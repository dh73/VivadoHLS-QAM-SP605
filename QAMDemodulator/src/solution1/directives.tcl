############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2014 Xilinx Inc. All rights reserved.
############################################################
set_directive_allocation -limit 1 -type operation "mix" mul
set_directive_interface -mode ap_none -register "qam_dem_top" ph_out
set_directive_interface -mode ap_none -register "qam_dem_top" loop_integ
set_directive_dataflow "qam_dem_top"
set_directive_dataflow "qam_dem_top"
set_directive_interface -mode ap_none -register "qam_dem_top" dout_mix
set_directive_allocation -limit 1 -type operation "QAMDEM::mix" mul
