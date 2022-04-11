#include "eucHW.h"

void eucHW(Tout *y_sqrt, T x[2*LENGTH])
{
	#pragma HLS INTERFACE mode=s_axilite port=x storage_impl=bram
	#pragma HLS INTERFACE mode=s_axilite port=y_sqrt
	#pragma HLS INTERFACE mode=s_axilite port=return
	#pragma HLS ARRAY_PARTITION variable=x type=complete

	uint23_t res = 0;

	MainLoop: for (int i = 0; i < LENGTH; ++i)
	{
		#pragma HLS UNROLL
		res += (x[i+ LENGTH] -x[i])*(x[i+ LENGTH] -x[i]);
	}
	*y_sqrt = hls::sqrt(res);
	return;
}
