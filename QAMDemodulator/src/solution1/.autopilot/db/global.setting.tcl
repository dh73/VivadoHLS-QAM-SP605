
set TopModule "qam_dem_top"
set ClockPeriod "10.000000"
set ClockList {ap_clk}
set multiClockList {}
set PortClockMap {}
set CombLogicFlag 0
set PipelineFlag 1
set DataflowTaskPipelineFlag  1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 0
set FftOrFirFlag 0
set NewDSPMapping 0
set ResetLevelFlag 1
set ResetStyle "control"
set ResetSyncFlag 1
set ResetRegisterFlag 0
set ResetVariableFlag 0
set fsmEncStyle "onehot"
set maxFanout "0"
set RtlPrefix ""
set ExtraCCFlags ""
set ExtraCLdFlags ""
set SynCheckOptions ""
set PresynOptions ""
set PreprocOptions ""
set SchedOptions ""
set BindOptions ""
set RtlGenOptions ""
set RtlWriterOptions ""
set CbcGenFlag ""
set CasGenFlag ""
set CasMonitorFlag ""
set AutoSimOptions {}
set ExportMCPathFlag "0"
set SCTraceFileName "mytrace"
set SCTraceFileFormat "vcd"
set SCTraceOption "all"
set TargetInfo "xc6slx45t:fgg484:-3"
set SourceFiles {sc {} c ../../qam_dem.cpp}
set SourceFlags {sc {} c {{}}}
set DirectiveFile {/home/diego/qam_demudulator/v1/src/src2/qam_dem/solution1/solution1.directive}
set TBFiles {verilog {../../tb_qam_dem.cpp ../../../../../xapp1173/src/table.txt ../../../../../xapp1173/src/cin.txt} bc {../../tb_qam_dem.cpp ../../../../../xapp1173/src/table.txt ../../../../../xapp1173/src/cin.txt} vhdl {../../tb_qam_dem.cpp ../../../../../xapp1173/src/table.txt ../../../../../xapp1173/src/cin.txt} sc {../../tb_qam_dem.cpp ../../../../../xapp1173/src/table.txt ../../../../../xapp1173/src/cin.txt} cas {../../tb_qam_dem.cpp ../../../../../xapp1173/src/table.txt ../../../../../xapp1173/src/cin.txt} c {}}
set SpecLanguage "C"
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set TBInstNames {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set PlatformFiles {{DefaultPlatform {xilinx/spartan6/spartan6 xilinx/spartan6/spartan6_fpv6}}}
set DefaultPlatform "DefaultPlatform"
set TBTVFileNotFound ""
set AppFile "../vivado_hls.app"
set ApsFile "solution1.aps"
set AvePath "../.."
