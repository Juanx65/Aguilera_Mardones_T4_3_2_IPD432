# Tarea 4 P3.2 IPD432

### Grupo Juan Aguilera - Ricardo Mardones

El propósito de este proyecto es el de ilustrar el proceso de diseño de un coprocesador en un sistema SoC (ZYBO),soporta el cálculo de la distancia Euclidiana entre dos vectores, con el fin de comparar/caracterizar la latencia entre una implementación en sistema hererogéneo con Programmable System (PS) y  Programmable Logic (PL)(FPGA) con respecto a implementación  exclusivamente en Processing Subsystem (PS)(ZYNQ7).
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
      <a href="https://youtu.be/Br60XaD3chg">
     <img
      src="/Imagenes_Readme/vitis_hls_youtube.png"
      alt="Tutoral VITIS HLS"
      style="width:80%;">
      </a>
</div>

##### Guía paso a paso

Para reproducir la síntesis del coprocesador mediante Vitis HLS se utilizan los archivos fuente que se encuentran en  la carpeta ``` \VITIS_HLS_SRC``` dentro de este repositorio. Se deben seguir  las instrucciones descritas  a continuación:

* Abrir Vitis HLS 2021.2, seleccionando la opción ```Create Project```.
* Elegir un nombre y ubicación para el proyecto creado y hacer click en  el botón ```Next > ```.
* Añadir los archivos fuente correspondientes a archivos de diseño, estos son ```EucHW.cpp```, ```EucHW.h``` y  ```specs.h```. En esta misma ventana se debe definir la función principal, en este caso, ```EucHW```. Luego  hacer click en  el botón ```Next > ```.
* Añadir los archivos fuente correspondientes a archivos de <em>testbench</em>, estos son ```EucSW.cpp```, ```EucSW.h``` y  ```EucTB.cpp```. Luego  hacer click en  el botón ```Next > ```.

* Elegir nombre para la solución, escoger el periodo del reloj a utilizar en la síntesis (se conserva el valor por defecto de 10 ns para obtener un estimado del <em>timing</em> comparable con el esperado al cargar el diseño en la tarjeta).

* En la sección ```Part Selection```, ```Parts```, especificar la tarjeta en la cual se implementará el diseño, en este caso  ```XC7Z010CLG400-1```.

* Conservar la configuración por defecto en la sección ```Flow Target``` y hacer click en el botón ```Finish ```.

##### Tamaño del vectores de entrada y tipo de variable

El objetivo es  experimentar con distintos tamaños de vectores, así como con distintos tipos de variables, realizan versiones trabajando con enteros de 32 bits y flotantes de 32 bits, por lo que, modificando el código fuente en ``` \VITIS_HLS_SRC\specs.h```, se puede configurar los parámetros para obtener el diseño deseado.

* En las lineas 8-9 se define el largo del vector de la siguiente forma, donde se descomenta el largo deseado, o simplemente se modifica la línea para definir el tamaño de los vectores.
```c
#define LENGTH 1024           /* Largo de vectores para 1024 palabras */
//#define LENGTH 128          /* Largo de vectores para 128 palabras */
```

* En las lineas 5-6 se define el tipo de dato a operar, donde se puede cambiar el tipo de dato deseado.
```c
//typedef int T_in;     /* Version entero sin signo */
typedef float T_in;     /* Version punto flotante */
```

En el archivo ```\VITS_HLS_SCR\eucHW.cpp```  debe escoger entre  los siguientes pares de líneas dependiendo de los tipos de variable a operar. Dejando descomentada la línea de interés y la linea descartada se comenta (esto último es solo una recomendación para poder migrar de una versión del diseño a la otra sin modificar demasiado el código)
* Líneas 32-31:
 ```c
 *y_sqrt = hls::sqrtf(res); 				/* raiz cuadrada para números de punto flotante */
 //*y_sqrt = hls::sqrt(res); 				/* raíz cuadrada para números enteros */
 ```
* Lineas 24-25:
 ```c
 //#pragma HLS PIPELINE ii=2  						 /* Operaciones de enteros */
 #pragma HLS PIPELINE ii=160  						/* Operaciones flotantes */
 ```
##### Síntesis  
El proceso de síntesis es el mismo para todos los diseños a implementar.
* Sintetizar el proyecto haciendo click en el botón `Run` de la barra superior del Software o  `Run C Synthesis `  ubicado en la sección `Flow Navigator`.

 Si todo ha ido como corresponde, la síntesis debiese entregar resultados satisfactorios cumpliendo con las restricciones de <em>timing</em> (sin <em>slack</em> negativo), y un uso de recursos  fisicamente implementable en la tarjeta de desarrollo a utilizar.

 En la Figura a continuación se muestra los resultados de síntesis para vectores de 1024 palabras con tipo flotante de 32 bits:

![Device part.](/Imagenes_Readme/performance_hls.png)

* Para validar el diseño y comprobar que se comporta como se esperaba, se ejecuta la Cosimulación  haciendo click en botón de `Run Cosimulation`  ubicado en la sección `Flow Navigator `.

* Exportar IP hacienco click en el botón `Export RTL`  en la sección `Flow navigator`. Esta acción genera un archvio .zip, el cual al ser descomprimido puede ser añadido a
`Vivado`  como se mostrará más adelante.

#### Uso de pragmas en Vitis HLS y decisiones de diseño

En esta sección se explica el uso de los pragmas implementados al realizar la sección anterior, siguiendo la función definida en ` SRC_VITIS_HLS\EucHW.cpp`.

* `pragma ARRAY_PARTITION`  Este comando separa un arreglo de datos y genera arreglos más pequeños o de un solo elemento almacenandolos en bloques de memoria RAM individuales.
 Sintaxis:
 ` c
 #pragma HLS array_partition variable=<name> <type>  factor=<int>
 `
  Donde `variable`  especifica la variable a la cual se le aplica la directiva, ` type`  sporta block, cyclic y complete, que determinan la forma en que se re ordenan los datos. ` factor`  indica el largo en unidades de cada particion generada.

* ` pragma INTERFACE`  Este comando define como serán creados los puertos de salida y entrada del PL en al momento de la síntesis.
Sintaxis:
```c
#pragma HLS interface mode=<mode> port=<name> storage_impl=<name>
```
Donde ` mode`  especifica el el protocolo a utilizar en el puerto, en este caso será ```axilite```. El parámetro ` port`  representa el nombre del argumento de la función al cual se le aplicara el protocolo especificado.

* ` pragma PIPELINE`  Este comando se asegura resolver la violación de intervalo de iniciación, manteniendo el pipline lleno.
Sintaxis:
```c
#pragma HLS pipeline ii=<iterations>
```

Donde ` ii`  Especifica el intervalo de iniciación deseado para el pipeline.

Si bien el diseño pretende realizar operaciónes entre dos vectores, como argumento de entrada se entrega únicamente un vector, corresondiente a los dos vectores que se operarán, pero concatenados. De esta forma el argumento de entrada es un vector del doble del largo definido:
```c
T_in X[2*LENGTH]
```

Finalmente la función `main` del diseño queda como se muestra a continuación:

```c
void eucHW(T_in *y_sqrt, T_in x[2*LENGTH])
{
	#pragma HLS INTERFACE mode=s_axilite port=x storage_impl=bram
	#pragma HLS INTERFACE mode=s_axilite port=y_sqrt
	#pragma HLS INTERFACE mode=s_axilite port=return
	#pragma HLS ARRAY_PARTITION variable=x type=cyclic factor=32

	T_in res = 0;
	MainLoop: for (int i = 0; i < LENGTH; ++i)
	{
		#pragma HLS UNROLL factor=32
		//#pragma HLS PIPELINE ii=2  									/* Operaciones de enteros  */
		#pragma HLS PIPELINE ii=160  									/* Operaciones flotantes  */
		res += (x[i+ LENGTH] -x[i])*(x[i+ LENGTH] -x[i]);
	}

	*y_sqrt = hls::sqrtf(res);      /* raiz cuadrada para números de punto flotante */
	//*y_sqrt = hls::sqrt(res); 	 /* raíz cuadrada para números enteros */
	return;
```

#### Implementación de comprocesador en PL usando Vivado

##### Video tutorial

<div align="center">
      <a href="https://www.youtube.com/watch?v=T1cJjMVZNRA">
     <img
      src="/Imagenes_Readme/vivado_youtube.png"
      alt="Tutorial VIVADO"
      style="width:80%;">
      </a>
</div>

##### Guía paso a paso

Para cualquier diseño de coprocesador que se desee implementar, los pasos a seguir son equivalentes, solo debe importar el repositorio IP correspondiente:
* Abrir Vivado y crear un nuevo proyecto con `Create Project`.
* En la sección `Project name` elegir un nombre y directorio para el proyecto. Avanzar.
* En la sección ` Project type`  conservar las configuraciones  `RTL project`  y todas las demas casillas desmarcadas.
* En `Add Source`  click en siguiente (no se necesitan fuentes para este proyecto).
* En `Add Constraints`  click en  `Add File`  y seleccionar el archivo ` zybo.XDC`  presente en el respoitorio.
* En `Default Part`, ` Boards`  elegir ` ZYBO`  si es necesario, descargar y Finalizar.
* En ` Flow navigator`,  ` IP INTEGRATOR`  seleccionar ` Create Block Design` .
* Una vez abierto, añadir los siguientes componentes con sus respectivas configuraciones:
  * ZYNQ7 Processing System -> Re-customize IP:
    * Interrupts, Fabric Interrupts, PL-PS Interrupt Ports, IRQ_F2P.
    * Clock Configuration, Input Frequency (MHz) = 60, PL Fabric Clocks, FCLK_CLK0 = 100.
  * AXI GPIO -> Re-customize IP:
    * IP Configuration, All Output ; GPIO Width = 2 ; Enable Interrupts.
  * Concat.
  * jb (puerto de salida Pmod) -> Design, click derecho, Create Port:
   * Port name = jb; Direction = output; Type = Data; Create vector: from 1 to 0.
* Abrir Flow Navigator, Project Manager, IP Catalog y con click derecho en este abrir la opción `Add Repository`  y añadir el bloque ip para el diseño de coprocesador deseado, los cuales se encuentran en la carpeta `IP_SRC`  de este repositorio.
* Conectar manualmente los siguientes puertos:
  * Puerto jb[1:0] con la salida de AXI GPIO, gpio_io_o[1:0].
  * ip2intc_irpt de AXI GPIO con una de las entradas del modulo Concat.
  * interrupt del bloque Euchw a una de las entradas del modulo Concat.
  * dout del modulo Concat al puerto IRQ_F2P[0:0] del modulo ZYNQ7.
* Correr `Run Block Automation` , `Run Connection Automation`  (marcando todas las casillas).
* Verificar el diseño con `Validate Design`  (dos veces si es necesario).
* En Soruce, click derecho en design_1, Create HDL Wrapper, Let Vivado manage wrapper and auto-update, OK.
* En Flow Navigator, Program and debug, Generar bitstream.
* En File, Export, Export hardware, Include bitstream, elige nombre y carpeta de destino.

#### Integrar PS y PL en Vitis IDE para ZYBO

##### Video tutorial

<div align="center">
      <a href="https://youtu.be/iE7mESyYrVM">
     <img
      src="/Imagenes_Readme/vitis_youtube.png"
      alt="Tutorial VITIS"
      style="width:80%;">
      </a>
</div>

##### Guía paso a paso

Para la implementacion de cualquiera de los coprocesadores diseñados, se debe seguir los siguentes pasos:
* Crear un nuevo proyecto en Vitis IDE ( o abrirlo usando `launch vitis` desde Vivado ).
* Elegir el directorio del workspace, Launch.
* Del menu de bienvenida, abrir `Create Application Project`, `Next >`.
* Seleccionar `Create a new aplication from hardware (XSA)`.
* En `Hardware Specification`, `XSA File` seleccionar el archivo `.csv` creado al exportar el hardware en el tutorial de Vivado, `Next >`.
* Elegir un nombre para  el proyecto, `Next >`.
* `Next >`.
* Del menu de template, elegir `Empty application(C)`, `Next >` y finalizar.
* Una vez abierto el projecto, dirigirse a `src`, clic derecho, `new`, `File`.
* En el menu de `Create New File`, expandir opción `<< Advanced`, seleccionar `Link to file in the system`, `Browse`, sellecionar el archivo `\VITIS_SRC\main.c` disponible en el repositorio.

Para adaptar el código `main.c` a los distintos diseños implementados, se deben modificar los siguientes parametros según corresponda:

* Para vectores de entrada de distintos largos, es necesario modificar entre las líneas 20-25:
```c
#define VECTOR_SIZE				2*1024		/* para vector de 1024 palabras */
//#define VECTOR_SIZE			128*2   	/* para vector de 128 palabras */
#define BUFFER_SIZE				64			/* para vector de 1024 palabras */
//#define BUFFER_SIZE			4		/* para vector de 128 palabras */
#define BRAMS					32
```
 Donde BRAMS se mantiene dependiendo del factor de unroll y array partition usado para la sintesis de hls, el valor de BUFFER_SIZE es igual a `VECTOR_SIZE/BRAMS`.

*  Para vectores de distintos tipo, entre las líneas 43-44, descomentar/comentar según corresponda al diseño:
```c
typedef float T_in;     //Para variables de tipo flotante
//typedef int T_in;     //Para variables de tipo entero
```

* Además, modificar entre las líneas 99-100 según corresponda al diseño:
```c
//xil_printf("%d\n", results[0]); // Para variables de tipo entero
xil_printf("%f\n", results[0]); // Para variables de tipo flotante
```
* Finalmente, es necesario modificar las líneas 181 y 200 para que la generación de vectores aleatorios en el PL sea de `INT` o `FLOAT` dependiendo de la necesidad.
 ```c
 generateVector(txbuffer, INT); // INT para vectores int, FLOAT para vectores float.
 ```


Adicionalmente, se programó el script de Python `\PYTHON_SRC\serial_test.py`  donde se pueden generan un número variable de  instancias de prueba. Para cada
instancia se evalúa si el error numérico obtenido cumple con cierto margen de error, en este caso se consideró que un resultado es válido si presenta un error menor al 1 % respecto al resultado que se obtendría realizando la misma operación mediante software.

##### Implementación PS en Vitis IDE

Para implementar la operación de la distancia euclidiana entre los vectores de entrada se creó la siguiente función en C dentro de el archivo fuente `main.c`.

```c
double eucDistSW( T_in X[VECTOR_SIZE]){

    double sum = 0;
    for (int i= 0; i < VECTOR_SIZE/2; i++){
            sum += (X[i]- X[i + VECTOR_SIZE/2])*(X[i]- X[i+VECTOR_SIZE/2]);
    }
    return sqrt(sum);
}
```

La cual recibe los vectores de entrada concatenados en ` X`  y realiza la operación correspondiente.

#### Reporte de frecuencia, latencia y throughtput

Las versiónes crítica del proyecto, es decir, cuando se trabajan vectores de 1024 elementos de 32 bits se implementaron con una frecuencia de 100 MHz, para datos enteros y para la versión con flotantes.

 Los resultados finales muestran que se cumplen todas las restricciones de timepo, logrando un WNS de 0.081 ns, como se muestra en la Figura siguiente:




#### Latencia
  Para media la latencia del sistema se dio uso un analizador lógico conectado a un pin de salida de la tarjeta de desarrollo utilizada, el cual indicaba el inicio del proceso de comunicación entre PS y PL así como la finalización de la operación de cálculo. Con este método y varias instancias de prueba se llegó a que la ```latencia promedio del sistema es de 562.0780 us ``` para la versión que opera con flotantes y  una ``` latencia promedio de ---- us``` para la versión que trabaja con enteros de 32 bits.

#### Throughput
 Considerando que la frecuencia de reloj utilizada es de 100 Mhz y las latencias estimadas,se tiene  que el  ```throughtput estimado  es de 1779 resultado/s ```para la versión que opera con flotantes, entanto la versión que trabaja con enteros de 32 bits tiene un ```throughtput estimado de --- resultado/s```
#### Tiempo de sintesis


* Sintesis (HLS) versión enteros = 1.07 min
* Sintesis (HLS) versión flotantes = 0.51 min



* Sintesis (Vivado) versión flotantes = ???
* Sintesis (Vivado) versión enteros = ???


* Implementacion versión flotantes = ???
* Implementacion versión enteros = ???
