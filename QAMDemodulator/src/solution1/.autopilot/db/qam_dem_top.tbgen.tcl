set moduleName qam_dem_top
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName qam_dem_top
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
	{ control_qam_V int 2 unused  }
	{ control_lf_p int 8 regular  }
	{ control_lf_i int 8 regular  }
	{ control_lf_out_gain int 8 regular  }
	{ control_reg_clr int 1 regular  }
	{ control_reg_init_V int 28 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "din_i_V", "interface" : "wire", "bitwidth" : 16,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "din.i.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "din_q_V", "interface" : "wire", "bitwidth" : 16,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "din.q.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "dout_mix_i_V", "interface" : "wire", "bitwidth" : 16,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "dout_mix.i.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "dout_mix_q_V", "interface" : "wire", "bitwidth" : 16,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "dout_mix.q.V","cData": "int16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "ph_in_i_V", "interface" : "wire", "bitwidth" : 12,"bitSlice":[{"low":0,"up":11,"cElement": [{"cName": "ph_in.i.V","cData": "int12","bit_use": { "low": 0,"up": 11},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "ph_in_q_V", "interface" : "wire", "bitwidth" : 12,"bitSlice":[{"low":0,"up":11,"cElement": [{"cName": "ph_in.q.V","cData": "int12","bit_use": { "low": 0,"up": 11},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "ph_out_i_V", "interface" : "wire", "bitwidth" : 12,"bitSlice":[{"low":0,"up":11,"cElement": [{"cName": "ph_out.i.V","cData": "int12","bit_use": { "low": 0,"up": 11},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "ph_out_q_V", "interface" : "wire", "bitwidth" : 12,"bitSlice":[{"low":0,"up":11,"cElement": [{"cName": "ph_out.q.V","cData": "int12","bit_use": { "low": 0,"up": 11},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "loop_integ_V", "interface" : "wire", "bitwidth" : 28,"bitSlice":[{"low":0,"up":27,"cElement": [{"cName": "loop_integ.V","cData": "int28","bit_use": { "low": 0,"up": 27},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "control_qam_V", "interface" : "wire", "bitwidth" : 2,"bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "control.qam.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "control_lf_p", "interface" : "wire", "bitwidth" : 8,"bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "control.lf_p","cData": "char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "control_lf_i", "interface" : "wire", "bitwidth" : 8,"bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "control.lf_i","cData": "char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "control_lf_out_gain", "interface" : "wire", "bitwidth" : 8,"bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "control.lf_out_gain","cData": "char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "control_reg_clr", "interface" : "wire", "bitwidth" : 1,"bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "control.reg_clr","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "control_reg_init_V", "interface" : "wire", "bitwidth" : 28,"bitSlice":[{"low":0,"up":27,"cElement": [{"cName": "control.reg_init.V","cData": "int28","bit_use": { "low": 0,"up": 27},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ din_i_V sc_in sc_lv 16 signal 0 } 
	{ din_q_V sc_in sc_lv 16 signal 1 } 
	{ dout_mix_i_V sc_out sc_lv 16 signal 2 } 
	{ dout_mix_q_V sc_out sc_lv 16 signal 3 } 
	{ ph_in_i_V sc_in sc_lv 12 signal 4 } 
	{ ph_in_q_V sc_in sc_lv 12 signal 5 } 
	{ ph_out_i_V sc_out sc_lv 12 signal 6 } 
	{ ph_out_q_V sc_out sc_lv 12 signal 7 } 
	{ loop_integ_V sc_out sc_lv 28 signal 8 } 
	{ control_qam_V sc_in sc_lv 2 signal 9 } 
	{ control_lf_p sc_in sc_lv 8 signal 10 } 
	{ control_lf_i sc_in sc_lv 8 signal 11 } 
	{ control_lf_out_gain sc_in sc_lv 8 signal 12 } 
	{ control_reg_clr sc_in sc_lv 1 signal 13 } 
	{ control_reg_init_V sc_in sc_lv 28 signal 14 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
}
set NewPortList {[ 
	{ "name": "din_i_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "din_i_V", "role": "default" }} , 
 	{ "name": "din_q_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "din_q_V", "role": "default" }} , 
 	{ "name": "dout_mix_i_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dout_mix_i_V", "role": "default" }} , 
 	{ "name": "dout_mix_q_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dout_mix_q_V", "role": "default" }} , 
 	{ "name": "ph_in_i_V", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "ph_in_i_V", "role": "default" }} , 
 	{ "name": "ph_in_q_V", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "ph_in_q_V", "role": "default" }} , 
 	{ "name": "ph_out_i_V", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "ph_out_i_V", "role": "default" }} , 
 	{ "name": "ph_out_q_V", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "ph_out_q_V", "role": "default" }} , 
 	{ "name": "loop_integ_V", "direction": "out", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "loop_integ_V", "role": "default" }} , 
 	{ "name": "control_qam_V", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control_qam_V", "role": "default" }} , 
 	{ "name": "control_lf_p", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "control_lf_p", "role": "default" }} , 
 	{ "name": "control_lf_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "control_lf_i", "role": "default" }} , 
 	{ "name": "control_lf_out_gain", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "control_lf_out_gain", "role": "default" }} , 
 	{ "name": "control_reg_clr", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "control_reg_clr", "role": "default" }} , 
 	{ "name": "control_reg_init_V", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "control_reg_init_V", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }}  ]}
set Spec2ImplPortList { 
	din_i_V { ap_none {  { din_i_V in_data 0 16 } } }
	din_q_V { ap_none {  { din_q_V in_data 0 16 } } }
	dout_mix_i_V { ap_none {  { dout_mix_i_V out_data 1 16 } } }
	dout_mix_q_V { ap_none {  { dout_mix_q_V out_data 1 16 } } }
	ph_in_i_V { ap_none {  { ph_in_i_V in_data 0 12 } } }
	ph_in_q_V { ap_none {  { ph_in_q_V in_data 0 12 } } }
	ph_out_i_V { ap_none {  { ph_out_i_V out_data 1 12 } } }
	ph_out_q_V { ap_none {  { ph_out_q_V out_data 1 12 } } }
	loop_integ_V { ap_none {  { loop_integ_V out_data 1 28 } } }
	control_qam_V { ap_none {  { control_qam_V in_data 0 2 } } }
	control_lf_p { ap_none {  { control_lf_p in_data 0 8 } } }
	control_lf_i { ap_none {  { control_lf_i in_data 0 8 } } }
	control_lf_out_gain { ap_none {  { control_lf_out_gain in_data 0 8 } } }
	control_reg_clr { ap_none {  { control_reg_clr in_data 0 1 } } }
	control_reg_init_V { ap_none {  { control_reg_init_V in_data 0 28 } } }
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
