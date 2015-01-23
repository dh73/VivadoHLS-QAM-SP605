#include "qam_dem.h"
#include "synt_types.h"

void qam_dem_top( cdata_t din, cdata_t *dout_mix, cphase_t ph_in, cphase_t *ph_out, loop_int_t *loop_integ,  ctl_crec_t  control ){

	static QAMDEM qam; //Accesible for all the functions

	qam.mounstrito(din, dout_mix, ph_in, ph_out, loop_integ, control); //Magic box :-)

}
