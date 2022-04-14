#include <stdio.h>
#include <xparameters.h>
#include <xscugic.h>
#include <xil_exception.h>
#include "xeuchw.h"
//#include <xil_printf.h>


#define INTC_DEVICE_ID			XPAR_PS7_SCUGIC_0_DEVICE_ID
#define XHLS_DEVICE_ID			XPAR_EUCHW_0_DEVICE_ID
#define INTC_ADDT_INT_ID		XPAR_FABRIC_EUCHW_0_INTERRUPT_INTR
#define xil_printf 				printf

#define N_VECTORS				10
#define VECTOR_SIZE				2048// 2*1024
#define BUFFER_SIZE				16
#define BRAMS					128

enum errTypes
{
	ERR_HLS_INIT,
	ERR_INTC_INIT,
	ERR_DEFAULT
};
enum IP_ready
{
	IP_Ready,
	IP_Busy
};

int IntcInitFunction(u16 DeviceId);
int errorHandler(enum errTypes err);
void BTN_InterruptHandler(void *InsPtr);
int TxDataSend(XEuchw *InstancePtr, u8 data[VECTOR_SIZE]);
void AdderTreeReceiveHandler(void *InstPtr);

XScuGic intc;
XEuchw hls_ip;
volatile int ip_status;

void (*XHLSWriteFunc[])() = { XEuchw_Write_x_0_Bytes,
			XEuchw_Write_x_1_Bytes, XEuchw_Write_x_2_Bytes, XEuchw_Write_x_3_Bytes,
			XEuchw_Write_x_4_Bytes, XEuchw_Write_x_5_Bytes, XEuchw_Write_x_6_Bytes,
			XEuchw_Write_x_7_Bytes, XEuchw_Write_x_8_Bytes, XEuchw_Write_x_9_Bytes,
			XEuchw_Write_x_10_Bytes, XEuchw_Write_x_11_Bytes, XEuchw_Write_x_12_Bytes,
			XEuchw_Write_x_13_Bytes, XEuchw_Write_x_14_Bytes, XEuchw_Write_x_15_Bytes,
			XEuchw_Write_x_16_Bytes, XEuchw_Write_x_17_Bytes, XEuchw_Write_x_18_Bytes,
			XEuchw_Write_x_19_Bytes, XEuchw_Write_x_20_Bytes, XEuchw_Write_x_21_Bytes,
			XEuchw_Write_x_22_Bytes, XEuchw_Write_x_23_Bytes, XEuchw_Write_x_24_Bytes,
			XEuchw_Write_x_25_Bytes, XEuchw_Write_x_26_Bytes, XEuchw_Write_x_27_Bytes,
			XEuchw_Write_x_28_Bytes, XEuchw_Write_x_29_Bytes, XEuchw_Write_x_30_Bytes,
			XEuchw_Write_x_31_Bytes, XEuchw_Write_x_32_Bytes, XEuchw_Write_x_33_Bytes,
			XEuchw_Write_x_34_Bytes, XEuchw_Write_x_35_Bytes, XEuchw_Write_x_36_Bytes,
			XEuchw_Write_x_37_Bytes, XEuchw_Write_x_38_Bytes, XEuchw_Write_x_39_Bytes,
			XEuchw_Write_x_40_Bytes, XEuchw_Write_x_41_Bytes, XEuchw_Write_x_42_Bytes,
			XEuchw_Write_x_43_Bytes, XEuchw_Write_x_44_Bytes, XEuchw_Write_x_45_Bytes,
			XEuchw_Write_x_46_Bytes, XEuchw_Write_x_47_Bytes, XEuchw_Write_x_48_Bytes,
			XEuchw_Write_x_49_Bytes, XEuchw_Write_x_50_Bytes, XEuchw_Write_x_51_Bytes,
			XEuchw_Write_x_52_Bytes, XEuchw_Write_x_53_Bytes, XEuchw_Write_x_54_Bytes,
			XEuchw_Write_x_55_Bytes, XEuchw_Write_x_56_Bytes, XEuchw_Write_x_57_Bytes,
			XEuchw_Write_x_58_Bytes, XEuchw_Write_x_59_Bytes, XEuchw_Write_x_60_Bytes,
			XEuchw_Write_x_61_Bytes, XEuchw_Write_x_62_Bytes, XEuchw_Write_x_63_Bytes,
			XEuchw_Write_x_64_Bytes, XEuchw_Write_x_65_Bytes, XEuchw_Write_x_66_Bytes,
			XEuchw_Write_x_67_Bytes, XEuchw_Write_x_68_Bytes, XEuchw_Write_x_69_Bytes,
			XEuchw_Write_x_70_Bytes, XEuchw_Write_x_71_Bytes, XEuchw_Write_x_72_Bytes,
			XEuchw_Write_x_73_Bytes, XEuchw_Write_x_74_Bytes, XEuchw_Write_x_75_Bytes,
			XEuchw_Write_x_76_Bytes, XEuchw_Write_x_77_Bytes, XEuchw_Write_x_78_Bytes,
			XEuchw_Write_x_79_Bytes, XEuchw_Write_x_80_Bytes, XEuchw_Write_x_81_Bytes,
			XEuchw_Write_x_82_Bytes, XEuchw_Write_x_83_Bytes, XEuchw_Write_x_84_Bytes,
			XEuchw_Write_x_85_Bytes, XEuchw_Write_x_86_Bytes, XEuchw_Write_x_87_Bytes,
			XEuchw_Write_x_88_Bytes, XEuchw_Write_x_89_Bytes, XEuchw_Write_x_90_Bytes,
			XEuchw_Write_x_91_Bytes, XEuchw_Write_x_92_Bytes, XEuchw_Write_x_93_Bytes,
			XEuchw_Write_x_94_Bytes, XEuchw_Write_x_95_Bytes, XEuchw_Write_x_96_Bytes,
			XEuchw_Write_x_97_Bytes, XEuchw_Write_x_98_Bytes, XEuchw_Write_x_99_Bytes,
			XEuchw_Write_x_100_Bytes, XEuchw_Write_x_101_Bytes, XEuchw_Write_x_102_Bytes,
			XEuchw_Write_x_103_Bytes, XEuchw_Write_x_104_Bytes, XEuchw_Write_x_105_Bytes,
			XEuchw_Write_x_106_Bytes, XEuchw_Write_x_107_Bytes, XEuchw_Write_x_108_Bytes,
			XEuchw_Write_x_109_Bytes, XEuchw_Write_x_110_Bytes, XEuchw_Write_x_111_Bytes,
			XEuchw_Write_x_112_Bytes, XEuchw_Write_x_113_Bytes, XEuchw_Write_x_114_Bytes,
			XEuchw_Write_x_115_Bytes, XEuchw_Write_x_116_Bytes, XEuchw_Write_x_117_Bytes,
			XEuchw_Write_x_118_Bytes, XEuchw_Write_x_119_Bytes, XEuchw_Write_x_120_Bytes,
			XEuchw_Write_x_121_Bytes, XEuchw_Write_x_122_Bytes, XEuchw_Write_x_123_Bytes,
			XEuchw_Write_x_124_Bytes, XEuchw_Write_x_125_Bytes, XEuchw_Write_x_126_Bytes,
			XEuchw_Write_x_127_Bytes};
u8 TxData[BUFFER_SIZE];
u32 RxData[1];

int TxDataSend(XEuchw *InstancePtr, u8 data[VECTOR_SIZE])
{
	int status = XST_SUCCESS;
	for (int br = 0; br < BRAMS; br++)
	{
		for (int i = 0; i < BUFFER_SIZE; i++)
		{
			TxData[i] = (i*BRAMS +br)< VECTOR_SIZE ? *((u8*) &data[(i*BRAMS) + br]) : 0;
		}
		XHLSWriteFunc[br](InstancePtr, 0, TxData, BUFFER_SIZE);
	}
	return status;
}
/*
int TxDataSend(XEuchw *InstancePtr, int data[VECTOR_SIZE])
{
	int status = XST_SUCCESS;
	for (int br = 0; br < BRAMS; br++)
	{
		XHLSWriteFunc[br](InstancePtr, data[br]);
	}
	return status;
}
*/
void AdderTreeReceiveHandler(void *InstPtr)
{
	u32 results[1];
	XEuchw_InterruptDisable(&hls_ip,1);

	RxData[0] = XEuchw_Get_y_sqrt(&hls_ip);
	results[0] = *((u32*) &(RxData[0]));

	xil_printf("Resultados: %u\n", results[0]);
	ip_status = IP_Ready;
	XEuchw_InterruptClear(&hls_ip,1);
	XEuchw_InterruptEnable(&hls_ip,1);
}

void getVector(u8 vec[VECTOR_SIZE])
{
	for (int i = 0; i < VECTOR_SIZE; i++)
	{
		scanf("%u", &vec[i]);
	}
}

int main()
{

	int status = XST_SUCCESS;

	/* INIT */
	/* HLS IP init */
	status += XEuchw_Initialize(&hls_ip, XHLS_DEVICE_ID);
	if (status != XST_SUCCESS) return errorHandler(ERR_HLS_INIT);

	/* interrupt controller init*/
	status = IntcInitFunction(INTC_DEVICE_ID);
	if (status != XST_SUCCESS) return errorHandler(ERR_INTC_INIT);

	ip_status = IP_Ready;
	u8 txbuffer[VECTOR_SIZE];
	for (int trial = 0; trial < N_VECTORS; trial++ )
	{
		while (ip_status == IP_Busy) {};
		getVector(txbuffer);
		TxDataSend(&hls_ip, txbuffer);
		ip_status = IP_Busy;
		XEuchw_Start(&hls_ip);
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
							 (Xil_ExceptionHandler)AdderTreeReceiveHandler,
							 (void *) (&hls_ip));

	// Enable GPIO interrupts interrupt
	XEuchw_InterruptEnable(&hls_ip, 1);
	XEuchw_InterruptGlobalEnable(&hls_ip);

	// Enable GPIO and timer interrupts in the controller
	XScuGic_Enable(&intc, INTC_ADDT_INT_ID);

	return XST_SUCCESS;
}
