# Tarea 4 P3.2 IPD432

### Grupo Juan Aguilera - Ricardo Mardones

El propósito de este proyecto es el de ilustrar el proceso de diseño de un coprocesador que soporta el cálculo de la distancia euclidiana entre vectores de distinta cantidad de palabras de 8 bits cada una.
El proyecto se desarrolló usando las siguientes herramientas:

* Software  Vitis HLS 2021.1
* Software  Vitis 2021.1
* Software Vivado 2021.1
* Tarjeta de desarrollo ZYBO

El sistema operativo utilizado fue Windows 10 /  Windwos 11 / Manjaro Linux (Gnome 41.3).

Los tiempos estimados de síntesis e implementación fueron tomados operando en un computador con las siguientes caracterisiticas:

* Procesador: Intel Core i7-10750H CPU @ 2.60GHz
* Memoria (RAM): 12 GB @ 2933 MHz

### Guía para replicar resulados
#### Coprocesador de vectores usando HLS para ZYBO
##### Video tutorial

<div align="center">
      <a href="https://www.youtube.com/watch?v=BcKH4BeqSr0">
     <img
      src="/Imagenes_Readme/vitis_hls_youtube.png"
      alt="Tutoral VITIS HLS"
      style="width:80%;">
      </a>
</div>

##### Guía paso a paso

Para reproducir la síntesis del coprocesador mediante Vitis HLS se utilizan los archivos fuente que se encuentran en  la carpeta ``` \VITIS_HLS_SRC``` dentro de este repositorio. Se deben seguir  las instrucciones descritas  a continuación:

* Abrir Vitis HLS 2021.1, seleccionando la opción ```Create Project```.
* Elegir un nombre y ubicación para el proyecto creado y hacer click en  el botón ```Next > ```.
* Añadir los archivos fuente correspondientes a archivos de diseño, estos son ```EucHW.cpp```, ```EucHW.h``` y  ```specs.h```. En esta misma ventana se debe definir la función principal, en este caso, ```EucHW```. Luego  hacer click en  el botón ```Next > ```.
* Añadir los archivos fuente correspondientes a archivos de <em>testbench</em>, estos son ```EucSW.cpp```, ```EucSW.h``` y  ```EucTB.cpp```. Luego  hacer click en  el botón ```Next > ```.

* Elegir nombre para la solución, escoger el periodo del reloj a utilizar en la síntesis (se conserva el valor por defecto de 10 ns para obtener un estimado del <em>timing</em> comparable con el esperado al cargar el diseño en la taejta).

* En la sección ```Part Selection```, ```Parts```, especificar la tarjeta en la cual se implementará el diseño, en este caso  ```XC7Z010CLG400-1```.

* Conservar la configuración por defecto en la sección ```Flow Target``` y hacer click en el botón ```Finish ```.

##### Tamaño del vectores de entrada y tipo de variable de salida

Para esta experiencia se busca experimentar con distintos tamaños de vectores, por lo que, modificando el codigo fuente en ``` \VITIS_HLS_SRC\specs.h``` se puede modificar para obtener distintos tamaños de vector de entrada así como distintos tipos de variable resultante.

* Para vectores de tamaño 1024 palabras entre las lineas 14 y 18 dejar de la siguiente forma
```c
typedef ap_uint<26> T_int;    /* Tipo variable intermedia para 1024 palabras* /
//typedef ap_uint<23> T_int;  /* Tipo variable intermedia para 128 palabras */
#define LENGTH 1024           /* Largo de vectores para 1024 palabras */
//#define LENGTH 128          /* Largo de vectores para 128 palabras */
```

* Para vectores de 128 palabras
```c
//typedef ap_uint<26> T_int;    /* Tipo variable intermedia para 1024 palabras* /
typedef ap_uint<23> T_int;  /* Tipo variable intermedia para 128 palabras */
//#define LENGTH 1024           /* Largo de vectores para 1024 palabras */
#define LENGTH 128          /* Largo de vectores para 128 palabras */
```

* Para operar con resultado sin signo entero de 32 bits entre las lineas 9 y 10
```c
//typedef float Tout;         /* Version punto flotante */
typedef uint32_t Tout;        /* Version entero sin signo */
```

* Para operar con resultado del tipo punto flotante de precisión simple:
```c
typedef float Tout;         /* Version punto flotante */
//typedef uint32_t Tout;        /* Version entero sin signo */
```

##### Síntesis
El proceso de síntesis es el mismo para todos los disenos implementados.
* Sintetizar el proyecto haciendo click en el botón ```Run``` de la barra superior del Software o  ```Run C Synthesis ``` ubicado en la sección ```Flow Navigator```.
 Si todo ha ido como corresponde, la síntesis debiese entregar resultados satisfactorios como los que se muestran en la Figura siguiente, cumpliendo con las restricciones de <em>timing</em> (sin <em>slack</em> negativo), y un uso de recursos  fisicamente implementable en la tarjeta de desarrollo a utilizar.
 En la Figura a continuación se muestra los resultados de sintesis para 1024 palabras para un resultado de punto flotante precisión simple:

cambiar imagen ajaj
![Device part.](/Imagenes_Readme/performance_hls.png)

* Para validar el diseño se ejecuta la Cosimulación  haciendo click en botón de ``` Run Cosimulation ``` ubicado en la sección ```Flow Navigator ```.

* Exportar IP hacienco click en el botón ```Export RTL``` en la sección ```Flow navigator```. Esta acción genera un archvio .zip, el cual al ser descomprimido puede ser añadido a ```Vivado``` como se mostrará más adelante.

#### Uso de pragmas en Vitis HLS

En esta sección se explica el uso de los pragmas implementados al realizar la sección anterior, siguiendo la función definida en \SRC_VITIS_HLS\EucHW.cpp.

* ```pragma ARRAY_PARTITION``` Este comando separa un arreglo de datos y genera arreglos más pequeños o de un solo elemento almacenandolos en bloques de memoria RAM individuales.
* ```pragma INTERFACE``` escribir algo porfavor ... :(
```cpp
void eucHW(Tout *y_sqrt, T x[2*LENGTH])
{
	#pragma HLS INTERFACE mode=s_axilite port=x storage_impl=bram
	#pragma HLS INTERFACE mode=s_axilite port=y_sqrt
	#pragma HLS INTERFACE mode=s_axilite port=return
	#pragma HLS ARRAY_PARTITION variable=x type=cyclic factor=64

	T_int res = 0;
	MainLoop: for (int i = 0; i < LENGTH; ++i)
	{
		#pragma HLS UNROLL factor=64
		#pragma HLS PIPELINE ii=2
		res += (x[i+ LENGTH] -x[i])*(x[i+ LENGTH] -x[i]);
	}
	//*y_sqrt = sqrt(res);
	*y_sqrt = hls::sqrt(res);
	return;
}
```

#### Implementación usando Vivado

##### Video tutorial

<div align="center">
      <a href="https://www.youtube.com/watch?v=47fFncKo3N0">
     <img
      src="/Imagenes_Readme/vivado_youtube.png"
      alt="Tutorial VIVADO"
      style="width:80%;">
      </a>
</div>

##### Guía paso a paso


Para cualquier diseno de coprocesador que se desee implementar, los pasos a seguir son equivalentes:
* Crear un nuevo proyecto de vivado.
* Seleccionar la tarjeta Nexys4 DDR en la pestana Boards.
* Una vez creado el proyecto, importar el archivo zybo.XCD presente en el repositorio.
* Crear un bloque de diseno
* Una vez creado, anadir los componentes zynq7, conncat, gpio axis.
* En el procesador zynq7, activar las interrupciones con PL-PS, y cambiar las frecuecias 60 procesador, 100 PL.
* En el puerto axis gpio, mostrar solo las salidas, las cuales se deben configurar para un vector de 2 bits. Activar las interrupciones.
* Anadir un puerto de salida, para conectar en ellos los puertso pmod JB descomentados en el archivo XCD.
* Conectar el puerto de salida jb[1:0] con la salida del axis gpio.
* Conectar las interrupciones con la entrada del modulo concat.
* Abrir el catalogo IP, anadir el bloque ip para el diseno de coprocesador deseado, los cuales se encuentran en la carpeta IP SRC del repositorio.
* Anadir el bloque al diagrama, conectar la interrupcion al bloque concat.
* Conectar la salida del bloque concat al puerto de interrupciones de procesador zynq7.
* Correr las conecciones automaticas del bloque, verificar.
* Generar bitstream.
* Exportar hardware
 
#### Implementación usando Vitis

##### Video tutorial

<div align="center">
      <a href="https://www.youtube.com/watch?v=YKQXbtaWfqE">
     <img
      src="/Imagenes_Readme/vitis_youtube.png"
      alt="Tutorial VITIS"
      style="width:80%;">
      </a>
</div>

##### Guía paso a paso

Para la implementacion en la zybo de cualquiera de los coprocesadores disenados, se debe seguir los siguentes pasos:
* Crear un nuevo proyecto en vitis ide ( o abrirlo usando launch vitis desde viviado ).
* Utilizar el archivo .ns creado al exportar el hardware.
* etc

Adicionalmente, se programó el script de Python ``` \PYTHON_SRC\serial_test.py ``` donde se generan 1000 instancias de prueba, donde llegamos a un error promedio de 0.24, el cual es menor al 1% de error promedio.

#### Reporte de frecuencia, latencia y throughtput

El proyecto se implemento con una frecuencia de 100 MHz, como se sugeira en la sintesis de HLS. Los resultados finales muestran que se cumplen todas las restricciones de timepo, logrando un WNS de 0.081 ns, como se muestra en la Figura siguiente:

#### Tiempo de sintesis

* Sintesis (HLS) = ???
* Sintesis (Vivado) = ???
* Implementacion = ???
