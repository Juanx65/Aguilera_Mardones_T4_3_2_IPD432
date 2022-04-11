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
#define VECTOR_SIZE				256 // 2*128
#define BUFFER_SIZE				1
#define BRAMS					256

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
int TxDataSend(XEuchw *InstancePtr, int data[VECTOR_SIZE]);
void AdderTreeReceiveHandler(void *InstPtr);

XScuGic intc;
XEuchw hls_ip;
volatile int ip_status;

void (*XHLSWriteFunc[])() = { XEuchw_Set_x_0,
			XEuchw_Set_x_1, XEuchw_Set_x_2, XEuchw_Set_x_3,
			XEuchw_Set_x_4, XEuchw_Set_x_5, XEuchw_Set_x_6,
			XEuchw_Set_x_7, XEuchw_Set_x_8, XEuchw_Set_x_9,
			XEuchw_Set_x_10, XEuchw_Set_x_11, XEuchw_Set_x_12,
			XEuchw_Set_x_13, XEuchw_Set_x_14, XEuchw_Set_x_15,
			XEuchw_Set_x_16, XEuchw_Set_x_17, XEuchw_Set_x_18,
			XEuchw_Set_x_19, XEuchw_Set_x_20, XEuchw_Set_x_21,
			XEuchw_Set_x_22, XEuchw_Set_x_23, XEuchw_Set_x_24,
			XEuchw_Set_x_25, XEuchw_Set_x_26, XEuchw_Set_x_27,
			XEuchw_Set_x_28, XEuchw_Set_x_29, XEuchw_Set_x_30,
			XEuchw_Set_x_31, XEuchw_Set_x_32, XEuchw_Set_x_33,
			XEuchw_Set_x_34, XEuchw_Set_x_35, XEuchw_Set_x_36,
			XEuchw_Set_x_37, XEuchw_Set_x_38, XEuchw_Set_x_39,
			XEuchw_Set_x_40, XEuchw_Set_x_41, XEuchw_Set_x_42,
			XEuchw_Set_x_43, XEuchw_Set_x_44, XEuchw_Set_x_45,
			XEuchw_Set_x_46, XEuchw_Set_x_47, XEuchw_Set_x_48,
			XEuchw_Set_x_49, XEuchw_Set_x_50, XEuchw_Set_x_51,
			XEuchw_Set_x_52, XEuchw_Set_x_53, XEuchw_Set_x_54,
			XEuchw_Set_x_55, XEuchw_Set_x_56, XEuchw_Set_x_57,
			XEuchw_Set_x_58, XEuchw_Set_x_59, XEuchw_Set_x_60,
			XEuchw_Set_x_61, XEuchw_Set_x_62, XEuchw_Set_x_63,
			XEuchw_Set_x_64, XEuchw_Set_x_65, XEuchw_Set_x_66,
			XEuchw_Set_x_67, XEuchw_Set_x_68, XEuchw_Set_x_69,
			XEuchw_Set_x_70, XEuchw_Set_x_71, XEuchw_Set_x_72,
			XEuchw_Set_x_73, XEuchw_Set_x_74, XEuchw_Set_x_75,
			XEuchw_Set_x_76, XEuchw_Set_x_77, XEuchw_Set_x_78,
			XEuchw_Set_x_79, XEuchw_Set_x_80, XEuchw_Set_x_81,
			XEuchw_Set_x_82, XEuchw_Set_x_83, XEuchw_Set_x_84,
			XEuchw_Set_x_85, XEuchw_Set_x_86, XEuchw_Set_x_87,
			XEuchw_Set_x_88, XEuchw_Set_x_89, XEuchw_Set_x_90,
			XEuchw_Set_x_91, XEuchw_Set_x_92, XEuchw_Set_x_93,
			XEuchw_Set_x_94, XEuchw_Set_x_95, XEuchw_Set_x_96,
			XEuchw_Set_x_97, XEuchw_Set_x_98, XEuchw_Set_x_99,
			XEuchw_Set_x_100, XEuchw_Set_x_101, XEuchw_Set_x_102,
			XEuchw_Set_x_103, XEuchw_Set_x_104, XEuchw_Set_x_105,
			XEuchw_Set_x_106, XEuchw_Set_x_107, XEuchw_Set_x_108,
			XEuchw_Set_x_109, XEuchw_Set_x_110, XEuchw_Set_x_111,
			XEuchw_Set_x_112, XEuchw_Set_x_113, XEuchw_Set_x_114,
			XEuchw_Set_x_115, XEuchw_Set_x_116, XEuchw_Set_x_117,
			XEuchw_Set_x_118, XEuchw_Set_x_119, XEuchw_Set_x_120,
			XEuchw_Set_x_121, XEuchw_Set_x_122, XEuchw_Set_x_123,
			XEuchw_Set_x_124, XEuchw_Set_x_125, XEuchw_Set_x_126,
			XEuchw_Set_x_127, XEuchw_Set_x_128, XEuchw_Set_x_129,
			XEuchw_Set_x_130, XEuchw_Set_x_131, XEuchw_Set_x_132,
			XEuchw_Set_x_133, XEuchw_Set_x_134, XEuchw_Set_x_135,
			XEuchw_Set_x_136, XEuchw_Set_x_137, XEuchw_Set_x_138,
			XEuchw_Set_x_139, XEuchw_Set_x_140, XEuchw_Set_x_141,
			XEuchw_Set_x_142, XEuchw_Set_x_143, XEuchw_Set_x_144,
			XEuchw_Set_x_145, XEuchw_Set_x_146, XEuchw_Set_x_147,
			XEuchw_Set_x_148, XEuchw_Set_x_149, XEuchw_Set_x_150,
			XEuchw_Set_x_151, XEuchw_Set_x_152, XEuchw_Set_x_153,
			XEuchw_Set_x_154, XEuchw_Set_x_155, XEuchw_Set_x_156,
			XEuchw_Set_x_157, XEuchw_Set_x_158, XEuchw_Set_x_159,
			XEuchw_Set_x_160, XEuchw_Set_x_161, XEuchw_Set_x_162,
			XEuchw_Set_x_163, XEuchw_Set_x_164, XEuchw_Set_x_165,
			XEuchw_Set_x_166, XEuchw_Set_x_167, XEuchw_Set_x_168,
			XEuchw_Set_x_169, XEuchw_Set_x_170, XEuchw_Set_x_171,
			XEuchw_Set_x_172, XEuchw_Set_x_173, XEuchw_Set_x_174,
			XEuchw_Set_x_175, XEuchw_Set_x_176, XEuchw_Set_x_177,
			XEuchw_Set_x_178, XEuchw_Set_x_179, XEuchw_Set_x_180,
			XEuchw_Set_x_181, XEuchw_Set_x_182, XEuchw_Set_x_183,
			XEuchw_Set_x_184, XEuchw_Set_x_185, XEuchw_Set_x_186,
			XEuchw_Set_x_187, XEuchw_Set_x_188, XEuchw_Set_x_189,
			XEuchw_Set_x_190, XEuchw_Set_x_191, XEuchw_Set_x_192,
			XEuchw_Set_x_193, XEuchw_Set_x_194, XEuchw_Set_x_195,
			XEuchw_Set_x_196, XEuchw_Set_x_197, XEuchw_Set_x_198,
			XEuchw_Set_x_199, XEuchw_Set_x_200, XEuchw_Set_x_201,
			XEuchw_Set_x_202, XEuchw_Set_x_203, XEuchw_Set_x_204,
			XEuchw_Set_x_205, XEuchw_Set_x_206, XEuchw_Set_x_207,
			XEuchw_Set_x_208, XEuchw_Set_x_209, XEuchw_Set_x_210,
			XEuchw_Set_x_211, XEuchw_Set_x_212, XEuchw_Set_x_213,
			XEuchw_Set_x_214, XEuchw_Set_x_215, XEuchw_Set_x_216,
			XEuchw_Set_x_217, XEuchw_Set_x_218, XEuchw_Set_x_219,
			XEuchw_Set_x_220, XEuchw_Set_x_221, XEuchw_Set_x_222,
			XEuchw_Set_x_223, XEuchw_Set_x_224, XEuchw_Set_x_225,
			XEuchw_Set_x_226, XEuchw_Set_x_227, XEuchw_Set_x_228,
			XEuchw_Set_x_229, XEuchw_Set_x_230, XEuchw_Set_x_231,
			XEuchw_Set_x_232, XEuchw_Set_x_233, XEuchw_Set_x_234,
			XEuchw_Set_x_235, XEuchw_Set_x_236, XEuchw_Set_x_237,
			XEuchw_Set_x_238, XEuchw_Set_x_239, XEuchw_Set_x_240,
			XEuchw_Set_x_241, XEuchw_Set_x_242, XEuchw_Set_x_243,
			XEuchw_Set_x_244, XEuchw_Set_x_245, XEuchw_Set_x_246,
			XEuchw_Set_x_247, XEuchw_Set_x_248, XEuchw_Set_x_249,
			XEuchw_Set_x_250, XEuchw_Set_x_251, XEuchw_Set_x_252,
			XEuchw_Set_x_253, XEuchw_Set_x_254, XEuchw_Set_x_255,
			XEuchw_Set_x_255};

u32 TxData[BUFFER_SIZE];
u32 RxData[1];

int TxDataSend(XEuchw *InstancePtr, int data[VECTOR_SIZE])
{
	int status = XST_SUCCESS;
	for (int br = 0; br < BRAMS; br++)
	{
		XHLSWriteFunc[br](InstancePtr, data[br]);
	}
	return status;
}

void AdderTreeReceiveHandler(void *InstPtr)
{
	int results[1];
	XEuchw_InterruptDisable(&hls_ip,1);

	RxData[0] = XEuchw_Get_y_sqrt(&hls_ip);
	results[0] = *((int*) &(RxData[0]));

	xil_printf("Resultados: %d\n", results[0]);
	ip_status = IP_Ready;
	XEuchw_InterruptClear(&hls_ip,1);
	XEuchw_InterruptEnable(&hls_ip,1);
}

void getVector(int vec[VECTOR_SIZE])
{
	for (int i = 0; i < VECTOR_SIZE; i++)
	{
		scanf("%d", &vec[i]);
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
	int txbuffer[VECTOR_SIZE];
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
