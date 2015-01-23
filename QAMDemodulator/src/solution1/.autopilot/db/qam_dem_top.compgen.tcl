# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 17 \
    name din_i_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_din_i_V \
    op interface \
    ports { din_i_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
    name din_q_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_din_q_V \
    op interface \
    ports { din_q_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 19 \
    name dout_mix_i_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dout_mix_i_V \
    op interface \
    ports { dout_mix_i_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
    name dout_mix_q_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dout_mix_q_V \
    op interface \
    ports { dout_mix_q_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name ph_in_i_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ph_in_i_V \
    op interface \
    ports { ph_in_i_V { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name ph_in_q_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ph_in_q_V \
    op interface \
    ports { ph_in_q_V { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 23 \
    name ph_out_i_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_ph_out_i_V \
    op interface \
    ports { ph_out_i_V { O 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 24 \
    name ph_out_q_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_ph_out_q_V \
    op interface \
    ports { ph_out_q_V { O 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 25 \
    name loop_integ_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_loop_integ_V \
    op interface \
    ports { loop_integ_V { O 28 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 26 \
    name control_qam_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_control_qam_V \
    op interface \
    ports { control_qam_V { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 27 \
    name control_lf_p \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_control_lf_p \
    op interface \
    ports { control_lf_p { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name control_lf_i \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_control_lf_i \
    op interface \
    ports { control_lf_i { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name control_lf_out_gain \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_control_lf_out_gain \
    op interface \
    ports { control_lf_out_gain { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name control_reg_clr \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_control_reg_clr \
    op interface \
    ports { control_reg_clr { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name control_reg_init_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_control_reg_init_V \
    op interface \
    ports { control_reg_init_V { I 28 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


