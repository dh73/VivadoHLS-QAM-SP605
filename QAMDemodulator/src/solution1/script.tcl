############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2014 Xilinx Inc. All rights reserved.
############################################################
open_project qam_dem
set_top qam_dem_top
add_files qam_dem.cpp
add_files qam_dem.h
add_files synt_types.h
add_files table.h
add_files -tb cin.txt
add_files -tb table.txt
add_files -tb tb_qam_dem.cpp
open_solution "solution1"
set_part {xc6slx45tfgg484-3}
create_clock -period 10 -name default
source "./qam_dem/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format sysgen_ise
