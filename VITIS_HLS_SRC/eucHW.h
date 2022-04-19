#ifndef EUCDISTHW_H
#define EUCDISTHW_H

#include "specs.h"
#include <cmath> // usar en linux
//#include <math.h> /* Mantener comentada en linux */
#include <hls_math.h>  /* Se incluye para el uso de la función hls::sqrt
                        * que disminuye la latencia respecto a sdt::sqrt,
                        * con el costo de tener un mayor error.
                        */
void eucHW (Tout *y_sqrt, T x[2*LENGTH]);
#endif
