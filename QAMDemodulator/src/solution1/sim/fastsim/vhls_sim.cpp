// vhls_sim.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"

#define HLS_EXPORT
#include "vhls_sim.h"
#include "hls_design.h"

#include <iostream>
 
extern "C"
{
   HLS_DLLESPEC int Add( int a, int b )
   {
      return( a + b );
   }
 
   HLS_DLLESPEC void Function( void )
   {
      std::cout << "DLL Called!" << std::endl;
   }

   HLS_DLLESPEC hlsHandle hls_open(p_hls_setup_info setup_info)
   {
	   HLS_Design* hlsDesign = new HLS_Design(setup_info);
	   return hlsHandle(hlsDesign);
   }

   HLS_DLLESPEC HLS_INT32 hls_get_port_index(hlsHandle design_handle, const char* port_name)
   {
	   return static_cast<HLS_Design*>(design_handle)->get_port_index(port_name);
   }


    HLS_DLLESPEC void hls_put_value(hlsHandle design_handle, HLS_INT32 port_number,  void* port_value)
	{
		static_cast<HLS_Design*>(design_handle)->put_value(port_number, port_value);
	}

	HLS_DLLESPEC void  hls_get_value(hlsHandle design_handle, HLS_INT32 port_number, void* port_value)
	{
		static_cast<HLS_Design*>(design_handle)->get_value(port_number, port_value);
	}


	 HLS_DLLESPEC void hls_run(hlsHandle design_handle)
	 {
		 static_cast<HLS_Design*>(design_handle)->run();
	 }

	 HLS_DLLESPEC HLS_INT32 hls_get_status(hlsHandle design_handle)
	 {
		 return static_cast<HLS_Design*>(design_handle)->get_status();
	 }

     HLS_DLLESPEC const char* hls_get_error_info(hlsHandle design_handle)
     {
          return static_cast<HLS_Design*>(design_handle)->get_error_info();
     }

    HLS_DLLESPEC void hls_close(hlsHandle design_handle)
     {
         delete static_cast<HLS_Design*>(design_handle);
     }

    HLS_DLLESPEC void hls_restart(hlsHandle design_handle)
    {
        static_cast<HLS_Design*>(design_handle)->restart();
    }

}
