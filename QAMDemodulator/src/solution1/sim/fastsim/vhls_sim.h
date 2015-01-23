/*
#-  (c) Copyright 2011-2014 Xilinx, Inc. All rights reserved.
#-
#-  This file contains confidential and proprietary information
#-  of Xilinx, Inc. and is protected under U.S. and
#-  international copyright and other intellectual property
#-  laws.
#-
#-  DISCLAIMER
#-  This disclaimer is not a license and does not grant any
#-  rights to the materials distributed herewith. Except as
#-  otherwise provided in a valid license issued to you by
#-  Xilinx, and to the maximum extent permitted by applicable
#-  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
#-  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
#-  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
#-  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
#-  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
#-  (2) Xilinx shall not be liable (whether in contract or tort,
#-  including negligence, or under any other theory of
#-  liability) for any loss or damage of any kind or nature
#-  related to, arising under or in connection with these
#-  materials, including for any direct, or any indirect,
#-  special, incidental, or consequential loss or damage
#-  (including loss of data, profits, goodwill, or any type of
#-  loss or damage suffered as a result of any action brought
#-  by a third party) even if such damage or loss was
#-  reasonably foreseeable or Xilinx had been advised of the
#-  possibility of the same.
#-
#-  CRITICAL APPLICATIONS
#-  Xilinx products are not designed or intended to be fail-
#-  safe, or for use in any application requiring fail-safe
#-  performance, such as life-support or safety devices or
#-  systems, Class III medical devices, nuclear facilities,
#-  applications related to the deployment of airbags, or any
#-  other applications that could lead to death, personal
#-  injury, or severe property or environmental damage
#-  (individually and collectively, "Critical
#-  Applications"). Customer assumes the sole risk and
#-  liability of any use of Xilinx products in Critical
#-  Applications, subject only to applicable laws and
#-  regulations governing limitations on product liability.
#-
#-  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
#-  PART OF THIS FILE AT ALL TIMES. 
#- ************************************************************************

*/

#ifndef VHLS_FSM_H
#define VHLS_FSM_H

#ifdef  __cplusplus 
extern "C" { 
#endif 

#if defined (_MSC_VER)
    typedef unsigned __int64 uint64_t;
    typedef unsigned __int32 uint32_t;
    typedef unsigned __int8 uint8_t;
    typedef signed __int64 int64_t;
    typedef signed __int32 int32_t;
    typedef signed __int8 int8_t;
#elif defined(__MINGW32__)
#include <stdint.h>
#elif defined(__linux)
#include <inttypes.h>
#else
#include <sys/types.h>
#endif

#ifndef HLS_TYPES
#define HLS_TYPES
    typedef int64_t HLS_INT64;
    typedef uint64_t HLS_UINT64;
    typedef int HLS_INT32;
    typedef unsigned int HLS_UINT32;
    typedef short HLS_INT16;
    typedef unsigned short HLS_UINT16;
    typedef char HLS_BYTE8;
    typedef unsigned char HLS_UBYTE8;
#endif



    
    /* Error types */
	enum HLSErrorType{hlsNormal=1, hlsError};
	typedef enum HLSErrorType HLSErrorType;



    /* Use HLS_DLLESPEC to export symbols out of ISim Kernel 
       and import into clienHLSode. Use HHLSDESIGN_DLLESPEC
       to export symbols out of fuse generated dll i.e.
       user design dll and import into client/ISim Kernel code
    */
#if defined(_WIN32)
#ifdef HLS_EXPORT
#define HLS_DLLESPEC __declspec(dllexport)
#define HLS_HIDE_SYMBOL_SPEC true
#else
#define HLS_DLLESPEC __declspec(dllimport)
#endif
#else
#ifndef HLS_DLLESPEC
#define HLS_DLLESPEC
#endif
#endif

#if defined(_WIN32)
#ifdef HLS_DESIGN_DLL_EXPORT
#define HLS_DESIGN_DLLESPEC __declspec(dllexport)
#else
#define HLS_DESIGN_DLLESPEC __declspec(dllimport)
#endif
#else
#ifndef HLS_DESIGN_DLLESPEC
#define HLS_DESIGN_DLLESPEC
#endif
#endif

    /* A generic pointer to an object in the design */
    typedef void* hlsHandle;  

    /* Verilog logic values are stored bit packed encoded in two bits 
     * one bit put into aVal and the other into bVal. The four logic 
     * values are encoded as {aVal, bVal}: 0=00, 1=10, X=11, Z=01 
     * So, a 8 bit logic value 0Z11011X is stored as below :
     * (in hexadecimal) aVal = 00000037 bVal=00000041 */
    typedef struct t_hls_vlog_logicval {
        HLS_UINT32 aVal;
        HLS_UINT32 bVal;
    } s_hls_vlog_logicval, *p_hls_vlog_logicval;

    /* Note: VHDL std_logic value is stored in a byte (char). The 
     * MVL9 values are mapped as  'U':00, 'X':1, '0':2, '1':3
     * 'Z':4, 'W':5, 'L':6, 'H':7, '-':8 . The std_logic_vector 
     * is stored as a contiguous array of bytes. For example 
     * "0101Z" is stored in five bytes as char s[5] = {2,3,2,3,4}
     * An HDL integer type is stored as C int, a HDL real type is 
     * stored as a C double and a VHDL string type is stored as char*.
     * An array of HDL integer or double is stored as an array of C
     * integer or double respectively                         */  

    /* Pass start up switches using this struct */
    typedef struct t_hls_setup_info {
        char* logFileName; /* A Null value means turn off log file generation */
    } s_hls_setup_info, *p_hls_setup_info;

    /* For each function supported by HLS, a typedef has been provided
     * below for easily storing the function pointer address of the 
     * HLS function. 
     */
    typedef hlsHandle (*t_fp_hls_open)(p_hls_setup_info);
    typedef int (*t_fp_hls_get_port_index)(hlsHandle, const char*);
    typedef void (*t_fp_hls_put_value)(hlsHandle,HLS_INT32, void*);
    typedef void (*t_fp_hls_get_value)(hlsHandle, HLS_INT32, void*);
    typedef void (*t_fp_hls_run)(hlsHandle, HLS_INT64);
    typedef void (*t_fp_hls_restart)(hlsHandle);
    typedef int (*t_fp_hls_get_status)(hlsHandle);
    typedef const char* (*t_fp_hls_get_error_info)(hlsHandle);
    typedef void (*t_fp_hls_close)(hlsHandle);

    /** Load the design and initialize the design handle
	*   It allocates resources and initializes the block states
    *   @param setup_info is set up information for the design
    *   @returns the XSI design handle
    */ 
#ifndef HLS_HIDEFUNCTIONSPEC
    HLS_DLLESPEC hlsHandle hls_open(p_hls_setup_info setup_info); 
#endif

    /** Get port position number of the specified port name (only top level ports supported)
    *   @param design_handle 
    *   @param port_name is name of the port (case sensitive for Verilog and case-insensitive for VHDL)
    *   @returns the port number of the specified port if the named port exists else returns -1
    *   Example: To get port number of the port named clk
    *   HLS_INT32 port_number = hls_get_port_number(design_handle, "clk");
    */
    HLS_DLLESPEC HLS_INT32 hls_get_port_index(hlsHandle design_handle, const char* port_name);

    /** Put value on the port specified by the port_number
    *   @param design_handle is HLS design handle 
    *   @param port_number is position number of the port in HDL port declaration
    *          Example: For "entity lut is port (a: in std_logic_vector(0 to 7),
    *          b: out std_logic_vector(0 to 7));," the port_number of a is 0 and
    *          the port_number of b is 1
    *   @param port_value is value buffer of the specified port in ISim value format
    */ 
    HLS_DLLESPEC void hls_put_value(hlsHandle design_handle, HLS_INT32 port_number,  void* port_value);

    /** Read value of the port specified by the port_number 
    *   @param design_handle is HLS design handle 
    *   @param port_number is position number of the port in HDL port declaration
    *          Example: For "entity lut is port (a: in std_logic_vector(0 to 7),
    *          b: out std_logic_vector(0 to 7));," the port_number of a is 0 and
    *          the port_number of b is 1
    *   @param port_value is value buffer of the specified port in ISim value format
    */ 
    HLS_DLLESPEC void  hls_get_value(hlsHandle design_handle, HLS_INT32 port_number, void* port_value); 

    /** Run 1 clock cycle simulation for the given block 
    *   @param design_handle is HLS design handle 
    */ 
    HLS_DLLESPEC void hls_run(hlsHandle design_handle); 

    /** Reset simulation time to 0
    *   @param design_handle is HLS design handle
    */
    HLS_DLLESPEC void hls_restart(hlsHandle design_handle);


    /** Get status of the simulation run 
    *   @param design_handle is XSI design handle 
    *   @return current status of design. Returns one of hlsNormal, hlsError, hlsFatalError
    */
    HLS_DLLESPEC HLS_INT32 hls_get_status(hlsHandle design_handle);

    /** Get the last error message encountered
    *   @param design_handle is XSI design handle 
    *   @returns current error messages. Returns null if no error message printed ever
    */
    HLS_DLLESPEC const char* hls_get_error_info(hlsHandle design_handle);

   /** Close simulation and free up memory used by the design
    *   @param design_handle is HLS design handle
    */
    HLS_DLLESPEC void hls_close(hlsHandle design_handle);


#ifdef  __cplusplus 
} 
#endif 

#endif 

