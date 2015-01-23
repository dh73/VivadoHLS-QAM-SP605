#ifndef QAM_DEM_H_
#define QAM_DEM_H_

#include <iostream>
#include <fstream>
#include <math.h>
#include "synt_types.h"


using namespace std;

class QAMDEM {

	//private:
		cdata_t     din;
    	cdata_t    *dout_mix;
    	cphase_t    ph_in;
    	cphase_t   *ph_out;
    	loop_int_t *loop_integ; 
    	ctl_crec_t  control;
    	cphase_t    ph_xy;
    	qam_t 		qam;

	public:
		void mix(cdata_t din, cdata_t *dout_mix, cphase_t ph_xy);
		void slicer (qam_t qam, cdata_t dout_mix, hd_t *hd_out, cdata_t *sd_out, error_t *err);
		void compute_phase (hd_t hd_out, cdata_t sd_out, phase_t *ph_est);
		void loop_filter(phase_t din, loop_out_t *loop_out, loop_int_t *loop_integ, ctl_crec_t control);
		void vco (loop_out_t loop_out, ap_fixed<16,1> *tphase, cphase_t *ph_offset );
		void phase_recovery (hd_t hd_out, cdata_t sd_out, loop_int_t *loop_integ, loop_out_t *loop_out, cphase_t  *ph_offset, ctl_crec_t control );
		void mounstrito( cdata_t din, cdata_t *dout, cphase_t ph_in, cphase_t  *ph_out, loop_int_t *loop_integ, ctl_crec_t  control);

};

void QAMDEM::mix( cdata_t din, cdata_t *dout_mix, cphase_t ph_offset ) {
    cdata_t t_dout;

    t_dout.i =  din.i * ph_offset.i;
    t_dout.i -= din.q * ph_offset.q;
    t_dout.q =  din.i * ph_offset.q;
    t_dout.q += din.q * ph_offset.i;

    *dout_mix = t_dout;

}

void QAMDEM::slicer ( qam_t   qam, cdata_t dout_mix, hd_t  *hd_out, cdata_t *sd_out, error_t *err ) {

ap_fixed<5,1,AP_TRN,AP_SAT> clip_i, clip_q;

clip_i = dout_mix.i;
clip_q = dout_mix.q;

hd_t      tmp_hd; 
error_t   tmp_err; 

    tmp_hd.i[4] = clip_i[4];
    tmp_hd.i[3] = 1;
    tmp_hd.q[4] = clip_q[4];
    tmp_hd.q[3] = 1;

  *sd_out = dout_mix;
  *hd_out = tmp_hd;

  tmp_err.i = dout_mix.i - tmp_hd.i;
  tmp_err.q = dout_mix.q - tmp_hd.q;

  *err  = tmp_err;

}

void QAMDEM::phase_recovery (
  hd_t       hd_out, 
  cdata_t    sd_out, 
  loop_int_t *loop_integ, 
  loop_out_t *loop_out,
  cphase_t   *ph_offset,
  ctl_crec_t control ) {


phase_t  ph_est;
compute_phase (
    hd_out, 
    sd_out, 
    &ph_est);

loop_int_t t_loop_integ; 
loop_out_t t_loop_out;
loop_filter(
    ph_est, 
    &t_loop_integ, 
    &t_loop_out, 
    control);
  
ap_fixed<16,1> tphase;
cphase_t       t_ph_offset;
vco (
    t_loop_out, 
    &tphase,
    &t_ph_offset );
  
*loop_integ = t_loop_integ;
*loop_out   = t_loop_out;
*ph_offset  = t_ph_offset;

}

void QAMDEM::compute_phase (
    hd_t    hd_out, 
    cdata_t sd_out, 
    phase_t *ph_est) {

    phase_t   tmp; 

    tmp =  hd_out.i * sd_out.q;
    //cout << "tmp: " << tmp << ", ";
    tmp -= hd_out.q * sd_out.i;
    //cout << "tmp: " << tmp << ", " << endl;

    *ph_est = tmp;

}

void QAMDEM::loop_filter(
    phase_t    din, 
    loop_int_t *loop_integ, 
    loop_out_t *loop_out, 
    ctl_crec_t control) {
  

ap_fixed<28,2,AP_TRN,AP_WRAP> din_long;
ap_fixed<28,2,AP_TRN,AP_WRAP> p_out;
ap_fixed<28,2,AP_TRN,AP_WRAP> i_out;
ap_fixed<28,2,AP_TRN,AP_WRAP> i_sum;
ap_fixed<28,2,AP_TRN,AP_WRAP> tmp_sum;
ap_fixed<28,2,AP_TRN,AP_SAT>  sum;

static ap_fixed<28,2,AP_TRN,AP_SAT> i_reg = 0;

din_long = din;  // to allow shift right

p_out = din_long >> control.lf_p;
i_out = din_long >> (9 + control.lf_i);

i_sum = i_out + i_reg;
sum   = i_sum + p_out;

if (control.reg_clr ==1)
  i_reg = control.reg_init;
else
  i_reg = i_sum;  

tmp_sum     = sum >> control.lf_out_gain;
*loop_integ = i_reg;
*loop_out   = tmp_sum;

//cout << " din: " << din << "  pout: " << p_out  << "  i_out:" << i_out <<endl;
  
}

void QAMDEM::vco (
    loop_out_t     din, 
    ap_fixed<16,1> *tphase,
    cphase_t       *ph_offset ) {
  
static ap_fixed<16,1> phase_angle;   // +/- 1  equivalent to +/- pi
ap_fixed<32,2> diff;
cphase_t       t_ph;

const cos_t cos_lut[Q] = {
    #include "table.h"
};

diff        = phase_angle - din;
phase_angle = diff;     // register, s.xxxxx...

#define HW
//---- look up cos/sin table
#ifdef HW
ap_uint<12>    full_adr;
ap_uint<2>     msb;
ap_uint<10>    cos_adr,sin_adr;
cos_t          t_cos_out, t_sin_out;
ap_fixed<16,1> cos_out, sin_out;

full_adr = phase_angle(15,4);
msb      = full_adr(11,10);

if (msb[0]==1) {
  //cos_adr    = -full_adr(9,0);
  //sin_adr    = Q-1+full_adr(9,0);
  cos_adr    = ~full_adr(9,0);
  sin_adr    = full_adr(9,0);
}
else {
  //cos_adr    = full_adr(9,0);
  //sin_adr    = Q-1-full_adr(9,0);
  cos_adr    = full_adr(9,0);
  sin_adr    = ~full_adr(9,0);
}

t_cos_out = cos_lut[cos_adr];
t_sin_out = cos_lut[sin_adr];

  if (msb == 1) {  
     cos_out = -t_cos_out;
     sin_out =  t_sin_out;
  } //---- 1

  else if (msb == 0) {
   cos_out = t_cos_out;
   sin_out = t_sin_out;
  } //---- 0

  else if (msb == 3) {
     cos_out =  t_cos_out;
     sin_out = -t_sin_out;
  } //---- 3
  
  else {
   cos_out = -t_cos_out;
   sin_out = -t_sin_out;
  } //---- 2
  

t_ph.i = cos_out;
t_ph.q = sin_out;

//cout << setw(16) << cos_out << setw(16) << phase_angle << setw(16) << full_adr << setw(16) << msb << endl;
#else
//---- floating pt version

float f_angle;
float f_cos,f_sin;

//f_angle = 3.1416 * phase_angle;  // +/- pi
f_angle = phase_angle;  // +/- pi
f_angle = 3.1416 * f_angle;  // +/- pi
f_cos   = cos(f_angle);
f_sin   = sin(f_angle);

t_ph.i = f_cos;
t_ph.q = f_sin;
#endif

*ph_offset = t_ph;
*tphase = phase_angle; 
}

void QAMDEM::mounstrito (
    cdata_t     din, 
    cdata_t    *dout_mix,
    cphase_t    ph_in,
    cphase_t   *ph_out,
    loop_int_t *loop_integ, 
    ctl_crec_t  control ) {

  qam_t     qam = control.qam;
  hd_t      hd_out;
  cdata_t   sd_out;
  error_t   err;

  cphase_t   t_ph_out;
  cdata_t    t_dout_mix;
  loop_int_t t_loop_integ; 
  loop_out_t t_loop_out; 

  QAMDEM::mix( din, &t_dout_mix, ph_in );

  QAMDEM::slicer ( qam, t_dout_mix, &hd_out, &sd_out, &err);

  QAMDEM::phase_recovery ( hd_out, sd_out, &t_loop_integ, &t_loop_out, &t_ph_out, control);

  *ph_out     = t_ph_out;
  *dout_mix   = t_dout_mix;
  *loop_integ = t_loop_integ;
}

#endif
