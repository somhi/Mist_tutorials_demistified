# Soc lesson 5 DeMiSTify example

06/12/21 Deca port DeMiSTified by Somhic from original MiST SoC tutorial lesson 12 https://github.com/mist-devel/mist-board/tree/master/tutorials

Special thanks to Alastair M. Robinson creator of [DeMiSTify](https://github.com/robinsonb5/DeMiSTify) for helping me. 

[Read this guide if you want to know how I DeMiSTified this core](https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify).

**Features:**

* VGA 444 video output is available through GPIO (see pinout below). 
* Joystick available through GPIO  (see pinout below).  **Joystick power pin must be 2.5 V**
  * **DANGER: Connecting power pin above 2.6 V may damage the FPGA**
  * This core was tested with a Megadrive 6 button gamepad. A permanent high level is applied on pin 7 of DB9, so only works buttons B and C.

**Additional hardware required**:

- PS/2 Keyboard connected to GPIO  (see pinout below)

##### Versions:

v0.1 initial release

### OSD Controls

* F12 show/hide OSD 

* The reset button KEY0 resets the controller. The OSD Reset menu item resets the core itself.

  

### Instructions to DeMiSTify the project for a specific board:

For a broader description of possible configurations check https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify

```sh
git clone https://github.com/DECAfpga/Demistify_example
cd Demistify_example
git submodule add https://github.com/robinsonb5/DeMiSTify.git
git submodule update --init 
cp -r DeMiSTify/templates/deca/ .
cp -r DeMiSTify/templates/deca_atlas_root/* .
cp -r DeMiSTify/templates/config.h ./firmware/

########### Edit files in root folder
#edit Makefile and change project name (PROJECT=soc12)
gedit Makefile 
#edit project.qip and follow file notes
# set_global_assignment -name SYSTEMVERILOG_FILE [file join $::quartus(qip_path) soc12/rgb2ypbpr.sv]
# set_global_assignment -name VERILOG_FILE [file join $::quartus(qip_path) soc12/video.v]
# set_global_assignment -name VERILOG_FILE [file join $::quartus(qip_path) soc12/scandoubler.v]
# set_global_assignment -name VERILOG_FILE [file join $::quartus(qip_path) soc12/user_io.v]
# set_global_assignment -name VERILOG_FILE [file join $::quartus(qip_path) soc12/osd.v]
# set_global_assignment -name VERILOG_FILE [file join $::quartus(qip_path) soc12/soc.v]
# set_global_assignment -name QIP_FILE [file join $::quartus(qip_path) soc12/image.qip]
gedit project.qip 
#edit project_files.rtl (make sure project.qip is listed)
gedit project_files.rtl
#edit project_defs.tcl and change sdram value (no sdram is used)
# set requires_sdram 0
gedit project_defs.tcl
#edit demistify_config_pkg.vhd. Usually does not need to be modified, except component guest_mist. In this example we will define the component later in the board_top.vhd so doesn't need to modify this file
gedit demistify_config_pkg.vhd 
# edit firmware/config.h and #define / #undef accordingly to your core options. From the default settings change just #define CONFIG_WITHOUT_FILESYSTEM  because no SD is needed
gedit firmware/config.h 
#edit firmware/overrides.c No ROM or VHD is needed in this core so remove everything.
gedit firmware/overrides.c 

########### Edit files in board folder
cd deca
#PLL: soc12 core does not use a pll but uses 27 MHz to feed the VGA clock
# Most boards work at 50 MHz so a PLL is needed to generate that frecuency
# In Quartus open deca/pll.v file and define a c0 frequency of 27 MHz  
#Another pll or the same one might be used to generate hdmi output clock (pll2 folder)
#As the core does not use SDRAM, there is no need to use a specific sdram controller 
rm sdram.sv
#edit top.qip and comment # whatever is not needed (plls, sdram). Just leave these lines
# set_global_assignment -name QIP_FILE [file join $::quartus(qip_path) pll.qip]
# set_global_assignment -name VHDL_FILE [file join $::quartus(qip_path) deca_top.vhd]
gedit top.qip
#edit deca_top.vhd
# Change the guest module name "guest_mist" to "soc" and adapt ports accordingly to soc.v top Mist core file
# (optional) comment everything that is not used, like sound, HDMI, SDRAM except  DRAM_CS_N, UART.
# add pll instance to generate the 27 MHz clock to feed the guest soc module
gedit deca_top.vhd
cd ..

########### Compile project
#Do a first make (will finish in error) but it will download missing submodules 
make
cd DeMiSTify
#Create file site.mk in DeMiSTify folder 
cp site.template site.mk
#Edit site.mk and modify with your PATHs to Quartus and the BOARDS you are porting to
#(chameleon64 chameleon64v2 de10lite deca neptuno sidi uareloaded mist atlas_cyc...)
#(e.g. Q18 = /opt/intelFPGA_lite/17.1/quartus/bin)
gedit site.mk
#Go back to root folder and do a make with board target (deca, neptuno, uareloaded, atlas_cyc, ...).  If not specified it will compile for all targets. 
cd ..
make BOARD=deca
#When asked just accept default settings with Enter key
```

After that you can:

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)

```sh
cd deca/output_files/
export PATH="/path/to/intelFPGA_lite/17.1/quartus/bin:$PATH"
quartus_pgm --mode=jtag -o "p;soc12_deca.sof"
```

* or load project in Quartus from /deca/soc12_deca.qpf

### Pinout connections:

![pinout_deca](pinout_deca.png)

For this core is just needed to connect PS2 keyboard signals. 

Gamepad also works with OSD.

For 444 video DAC use all VGA pins. For 333 video DAC connect MSB from addon to MSB of location assignment (e.g. connect pin VGAR2 from Waveshare addon to VGA_R[3] Deca pin).

**Others:**

* Button KEY0 is a reset button

### STATUS

* Working fine

  

