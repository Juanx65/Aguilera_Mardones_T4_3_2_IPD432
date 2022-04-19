// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XEUCHW_H
#define XEUCHW_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xeuchw_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XEuchw_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XEuchw;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XEuchw_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XEuchw_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XEuchw_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XEuchw_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XEuchw_Initialize(XEuchw *InstancePtr, u16 DeviceId);
XEuchw_Config* XEuchw_LookupConfig(u16 DeviceId);
int XEuchw_CfgInitialize(XEuchw *InstancePtr, XEuchw_Config *ConfigPtr);
#else
int XEuchw_Initialize(XEuchw *InstancePtr, const char* InstanceName);
int XEuchw_Release(XEuchw *InstancePtr);
#endif

void XEuchw_Start(XEuchw *InstancePtr);
u32 XEuchw_IsDone(XEuchw *InstancePtr);
u32 XEuchw_IsIdle(XEuchw *InstancePtr);
u32 XEuchw_IsReady(XEuchw *InstancePtr);
void XEuchw_EnableAutoRestart(XEuchw *InstancePtr);
void XEuchw_DisableAutoRestart(XEuchw *InstancePtr);

u32 XEuchw_Get_y_sqrt(XEuchw *InstancePtr);
u32 XEuchw_Get_y_sqrt_vld(XEuchw *InstancePtr);
u32 XEuchw_Get_x_0_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_0_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_0_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_0_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_0_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_0_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_0_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_0_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_0_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_1_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_1_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_1_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_1_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_1_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_1_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_1_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_1_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_1_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_2_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_2_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_2_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_2_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_2_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_2_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_2_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_2_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_2_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_3_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_3_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_3_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_3_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_3_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_3_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_3_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_3_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_3_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_4_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_4_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_4_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_4_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_4_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_4_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_4_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_4_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_4_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_5_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_5_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_5_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_5_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_5_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_5_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_5_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_5_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_5_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_6_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_6_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_6_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_6_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_6_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_6_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_6_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_6_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_6_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_7_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_7_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_7_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_7_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_7_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_7_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_7_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_7_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_7_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_8_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_8_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_8_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_8_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_8_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_8_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_8_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_8_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_8_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_9_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_9_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_9_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_9_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_9_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_9_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_9_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_9_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_9_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_10_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_10_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_10_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_10_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_10_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_10_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_10_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_10_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_10_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_11_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_11_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_11_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_11_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_11_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_11_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_11_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_11_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_11_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_12_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_12_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_12_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_12_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_12_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_12_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_12_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_12_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_12_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_13_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_13_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_13_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_13_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_13_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_13_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_13_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_13_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_13_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_14_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_14_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_14_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_14_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_14_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_14_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_14_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_14_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_14_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_15_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_15_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_15_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_15_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_15_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_15_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_15_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_15_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_15_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_16_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_16_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_16_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_16_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_16_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_16_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_16_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_16_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_16_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_17_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_17_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_17_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_17_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_17_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_17_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_17_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_17_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_17_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_18_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_18_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_18_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_18_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_18_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_18_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_18_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_18_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_18_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_19_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_19_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_19_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_19_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_19_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_19_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_19_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_19_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_19_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_20_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_20_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_20_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_20_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_20_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_20_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_20_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_20_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_20_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_21_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_21_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_21_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_21_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_21_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_21_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_21_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_21_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_21_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_22_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_22_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_22_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_22_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_22_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_22_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_22_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_22_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_22_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_23_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_23_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_23_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_23_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_23_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_23_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_23_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_23_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_23_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_24_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_24_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_24_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_24_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_24_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_24_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_24_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_24_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_24_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_25_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_25_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_25_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_25_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_25_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_25_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_25_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_25_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_25_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_26_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_26_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_26_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_26_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_26_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_26_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_26_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_26_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_26_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_27_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_27_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_27_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_27_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_27_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_27_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_27_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_27_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_27_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_28_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_28_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_28_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_28_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_28_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_28_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_28_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_28_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_28_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_29_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_29_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_29_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_29_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_29_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_29_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_29_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_29_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_29_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_30_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_30_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_30_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_30_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_30_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_30_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_30_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_30_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_30_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_31_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_31_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_31_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_31_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_31_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_31_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_31_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_31_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_31_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_32_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_32_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_32_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_32_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_32_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_32_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_32_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_32_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_32_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_33_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_33_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_33_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_33_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_33_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_33_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_33_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_33_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_33_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_34_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_34_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_34_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_34_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_34_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_34_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_34_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_34_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_34_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_35_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_35_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_35_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_35_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_35_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_35_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_35_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_35_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_35_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_36_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_36_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_36_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_36_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_36_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_36_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_36_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_36_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_36_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_37_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_37_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_37_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_37_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_37_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_37_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_37_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_37_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_37_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_38_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_38_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_38_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_38_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_38_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_38_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_38_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_38_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_38_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_39_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_39_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_39_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_39_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_39_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_39_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_39_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_39_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_39_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_40_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_40_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_40_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_40_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_40_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_40_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_40_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_40_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_40_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_41_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_41_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_41_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_41_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_41_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_41_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_41_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_41_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_41_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_42_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_42_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_42_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_42_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_42_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_42_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_42_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_42_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_42_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_43_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_43_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_43_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_43_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_43_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_43_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_43_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_43_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_43_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_44_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_44_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_44_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_44_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_44_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_44_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_44_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_44_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_44_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_45_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_45_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_45_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_45_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_45_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_45_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_45_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_45_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_45_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_46_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_46_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_46_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_46_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_46_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_46_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_46_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_46_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_46_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_47_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_47_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_47_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_47_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_47_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_47_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_47_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_47_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_47_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_48_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_48_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_48_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_48_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_48_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_48_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_48_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_48_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_48_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_49_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_49_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_49_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_49_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_49_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_49_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_49_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_49_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_49_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_50_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_50_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_50_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_50_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_50_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_50_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_50_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_50_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_50_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_51_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_51_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_51_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_51_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_51_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_51_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_51_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_51_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_51_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_52_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_52_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_52_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_52_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_52_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_52_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_52_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_52_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_52_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_53_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_53_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_53_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_53_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_53_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_53_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_53_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_53_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_53_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_54_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_54_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_54_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_54_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_54_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_54_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_54_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_54_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_54_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_55_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_55_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_55_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_55_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_55_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_55_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_55_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_55_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_55_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_56_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_56_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_56_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_56_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_56_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_56_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_56_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_56_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_56_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_57_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_57_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_57_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_57_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_57_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_57_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_57_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_57_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_57_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_58_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_58_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_58_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_58_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_58_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_58_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_58_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_58_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_58_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_59_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_59_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_59_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_59_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_59_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_59_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_59_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_59_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_59_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_60_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_60_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_60_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_60_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_60_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_60_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_60_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_60_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_60_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_61_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_61_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_61_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_61_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_61_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_61_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_61_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_61_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_61_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_62_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_62_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_62_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_62_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_62_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_62_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_62_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_62_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_62_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Get_x_63_BaseAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_63_HighAddress(XEuchw *InstancePtr);
u32 XEuchw_Get_x_63_TotalBytes(XEuchw *InstancePtr);
u32 XEuchw_Get_x_63_BitWidth(XEuchw *InstancePtr);
u32 XEuchw_Get_x_63_Depth(XEuchw *InstancePtr);
u32 XEuchw_Write_x_63_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Read_x_63_Words(XEuchw *InstancePtr, int offset, word_type *data, int length);
u32 XEuchw_Write_x_63_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);
u32 XEuchw_Read_x_63_Bytes(XEuchw *InstancePtr, int offset, char *data, int length);

void XEuchw_InterruptGlobalEnable(XEuchw *InstancePtr);
void XEuchw_InterruptGlobalDisable(XEuchw *InstancePtr);
void XEuchw_InterruptEnable(XEuchw *InstancePtr, u32 Mask);
void XEuchw_InterruptDisable(XEuchw *InstancePtr, u32 Mask);
void XEuchw_InterruptClear(XEuchw *InstancePtr, u32 Mask);
u32 XEuchw_InterruptGetEnabled(XEuchw *InstancePtr);
u32 XEuchw_InterruptGetStatus(XEuchw *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
