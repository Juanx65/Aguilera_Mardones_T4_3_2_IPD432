
#ifndef SPECS_H
#define SPECS_H

#import <cstdint>
#include "ap_int.h"

typedef float Tout;         /* Version punto flotante */
//typedef uint32_t Tout;        /* Version entero sin signo */

typedef uint8_t T;            /* Tipo de variable de vectores de entradad */

typedef ap_uint<26> T_int;    /* Tipo variable intermedia para 1024 palabras* /
//typedef ap_uint<23> T_int;  /* Tipo variable intermedia para 128 palabras */

#define LENGTH 1024           /* Largo de vectores para 1024 palabras */
//#define LENGTH 128          /* Largo de vectores para 128 palabras */

#endif
