#ifndef QAM_DEM_H_
#define QAM_DEM_H_

#include <iostream>
#include <fstream>
#include <math.h>
#include "synt_types.h"


using namespace std;

class QAMDEM {

	private:
		cdata_t     din;
    cdata_t    *dout_mix;
    cphase_t    ph_in;
    cphase_t   *ph_out;
    loop_int_t *loop_integ; 
    ctl_crec_t  control;
    cphase_t    ph_xy;
    qam_t 		qam;

	public:
		void mixer(cdata_t din, cdata_t *dout_mix, cphase_t ph_xy);
		void slicer (qam_t qam, cdata_t dout_mix, hd_t *hd_out, cdata_t *sd_out, error_t *err);
		void compute_phase (hd_t hd_out, cdata_t sd_out, phase_t *ph_est);
		void loop_filter(phase_t din, loop_out_t *loop_out, loop_int_t *loop_integ, ctl_crec_t control);
		void vco (loop_out_t loop_out, ap_fixed<16,1> *tphase, cphase_t *ph_offset );
		void phase_recovery (hd_t hd_out, cdata_t sd_out, loop_int_t *loop_integ, loop_out_t *loop_out, cphase_t  *ph_offset, ctl_crec_t control );
		void mounstrito( cdata_t din, cdata_t *dout, cphase_t ph_in, cphase_t  *ph_out, loop_int_t *loop_integ, ctl_crec_t  control);

};


#endif
