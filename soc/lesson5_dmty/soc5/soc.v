// A simple system-on-a-chip (SoC) for the MiST
// (c) 2015 Till Harbaum
									  
module soc (
   input [1:0] 	CLOCK_27,
	
	// SDRAM interface
	inout  [15:0] 	SDRAM_DQ, 		// SDRAM Data bus 16 Bits
	output [12:0] 	SDRAM_A, 		// SDRAM Address bus 13 Bits
	output        	SDRAM_DQML, 	// SDRAM Low-byte Data Mask
	output        	SDRAM_DQMH, 	// SDRAM High-byte Data Mask
	output        	SDRAM_nWE, 		// SDRAM Write Enable
	output       	SDRAM_nCAS, 	// SDRAM Column Address Strobe
	output        	SDRAM_nRAS, 	// SDRAM Row Address Strobe
	output        	SDRAM_nCS, 		// SDRAM Chip Select
	output [1:0]  	SDRAM_BA, 		// SDRAM Bank Address
	output 			SDRAM_CLK, 		// SDRAM Clock
	output        	SDRAM_CKE, 		// SDRAM Clock Enable

   // SPI interface to arm io controller
   output      	SPI_DO,
	input       	SPI_DI,
   input       	SPI_SCK,
   input 			SPI_SS2,
   input 			SPI_SS3,
   input 			SPI_SS4,
	input       	CONF_DATA0, 

	// VGA interface
   output 			VGA_HS,
   output 	 		VGA_VS,
   output [5:0] 	VGA_R,
   output [5:0] 	VGA_G,
   output [5:0] 	VGA_B
);

wire pixel_clock;

// the configuration string is returned to the io controller to allow
// it to control the menu on the OSD 
parameter CONF_STR = {
        "Z80_SOC;;",
        "O1,Scanlines,On,Off;",
        "T2,Reset;"
};

parameter CONF_STR_LEN = 9+20+8;

// the status register is controlled by the on screen display (OSD)
wire [63:0] status;

// include user_io module for arm controller communication
user_io #(.STRLEN(CONF_STR_LEN)) user_io ( 
		.conf_str   ( CONF_STR   ),

      .clk_sys    ( pixel_clock),     //ram_clock

		.SPI_CLK    ( SPI_SCK    ),
      .SPI_SS_IO  ( CONF_DATA0 ),
      .SPI_MISO   ( SPI_DO     ),
      .SPI_MOSI   ( SPI_DI     ),

		.status     ( status     )
);

// include the on screen display
osd #(0,0,4) osd (
   .clk_sys       ( pixel_clock  ),

   // spi for OSD
   .SPI_DI        ( SPI_DI       ),
   .SPI_SCK       ( SPI_SCK      ),
   .SPI_SS3       ( SPI_SS3      ),

   .R_in    ( video_r      ),
   .G_in    ( video_g      ),
   .B_in    ( video_b      ),
   .HSync   ( video_hs     ),
   .VSync   ( video_vs     ),

   .R_out   ( VGA_R        ),
   .G_out   ( VGA_G        ),
   .B_out   ( VGA_B        )
);
                          
assign VGA_HS = video_hs;
assign VGA_VS = video_vs;


wire [5:0] video_r, video_g, video_b;
wire video_hs, video_vs;
		  
// include VGA controller
vga vga (
	.pclk     ( pixel_clock      ),
	 
	.cpu_clk  ( cpu_clock        ),
	.cpu_wr   ( !cpu_wr_n && !cpu_addr[15] ),
	.cpu_addr ( cpu_addr[13:0]   ),
	.cpu_data ( cpu_dout         ),

	.scanlines ( !status[1]      ),
	
	.hs    	( video_hs          ),
	.vs    	( video_vs          ),
	.r     	( video_r           ),
	.g     	( video_g           ),
	.b     	( video_b           )
);

// The CPU is kept in reset for further 256 cyckes after the PLL is
// generating stable clocks to make sure things like the SDRAM have
// some time to initialize
// status 0 is arm controller power up reset, status 2 is reset entry in OSD
reg [7:0] cpu_reset_cnt = 8'h00;
wire cpu_reset = (cpu_reset_cnt != 255);
always @(posedge cpu_clock) begin
	if(!pll_locked || status[0] || status[2])
		cpu_reset_cnt <= 8'd0;
	else 
		if(cpu_reset_cnt != 255)
			cpu_reset_cnt <= cpu_reset_cnt + 8'd1;
end
			
// SDRAM control signals
wire ram_clock;
assign SDRAM_CKE = 1'b1;

sdram sdram (
	// interface to the MT48LC16M16 chip
   .sd_data        ( SDRAM_DQ                  ),
   .sd_addr        ( SDRAM_A                   ),
   .sd_dqm         ( {SDRAM_DQMH, SDRAM_DQML}  ),
   .sd_cs          ( SDRAM_nCS                 ),
   .sd_ba          ( SDRAM_BA                  ),
   .sd_we          ( SDRAM_nWE                 ),
   .sd_ras         ( SDRAM_nRAS                ),
   .sd_cas         ( SDRAM_nCAS                ),

   // system interface
   .clk            ( ram_clock                 ),
   .clkref         ( cpu_clock                 ),
   .init           ( !pll_locked               ),

   // cpu interface
   .din            ( cpu_dout                  ),
   .addr           ( { 10'd0, cpu_addr[14:0] } ),
   .we             ( !cpu_wr_n && cpu_addr[15] ),
   .oe         	 ( !cpu_rd_n && cpu_addr[15] ),
   .dout           ( ram_data_out              )
);
	
// CPU control signals
wire cpu_clock;
wire [15:0] cpu_addr;
wire [7:0] cpu_din;
wire [7:0] cpu_dout;
wire cpu_rd_n;
wire cpu_wr_n;
wire cpu_mreq_n;

// include Z80 CPU
T80s T80s (
	.RESET_n  ( !cpu_reset    ),
	.CLK_n    ( cpu_clock     ),
	.WAIT_n   ( 1'b1          ),
	.INT_n    ( 1'b1          ),
	.NMI_n    ( 1'b1          ),
	.BUSRQ_n  ( 1'b1          ),
	.MREQ_n   ( cpu_mreq_n    ),
	.RD_n     ( cpu_rd_n      ), 
	.WR_n     ( cpu_wr_n      ),
	.A        ( cpu_addr      ),
	.DI       ( cpu_din       ),
	.DO       ( cpu_dout      )
);

// map 32k SDRAM into upper half od the address space (A15=1)
// and 4k ROM into the lower half (A15=0)
wire [7:0] ram_data_out, rom_data_out;
assign cpu_din = cpu_addr[15]?ram_data_out:rom_data_out;

// include 4k program code from boot_rom
boot_rom boot_rom (
	.clock   ( cpu_clock      ),
	.address ( cpu_addr[11:0] ),
	.q       ( rom_data_out   )
);


// PLL to generate 32Mhz ram clock and 25Mhz video clock from MiSTs
// 27Mhz on board clock
wire pll_locked;
pll pll (
         .inclk0 ( CLOCK_27[0]   ),
         .locked ( pll_locked    ),        // PLL is running stable
         .c0     ( pixel_clock   ),        // 25.175 MHz
         .c1     ( ram_clock     ),        // 32 MHz
         .c2     ( SDRAM_CLK     ),        // slightly phase shifted 32 MHz
         .c3     ( cpu_clock     )         // 4 MHz cpu clock
);

endmodule
