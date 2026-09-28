# OpenXC7 Blackboard Example

Basic SystemVerilog example using the openXC7 toolchain on the RealDigital Blackboard (AMD Zynq xc7z007sclg400-1).

## Usage

This requires an installation of the openXC7 toolchain. The Nix flake is recommended,
although currently you will need to clone the openXC7/toolchain-nix repo locally and manually
update nextpnr to the latest commit for proper Zynq 7000S support.

* `make` builds the bitstream using yosys+nextpnr-xilinx+fpga-as
* `make program` builds the bitstream, then programs it to the Blackboard using OpenFPGALoader
* `make probe` builds the bitstream, programs the board and starts the fpgacapZero host web app for debugging (see below)

The example scrolls the Blackboard's onboard LEDs from right to left.
Set a pattern using the switches, press BTN0 and watch the LEDs scroll.

## On-Chip Debugging

This example includes a demonstration of an on-chip logic analyser using fpgacapZero, probing the
internal 25-bit timer. To try out the logic analyser, run `make probe` and visit http://localhost:7373 in a browser.

This requires the fpgacapZero web interface to be installed (it's a Python package, so e.g. `pipx install fpgacapzero[web]` on linux)
as well as OpenOCD (found in most linux distro repositories).