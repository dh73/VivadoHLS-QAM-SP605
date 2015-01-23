#ifndef HLS_UTIL_H
#define HLS_UTIL_H

#include "vhls_sim.h"
#ifndef WIN32
    typedef long long          int64;
    typedef unsigned long long uint64;
#else
    typedef __int64            int64;
    typedef unsigned __int64   uint64;
#endif

#include "ap_int.h"
#include "ap_fixed.h"

namespace HLS_Util {
    HLS_UINT64 to_uint64(const HLS_UINT32* data, HLS_UINT32 numWord) {
        assert(numWord > 0);
        if(numWord == 1)
            return (*data);
        HLS_UINT64 ret = (HLS_UINT64)data[1] << 32 | data[0];
        return ret;
    }

    void to_hls_uint32(HLS_UINT32* out, HLS_UINT64 data, HLS_UINT32 numWord) {
        assert(numWord > 0);
        if(numWord == 1)
            *out = data;
        else {
            out[0] = data;
            out[1] = data >> 32;
        }
    }

    template<int _AP_W>
    ap_int<_AP_W> to_apint(const HLS_UINT32* data, HLS_UINT32 numWord) {
        assert(numWord > 0);
        ap_int<_AP_W > tmp = 0;
        HLS_UINT32 realWord = _AP_W / 32 + (_AP_W % 32 == 0 ? 0 : 1);
        for (HLS_UINT32 i=0; i < realWord; i++) {
            if (i >= numWord) 
                return tmp;
            if (i == realWord - 1)
                tmp.range(_AP_W-1, i*32) = data[i];
            else
                tmp.range((i+1)*32 - 1, i*32) = data[i];
        }
        return tmp;
    }

    template<int _AP_W>
    ap_uint<_AP_W> to_apuint(const HLS_UINT32* data, HLS_UINT32 numWord) {
        assert(numWord > 0);
        ap_uint<_AP_W > tmp = 0;
        HLS_UINT32 realWord = _AP_W / 32 + (_AP_W % 32 == 0 ? 0 : 1);
        for (HLS_UINT32 i=0; i < realWord; i++) {
            if (i >= numWord) 
                return tmp;
            if (i == realWord - 1)
                tmp.range(_AP_W-1, i*32) = data[i];
            else
                tmp.range((i+1)*32 - 1, i*32) = data[i];
        }
        return tmp;
    }

    template<int _AP_W>
    void to_hls_uint32(HLS_UINT32* out, ap_int<_AP_W> data, HLS_UINT32 numWord) {
        assert(numWord > 0);
        HLS_UINT32 realWord = _AP_W / 32 + (_AP_W % 32 == 0 ? 0 : 1);
        for (HLS_UINT32 i=0; i < numWord; i++) {
            if (i >= realWord)
                out[i] = 0;
            else if (i == realWord - 1)
                out[i] = data.range(_AP_W - 1, i*32);
            else
                out[i] = data.range((i+1)*32 - 1, i*32);
        }
    }

    template<int _AP_W>
    void to_hls_uint32(HLS_UINT32* out, ap_uint<_AP_W> data, HLS_UINT32 numWord) {
        assert(numWord > 0);
        HLS_UINT32 realWord = _AP_W / 32 + (_AP_W % 32 == 0 ? 0 : 1);
        for (HLS_UINT32 i=0; i < numWord; i++) {
            if (i >= realWord)
                out[i] = 0;
            else if (i == realWord - 1)
                out[i] = data.range(_AP_W-1 - 1, i*32);
            else
                out[i] = data.range((i+1)*32 - 1, i*32);
        }
    }

    template<int _AP_W, int _AP_I, ap_q_mode _AP_Q,
             ap_o_mode _AP_O, int _AP_N>
    ap_fixed<_AP_W, _AP_I, _AP_Q, _AP_O, _AP_N> to_apfixed(const HLS_UINT32* data, HLS_UINT32 numWord) {
        assert(numWord > 0);
        ap_fixed<_AP_W, _AP_I, _AP_Q, _AP_O, _AP_N > tmp = 0;
        HLS_UINT32 realWord = _AP_W / 32 + (_AP_W % 32 == 0 ? 0 : 1);
        for (HLS_UINT32 i=0; i < realWord; i++) {
            if (i >= numWord) 
                return tmp;
            if (i == realWord - 1)
                tmp.range(_AP_W-1, i*32) = data[i];
            else
                tmp.range((i+1)*32 - 1, i*32) = data[i];
        }
        return tmp;
    }

    template<int _AP_W, int _AP_I, ap_q_mode _AP_Q,
             ap_o_mode _AP_O, int _AP_N>
    ap_ufixed<_AP_W, _AP_I, _AP_Q, _AP_O, _AP_N> to_apufixed(const HLS_UINT32* data, HLS_UINT32 numWord) {
        assert(numWord > 0);
        ap_ufixed<_AP_W, _AP_I, _AP_Q, _AP_O, _AP_N > tmp = 0;
        HLS_UINT32 realWord = _AP_W / 32 + (_AP_W % 32 == 0 ? 0 : 1);
        for (HLS_UINT32 i=0; i < realWord; i++) {
            if (i >= numWord) 
                return tmp;
            if (i == realWord - 1)
                tmp.range(_AP_W-1, i*32) = data[i];
            else
                tmp.range((i+1)*32 - 1, i*32) = data[i];
        }
        return tmp;
    }

    template<int _AP_W, int _AP_I, ap_q_mode _AP_Q,
             ap_o_mode _AP_O, int _AP_N>
    void to_hls_uint32(HLS_UINT32* out, ap_fixed<_AP_W, _AP_I, _AP_Q, _AP_O, _AP_N> data, HLS_UINT32 numWord) {
        assert(numWord > 0);
        HLS_UINT32 realWord = _AP_W / 32 + (_AP_W % 32 == 0 ? 0 : 1);
        for (HLS_UINT32 i=0; i < numWord; i++) {
            if (i >= realWord)
                out[i] = 0;
            else if (i == realWord - 1)
                out[i] = data.range(_AP_W - 1, i*32);
            else
                out[i] = data.range((i+1)*32 - 1, i*32);
        }
    }


    template<int _AP_W, int _AP_I, ap_q_mode _AP_Q,
             ap_o_mode _AP_O, int _AP_N>
    void to_hls_uint32(HLS_UINT32* out, ap_ufixed<_AP_W, _AP_I, _AP_Q, _AP_O, _AP_N> data, HLS_UINT32 numWord) {
        assert(numWord > 0);
        HLS_UINT32 realWord = _AP_W / 32 + (_AP_W % 32 == 0 ? 0 : 1);
        for (HLS_UINT32 i=0; i < numWord; i++) {
            if (i >= realWord)
                out[i] = 0;
            else if (i == realWord - 1)
                out[i] = data.range(_AP_W - 1, i*32);
            else
                out[i] = data.range((i+1)*32 - 1, i*32);
        }
    }
}

#endif
