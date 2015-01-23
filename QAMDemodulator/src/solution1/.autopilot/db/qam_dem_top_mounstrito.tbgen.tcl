set moduleName qam_dem_top_mounstrito
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName qam_dem_top_mounstrito
set C_modelType { void 0 }
set C_modelArgList { 
	{ din_i_V int 16 regular  }
	{ din_q_V int 16 regular  }
	{ dout_mix_i_V int 16 regular {pointer 1}  }
	{ dout_mix_q_V int 16 regular {pointer 1}  }
	{ ph_in_i_V int 12 regular  }
	{ ph_in_q_V int 12 regular  }
	{ ph_out_i_V int 12 regular {pointer 1}  }
	{ ph_out_q_V int 12 regular {pointer 1}  }
	{ loop_integ_V int 28 regular {pointer 1}  }
	{ control_lf_p int 8 regular  }
	{ control_lf_i int 8 regular  }
	{ control_lf_out_gain int 8 regular  }
	{ control_reg_clr int 1 regular  }
	{ control_reg_init_V int 28 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "din_i_V", "interface" : "wire", "bitwidth" : 16} , 
 	{ "Name" : "din_q_V", "interface" : "wire", "bitwidth" : 16} , 
 	{ "Name" : "dout_mix_i_V", "interface" : "wire", "bitwidth" : 16} , 
 	{ "Name" : "dout_mix_q_V", "interface" : "wire", "bitwidth" : 16} , 
 	{ "Name" : "ph_in_i_V", "interface" : "wire", "bitwidth" : 12} , 
 	{ "Name" : "ph_in_q_V", "interface" : "wire", "bitwidth" : 12} , 
 	{ "Name" : "ph_out_i_V", "interface" : "wire", "bitwidth" : 12} , 
 	{ "Name" : "ph_out_q_V", "interface" : "wire", "bitwidth" : 12} , 
 	{ "Name" : "loop_integ_V", "interface" : "wire", "bitwidth" : 28} , 
 	{ "Name" : "control_lf_p", "interface" : "wire", "bitwidth" : 8} , 
 	{ "Name" : "control_lf_i", "interface" : "wire", "bitwidth" : 8} , 
 	{ "Name" : "control_lf_out_gain", "interface" : "wire", "bitwidth" : 8} , 
 	{ "Name" : "control_reg_clr", "interface" : "wire", "bitwidth" : 1} , 
 	{ "Name" : "control_reg_init_V", "interface" : "wire", "bitwidth" : 28} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ din_i_V sc_in sc_lv 16 signal 0 } 
	{ din_q_V sc_in sc_lv 16 signal 1 } 
	{ dout_mix_i_V sc_out sc_lv 16 signal 2 } 
	{ dout_mix_i_V_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ dout_mix_q_V sc_out sc_lv 16 signal 3 } 
	{ dout_mix_q_V_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ ph_in_i_V sc_in sc_lv 12 signal 4 } 
	{ ph_in_q_V sc_in sc_lv 12 signal 5 } 
	{ ph_out_i_V sc_out sc_lv 12 signal 6 } 
	{ ph_out_i_V_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ ph_out_q_V sc_out sc_lv 12 signal 7 } 
	{ ph_out_q_V_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ loop_integ_V sc_out sc_lv 28 signal 8 } 
	{ loop_integ_V_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ control_lf_p sc_in sc_lv 8 signal 9 } 
	{ control_lf_i sc_in sc_lv 8 signal 10 } 
	{ control_lf_out_gain sc_in sc_lv 8 signal 11 } 
	{ control_reg_clr sc_in sc_lv 1 signal 12 } 
	{ control_reg_init_V sc_in sc_lv 28 signal 13 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "din_i_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "din_i_V", "role": "default" }} , 
 	{ "name": "din_q_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "din_q_V", "role": "default" }} , 
 	{ "name": "dout_mix_i_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dout_mix_i_V", "role": "default" }} , 
 	{ "name": "dout_mix_i_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dout_mix_i_V", "role": "ap_vld" }} , 
 	{ "name": "dout_mix_q_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dout_mix_q_V", "role": "default" }} , 
 	{ "name": "dout_mix_q_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dout_mix_q_V", "role": "ap_vld" }} , 
 	{ "name": "ph_in_i_V", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "ph_in_i_V", "role": "default" }} , 
 	{ "name": "ph_in_q_V", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "ph_in_q_V", "role": "default" }} , 
 	{ "name": "ph_out_i_V", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "ph_out_i_V", "role": "default" }} , 
 	{ "name": "ph_out_i_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ph_out_i_V", "role": "ap_vld" }} , 
 	{ "name": "ph_out_q_V", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "ph_out_q_V", "role": "default" }} , 
 	{ "name": "ph_out_q_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ph_out_q_V", "role": "ap_vld" }} , 
 	{ "name": "loop_integ_V", "direction": "out", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "loop_integ_V", "role": "default" }} , 
 	{ "name": "loop_integ_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "loop_integ_V", "role": "ap_vld" }} , 
 	{ "name": "control_lf_p", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "control_lf_p", "role": "default" }} , 
 	{ "name": "control_lf_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "control_lf_i", "role": "default" }} , 
 	{ "name": "control_lf_out_gain", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "control_lf_out_gain", "role": "default" }} , 
 	{ "name": "control_reg_clr", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "control_reg_clr", "role": "default" }} , 
 	{ "name": "control_reg_init_V", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "control_reg_init_V", "role": "default" }}  ]}
set Spec2ImplPortList { 
	din_i_V { ap_none {  { din_i_V in_data 0 16 } } }
	din_q_V { ap_none {  { din_q_V in_data 0 16 } } }
	dout_mix_i_V { ap_vld {  { dout_mix_i_V out_data 1 16 }  { dout_mix_i_V_ap_vld out_vld 1 1 } } }
	dout_mix_q_V { ap_vld {  { dout_mix_q_V out_data 1 16 }  { dout_mix_q_V_ap_vld out_vld 1 1 } } }
	ph_in_i_V { ap_none {  { ph_in_i_V in_data 0 12 } } }
	ph_in_q_V { ap_none {  { ph_in_q_V in_data 0 12 } } }
	ph_out_i_V { ap_vld {  { ph_out_i_V out_data 1 12 }  { ph_out_i_V_ap_vld out_vld 1 1 } } }
	ph_out_q_V { ap_vld {  { ph_out_q_V out_data 1 12 }  { ph_out_q_V_ap_vld out_vld 1 1 } } }
	loop_integ_V { ap_vld {  { loop_integ_V out_data 1 28 }  { loop_integ_V_ap_vld out_vld 1 1 } } }
	control_lf_p { ap_none {  { control_lf_p in_data 0 8 } } }
	control_lf_i { ap_none {  { control_lf_i in_data 0 8 } } }
	control_lf_out_gain { ap_none {  { control_lf_out_gain in_data 0 8 } } }
	control_reg_clr { ap_none {  { control_reg_clr in_data 0 1 } } }
	control_reg_init_V { ap_none {  { control_reg_init_V in_data 0 28 } } }
}
