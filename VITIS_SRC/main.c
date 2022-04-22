#include <stdio.h>
#include <stdlib.h>
#include <xparameters.h>
#include <xscugic.h>
#include <xil_exception.h>
#include "xeuchw.h"
#include <xil_printf.h>

#include <math.h>

#include <xgpio.h> // axis gpio

#define INTC_DEVICE_ID			XPAR_PS7_SCUGIC_0_DEVICE_ID
#define XHLS_DEVICE_ID			XPAR_EUCHW_0_DEVICE_ID
#define INTC_ADDT_INT_ID		XPAR_FABRIC_EUCHW_0_INTERRUPT_INTR
#define xil_printf 				printf

#define JBPMOD_DEVICE_ID			XPAR_XGPIOPS_0_DEVICE_ID

//#define N_VECTORS				10000
#define VECTOR_SIZE				2*1024		/* para vector de 1024 palabras */
//#define VECTOR_SIZE			128*2   	/* para vector de 128 palabras */
#define BUFFER_SIZE				64			/* para vector de 1024 palabras */
//#define BUFFER_SIZE			4		/* para vector de 128 palabras */
#define BRAMS					32

#define max_value 	1023
#define min_value 	-1023
#define FLOAT 		1
#define INT 		0

enum errTypes
{
	ERR_HLS_INIT,
	ERR_GPIO_INIT,
	ERR_INTC_INIT,
	ERR_DEFAULT
};
enum IP_ready
{
	IP_Ready,
	IP_Busy
};

//typedef float T_in;			//Para variables de tipo flotante
typedef int T_in;			//Para variables de tipo entero

int IntcInitFunction(u16 DeviceId);
int errorHandler(enum errTypes err);
void BTN_InterruptHandler(void *InsPtr);
int TxDataSend(XEuchw *InstancePtr, T_in data[VECTOR_SIZE]);
void reciveHandler(void *InstPtr);
double eucDistSW( T_in X[VECTOR_SIZE]);

XScuGic intc;
XEuchw hls_ip;

XGpio jb;

volatile int ip_status;

void (*XHLSWriteFunc[])() = { XEuchw_Write_x_0_Words,
			XEuchw_Write_x_1_Words, XEuchw_Write_x_2_Words, XEuchw_Write_x_3_Words,
			XEuchw_Write_x_4_Words, XEuchw_Write_x_5_Words, XEuchw_Write_x_6_Words,
			XEuchw_Write_x_7_Words, XEuchw_Write_x_8_Words, XEuchw_Write_x_9_Words,
			XEuchw_Write_x_10_Words, XEuchw_Write_x_11_Words, XEuchw_Write_x_12_Words,
			XEuchw_Write_x_13_Words, XEuchw_Write_x_14_Words, XEuchw_Write_x_15_Words,
			XEuchw_Write_x_16_Words, XEuchw_Write_x_17_Words, XEuchw_Write_x_18_Words,
			XEuchw_Write_x_19_Words, XEuchw_Write_x_20_Words, XEuchw_Write_x_21_Words,
			XEuchw_Write_x_22_Words, XEuchw_Write_x_23_Words, XEuchw_Write_x_24_Words,
			XEuchw_Write_x_25_Words, XEuchw_Write_x_26_Words, XEuchw_Write_x_27_Words,
			XEuchw_Write_x_28_Words, XEuchw_Write_x_29_Words, XEuchw_Write_x_30_Words,
			XEuchw_Write_x_31_Words};
u32 TxData[BUFFER_SIZE];
u32 RxData[1]; /* for uint as float version */
double RxDataSW;
int TxDataSend(XEuchw *InstancePtr, T_in data[VECTOR_SIZE])
{
	int status = XST_SUCCESS;
	for (int br = 0; br < BRAMS; br++)
	{
		for (int i = 0; i < BUFFER_SIZE; i++)
		{
			TxData[i] = (i*BRAMS +br)< VECTOR_SIZE ? *((u32*) &data[(i*BRAMS) + br]) : 0;
		}
		XHLSWriteFunc[br](InstancePtr, 0, TxData, BUFFER_SIZE);
	}
	return status;
}

void reciveHandler(void *InstPtr)
{
   T_in results[1];
   XEuchw_InterruptDisable(&hls_ip,1);

   RxData[0] = XEuchw_Get_y_sqrt(&hls_ip);
   results[0] = *((T_in*) &(RxData[0]));

   XGpio_DiscreteWrite(&jb, 1, 0b00);

	xil_printf("%d\n", results[0]); // Para variables de tipo entero
   //xil_printf("%f\n", results[0]); // Para variables de tipo flotante

   xil_printf("%f\n",  RxDataSW);

   ip_status = IP_Ready;
   XEuchw_InterruptClear(&hls_ip,1);
   XEuchw_InterruptEnable(&hls_ip,1);
}


void getCommand(int cmd[1])
{
	//while(1)
	//{
		scanf("%d", &cmd[0]);
		//if(cmd[0]==1)
			return;
	//}
}


void generateVector(T_in vec[VECTOR_SIZE], int type)
{
	for (int i=0; i< VECTOR_SIZE; i ++)
	{
		if(type == FLOAT){
			T_in random = ((T_in) rand())/RAND_MAX;
			T_in range = (T_in) (max_value-min_value) *random;
			T_in number = min_value + range;
			vec[i] = number;
		} else if (type == INT)
		{
			vec[i] = (rand() %(max_value - min_value + 1)) + min_value;
		}
	}

	return;
}


int main()
{
	/* INIT */
	/* HLS IP init */
	int status = XST_SUCCESS;
	status += XEuchw_Initialize(&hls_ip, XHLS_DEVICE_ID);
	if (status != XST_SUCCESS) return errorHandler(ERR_HLS_INIT);

	/* interrupt controller init*/
	status = IntcInitFunction(INTC_DEVICE_ID);
	if (status != XST_SUCCESS) return errorHandler(ERR_INTC_INIT);

	/* GPIO init */
	status += XGpio_Initialize(&jb, JBPMOD_DEVICE_ID);
	if (status != XST_SUCCESS) return errorHandler(ERR_GPIO_INIT);
	XGpio_SetDataDirection(&jb, 1, 0x00);

	//status = TimerSetupIntrSystem(ConfigPtr,TimerInstancePtr, TIMER_DEVICE_ID);
	if (status != XST_SUCCESS) return XST_FAILURE;

	ip_status = IP_Ready;
	T_in txbuffer[VECTOR_SIZE];
	XGpio_DiscreteWrite(&jb, 1, 0b00);

	int cmd[1];
	getCommand(cmd);

	int N_VECTORS = cmd[0];

	while(1){

		getCommand(cmd);

		if (cmd[0] == 1)
		{
			for (int trial = 0; trial < N_VECTORS; trial++ )
			{
				while (ip_status == IP_Busy) {};

				generateVector(txbuffer, INT); // INT para vectores int, FLOAT para vectores float.

				XGpio_DiscreteWrite(&jb, 1, 0b01);

				RxDataSW = eucDistSW(txbuffer);

				XGpio_DiscreteWrite(&jb, 1, 0b10);

				TxDataSend(&hls_ip, txbuffer);

				ip_status = IP_Busy;
				XEuchw_Start(&hls_ip);

				getCommand(cmd);

				if (cmd[0] != 1){

					while (ip_status == IP_Busy) {};

						generateVector(txbuffer, INT); // INT para vectores int, FLOAT para vectores float.

						XGpio_DiscreteWrite(&jb, 1, 0b01);

						RxDataSW = eucDistSW(txbuffer);

						XGpio_DiscreteWrite(&jb, 1, 0b10);

						TxDataSend(&hls_ip, txbuffer);

						ip_status = IP_Busy;
						XEuchw_Start(&hls_ip);

				}
			}
		}


		else break;
	}

	while(1);

    return 0;
}

int errorHandler(enum errTypes err)
{
	switch(err)
	{
		case(ERR_HLS_INIT):
		{
			xil_printf("Error inicializando bloque HLS\n");
			break;
		}
		case(ERR_GPIO_INIT):
		{
			xil_printf("Error inicializando GPIO\n");
			break;
		}
		case(ERR_INTC_INIT):
		{
			xil_printf("Error inicializando INTC\n");
			break;
		}
		default:
		{
			xil_printf("Error en ejecucion\n");
		}
	}
	return XST_FAILURE;
}

int IntcInitFunction(u16 DeviceId)
{
	XScuGic_Config *IntcConfig;
	int status;

	// Interrupt controller initialization
	IntcConfig = XScuGic_LookupConfig(DeviceId);
	status = XScuGic_CfgInitialize(&intc, IntcConfig, IntcConfig->CpuBaseAddress);
	if(status != XST_SUCCESS) return status;


	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
								(Xil_ExceptionHandler) XScuGic_InterruptHandler,
								&intc);

	Xil_ExceptionEnable();

	status = XScuGic_Connect(&intc,
							 INTC_ADDT_INT_ID,
							 (Xil_ExceptionHandler)reciveHandler,
							 (void *) (&hls_ip));

	// Enable GPIO interrupts interrupt
	XEuchw_InterruptEnable(&hls_ip, 1);
	XEuchw_InterruptGlobalEnable(&hls_ip);

	// Enable GPIO and timer interrupts in the controller
	XScuGic_Enable(&intc, INTC_ADDT_INT_ID);

	return XST_SUCCESS;
}

double eucDistSW( T_in X[VECTOR_SIZE]){

    double sum = 0;
    for (int i= 0; i < VECTOR_SIZE/2; i++){
            sum += (X[i]- X[i + VECTOR_SIZE/2])*(X[i]- X[i+VECTOR_SIZE/2]);
    }
    return sqrt( (long double) sum);
}
