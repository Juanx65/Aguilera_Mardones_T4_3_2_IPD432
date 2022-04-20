#ifndef EUCDISTHW_H
#define EUCDISTHW_H

#include "specs.h"
//#include <cmath> // usar en linux
#include <math.h> /* usar en window */
#include <hls_math.h>  /* Se incluye para el uso de la función hls::sqrt
                        * que disminuye la latencia respecto a sdt::sqrt,
                        * con el costo de tener un mayor error.
                        */
void eucHW (T_in *y_sqrt, T_in x[2*LENGTH]);
#endif
