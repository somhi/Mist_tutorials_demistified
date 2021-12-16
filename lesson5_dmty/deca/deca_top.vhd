library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.demistify_config_pkg.all;

-- -----------------------------------------------------------------------

entity deca_top is
	port
	(
		ADC_CLK_10		: IN STD_LOGIC;
		MAX10_CLK1_50	: IN STD_LOGIC;
		MAX10_CLK2_50	: IN STD_LOGIC;
		KEY				: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		LED				: OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111";
        -- SDRAM
		DRAM_CLK		: OUT STD_LOGIC;
		DRAM_CKE		: OUT STD_LOGIC;
		DRAM_ADDR		: OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
		DRAM_BA			: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		DRAM_DQ			: INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		DRAM_LDQM		: OUT STD_LOGIC;
		DRAM_UDQM		: OUT STD_LOGIC;
		DRAM_CS_N		: OUT STD_LOGIC;
		DRAM_WE_N		: OUT STD_LOGIC;
		DRAM_CAS_N		: OUT STD_LOGIC;
		DRAM_RAS_N		: OUT STD_LOGIC;
               -- VGA
		VGA_HS			: OUT STD_LOGIC;
		VGA_VS			: OUT STD_LOGIC;
		VGA_R			: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		VGA_G			: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		VGA_B			: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		-- -- AUDIO
		-- SIGMA_R                : OUT STD_LOGIC;
		-- SIGMA_L                : OUT STD_LOGIC;
		-- PS2
		PS2_KEYBOARD_CLK       : INOUT STD_LOGIC;
		PS2_KEYBOARD_DAT       : INOUT STD_LOGIC;
		PS2_MOUSE_CLK          : INOUT STD_LOGIC;
		PS2_MOUSE_DAT          : INOUT STD_LOGIC;
		-- -- UART
		-- UART_RXD               : IN  STD_LOGIC;
		-- UART_TXD               : OUT STD_LOGIC;
		-- JOYSTICK
		JOY1_B2_P9		: IN    STD_LOGIC;
		JOY1_B1_P6		: IN    STD_LOGIC;
		JOY1_UP			: IN    STD_LOGIC;
		JOY1_DOWN		: IN    STD_LOGIC;
		JOY1_LEFT		: IN    STD_LOGIC;
		JOY1_RIGHT		: IN    STD_LOGIC;
		JOYX_SEL_O		: OUT   STD_LOGIC := '1';
		-- SD Card
		SD_CS_N_O            	: OUT   STD_LOGIC := '1';
		SD_SCLK_O            	: OUT   STD_LOGIC := '0';
		SD_MOSI_O            	: OUT   STD_LOGIC := '0';
		SD_MISO_I            	: IN    STD_LOGIC;
		SD_SEL               	: OUT   STD_LOGIC := '0';   
		SD_CMD_DIR           	: OUT   STD_LOGIC := '1';  
		SD_D0_DIR            	: OUT   STD_LOGIC := '0';  
		SD_D123_DIR             : OUT   STD_LOGIC
		-- -- HDMI-TX  DECA 
		-- HDMI_I2C_SCL  		: INOUT STD_LOGIC; 		          		
		-- HDMI_I2C_SDA  		: INOUT STD_LOGIC; 		          		
		-- HDMI_I2S      		: INOUT STD_LOGIC_VECTOR(3 downto 0);		     	
		-- HDMI_LRCLK    		: INOUT STD_LOGIC; 		          		
		-- HDMI_MCLK     		: INOUT STD_LOGIC;		          		
		-- HDMI_SCLK     		: INOUT STD_LOGIC; 		          		
		-- HDMI_TX_CLK   		: OUT	STD_LOGIC;	          		
		-- HDMI_TX_D     		: OUT	STD_LOGIC_VECTOR(23 downto 0);	    		
		-- HDMI_TX_DE    		: OUT   STD_LOGIC;		          		 
		-- HDMI_TX_HS    		: OUT	STD_LOGIC;	          		
		-- HDMI_TX_INT   		: IN    STD_LOGIC;		          		
		-- HDMI_TX_VS    		: OUT   STD_LOGIC;         
        --        -- AUDIO CODEC  DECA 
		-- AUDIO_GPIO_MFP5  	: INOUT STD_LOGIC;
		-- AUDIO_MISO_MFP4  	: IN    STD_LOGIC;
		-- AUDIO_RESET_n    	: INOUT STD_LOGIC;
		-- AUDIO_SCLK_MFP3  	: OUT   STD_LOGIC;
		-- AUDIO_SCL_SS_n   	: OUT   STD_LOGIC;
		-- AUDIO_SDA_MOSI   	: INOUT STD_LOGIC;
		-- AUDIO_SPI_SELECT 	: OUT   STD_LOGIC;
		-- I2S_MCK 		: OUT   STD_LOGIC;
		-- I2S_SCK 		: OUT   STD_LOGIC;
		-- I2S_LR  		: OUT   STD_LOGIC;
		-- I2S_D   		: OUT   STD_LOGIC		
	);
END entity;

architecture RTL of deca_top is
	
-- System clocks
	signal locked : std_logic;
	signal reset_n : std_logic;

-- SPI signals
	signal sd_clk : std_logic;
	signal sd_cs : std_logic;
	signal sd_mosi : std_logic;
	signal sd_miso : std_logic;
	
-- internal SPI signals
	signal spi_toguest : std_logic;
	signal spi_fromguest : std_logic;
	signal spi_ss2 : std_logic;
	signal spi_ss3 : std_logic;
	signal spi_ss4 : std_logic;
	signal conf_data0 : std_logic;
	signal spi_clk_int : std_logic;

-- PS/2 Keyboard socket - used for second mouse
	signal ps2_keyboard_clk_in : std_logic;
	signal ps2_keyboard_dat_in : std_logic;
	signal ps2_keyboard_clk_out : std_logic;
	signal ps2_keyboard_dat_out : std_logic;

-- PS/2 Mouse
	signal ps2_mouse_clk_in: std_logic;
	signal ps2_mouse_dat_in: std_logic;
	signal ps2_mouse_clk_out: std_logic;
	signal ps2_mouse_dat_out: std_logic;
	
-- Video
	signal vga_red: std_logic_vector(7 downto 0);
	signal vga_green: std_logic_vector(7 downto 0);
	signal vga_blue: std_logic_vector(7 downto 0);
	signal vga_hsync : std_logic;
	signal vga_vsync : std_logic;

-- RS232 serial
	signal rs232_rxd : std_logic;
	signal rs232_txd : std_logic;

-- IO
	signal joya : std_logic_vector(7 downto 0);
	signal joyb : std_logic_vector(7 downto 0);
	signal joyc : std_logic_vector(7 downto 0);
	signal joyd : std_logic_vector(7 downto 0);


COMPONENT soc
	PORT
	(
        CLOCK_27 :	IN STD_LOGIC_VECTOR(1 downto 0);	
        -- SDRAM
		SDRAM_DQ		:	 INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		SDRAM_A			:	 OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
		SDRAM_DQML		:	 OUT STD_LOGIC;
		SDRAM_DQMH		:	 OUT STD_LOGIC;
		SDRAM_nWE		:	 OUT STD_LOGIC;
		SDRAM_nCAS		:	 OUT STD_LOGIC;
		SDRAM_nRAS		:	 OUT STD_LOGIC;
		SDRAM_nCS		:	 OUT STD_LOGIC;
		SDRAM_BA		:	 OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		SDRAM_CLK		:	 OUT STD_LOGIC;
		SDRAM_CKE		:	 OUT STD_LOGIC;
		-- UART
--		UART_TX    :   OUT STD_LOGIC;
--		UART_RX    :   IN STD_LOGIC;
		-- SPI
		SPI_DO		:	 OUT STD_LOGIC;
-- 		We can't do bi-directional signals here, so we need separate in and out signals.
--		If the guest core uses direct mode for ROM upload it will need to be adapted.
--		SPI_SD_DI	:	 IN STD_LOGIC;
		SPI_DI		:	 IN STD_LOGIC;
		SPI_SCK		:	 IN STD_LOGIC;
		SPI_SS2		:	 IN STD_LOGIC;
		SPI_SS3		:	 IN STD_LOGIC;
		SPI_SS4		:	 IN STD_LOGIC;
		CONF_DATA0		:	 IN STD_LOGIC;
        -- VGA
		VGA_HS		:	 OUT STD_LOGIC;
		VGA_VS		:	 OUT STD_LOGIC;
		VGA_R		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		VGA_G		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		VGA_B		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
--	        VGA_BLANK : out std_logic; 
--	        VGA_CLK : out std_logic;
        -- AUDIO
--		AUDIO_L  : out std_logic;
--		AUDIO_R  : out std_logic
	);
END COMPONENT;


-- -- HDMI

-- component I2C_HDMI_Config
--     port (
--     iCLK : in std_logic;
--     iRST_N : in std_logic;
--     I2C_SCLK : out std_logic;
--     I2C_SDAT : inout std_logic;
--     HDMI_TX_INT : in std_logic
--   );
-- end component;

-- component pll2
--     port (
--     inclk0 : in STD_LOGIC;
--     c0 : out STD_LOGIC;
--     locked : out STD_LOGIC
--   );
-- end component;

-- signal vga_clk :  std_logic;
-- signal vga_blank  :  std_logic;


begin


-- SPI
SD_CS_N_O<=sd_cs;
SD_MOSI_O<=sd_mosi;
sd_miso<=SD_MISO_I;
SD_SCLK_O<=sd_clk;


-- External devices tied to GPIOs
ps2_mouse_dat_in<=ps2_mouse_dat;
ps2_mouse_dat <= '0' when ps2_mouse_dat_out='0' else 'Z';
ps2_mouse_clk_in<=ps2_mouse_clk;
ps2_mouse_clk <= '0' when ps2_mouse_clk_out='0' else 'Z';

ps2_keyboard_dat_in <=ps2_keyboard_dat;
ps2_keyboard_dat <= '0' when ps2_keyboard_dat_out='0' else 'Z';
ps2_keyboard_clk_in<=ps2_keyboard_clk;
ps2_keyboard_clk <= '0' when ps2_keyboard_clk_out='0' else 'Z';
	

JOYX_SEL_O <= '1';

joya<="11" & JOY1_B1_P6 & JOY1_B2_P9 & JOY1_RIGHT & JOY1_LEFT & JOY1_DOWN & JOY1_UP;

joyb<=(others=>'1');
joyc<=(others=>'1');
joyd<=(others=>'1');


SD_SEL                          <= '0';  -- 0 = 3.3V at sdcard   
SD_CMD_DIR                      <= '1';  -- MOSI FPGA output
SD_D0_DIR                       <= '0';  -- MISO FPGA input     
SD_D123_DIR                     <= '1';  -- CS FPGA output  


VGA_R<=vga_red(7 downto 4);
VGA_G<=vga_green(7 downto 4);
VGA_B<=vga_blue(7 downto 4);
VGA_HS<=vga_hsync;
VGA_VS<=vga_vsync;



-- -- HDMI CONFIG    
-- I2C_HDMI_Config_inst : I2C_HDMI_Config
-- port map (
-- 	iCLK => MAX10_CLK1_50,      
-- 	iRST_N =>  reset_n,       --reset_n, KEY(0)
-- 	I2C_SCLK => HDMI_I2C_SCL,
-- 	I2C_SDAT => HDMI_I2C_SDA,
-- 	HDMI_TX_INT => HDMI_TX_INT
-- );

-- -- -- PLL2
-- -- pll2_inst : pll2
-- -- port map (
-- --	inclk0		=> MAX10_CLK1_50,
-- --	c0		=> vga_clk		
-- --	locked		=> open
-- -- );

-- --  HDMI VIDEO   
-- HDMI_TX_CLK <= vga_clk;	
-- HDMI_TX_DE  <= not vga_blank;
-- HDMI_TX_HS  <= vga_hsync;
-- HDMI_TX_VS  <= vga_vsync;
-- HDMI_TX_D   <= vga_red(7 downto 2)&vga_red(7 downto 6)&vga_green(7 downto 2)&vga_green(7 downto 6)&vga_blue(7 downto 2)&vga_blue(7 downto 6);


guest: COMPONENT  soc
	PORT map
	(
        CLOCK_27 => MAX10_CLK1_50&MAX10_CLK1_50,	 
        --SDRAM
		SDRAM_DQ => DRAM_DQ,
		SDRAM_A => DRAM_ADDR,
		SDRAM_DQML => DRAM_LDQM,
		SDRAM_DQMH => DRAM_UDQM,
		SDRAM_nWE => DRAM_WE_N,
		SDRAM_nCAS => DRAM_CAS_N,
		SDRAM_nRAS => DRAM_RAS_N,
		SDRAM_nCS => DRAM_CS_N,
		SDRAM_BA => DRAM_BA,
		SDRAM_CLK => DRAM_CLK,
		SDRAM_CKE => DRAM_CKE,
		--UART
--		UART_TX  => UART_TXD,
--		UART_RX  => UART_RXD,
		--SPI
		SPI_DO => spi_fromguest,
		SPI_DI => spi_toguest,
		SPI_SCK => spi_clk_int,
		SPI_SS2	=> spi_ss2,
		SPI_SS3 => spi_ss3,
		SPI_SS4	=> spi_ss4,
		CONF_DATA0 => conf_data0,
        --VGA
		VGA_HS => vga_hsync,
		VGA_VS => vga_vsync,
		VGA_R => vga_red(7 downto 2),
		VGA_G => vga_green(7 downto 2),
		VGA_B => vga_blue(7 downto 2)
--	         VGA_BLANK => vga_blank,
--	         VGA_CLK => vga_clk
        --AUDIO
--		AUDIO_L => sigma_l,
--		AUDIO_R => sigma_r
);


-- Pass internal signals to external SPI interface
sd_clk <= spi_clk_int;

controller : entity work.substitute_mcu
	generic map (
		sysclk_frequency => 500,
--		SPI_FASTBIT=>3,
		debug => false,
		jtag_uart => false
		
	)
	port map (
		clk => MAX10_CLK1_50,
		reset_in  => KEY(0),
		reset_out => reset_n,

		-- SPI signals
		spi_miso => sd_miso,
		spi_mosi	=> sd_mosi,
		spi_clk => spi_clk_int,
		spi_cs => sd_cs,
		spi_fromguest => spi_fromguest,
		spi_toguest => spi_toguest,
		spi_ss2 => spi_ss2,
		spi_ss3 => spi_ss3,
		spi_ss4 => spi_ss4,
		conf_data0 => conf_data0,
		
		-- PS/2 signals
		ps2k_clk_in => ps2_keyboard_clk_in,
		ps2k_dat_in => ps2_keyboard_dat_in,
		ps2k_clk_out => ps2_keyboard_clk_out,
		ps2k_dat_out => ps2_keyboard_dat_out,
		ps2m_clk_in => ps2_mouse_clk_in,
		ps2m_dat_in => ps2_mouse_dat_in,
		ps2m_clk_out => ps2_mouse_clk_out,
		ps2m_dat_out => ps2_mouse_dat_out,

		-- Buttons
		buttons => (0=>KEY(0),1=>KEY(1),others=>'1'),

		-- Joysticks
		joy1 => joya,
		joy2 => joyb,

		-- UART
		rxd => rs232_rxd,
		txd => rs232_txd
);

end rtl;

