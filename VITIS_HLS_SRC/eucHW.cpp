#include "eucHW.h"

void eucHW(Tout *y_sqrt, T x[2*LENGTH])
{
	#pragma HLS INTERFACE mode=s_axilite port=x storage_impl=bram
	#pragma HLS INTERFACE mode=s_axilite port=y_sqrt
	#pragma HLS INTERFACE mode=s_axilite port=return
	#pragma HLS ARRAY_PARTITION variable=x type=cyclic factor=32

	uint26_t res = 0;
	MainLoop: for (int i = 0; i < LENGTH; ++i)
	{
		#pragma HLS UNROLL factor=32
		#pragma HLS PIPELINE ii=2
		res += (x[i+ LENGTH] -x[i])*(x[i+ LENGTH] -x[i]);
	}
	*y_sqrt = sqrt(res);
	return;
}
