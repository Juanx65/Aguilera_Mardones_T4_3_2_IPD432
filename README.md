# Tarea 4 P3.2 IPD432

### Grupo Juan Aguilera - Ricardo Mardones

El propósito de este proyecto es el de ilustrar el proceso de diseño de un coprocesador en un sistema SoC (ZYBO), con el fin de comparar/caracterizar la latencia entre una implementación en Programmable Logic (PL)(FPGA) y una exclusivamente en Processing Subsystem (PS)(ZYNQ7).
El proyecto se desarrolló usando las siguientes herramientas:

* Software  Vitis HLS 2021.2
* Software  Vitis 2021.2
* Software Vivado 2021.2
* Tarjeta de desarrollo ZYBO

El sistema operativo utilizado fue Windows 10 /  Windwos 11 / Manjaro Linux (Gnome 41.3).

Los tiempos estimados de síntesis e implementación fueron tomados operando en un computador con las siguientes caracterisiticas:

* Procesador: Intel Core i7-10750H CPU @ 2.60GHz
* Memoria (RAM): 12 GB @ 2933 MHz

### Guía para replicar resulados
#### Coprocesador de vectores PL usando HLS para ZYBO
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

* Elegir nombre para la solución, escoger el periodo del reloj a utilizar en la síntesis (se conserva el valor por defecto de 10 ns para obtener un estimado del <em>timing</em> comparable con el esperado al cargar el diseño en la tarjeta).

* En la sección ```Part Selection```, ```Parts```, especificar la tarjeta en la cual se implementará el diseño, en este caso  ```XC7Z010CLG400-1```.

* Conservar la configuración por defecto en la sección ```Flow Target``` y hacer click en el botón ```Finish ```.

##### Tamaño del vectores de entrada y tipo de variable de salida

Para esta experiencia se busca experimentar con distintos tamaños de vectores, así como con distintos tipos de variables resultantes, por lo que, modificando el código fuente en ``` \VITIS_HLS_SRC\specs.h```, se puede configurar los parámetros para obtener el diseño deseado.

* Para vectores de tamaño 1024 palabras entre las líneas 14 y 18 dejar de la siguiente forma
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

* Para operar con resultado sin signo entero de 32 bits entre las líneas 9 y 10
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
El proceso de síntesis es el mismo para todos los diseños a implementar.
* Sintetizar el proyecto haciendo click en el botón ```Run``` de la barra superior del Software o  ```Run C Synthesis ``` ubicado en la sección ```Flow Navigator```.

 Si todo ha ido como corresponde, la síntesis debiese entregar resultados satisfactorios cumpliendo con las restricciones de <em>timing</em> (sin <em>slack</em> negativo), y un uso de recursos  fisicamente implementable en la tarjeta de desarrollo a utilizar.

 En la Figura a continuación se muestra los resultados de síntesis para 1024 palabras con un resultado del tipo entero sin signo de 32 bits:

![Device part.](/Imagenes_Readme/performance_hls.png)

* Para validar el diseño se ejecuta la Cosimulación  haciendo click en botón de ``` Run Cosimulation ``` ubicado en la sección ```Flow Navigator ```.

* Exportar IP hacienco click en el botón ```Export RTL``` en la sección ```Flow navigator```. Esta acción genera un archvio .zip, el cual al ser descomprimido puede ser añadido a ```Vivado``` como se mostrará más adelante.

#### Uso de pragmas en Vitis HLS

En esta sección se explica el uso de los pragmas implementados al realizar la sección anterior, siguiendo la función definida en ```\SRC_VITIS_HLS\EucHW.cpp```.

* ```pragma ARRAY_PARTITION``` Este comando separa un arreglo de datos y genera arreglos más pequeños o de un solo elemento almacenandolos en bloques de memoria RAM individuales.
 Sintaxis:
 ```c
 #pragma HLS array_partition variable=<name> <type>  factor=<int>
 ```
  Donde ```variable``` especifica la variable a la cual se le aplica la directiva, ```type``` sporta block, cyclic y complete, que determinan la forma en que se re ordenan los datos. ```factor``` indica el largo en unidades de cada particion generada.
* ```pragma INTERFACE``` Este comando define como seran creados los puertos en el momento de la síntesis.
Sintaxis:
```c
#pragma HLS interface mode=<mode> port=<name> storage_impl=<name>
```
Donde ```mode``` especifica el el protocolo a utilizar en el puerto. ```port``` representa el nombre del argumento de la función al cual se le aplicara el protocolo especificado.

Finalmente la función ```main``` del diseño queda como se muestra a continuación:

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

#### Implementación de comprocesador en PL usando Vivado

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


Para cualquier diseño de coprocesador que se desee implementar, los pasos a seguir son equivalentes, solo debe importar el repositorio IP deseado:
* Abrir Vivado y crear un nuevo proyecto con ```Create Project```.
* En la sección ```Project name``` elegir un nombre y directorio para el proyecto. Avanzar.
* En la sección ```Project type``` conservar las configuraciones  ```RTL project``` y todas las demas casillas desmarcadas.
* En ```Add Source``` click en siguiente (no se necesitan fuentes para este proyecto).
* En ```Add Constraints``` click en  ```Add File``` y seleccionar el archivo ```zybo.XDC``` presente en el respoitorio.
* En ```Default Part```, ```Boards``` elegir ```ZYBO```, si es necesario, descargar y Finalizar.
* En ```Flow navigator```, ```IP INTEGRATOR``` seleccionar ```Create Block Design```.
* Una vez abierto, añadir los siguientes componentes con sus respectivas configuraciones:
  * ZYNQ7 Processing System -> Re-customize IP:
    * Interrupts, Fabric Interrupts, PL-PS Interrupt Ports, IRQ_F2P.
    * Clock Configuration, Input Frequency (MHz) = 60, PL Fabric Clocks, FCLK_CLK0 = 100.
  * AXI GPIO -> Re-customize IP:
    * IP Configuration, All Output ; GPIO Width = 2 ; Enable Interrupts.
  * Concat.
  * jb (puerto de salida Pmod) -> Design, click derecho, Create Port:
   * Port name = jb; Direction = output; Type = Data; Create vector: from 1 to 0.
* Abrir Flow Navigator, Project Manager, IP Catalog y con click derecho en este abrir la opción ```Add Repository``` y añadir el bloque ip para el diseño de coprocesador deseado, los cuales se encuentran en la carpeta ```IP_SRC``` de este repositorio.
* Conectar manualmente los siguientes puertos:
  * Puerto jb[1:0] con la salida de AXI GPIO, gpio_io_o[1:0].
  * ip2intc_irpt de AXI GPIO con una de las entradas del modulo Concat.
  * interrupt del bloque Euchw a una de las entradas del modulo Concat.
  * dout del modulo Concat al puerto IRQ_F2P[0:0] del modulo ZYNQ7.
* Correr ```Run Block Automation```, ```Run Connection Automation``` (marcando todas las casillas).
* Verificar el diseño con ```Validate Design``` (dos veces si es necesario).
* En Soruce, click derecho en design_1, Create HDL Wrapper, Let Vivado manage wrapper and auto-update, OK.
* En Flow Navigator, Program and debug, Generar bitstream.
* En File, Export, Export hardware, Include bitstream, elige nombre y carpeta de destino.

#### Implementación de coprocesador PL en Vitis IDE

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

#### Implementación PS en Vitis IDE

Para implementar la operación de la distancia euclidiana entre los vectores de entrada se creo la siguiente función en C dentro de el archivo fuente ```main.c``` .

```c
double eucDistSW( u8 X[VECTOR_SIZE]){

    double sum = 0;
    for (int i= 0; i < VECTOR_SIZE/2; i++){
            sum += (X[i]- X[i + VECTOR_SIZE/2])*(X[i]- X[i+VECTOR_SIZE/2]);
    }
    return sqrt(sum);
}
```

La cual recibe los vectores de entrada concatenados en ```X``` y realiza la operación correspondiente.

#### Reporte de frecuencia, latencia y throughtput

El proyecto se implemento con una frecuencia de 100 MHz, como se sugeira en la sintesis de HLS. Los resultados finales muestran que se cumplen todas las restricciones de timepo, logrando un WNS de 0.081 ns, como se muestra en la Figura siguiente:

#### Tiempo de sintesis

* Sintesis (HLS) = ???
* Sintesis (Vivado) = ???
* Implementacion = ???
