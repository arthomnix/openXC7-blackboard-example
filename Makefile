FAMILY  	= zynq7
PART    	= xc7z007sclg400-1
JTAG_LINK 	= --fpga-part xc7z007sclg400 -c ft2232 --freq 3000000
PROJECT 	= test
TOP_VERILOG	= test.sv
CHIPDB  	= ${ZYNQ7_CHIPDB}

FCAPZ			= ./fpgacapZero/rtl
FCAPZ_SOURCES 	= ${FCAPZ}/fcapz_ela_xilinx7.v \
				  ${FCAPZ}/fcapz_ela.v \
				  ${FCAPZ}/reset_sync.v \
				  ${FCAPZ}/trig_compare.v \
				  ${FCAPZ}/dpram.v \
				  ${FCAPZ}/jtag_burst_read.v \
				  ${FCAPZ}/jtag_reg_iface.v \
				  ${FCAPZ}/jtag_tap/jtag_tap_xilinx7.v
ADDITIONAL_SOURCES = ${FCAPZ_SOURCES}

include openXC7.mk

.PHONY: probe
probe: program
	fcapz-web --openocd-cfg openocd.cfg
	