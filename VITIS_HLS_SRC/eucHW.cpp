#include "eucHW.h"
/**
 * @brief EucHW calcula la distancia euclidiana entre los vectores almacenados en la variable x,
 * cuyo resultado es almacenado en el puntero y_sqrt.
 *

 * @param x Vectores formado por la concatenación de los dos vectores a operar, ambos de tamaño LENGTH
 * @param y_sqrt Puntero resultado
 */
void eucHW(T_in *y_sqrt, T_in x[2*LENGTH])
{
	#pragma HLS INTERFACE mode=s_axilite port=x storage_impl=bram  /* Interface mode s_axislite
																	* permite el uso de el protocolo de comunicación AXIS
																	* para los puertos especificados
																	*/
	#pragma HLS INTERFACE mode=s_axilite port=y_sqrt
	#pragma HLS INTERFACE mode=s_axilite port=return
	#pragma HLS ARRAY_PARTITION variable=x type=cyclic factor=32

	T_in res = 0;
	MainLoop: for (int i = 0; i < LENGTH; ++i)
	{
		#pragma HLS UNROLL factor=32
		//#pragma HLS PIPELINE ii=2  									/* Asegura trabajar con el pipeline lleno .*/
		#pragma HLS PIPELINE ii=160  									/* Asegura trabajar con el pipeline lleno .*/
		res += (x[i+ LENGTH] -x[i])*(x[i+ LENGTH] -x[i]); 			/* res almacena la suma del cuadrado de la
																	 * diferencia entre el vector A ( primera mitad
																	 * del vector x) y B (segunda mitad del vector x)
																	 */
	}

	*y_sqrt = hls::sqrtf(res); 											 /* raiz cuadrada para números de punto flotante */
	//*y_sqrt = hls::sqrt(res); 										 /* raíz cuadrada para números enteros sin signo */
	return;
}
