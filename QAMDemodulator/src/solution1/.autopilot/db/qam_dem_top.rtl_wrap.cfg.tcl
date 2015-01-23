set lang "C++"
set moduleName "qam_dem_top"
set moduleIsExternC "0"
set rawDecl ""
set globalVariable ""
set PortList ""
set PortName0 "din"
set BitWidth0 "32"
set ArrayOpt0 ""
set Const0 "0"
set Volatile0 "0"
set Pointer0 "0"
set Reference0 "0"
set Dims0 [list 0]
set Interface0 "wire"
set structMem0 ""
set PortName00 "i"
set BitWidth00 "16"
set ArrayOpt00 ""
set Const00 "0"
set Volatile00 "0"
set Pointer00 "0"
set Reference00 "0"
set Dims00 [list 0]
set Interface00 "wire"
set DataType00 "[list ap_fixed 16 3 5 3 0 ]"
set Port00 [list $PortName00 $Interface00 $DataType00 $Pointer00 $Dims00 $Const00 $Volatile00 $ArrayOpt00]
lappend structMem0 $Port00
set PortName01 "q"
set BitWidth01 "16"
set ArrayOpt01 ""
set Const01 "0"
set Volatile01 "0"
set Pointer01 "0"
set Reference01 "0"
set Dims01 [list 0]
set Interface01 "wire"
set DataType01 "[list ap_fixed 16 3 5 3 0 ]"
set Port01 [list $PortName01 $Interface01 $DataType01 $Pointer01 $Dims01 $Const01 $Volatile01 $ArrayOpt01]
lappend structMem0 $Port01
set DataType0 [list "cdata_t" "struct cdata_t" $structMem0 0 0 ]
set Port0 [list $PortName0 $Interface0 $DataType0 $Pointer0 $Dims0 $Const0 $Volatile0 $ArrayOpt0]
lappend PortList $Port0
set PortName1 "dout_mix"
set BitWidth1 "64"
set ArrayOpt1 ""
set Const1 "0"
set Volatile1 "0"
set Pointer1 "1"
set Reference1 "0"
set Dims1 [list 0]
set Interface1 "wire"
set structMem1 ""
set PortName10 "i"
set BitWidth10 "16"
set ArrayOpt10 ""
set Const10 "0"
set Volatile10 "0"
set Pointer10 "0"
set Reference10 "0"
set Dims10 [list 0]
set Interface10 "wire"
set DataType10 "[list ap_fixed 16 3 5 3 0 ]"
set Port10 [list $PortName10 $Interface10 $DataType10 $Pointer10 $Dims10 $Const10 $Volatile10 $ArrayOpt10]
lappend structMem1 $Port10
set PortName11 "q"
set BitWidth11 "16"
set ArrayOpt11 ""
set Const11 "0"
set Volatile11 "0"
set Pointer11 "0"
set Reference11 "0"
set Dims11 [list 0]
set Interface11 "wire"
set DataType11 "[list ap_fixed 16 3 5 3 0 ]"
set Port11 [list $PortName11 $Interface11 $DataType11 $Pointer11 $Dims11 $Const11 $Volatile11 $ArrayOpt11]
lappend structMem1 $Port11
set DataType1 [list "cdata_t" "struct cdata_t" $structMem1 0 0 ]
set Port1 [list $PortName1 $Interface1 $DataType1 $Pointer1 $Dims1 $Const1 $Volatile1 $ArrayOpt1]
lappend PortList $Port1
set PortName2 "ph_in"
set BitWidth2 "32"
set ArrayOpt2 ""
set Const2 "0"
set Volatile2 "0"
set Pointer2 "0"
set Reference2 "0"
set Dims2 [list 0]
set Interface2 "wire"
set structMem2 ""
set PortName20 "i"
set BitWidth20 "16"
set ArrayOpt20 ""
set Const20 "0"
set Volatile20 "0"
set Pointer20 "0"
set Reference20 "0"
set Dims20 [list 0]
set Interface20 "wire"
set DataType20 "[list ap_fixed 12 1 5 3 0 ]"
set Port20 [list $PortName20 $Interface20 $DataType20 $Pointer20 $Dims20 $Const20 $Volatile20 $ArrayOpt20]
lappend structMem2 $Port20
set PortName21 "q"
set BitWidth21 "16"
set ArrayOpt21 ""
set Const21 "0"
set Volatile21 "0"
set Pointer21 "0"
set Reference21 "0"
set Dims21 [list 0]
set Interface21 "wire"
set DataType21 "[list ap_fixed 12 1 5 3 0 ]"
set Port21 [list $PortName21 $Interface21 $DataType21 $Pointer21 $Dims21 $Const21 $Volatile21 $ArrayOpt21]
lappend structMem2 $Port21
set DataType2 [list "cphase_t" "struct cphase_t" $structMem2 0 0 ]
set Port2 [list $PortName2 $Interface2 $DataType2 $Pointer2 $Dims2 $Const2 $Volatile2 $ArrayOpt2]
lappend PortList $Port2
set PortName3 "ph_out"
set BitWidth3 "64"
set ArrayOpt3 ""
set Const3 "0"
set Volatile3 "0"
set Pointer3 "1"
set Reference3 "0"
set Dims3 [list 0]
set Interface3 "wire"
set structMem3 ""
set PortName30 "i"
set BitWidth30 "16"
set ArrayOpt30 ""
set Const30 "0"
set Volatile30 "0"
set Pointer30 "0"
set Reference30 "0"
set Dims30 [list 0]
set Interface30 "wire"
set DataType30 "[list ap_fixed 12 1 5 3 0 ]"
set Port30 [list $PortName30 $Interface30 $DataType30 $Pointer30 $Dims30 $Const30 $Volatile30 $ArrayOpt30]
lappend structMem3 $Port30
set PortName31 "q"
set BitWidth31 "16"
set ArrayOpt31 ""
set Const31 "0"
set Volatile31 "0"
set Pointer31 "0"
set Reference31 "0"
set Dims31 [list 0]
set Interface31 "wire"
set DataType31 "[list ap_fixed 12 1 5 3 0 ]"
set Port31 [list $PortName31 $Interface31 $DataType31 $Pointer31 $Dims31 $Const31 $Volatile31 $ArrayOpt31]
lappend structMem3 $Port31
set DataType3 [list "cphase_t" "struct cphase_t" $structMem3 0 0 ]
set Port3 [list $PortName3 $Interface3 $DataType3 $Pointer3 $Dims3 $Const3 $Volatile3 $ArrayOpt3]
lappend PortList $Port3
set PortName4 "loop_integ"
set BitWidth4 "64"
set ArrayOpt4 ""
set Const4 "0"
set Volatile4 "0"
set Pointer4 "1"
set Reference4 "0"
set Dims4 [list 0]
set Interface4 "wire"
set DataType4 "[list ap_fixed 28 2 5 3 0 ]"
set Port4 [list $PortName4 $Interface4 $DataType4 $Pointer4 $Dims4 $Const4 $Volatile4 $ArrayOpt4]
lappend PortList $Port4
set PortName5 "control"
set BitWidth5 "96"
set ArrayOpt5 ""
set Const5 "0"
set Volatile5 "0"
set Pointer5 "0"
set Reference5 "0"
set Dims5 [list 0]
set Interface5 "wire"
set structMem5 ""
set PortName50 "qam"
set BitWidth50 "8"
set ArrayOpt50 ""
set Const50 "0"
set Volatile50 "0"
set Pointer50 "0"
set Reference50 "0"
set Dims50 [list 0]
set Interface50 "wire"
set DataType50 "[list ap_ufixed 2 2 5 3 0 ]"
set Port50 [list $PortName50 $Interface50 $DataType50 $Pointer50 $Dims50 $Const50 $Volatile50 $ArrayOpt50]
lappend structMem5 $Port50
set PortName51 "lf_p"
set BitWidth51 "8"
set ArrayOpt51 ""
set Const51 "0"
set Volatile51 "0"
set Pointer51 "0"
set Reference51 "0"
set Dims51 [list 0]
set Interface51 "wire"
set DataType51 "char"
set Port51 [list $PortName51 $Interface51 $DataType51 $Pointer51 $Dims51 $Const51 $Volatile51 $ArrayOpt51]
lappend structMem5 $Port51
set PortName52 "lf_i"
set BitWidth52 "8"
set ArrayOpt52 ""
set Const52 "0"
set Volatile52 "0"
set Pointer52 "0"
set Reference52 "0"
set Dims52 [list 0]
set Interface52 "wire"
set DataType52 "char"
set Port52 [list $PortName52 $Interface52 $DataType52 $Pointer52 $Dims52 $Const52 $Volatile52 $ArrayOpt52]
lappend structMem5 $Port52
set PortName53 "lf_out_gain"
set BitWidth53 "8"
set ArrayOpt53 ""
set Const53 "0"
set Volatile53 "0"
set Pointer53 "0"
set Reference53 "0"
set Dims53 [list 0]
set Interface53 "wire"
set DataType53 "char"
set Port53 [list $PortName53 $Interface53 $DataType53 $Pointer53 $Dims53 $Const53 $Volatile53 $ArrayOpt53]
lappend structMem5 $Port53
set PortName54 "reg_clr"
set BitWidth54 "8"
set ArrayOpt54 ""
set Const54 "0"
set Volatile54 "0"
set Pointer54 "0"
set Reference54 "0"
set Dims54 [list 0]
set Interface54 "wire"
set DataType54 "bool"
set Port54 [list $PortName54 $Interface54 $DataType54 $Pointer54 $Dims54 $Const54 $Volatile54 $ArrayOpt54]
lappend structMem5 $Port54
set PortName55 "reg_init"
set BitWidth55 "32"
set ArrayOpt55 ""
set Const55 "0"
set Volatile55 "0"
set Pointer55 "0"
set Reference55 "0"
set Dims55 [list 0]
set Interface55 "wire"
set DataType55 "[list ap_fixed 28 2 5 0 0 ]"
set Port55 [list $PortName55 $Interface55 $DataType55 $Pointer55 $Dims55 $Const55 $Volatile55 $ArrayOpt55]
lappend structMem5 $Port55
set DataType5 [list "ctl_crec_t" "struct ctl_crec_t" $structMem5 0 0 ]
set Port5 [list $PortName5 $Interface5 $DataType5 $Pointer5 $Dims5 $Const5 $Volatile5 $ArrayOpt5]
lappend PortList $Port5
set globalAPint "" 
set returnAPInt "" 
set hasCPPAPInt 0 
set argAPInt "" 
set hasCPPAPFix 1 
set hasSCFix 0 
set hasCBool 0 
set hasCPPComplex 0 
set isTemplateTop 0
set dataPackList ""
set module [list $moduleName $PortList $rawDecl $argAPInt $returnAPInt $dataPackList]
