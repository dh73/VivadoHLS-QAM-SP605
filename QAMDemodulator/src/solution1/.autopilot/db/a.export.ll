; ModuleID = '/home/diego/qam_demudulator/v1/src/src2/qam_dem/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@p_str = private unnamed_addr constant [4 x i8] c"mul\00", align 1
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@i_reg_V = internal unnamed_addr global i28 0
@phase_angle_V = internal unnamed_addr global i16 0
@p_str2 = private unnamed_addr constant [8 x i8] c"ap_none\00", align 1
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@str = internal constant [12 x i8] c"qam_dem_top\00"
@cos_lut = internal unnamed_addr constant [1024 x i15] [i15 -1, i15 -1, i15 -1, i15 -1, i15 -1, i15 -1, i15 -1, i15 -2, i15 -2, i15 -3, i15 -4, i15 -5, i15 -6, i15 -7, i15 -8, i15 -9, i15 -10, i15 -11, i15 -12, i15 -14, i15 -15, i15 -17, i15 -19, i15 -20, i15 -22, i15 -24, i15 -26, i15 -28, i15 -30, i15 -32, i15 -35, i15 -37, i15 -39, i15 -42, i15 -45, i15 -47, i15 -50, i15 -53, i15 -56, i15 -59, i15 -62, i15 -65, i15 -68, i15 -71, i15 -75, i15 -78, i15 -82, i15 -85, i15 -89, i15 -93, i15 -96, i15 -100, i15 -104, i15 -108, i15 -112, i15 -117, i15 -121, i15 -125, i15 -130, i15 -134, i15 -139, i15 -143, i15 -148, i15 -153, i15 -158, i15 -163, i15 -168, i15 -173, i15 -178, i15 -183, i15 -189, i15 -194, i15 -200, i15 -205, i15 -211, i15 -217, i15 -222, i15 -228, i15 -234, i15 -240, i15 -246, i15 -253, i15 -259, i15 -265, i15 -272, i15 -278, i15 -285, i15 -291, i15 -298, i15 -305, i15 -312, i15 -319, i15 -326, i15 -333, i15 -340, i15 -347, i15 -355, i15 -362, i15 -370, i15 -377, i15 -385, i15 -392, i15 -400, i15 -408, i15 -416, i15 -424, i15 -432, i15 -440, i15 -449, i15 -457, i15 -465, i15 -474, i15 -482, i15 -491, i15 -500, i15 -509, i15 -517, i15 -526, i15 -535, i15 -544, i15 -554, i15 -563, i15 -572, i15 -582, i15 -591, i15 -601, i15 -610, i15 -620, i15 -630, i15 -639, i15 -649, i15 -659, i15 -669, i15 -680, i15 -690, i15 -700, i15 -711, i15 -721, i15 -731, i15 -742, i15 -753, i15 -763, i15 -774, i15 -785, i15 -796, i15 -807, i15 -818, i15 -830, i15 -841, i15 -852, i15 -864, i15 -875, i15 -887, i15 -898, i15 -910, i15 -922, i15 -934, i15 -946, i15 -958, i15 -970, i15 -982, i15 -994, i15 -1007, i15 -1019, i15 -1031, i15 -1044, i15 -1057, i15 -1069, i15 -1082, i15 -1095, i15 -1108, i15 -1121, i15 -1134, i15 -1147, i15 -1160, i15 -1174, i15 -1187, i15 -1200, i15 -1214, i15 -1228, i15 -1241, i15 -1255, i15 -1269, i15 -1283, i15 -1297, i15 -1311, i15 -1325, i15 -1339, i15 -1353, i15 -1368, i15 -1382, i15 -1396, i15 -1411, i15 -1426, i15 -1440, i15 -1455, i15 -1470, i15 -1485, i15 -1500, i15 -1515, i15 -1530, i15 -1545, i15 -1561, i15 -1576, i15 -1591, i15 -1607, i15 -1622, i15 -1638, i15 -1654, i15 -1670, i15 -1686, i15 -1701, i15 -1718, i15 -1734, i15 -1750, i15 -1766, i15 -1782, i15 -1799, i15 -1815, i15 -1832, i15 -1848, i15 -1865, i15 -1882, i15 -1899, i15 -1915, i15 -1932, i15 -1949, i15 -1967, i15 -1984, i15 -2001, i15 -2018, i15 -2036, i15 -2053, i15 -2071, i15 -2088, i15 -2106, i15 -2124, i15 -2142, i15 -2160, i15 -2178, i15 -2196, i15 -2214, i15 -2232, i15 -2250, i15 -2269, i15 -2287, i15 -2306, i15 -2324, i15 -2343, i15 -2361, i15 -2380, i15 -2399, i15 -2418, i15 -2437, i15 -2456, i15 -2475, i15 -2494, i15 -2514, i15 -2533, i15 -2552, i15 -2572, i15 -2591, i15 -2611, i15 -2631, i15 -2650, i15 -2670, i15 -2690, i15 -2710, i15 -2730, i15 -2750, i15 -2771, i15 -2791, i15 -2811, i15 -2832, i15 -2852, i15 -2873, i15 -2893, i15 -2914, i15 -2935, i15 -2955, i15 -2976, i15 -2997, i15 -3018, i15 -3039, i15 -3061, i15 -3082, i15 -3103, i15 -3125, i15 -3146, i15 -3168, i15 -3189, i15 -3211, i15 -3233, i15 -3254, i15 -3276, i15 -3298, i15 -3320, i15 -3342, i15 -3364, i15 -3387, i15 -3409, i15 -3431, i15 -3454, i15 -3476, i15 -3499, i15 -3521, i15 -3544, i15 -3567, i15 -3590, i15 -3613, i15 -3636, i15 -3659, i15 -3682, i15 -3705, i15 -3728, i15 -3752, i15 -3775, i15 -3798, i15 -3822, i15 -3846, i15 -3869, i15 -3893, i15 -3917, i15 -3941, i15 -3965, i15 -3989, i15 -4013, i15 -4037, i15 -4061, i15 -4085, i15 -4110, i15 -4134, i15 -4158, i15 -4183, i15 -4208, i15 -4232, i15 -4257, i15 -4282, i15 -4307, i15 -4332, i15 -4357, i15 -4382, i15 -4407, i15 -4432, i15 -4457, i15 -4483, i15 -4508, i15 -4534, i15 -4559, i15 -4585, i15 -4610, i15 -4636, i15 -4662, i15 -4688, i15 -4714, i15 -4740, i15 -4766, i15 -4792, i15 -4818, i15 -4844, i15 -4871, i15 -4897, i15 -4924, i15 -4950, i15 -4977, i15 -5003, i15 -5030, i15 -5057, i15 -5084, i15 -5111, i15 -5138, i15 -5165, i15 -5192, i15 -5219, i15 -5246, i15 -5274, i15 -5301, i15 -5329, i15 -5356, i15 -5384, i15 -5411, i15 -5439, i15 -5467, i15 -5495, i15 -5522, i15 -5550, i15 -5578, i15 -5606, i15 -5635, i15 -5663, i15 -5691, i15 -5719, i15 -5748, i15 -5776, i15 -5805, i15 -5833, i15 -5862, i15 -5891, i15 -5920, i15 -5948, i15 -5977, i15 -6006, i15 -6035, i15 -6065, i15 -6094, i15 -6123, i15 -6152, i15 -6182, i15 -6211, i15 -6240, i15 -6270, i15 -6300, i15 -6329, i15 -6359, i15 -6389, i15 -6419, i15 -6448, i15 -6478, i15 -6509, i15 -6539, i15 -6569, i15 -6599, i15 -6629, i15 -6660, i15 -6690, i15 -6720, i15 -6751, i15 -6782, i15 -6812, i15 -6843, i15 -6874, i15 -6905, i15 -6935, i15 -6966, i15 -6997, i15 -7029, i15 -7060, i15 -7091, i15 -7122, i15 -7153, i15 -7185, i15 -7216, i15 -7248, i15 -7279, i15 -7311, i15 -7343, i15 -7374, i15 -7406, i15 -7438, i15 -7470, i15 -7502, i15 -7534, i15 -7566, i15 -7598, i15 -7630, i15 -7663, i15 -7695, i15 -7727, i15 -7760, i15 -7792, i15 -7825, i15 -7858, i15 -7890, i15 -7923, i15 -7956, i15 -7989, i15 -8022, i15 -8055, i15 -8088, i15 -8121, i15 -8154, i15 -8187, i15 -8220, i15 -8254, i15 -8287, i15 -8320, i15 -8354, i15 -8387, i15 -8421, i15 -8455, i15 -8489, i15 -8522, i15 -8556, i15 -8590, i15 -8624, i15 -8658, i15 -8692, i15 -8726, i15 -8760, i15 -8795, i15 -8829, i15 -8863, i15 -8898, i15 -8932, i15 -8967, i15 -9001, i15 -9036, i15 -9071, i15 -9105, i15 -9140, i15 -9175, i15 -9210, i15 -9245, i15 -9280, i15 -9315, i15 -9350, i15 -9385, i15 -9421, i15 -9456, i15 -9491, i15 -9527, i15 -9562, i15 -9598, i15 -9633, i15 -9669, i15 -9704, i15 -9740, i15 -9776, i15 -9812, i15 -9848, i15 -9884, i15 -9920, i15 -9956, i15 -9992, i15 -10028, i15 -10064, i15 -10100, i15 -10137, i15 -10173, i15 -10210, i15 -10246, i15 -10283, i15 -10319, i15 -10356, i15 -10393, i15 -10429, i15 -10466, i15 -10503, i15 -10540, i15 -10577, i15 -10614, i15 -10651, i15 -10688, i15 -10725, i15 -10762, i15 -10800, i15 -10837, i15 -10874, i15 -10912, i15 -10949, i15 -10987, i15 -11024, i15 -11062, i15 -11100, i15 -11137, i15 -11175, i15 -11213, i15 -11251, i15 -11289, i15 -11327, i15 -11365, i15 -11403, i15 -11441, i15 -11479, i15 -11517, i15 -11556, i15 -11594, i15 -11632, i15 -11671, i15 -11709, i15 -11748, i15 -11787, i15 -11825, i15 -11864, i15 -11903, i15 -11941, i15 -11980, i15 -12019, i15 -12058, i15 -12097, i15 -12136, i15 -12175, i15 -12214, i15 -12253, i15 -12293, i15 -12332, i15 -12371, i15 -12411, i15 -12450, i15 -12489, i15 -12529, i15 -12568, i15 -12608, i15 -12648, i15 -12687, i15 -12727, i15 -12767, i15 -12807, i15 -12847, i15 -12887, i15 -12927, i15 -12967, i15 -13007, i15 -13047, i15 -13087, i15 -13127, i15 -13167, i15 -13208, i15 -13248, i15 -13289, i15 -13329, i15 -13369, i15 -13410, i15 -13451, i15 -13491, i15 -13532, i15 -13573, i15 -13613, i15 -13654, i15 -13695, i15 -13736, i15 -13777, i15 -13818, i15 -13859, i15 -13900, i15 -13941, i15 -13982, i15 -14023, i15 -14065, i15 -14106, i15 -14147, i15 -14189, i15 -14230, i15 -14272, i15 -14313, i15 -14355, i15 -14396, i15 -14438, i15 -14480, i15 -14521, i15 -14563, i15 -14605, i15 -14647, i15 -14689, i15 -14731, i15 -14773, i15 -14815, i15 -14857, i15 -14899, i15 -14941, i15 -14983, i15 -15025, i15 -15068, i15 -15110, i15 -15152, i15 -15195, i15 -15237, i15 -15280, i15 -15322, i15 -15365, i15 -15407, i15 -15450, i15 -15493, i15 -15535, i15 -15578, i15 -15621, i15 -15664, i15 -15707, i15 -15750, i15 -15793, i15 -15836, i15 -15879, i15 -15922, i15 -15965, i15 -16008, i15 -16051, i15 -16095, i15 -16138, i15 -16181, i15 -16225, i15 -16268, i15 -16312, i15 -16355, i15 16369, i15 16326, i15 16282, i15 16239, i15 16195, i15 16151, i15 16108, i15 16064, i15 16020, i15 15976, i15 15932, i15 15888, i15 15844, i15 15800, i15 15756, i15 15712, i15 15668, i15 15624, i15 15580, i15 15535, i15 15491, i15 15447, i15 15402, i15 15358, i15 15314, i15 15269, i15 15225, i15 15180, i15 15136, i15 15091, i15 15046, i15 15002, i15 14957, i15 14912, i15 14867, i15 14823, i15 14778, i15 14733, i15 14688, i15 14643, i15 14598, i15 14553, i15 14508, i15 14463, i15 14418, i15 14373, i15 14327, i15 14282, i15 14237, i15 14192, i15 14146, i15 14101, i15 14056, i15 14010, i15 13965, i15 13919, i15 13874, i15 13828, i15 13783, i15 13737, i15 13691, i15 13646, i15 13600, i15 13554, i15 13508, i15 13463, i15 13417, i15 13371, i15 13325, i15 13279, i15 13233, i15 13187, i15 13141, i15 13095, i15 13049, i15 13003, i15 12957, i15 12910, i15 12864, i15 12818, i15 12772, i15 12725, i15 12679, i15 12633, i15 12586, i15 12540, i15 12493, i15 12447, i15 12400, i15 12354, i15 12307, i15 12261, i15 12214, i15 12167, i15 12121, i15 12074, i15 12027, i15 11980, i15 11934, i15 11887, i15 11840, i15 11793, i15 11746, i15 11699, i15 11652, i15 11605, i15 11558, i15 11511, i15 11464, i15 11417, i15 11370, i15 11323, i15 11276, i15 11228, i15 11181, i15 11134, i15 11087, i15 11039, i15 10992, i15 10945, i15 10897, i15 10850, i15 10802, i15 10755, i15 10707, i15 10660, i15 10612, i15 10565, i15 10517, i15 10469, i15 10422, i15 10374, i15 10326, i15 10279, i15 10231, i15 10183, i15 10135, i15 10088, i15 10040, i15 9992, i15 9944, i15 9896, i15 9848, i15 9800, i15 9752, i15 9704, i15 9656, i15 9608, i15 9560, i15 9512, i15 9464, i15 9416, i15 9368, i15 9319, i15 9271, i15 9223, i15 9175, i15 9127, i15 9078, i15 9030, i15 8982, i15 8933, i15 8885, i15 8836, i15 8788, i15 8740, i15 8691, i15 8643, i15 8594, i15 8546, i15 8497, i15 8449, i15 8400, i15 8351, i15 8303, i15 8254, i15 8206, i15 8157, i15 8108, i15 8059, i15 8011, i15 7962, i15 7913, i15 7864, i15 7816, i15 7767, i15 7718, i15 7669, i15 7620, i15 7571, i15 7522, i15 7473, i15 7425, i15 7376, i15 7327, i15 7278, i15 7229, i15 7180, i15 7130, i15 7081, i15 7032, i15 6983, i15 6934, i15 6885, i15 6836, i15 6787, i15 6737, i15 6688, i15 6639, i15 6590, i15 6541, i15 6491, i15 6442, i15 6393, i15 6343, i15 6294, i15 6245, i15 6195, i15 6146, i15 6097, i15 6047, i15 5998, i15 5948, i15 5899, i15 5850, i15 5800, i15 5751, i15 5701, i15 5652, i15 5602, i15 5553, i15 5503, i15 5453, i15 5404, i15 5354, i15 5305, i15 5255, i15 5205, i15 5156, i15 5106, i15 5057, i15 5007, i15 4957, i15 4907, i15 4858, i15 4808, i15 4758, i15 4709, i15 4659, i15 4609, i15 4559, i15 4510, i15 4460, i15 4410, i15 4360, i15 4310, i15 4260, i15 4211, i15 4161, i15 4111, i15 4061, i15 4011, i15 3961, i15 3911, i15 3861, i15 3812, i15 3762, i15 3712, i15 3662, i15 3612, i15 3562, i15 3512, i15 3462, i15 3412, i15 3362, i15 3312, i15 3262, i15 3212, i15 3162, i15 3112, i15 3062, i15 3012, i15 2962, i15 2912, i15 2861, i15 2811, i15 2761, i15 2711, i15 2661, i15 2611, i15 2561, i15 2511, i15 2461, i15 2411, i15 2360, i15 2310, i15 2260, i15 2210, i15 2160, i15 2110, i15 2060, i15 2009, i15 1959, i15 1909, i15 1859, i15 1809, i15 1758, i15 1708, i15 1658, i15 1608, i15 1558, i15 1507, i15 1457, i15 1407, i15 1357, i15 1307, i15 1256, i15 1206, i15 1156, i15 1106, i15 1055, i15 1005, i15 955, i15 905, i15 854, i15 804, i15 754, i15 704, i15 653, i15 603, i15 553, i15 503, i15 452, i15 402, i15 352, i15 302, i15 251, i15 201, i15 151, i15 101, i15 50]

define weak void @_ssdm_op_SpecResourceLimit(...) nounwind {
entry:
  ret void
}

define internal fastcc void @qam_dem_top_mounstrito(i16 %din_i_V, i16 %din_q_V, i16* nocapture %dout_mix_i_V, i16* nocapture %dout_mix_q_V, i12 %ph_in_i_V, i12 %ph_in_q_V, i12* nocapture %ph_out_i_V, i12* nocapture %ph_out_q_V, i28* nocapture %loop_integ_V, i8 %control_lf_p, i8 %control_lf_i, i8 %control_lf_out_gain, i1 %control_reg_clr, i28 %control_reg_init_V) {
  %control_reg_init_V_read = call i28 @_ssdm_op_Read.ap_auto.i28(i28 %control_reg_init_V)
  %control_reg_clr_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %control_reg_clr)
  %control_lf_out_gain_read = call i8 @_ssdm_op_Read.ap_auto.i8(i8 %control_lf_out_gain)
  %control_lf_i_read = call i8 @_ssdm_op_Read.ap_auto.i8(i8 %control_lf_i)
  %control_lf_p_read = call i8 @_ssdm_op_Read.ap_auto.i8(i8 %control_lf_p)
  %ph_in_q_V_read = call i12 @_ssdm_op_Read.ap_auto.i12(i12 %ph_in_q_V)
  %ph_in_i_V_read = call i12 @_ssdm_op_Read.ap_auto.i12(i12 %ph_in_i_V)
  %din_q_V_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %din_q_V)
  %din_i_V_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %din_i_V)
  call void (...)* @_ssdm_op_SpecResourceLimit(i32 1, [4 x i8]* @p_str, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %OP1_V_i_cast = sext i16 %din_i_V_read to i27
  %OP2_V_i_cast = sext i12 %ph_in_i_V_read to i27
  %p_Val2_s = mul i27 %OP1_V_i_cast, %OP2_V_i_cast
  %OP2_V_1_i_cast = sext i12 %ph_in_q_V_read to i27
  %tmp_1 = sext i16 %din_q_V_read to i27
  %tmp = call i16 @_ssdm_op_PartSelect.i16.i27.i32.i32(i27 %p_Val2_s, i32 11, i32 26)
  %tmp_6_i = call i27 @_ssdm_op_BitConcatenate.i27.i16.i11(i16 %tmp, i11 0)
  %tmp_i_cast = mul i27 %tmp_1, %OP2_V_1_i_cast
  %p_Val2_1 = sub i27 %tmp_6_i, %tmp_i_cast
  %sd_out_i_V = call i16 @_ssdm_op_PartSelect.i16.i27.i32.i32(i27 %p_Val2_1, i32 11, i32 26)
  %p_Val2_2 = mul i27 %OP1_V_i_cast, %OP2_V_1_i_cast
  %tmp_2 = call i16 @_ssdm_op_PartSelect.i16.i27.i32.i32(i27 %p_Val2_2, i32 11, i32 26)
  %tmp_3_i = call i27 @_ssdm_op_BitConcatenate.i27.i16.i11(i16 %tmp_2, i11 0)
  %tmp_4_i_cast = mul i27 %tmp_1, %OP2_V_i_cast
  %p_Val2_3 = add i27 %tmp_3_i, %tmp_4_i_cast
  %sd_out_q_V = call i16 @_ssdm_op_PartSelect.i16.i27.i32.i32(i27 %p_Val2_3, i32 11, i32 26)
  %isneg = call i1 @_ssdm_op_BitSelect.i1.i27.i32(i27 %p_Val2_1, i32 26)
  %newsignbit = call i1 @_ssdm_op_BitSelect.i1.i27.i32(i27 %p_Val2_1, i32 24)
  %p_Result_i = call i2 @_ssdm_op_PartSelect.i2.i27.i32.i32(i27 %p_Val2_1, i32 25, i32 26)
  %p_not_i1_i = icmp ne i2 %p_Result_i, 0
  %brmerge_i1_i = or i1 %newsignbit, %p_not_i1_i
  %tmp_5_i = xor i1 %isneg, true
  %overflow = and i1 %brmerge_i1_i, %tmp_5_i
  %newsignbit_0_not_i1_i = xor i1 %newsignbit, true
  %p_not38_i1_i = icmp ne i2 %p_Result_i, -1
  %brmerge39_i1_i = or i1 %p_not38_i1_i, %newsignbit_0_not_i1_i
  %underflow = and i1 %brmerge39_i1_i, %isneg
  %brmerge_i_i1_i = or i1 %underflow, %overflow
  %underflow_not_i = xor i1 %underflow, true
  %brmerge8_i = or i1 %overflow, %underflow_not_i
  %isneg_1 = call i1 @_ssdm_op_BitSelect.i1.i27.i32(i27 %p_Val2_3, i32 26)
  %newsignbit_1 = call i1 @_ssdm_op_BitSelect.i1.i27.i32(i27 %p_Val2_3, i32 24)
  %p_Result_1_i = call i2 @_ssdm_op_PartSelect.i2.i27.i32.i32(i27 %p_Val2_3, i32 25, i32 26)
  %p_not_i_i = icmp ne i2 %p_Result_1_i, 0
  %brmerge_i_i = or i1 %newsignbit_1, %p_not_i_i
  %tmp_7_i = xor i1 %isneg_1, true
  %overflow_1 = and i1 %brmerge_i_i, %tmp_7_i
  %newsignbit_0_not_i_i = xor i1 %newsignbit_1, true
  %p_not38_i_i = icmp ne i2 %p_Result_1_i, -1
  %brmerge39_i_i = or i1 %p_not38_i_i, %newsignbit_0_not_i_i
  %underflow_1 = and i1 %brmerge39_i_i, %isneg_1
  %brmerge_i_i_i = or i1 %underflow_1, %overflow_1
  %underflow_1_not_i = xor i1 %underflow_1, true
  %brmerge9_i = or i1 %overflow_1, %underflow_1_not_i
  %not_brmerge_i_i1_i = xor i1 %brmerge_i_i1_i, true
  %tmp_5 = and i1 %newsignbit, %not_brmerge_i_i1_i
  %tmp_s = or i1 %underflow, %newsignbit
  %tmp_3 = select i1 %brmerge8_i, i1 %tmp_5, i1 %tmp_s
  %tmp_i2 = call i2 @_ssdm_op_BitConcatenate.i2.i1.i1(i1 %tmp_3, i1 true)
  %p_Result_s = call i5 @_ssdm_op_PartSet.i5.i5.i2.i32.i32(i5 undef, i2 %tmp_i2, i32 3, i32 4)
  %not_brmerge_i_i_i = xor i1 %brmerge_i_i_i, true
  %tmp_4 = and i1 %newsignbit_1, %not_brmerge_i_i_i
  %tmp_8 = or i1 %underflow_1, %newsignbit_1
  %tmp_6 = select i1 %brmerge9_i, i1 %tmp_4, i1 %tmp_8
  %tmp_1_i3 = call i2 @_ssdm_op_BitConcatenate.i2.i1.i1(i1 %tmp_6, i1 true)
  %p_Result_2 = call i5 @_ssdm_op_PartSet.i5.i5.i2.i32.i32(i5 undef, i2 %tmp_1_i3, i32 3, i32 4)
  %OP1_V = sext i5 %p_Result_s to i21
  %OP2_V = sext i16 %sd_out_q_V to i21
  %p_Val2_8 = mul i21 %OP2_V, %OP1_V
  %isneg_2 = call i1 @_ssdm_op_BitSelect.i1.i21.i32(i21 %p_Val2_8, i32 20)
  %p_Val2_9 = call i14 @_ssdm_op_PartSelect.i14.i21.i32.i32(i21 %p_Val2_8, i32 5, i32 18)
  %newsignbit_2 = call i1 @_ssdm_op_BitSelect.i1.i21.i32(i21 %p_Val2_8, i32 18)
  %p_Result_i8 = call i2 @_ssdm_op_PartSelect.i2.i21.i32.i32(i21 %p_Val2_8, i32 19, i32 20)
  %p_not_i_i9 = icmp ne i2 %p_Result_i8, 0
  %brmerge_i_i1 = or i1 %newsignbit_2, %p_not_i_i9
  %tmp_8_i = xor i1 %isneg_2, true
  %overflow_2 = and i1 %brmerge_i_i1, %tmp_8_i
  %newsignbit_0_not_i_i1 = xor i1 %newsignbit_2, true
  %p_not38_i_i1 = icmp ne i2 %p_Result_i8, -1
  %brmerge39_i_i1 = or i1 %p_not38_i_i1, %newsignbit_0_not_i_i1
  %underflow_2 = and i1 %brmerge39_i_i1, %isneg_2
  %brmerge_i_i_i1 = or i1 %underflow_2, %overflow_2
  %underflow_not_i1 = xor i1 %underflow_2, true
  %brmerge_i = or i1 %overflow_2, %underflow_not_i1
  %p_Val2_21_mux_i = select i1 %brmerge_i_i_i1, i14 8191, i14 %p_Val2_9
  %p_Val2_i1 = select i1 %underflow_2, i14 -8192, i14 %p_Val2_9
  %OP1_V_1 = sext i5 %p_Result_2 to i21
  %OP2_V_1 = sext i16 %sd_out_i_V to i21
  %p_Val2_18 = mul i21 %OP2_V_1, %OP1_V_1
  %tmp_9 = select i1 %brmerge_i, i14 %p_Val2_21_mux_i, i14 %p_Val2_i1
  %tmp_1_i1 = call i19 @_ssdm_op_BitConcatenate.i19.i14.i5(i14 %tmp_9, i5 0)
  %tmp_10_cast_i = sext i19 %tmp_1_i1 to i21
  %p_Val2_23 = sub i21 %tmp_10_cast_i, %p_Val2_18
  %isneg_3 = call i1 @_ssdm_op_BitSelect.i1.i21.i32(i21 %p_Val2_23, i32 20)
  %p_Val2_24 = call i14 @_ssdm_op_PartSelect.i14.i21.i32.i32(i21 %p_Val2_23, i32 5, i32 18)
  %newsignbit_3 = call i1 @_ssdm_op_BitSelect.i1.i21.i32(i21 %p_Val2_23, i32 18)
  %tmp_7 = call i2 @_ssdm_op_PartSelect.i2.i21.i32.i32(i21 %p_Val2_23, i32 19, i32 20)
  %p_not_i_i_i = icmp ne i2 %tmp_7, 0
  %brmerge_i_i4_i = or i1 %newsignbit_3, %p_not_i_i_i
  %tmp_3_i1 = xor i1 %isneg_3, true
  %overflow_3 = and i1 %brmerge_i_i4_i, %tmp_3_i1
  %newsignbit_0_not_i_i_i = xor i1 %newsignbit_3, true
  %p_not38_i_i_i = icmp ne i2 %tmp_7, -1
  %brmerge39_i_i_i = or i1 %p_not38_i_i_i, %newsignbit_0_not_i_i_i
  %underflow_3 = and i1 %brmerge39_i_i_i, %isneg_3
  %brmerge_i_i_i_i = or i1 %underflow_3, %overflow_3
  %underflow_4_not_i = xor i1 %underflow_3, true
  %brmerge1_i = or i1 %overflow_3, %underflow_4_not_i
  %ssdm_int_V_write_assign = select i1 %brmerge_i_i_i_i, i14 8191, i14 %p_Val2_24
  %p_Val2_1_i = select i1 %underflow_3, i14 -8192, i14 %p_Val2_24
  %tmp_10 = select i1 %brmerge1_i, i14 %ssdm_int_V_write_assign, i14 %p_Val2_1_i
  %tmp_i1 = call i28 @_ssdm_op_BitConcatenate.i28.i14.i14(i14 %tmp_10, i14 0)
  %isNeg = call i1 @_ssdm_op_BitSelect.i1.i8.i32(i8 %control_lf_p_read, i32 7)
  %tmp_4_i = sub i8 0, %control_lf_p_read
  %sh_assign = select i1 %isNeg, i8 %tmp_4_i, i8 %control_lf_p_read
  %sh_assign_1_cast6_i = zext i8 %sh_assign to i28
  %sh_assign_1_cast_i = zext i8 %sh_assign to i32
  %tmp_5_i1 = sext i28 %tmp_i1 to i32
  %tmp_6_i2 = shl i32 %tmp_5_i1, %sh_assign_1_cast_i
  %tmp_7_i1 = ashr i28 %tmp_i1, %sh_assign_1_cast6_i
  %tmp_16 = trunc i32 %tmp_6_i2 to i28
  %p_Val2_26 = select i1 %isNeg, i28 %tmp_16, i28 %tmp_7_i1
  %tmp_19_cast_i = sext i8 %control_lf_i_read to i9
  %sh_assign_1 = add i9 %tmp_19_cast_i, 9
  %isNeg_1 = call i1 @_ssdm_op_BitSelect.i1.i9.i32(i9 %sh_assign_1, i32 8)
  %tmp_8_i1 = sub i9 -9, %tmp_19_cast_i
  %sh_assign_2 = select i1 %isNeg_1, i9 %tmp_8_i1, i9 %sh_assign_1
  %sh_assign_3_cast5_i = sext i9 %sh_assign_2 to i28
  %sh_assign_3_cast_i = sext i9 %sh_assign_2 to i32
  %tmp_10_i = shl i32 %tmp_5_i1, %sh_assign_3_cast_i
  %tmp_11_i = ashr i28 %tmp_i1, %sh_assign_3_cast5_i
  %tmp_18 = trunc i32 %tmp_10_i to i28
  %p_Val2_4 = select i1 %isNeg_1, i28 %tmp_18, i28 %tmp_11_i
  %p_Val2_25 = load i28* @i_reg_V, align 4
  %p_Val2_5 = add i28 %p_Val2_25, %p_Val2_4
  %tmp_12_i = sext i28 %p_Val2_5 to i29
  %tmp_13_i = sext i28 %p_Val2_26 to i29
  %p_Val2_27 = add i29 %tmp_12_i, %tmp_13_i
  %isneg_4 = call i1 @_ssdm_op_BitSelect.i1.i29.i32(i29 %p_Val2_27, i32 28)
  %p_Val2_29 = trunc i29 %p_Val2_27 to i28
  %newsignbit_4 = call i1 @_ssdm_op_BitSelect.i1.i29.i32(i29 %p_Val2_27, i32 27)
  %tmp_15_i = xor i1 %newsignbit_4, true
  %underflow_4 = and i1 %isneg_4, %tmp_15_i
  %brmerge_i_i_i2 = xor i1 %isneg_4, %newsignbit_4
  %isneg_not_i = xor i1 %isneg_4, true
  %brmerge_i1 = or i1 %newsignbit_4, %isneg_not_i
  %p_Val2_28_mux_i = select i1 %brmerge_i_i_i2, i28 134217727, i28 %p_Val2_29
  %p_Val2_i2 = select i1 %underflow_4, i28 -134217728, i28 %p_Val2_29
  %tmp_16_i = select i1 %brmerge_i1, i28 %p_Val2_28_mux_i, i28 %p_Val2_i2
  %p_Val2_41 = select i1 %control_reg_clr_read, i28 %control_reg_init_V_read, i28 %p_Val2_5
  store i28 %p_Val2_41, i28* @i_reg_V, align 4
  %isNeg_2 = call i1 @_ssdm_op_BitSelect.i1.i8.i32(i8 %control_lf_out_gain_read, i32 7)
  %tmp_17_i = sub i8 0, %control_lf_out_gain_read
  %sh_assign_3 = select i1 %isNeg_2, i8 %tmp_17_i, i8 %control_lf_out_gain_read
  %sh_assign_5_cast3_i = zext i8 %sh_assign_3 to i28
  %sh_assign_5_cast_i = zext i8 %sh_assign_3 to i32
  %tmp_18_i = sext i28 %tmp_16_i to i32
  %tmp_19_i = shl i32 %tmp_18_i, %sh_assign_5_cast_i
  %tmp_20_i = ashr i28 %tmp_16_i, %sh_assign_5_cast3_i
  %tmp_25 = trunc i32 %tmp_19_i to i28
  %p_Val2_33 = select i1 %isNeg_2, i28 %tmp_25, i28 %tmp_20_i
  %p_Val2_32 = load i16* @phase_angle_V, align 2
  %tmp_i2_15 = call i27 @_ssdm_op_BitConcatenate.i27.i16.i11(i16 %p_Val2_32, i11 0)
  %tmp_35_cast_i = sext i27 %tmp_i2_15 to i29
  %tmp_21_i = zext i28 %p_Val2_33 to i29
  %p_Val2_34 = sub i29 %tmp_35_cast_i, %tmp_21_i
  %p_Val2_35 = call i16 @_ssdm_op_PartSelect.i16.i29.i32.i32(i29 %p_Val2_34, i32 11, i32 26)
  store i16 %p_Val2_35, i16* @phase_angle_V, align 2
  %msb_V = call i2 @_ssdm_op_PartSelect.i2.i29.i32.i32(i29 %p_Val2_34, i32 25, i32 26)
  %tmp_26 = call i1 @_ssdm_op_BitSelect.i1.i29.i32(i29 %p_Val2_34, i32 25)
  %sin_adr_V = call i10 @_ssdm_op_PartSelect.i10.i29.i32.i32(i29 %p_Val2_34, i32 15, i32 24)
  %cos_adr_V_3 = xor i10 %sin_adr_V, -1
  %cos_adr_V = select i1 %tmp_26, i10 %cos_adr_V_3, i10 %sin_adr_V
  %sin_adr_V_1 = select i1 %tmp_26, i10 %sin_adr_V, i10 %cos_adr_V_3
  %tmp_23_i = zext i10 %cos_adr_V to i64
  %cos_lut_addr = getelementptr [1024 x i15]* @cos_lut, i64 0, i64 %tmp_23_i
  %cos_out_V = load i15* %cos_lut_addr, align 2
  %p_Val2_32_cast_i = zext i15 %cos_out_V to i16
  %tmp_24_i = zext i10 %sin_adr_V_1 to i64
  %cos_lut_addr_1 = getelementptr [1024 x i15]* @cos_lut, i64 0, i64 %tmp_24_i
  %sin_out_V_3 = load i15* %cos_lut_addr_1, align 2
  %p_Val2_31_cast_i = zext i15 %sin_out_V_3 to i16
  %tmp_25_i = icmp eq i2 %msb_V, 1
  %tmp_26_i = icmp eq i2 %msb_V, 0
  %tmp_27_i = icmp eq i2 %msb_V, -1
  %sin_out_V = sub i16 0, %p_Val2_31_cast_i
  %sel_tmp_i = sub i16 0, %p_Val2_32_cast_i
  %sel_tmp3_demorgan_i = or i1 %tmp_25_i, %tmp_26_i
  %sel_tmp3_i = xor i1 %sel_tmp3_demorgan_i, true
  %sel_tmp4_i = and i1 %tmp_27_i, %sel_tmp3_i
  %sel_tmp6_i = xor i1 %tmp_25_i, true
  %sel_tmp7_i = and i1 %tmp_26_i, %sel_tmp6_i
  %or_cond = or i1 %sel_tmp7_i, %sel_tmp4_i
  %tmp_11 = call i11 @_ssdm_op_PartSelect.i11.i15.i32.i32(i15 %cos_out_V, i32 4, i32 14)
  %tmp_12 = zext i11 %tmp_11 to i12
  %tmp_27 = call i12 @_ssdm_op_PartSelect.i12.i16.i32.i32(i16 %sel_tmp_i, i32 4, i32 15)
  %tmp_28 = select i1 %sel_tmp4_i, i12 %tmp_12, i12 %tmp_27
  %t_ph_out_i_V = select i1 %sel_tmp7_i, i12 %tmp_12, i12 %tmp_28
  %tmp_29 = call i11 @_ssdm_op_PartSelect.i11.i15.i32.i32(i15 %sin_out_V_3, i32 4, i32 14)
  %tmp_30 = zext i11 %tmp_29 to i12
  %tmp_31 = call i12 @_ssdm_op_PartSelect.i12.i16.i32.i32(i16 %sin_out_V, i32 4, i32 15)
  %tmp_32 = select i1 %sel_tmp7_i, i12 %tmp_30, i12 %tmp_31
  %tmp_33 = select i1 %tmp_25_i, i12 %tmp_30, i12 %tmp_31
  %t_ph_out_q_V = select i1 %or_cond, i12 %tmp_32, i12 %tmp_33
  call void @_ssdm_op_Write.ap_auto.i12P(i12* %ph_out_i_V, i12 %t_ph_out_i_V)
  call void @_ssdm_op_Write.ap_auto.i12P(i12* %ph_out_q_V, i12 %t_ph_out_q_V)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %dout_mix_i_V, i16 %sd_out_i_V)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %dout_mix_q_V, i16 %sd_out_q_V)
  call void @_ssdm_op_Write.ap_auto.i28P(i28* %loop_integ_V, i28 %p_Val2_41)
  ret void
}

define void @qam_dem_top(i16 %din_i_V, i16 %din_q_V, i16* %dout_mix_i_V, i16* %dout_mix_q_V, i12 %ph_in_i_V, i12 %ph_in_q_V, i12* %ph_out_i_V, i12* %ph_out_q_V, i28* %loop_integ_V, i2 %control_qam_V, i8 %control_lf_p, i8 %control_lf_i, i8 %control_lf_out_gain, i1 %control_reg_clr, i28 %control_reg_init_V) {
codeRepl:
  call void (...)* @_ssdm_op_SpecDataflowPipeline(i32 -1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %din_i_V), !map !7
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %din_q_V), !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %dout_mix_i_V), !map !17
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %dout_mix_q_V), !map !21
  call void (...)* @_ssdm_op_SpecBitsMap(i12 %ph_in_i_V), !map !25
  call void (...)* @_ssdm_op_SpecBitsMap(i12 %ph_in_q_V), !map !29
  call void (...)* @_ssdm_op_SpecBitsMap(i12* %ph_out_i_V), !map !33
  call void (...)* @_ssdm_op_SpecBitsMap(i12* %ph_out_q_V), !map !37
  call void (...)* @_ssdm_op_SpecBitsMap(i28* %loop_integ_V), !map !41
  call void (...)* @_ssdm_op_SpecBitsMap(i2 %control_qam_V), !map !45
  call void (...)* @_ssdm_op_SpecBitsMap(i8 %control_lf_p), !map !49
  call void (...)* @_ssdm_op_SpecBitsMap(i8 %control_lf_i), !map !53
  call void (...)* @_ssdm_op_SpecBitsMap(i8 %control_lf_out_gain), !map !57
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %control_reg_clr), !map !61
  call void (...)* @_ssdm_op_SpecBitsMap(i28 %control_reg_init_V), !map !65
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i16* %dout_mix_i_V, i16* %dout_mix_q_V, [8 x i8]* @p_str2, i32 1, i32 1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecDataflowPipeline(i32 -1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i28* %loop_integ_V, [8 x i8]* @p_str2, i32 1, i32 1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i12* %ph_out_i_V, i12* %ph_out_q_V, [8 x i8]* @p_str2, i32 1, i32 1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %control_reg_init_V_read = call i28 @_ssdm_op_Read.ap_auto.i28(i28 %control_reg_init_V)
  %control_reg_clr_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %control_reg_clr)
  %control_lf_out_gain_read = call i8 @_ssdm_op_Read.ap_auto.i8(i8 %control_lf_out_gain)
  %control_lf_i_read = call i8 @_ssdm_op_Read.ap_auto.i8(i8 %control_lf_i)
  %control_lf_p_read = call i8 @_ssdm_op_Read.ap_auto.i8(i8 %control_lf_p)
  %ph_in_q_V_read = call i12 @_ssdm_op_Read.ap_auto.i12(i12 %ph_in_q_V)
  %ph_in_i_V_read = call i12 @_ssdm_op_Read.ap_auto.i12(i12 %ph_in_i_V)
  %din_q_V_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %din_q_V)
  %din_i_V_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %din_i_V)
  call fastcc void @qam_dem_top_mounstrito(i16 %din_i_V_read, i16 %din_q_V_read, i16* %dout_mix_i_V, i16* %dout_mix_q_V, i12 %ph_in_i_V_read, i12 %ph_in_q_V_read, i12* %ph_out_i_V, i12* %ph_out_q_V, i28* %loop_integ_V, i8 %control_lf_p_read, i8 %control_lf_i_read, i8 %control_lf_out_gain_read, i1 %control_reg_clr_read, i28 %control_reg_init_V_read)
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecDataflowPipeline(...) nounwind {
entry:
  ret void
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

declare void @_GLOBAL__I_a() nounwind section ".text.startup"

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i2 @_ssdm_op_BitConcatenate.i2.i1.i1(i1, i1) nounwind readnone {
entry:
  %empty = zext i1 %0 to i2
  %empty_16 = zext i1 %1 to i2
  %empty_17 = shl i2 %empty, 1
  %empty_18 = or i2 %empty_17, %empty_16
  ret i2 %empty_18
}

define weak i5 @_ssdm_op_PartSet.i5.i5.i2.i32.i32(i5, i2, i32, i32) nounwind readnone {
entry:
  %empty = call i5 @llvm.part.set.i5.i2(i5 %0, i2 %1, i32 %2, i32 %3)
  ret i5 %empty
}

define weak i2 @_ssdm_op_PartSelect.i2.i21.i32.i32(i21, i32, i32) nounwind readnone {
entry:
  %empty = call i21 @llvm.part.select.i21(i21 %0, i32 %1, i32 %2)
  %empty_19 = trunc i21 %empty to i2
  ret i2 %empty_19
}

define weak i2 @_ssdm_op_PartSelect.i2.i29.i32.i32(i29, i32, i32) nounwind readnone {
entry:
  %empty = call i29 @llvm.part.select.i29(i29 %0, i32 %1, i32 %2)
  %empty_20 = trunc i29 %empty to i2
  ret i2 %empty_20
}

define weak i10 @_ssdm_op_PartSelect.i10.i29.i32.i32(i29, i32, i32) nounwind readnone {
entry:
  %empty = call i29 @llvm.part.select.i29(i29 %0, i32 %1, i32 %2)
  %empty_21 = trunc i29 %empty to i10
  ret i10 %empty_21
}

define weak i2 @_ssdm_op_PartSelect.i2.i27.i32.i32(i27, i32, i32) nounwind readnone {
entry:
  %empty = call i27 @llvm.part.select.i27(i27 %0, i32 %1, i32 %2)
  %empty_22 = trunc i27 %empty to i2
  ret i2 %empty_22
}

define weak i12 @_ssdm_op_PartSelect.i12.i16.i32.i32(i16, i32, i32) nounwind readnone {
entry:
  %empty = call i16 @llvm.part.select.i16(i16 %0, i32 %1, i32 %2)
  %empty_23 = trunc i16 %empty to i12
  ret i12 %empty_23
}

define weak i16 @_ssdm_op_PartSelect.i16.i27.i32.i32(i27, i32, i32) nounwind readnone {
entry:
  %empty = call i27 @llvm.part.select.i27(i27 %0, i32 %1, i32 %2)
  %empty_24 = trunc i27 %empty to i16
  ret i16 %empty_24
}

define weak i27 @_ssdm_op_BitConcatenate.i27.i16.i11(i16, i11) nounwind readnone {
entry:
  %empty = zext i16 %0 to i27
  %empty_25 = zext i11 %1 to i27
  %empty_26 = shl i27 %empty, 11
  %empty_27 = or i27 %empty_26, %empty_25
  ret i27 %empty_27
}

define weak i28 @_ssdm_op_BitConcatenate.i28.i14.i14(i14, i14) nounwind readnone {
entry:
  %empty = zext i14 %0 to i28
  %empty_28 = zext i14 %1 to i28
  %empty_29 = shl i28 %empty, 14
  %empty_30 = or i28 %empty_29, %empty_28
  ret i28 %empty_30
}

define weak i14 @_ssdm_op_PartSelect.i14.i21.i32.i32(i21, i32, i32) nounwind readnone {
entry:
  %empty = call i21 @llvm.part.select.i21(i21 %0, i32 %1, i32 %2)
  %empty_31 = trunc i21 %empty to i14
  ret i14 %empty_31
}

define weak i19 @_ssdm_op_BitConcatenate.i19.i14.i5(i14, i5) nounwind readnone {
entry:
  %empty = zext i14 %0 to i19
  %empty_32 = zext i5 %1 to i19
  %empty_33 = shl i19 %empty, 5
  %empty_34 = or i19 %empty_33, %empty_32
  ret i19 %empty_34
}

define weak i11 @_ssdm_op_PartSelect.i11.i15.i32.i32(i15, i32, i32) nounwind readnone {
entry:
  %empty = call i15 @llvm.part.select.i15(i15 %0, i32 %1, i32 %2)
  %empty_35 = trunc i15 %empty to i11
  ret i11 %empty_35
}

define weak i16 @_ssdm_op_PartSelect.i16.i29.i32.i32(i29, i32, i32) nounwind readnone {
entry:
  %empty = call i29 @llvm.part.select.i29(i29 %0, i32 %1, i32 %2)
  %empty_36 = trunc i29 %empty to i16
  ret i16 %empty_36
}

define weak i16 @_ssdm_op_Read.ap_auto.i16(i16) {
entry:
  ret i16 %0
}

define weak i12 @_ssdm_op_Read.ap_auto.i12(i12) {
entry:
  ret i12 %0
}

define weak i8 @_ssdm_op_Read.ap_auto.i8(i8) {
entry:
  ret i8 %0
}

define weak i1 @_ssdm_op_Read.ap_auto.i1(i1) {
entry:
  ret i1 %0
}

define weak i28 @_ssdm_op_Read.ap_auto.i28(i28) {
entry:
  ret i28 %0
}

define weak void @_ssdm_op_Write.ap_auto.i28P(i28*, i28) {
entry:
  store i28 %1, i28* %0
  ret void
}

define weak void @_ssdm_op_Write.ap_auto.i16P(i16*, i16) {
entry:
  store i16 %1, i16* %0
  ret void
}

define weak void @_ssdm_op_Write.ap_auto.i12P(i12*, i12) {
entry:
  store i12 %1, i12* %0
  ret void
}

define weak i1 @_ssdm_op_BitSelect.i1.i27.i32(i27, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i27
  %empty_37 = shl i27 1, %empty
  %empty_38 = and i27 %0, %empty_37
  %empty_39 = icmp ne i27 %empty_38, 0
  ret i1 %empty_39
}

define weak i1 @_ssdm_op_BitSelect.i1.i21.i32(i21, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i21
  %empty_40 = shl i21 1, %empty
  %empty_41 = and i21 %0, %empty_40
  %empty_42 = icmp ne i21 %empty_41, 0
  ret i1 %empty_42
}

define weak i1 @_ssdm_op_BitSelect.i1.i8.i32(i8, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i8
  %empty_43 = shl i8 1, %empty
  %empty_44 = and i8 %0, %empty_43
  %empty_45 = icmp ne i8 %empty_44, 0
  ret i1 %empty_45
}

define weak i1 @_ssdm_op_BitSelect.i1.i9.i32(i9, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i9
  %empty_46 = shl i9 1, %empty
  %empty_47 = and i9 %0, %empty_46
  %empty_48 = icmp ne i9 %empty_47, 0
  ret i1 %empty_48
}

define weak i1 @_ssdm_op_BitSelect.i1.i29.i32(i29, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i29
  %empty_49 = shl i29 1, %empty
  %empty_50 = and i29 %0, %empty_49
  %empty_51 = icmp ne i29 %empty_50, 0
  ret i1 %empty_51
}

declare i5 @llvm.part.set.i5.i2(i5, i2, i32, i32) nounwind readnone

declare i21 @llvm.part.select.i21(i21, i32, i32) nounwind readnone

declare i29 @llvm.part.select.i29(i29, i32, i32) nounwind readnone

declare i27 @llvm.part.select.i27(i27, i32, i32) nounwind readnone

declare i16 @llvm.part.select.i16(i16, i32, i32) nounwind readnone

declare i15 @llvm.part.select.i15(i15, i32, i32) nounwind readnone

declare i28 @_ssdm_op_PartSelect.i28.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i28 @_ssdm_op_PartSelect.i28.i29.i32.i32(i29, i32, i32) nounwind readnone

!llvm.map.gv = !{!0}

!0 = metadata !{metadata !1, [1 x i32]* @llvm_global_ctors_0}
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0, i32 31, metadata !3}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !"llvm.global_ctors.0", metadata !5, metadata !"", i32 0, i32 31}
!5 = metadata !{metadata !6}
!6 = metadata !{i32 0, i32 0, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 15, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"din.i.V", metadata !11, metadata !"int16", i32 0, i32 15}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0, i32 0, i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 15, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"din.q.V", metadata !11, metadata !"int16", i32 0, i32 15}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 15, metadata !19}
!19 = metadata !{metadata !20}
!20 = metadata !{metadata !"dout_mix.i.V", metadata !5, metadata !"int16", i32 0, i32 15}
!21 = metadata !{metadata !22}
!22 = metadata !{i32 0, i32 15, metadata !23}
!23 = metadata !{metadata !24}
!24 = metadata !{metadata !"dout_mix.q.V", metadata !5, metadata !"int16", i32 0, i32 15}
!25 = metadata !{metadata !26}
!26 = metadata !{i32 0, i32 11, metadata !27}
!27 = metadata !{metadata !28}
!28 = metadata !{metadata !"ph_in.i.V", metadata !11, metadata !"int12", i32 0, i32 11}
!29 = metadata !{metadata !30}
!30 = metadata !{i32 0, i32 11, metadata !31}
!31 = metadata !{metadata !32}
!32 = metadata !{metadata !"ph_in.q.V", metadata !11, metadata !"int12", i32 0, i32 11}
!33 = metadata !{metadata !34}
!34 = metadata !{i32 0, i32 11, metadata !35}
!35 = metadata !{metadata !36}
!36 = metadata !{metadata !"ph_out.i.V", metadata !5, metadata !"int12", i32 0, i32 11}
!37 = metadata !{metadata !38}
!38 = metadata !{i32 0, i32 11, metadata !39}
!39 = metadata !{metadata !40}
!40 = metadata !{metadata !"ph_out.q.V", metadata !5, metadata !"int12", i32 0, i32 11}
!41 = metadata !{metadata !42}
!42 = metadata !{i32 0, i32 27, metadata !43}
!43 = metadata !{metadata !44}
!44 = metadata !{metadata !"loop_integ.V", metadata !5, metadata !"int28", i32 0, i32 27}
!45 = metadata !{metadata !46}
!46 = metadata !{i32 0, i32 1, metadata !47}
!47 = metadata !{metadata !48}
!48 = metadata !{metadata !"control.qam.V", metadata !11, metadata !"uint2", i32 0, i32 1}
!49 = metadata !{metadata !50}
!50 = metadata !{i32 0, i32 7, metadata !51}
!51 = metadata !{metadata !52}
!52 = metadata !{metadata !"control.lf_p", metadata !11, metadata !"char", i32 0, i32 7}
!53 = metadata !{metadata !54}
!54 = metadata !{i32 0, i32 7, metadata !55}
!55 = metadata !{metadata !56}
!56 = metadata !{metadata !"control.lf_i", metadata !11, metadata !"char", i32 0, i32 7}
!57 = metadata !{metadata !58}
!58 = metadata !{i32 0, i32 7, metadata !59}
!59 = metadata !{metadata !60}
!60 = metadata !{metadata !"control.lf_out_gain", metadata !11, metadata !"char", i32 0, i32 7}
!61 = metadata !{metadata !62}
!62 = metadata !{i32 0, i32 0, metadata !63}
!63 = metadata !{metadata !64}
!64 = metadata !{metadata !"control.reg_clr", metadata !11, metadata !"bool", i32 0, i32 0}
!65 = metadata !{metadata !66}
!66 = metadata !{i32 0, i32 27, metadata !67}
!67 = metadata !{metadata !68}
!68 = metadata !{metadata !"control.reg_init.V", metadata !11, metadata !"int28", i32 0, i32 27}
