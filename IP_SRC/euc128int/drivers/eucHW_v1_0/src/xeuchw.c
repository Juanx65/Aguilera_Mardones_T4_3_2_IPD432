// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xeuchw.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XEuchw_CfgInitialize(XEuchw *InstancePtr, XEuchw_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XEuchw_Start(XEuchw *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEuchw_ReadReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_AP_CTRL) & 0x80;
    XEuchw_WriteReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XEuchw_IsDone(XEuchw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEuchw_ReadReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XEuchw_IsIdle(XEuchw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEuchw_ReadReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XEuchw_IsReady(XEuchw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEuchw_ReadReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XEuchw_EnableAutoRestart(XEuchw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEuchw_WriteReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XEuchw_DisableAutoRestart(XEuchw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEuchw_WriteReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XEuchw_Get_y_sqrt(XEuchw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEuchw_ReadReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_Y_SQRT_DATA);
    return Data;
}

u32 XEuchw_Get_y_sqrt_vld(XEuchw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEuchw_ReadReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_Y_SQRT_CTRL);
    return Data & 0x1;
}

u32 XEuchw_Get_x_0_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_0_BASE);
}

u32 XEuchw_Get_x_0_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_0_HIGH);
}

u32 XEuchw_Get_x_0_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_0_HIGH - XEUCHW_CONTROL_ADDR_X_0_BASE + 1);
}

u32 XEuchw_Get_x_0_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_0;
}

u32 XEuchw_Get_x_0_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_0;
}

u32 XEuchw_Write_x_0_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_0_HIGH - XEUCHW_CONTROL_ADDR_X_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_0_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_0_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_0_HIGH - XEUCHW_CONTROL_ADDR_X_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_0_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_0_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_0_HIGH - XEUCHW_CONTROL_ADDR_X_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_0_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_0_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_0_HIGH - XEUCHW_CONTROL_ADDR_X_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_0_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_1_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_1_BASE);
}

u32 XEuchw_Get_x_1_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_1_HIGH);
}

u32 XEuchw_Get_x_1_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_1_HIGH - XEUCHW_CONTROL_ADDR_X_1_BASE + 1);
}

u32 XEuchw_Get_x_1_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_1;
}

u32 XEuchw_Get_x_1_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_1;
}

u32 XEuchw_Write_x_1_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_1_HIGH - XEUCHW_CONTROL_ADDR_X_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_1_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_1_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_1_HIGH - XEUCHW_CONTROL_ADDR_X_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_1_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_1_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_1_HIGH - XEUCHW_CONTROL_ADDR_X_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_1_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_1_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_1_HIGH - XEUCHW_CONTROL_ADDR_X_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_1_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_2_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_2_BASE);
}

u32 XEuchw_Get_x_2_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_2_HIGH);
}

u32 XEuchw_Get_x_2_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_2_HIGH - XEUCHW_CONTROL_ADDR_X_2_BASE + 1);
}

u32 XEuchw_Get_x_2_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_2;
}

u32 XEuchw_Get_x_2_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_2;
}

u32 XEuchw_Write_x_2_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_2_HIGH - XEUCHW_CONTROL_ADDR_X_2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_2_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_2_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_2_HIGH - XEUCHW_CONTROL_ADDR_X_2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_2_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_2_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_2_HIGH - XEUCHW_CONTROL_ADDR_X_2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_2_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_2_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_2_HIGH - XEUCHW_CONTROL_ADDR_X_2_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_2_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_3_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_3_BASE);
}

u32 XEuchw_Get_x_3_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_3_HIGH);
}

u32 XEuchw_Get_x_3_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_3_HIGH - XEUCHW_CONTROL_ADDR_X_3_BASE + 1);
}

u32 XEuchw_Get_x_3_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_3;
}

u32 XEuchw_Get_x_3_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_3;
}

u32 XEuchw_Write_x_3_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_3_HIGH - XEUCHW_CONTROL_ADDR_X_3_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_3_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_3_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_3_HIGH - XEUCHW_CONTROL_ADDR_X_3_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_3_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_3_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_3_HIGH - XEUCHW_CONTROL_ADDR_X_3_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_3_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_3_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_3_HIGH - XEUCHW_CONTROL_ADDR_X_3_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_3_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_4_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_4_BASE);
}

u32 XEuchw_Get_x_4_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_4_HIGH);
}

u32 XEuchw_Get_x_4_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_4_HIGH - XEUCHW_CONTROL_ADDR_X_4_BASE + 1);
}

u32 XEuchw_Get_x_4_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_4;
}

u32 XEuchw_Get_x_4_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_4;
}

u32 XEuchw_Write_x_4_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_4_HIGH - XEUCHW_CONTROL_ADDR_X_4_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_4_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_4_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_4_HIGH - XEUCHW_CONTROL_ADDR_X_4_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_4_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_4_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_4_HIGH - XEUCHW_CONTROL_ADDR_X_4_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_4_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_4_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_4_HIGH - XEUCHW_CONTROL_ADDR_X_4_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_4_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_5_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_5_BASE);
}

u32 XEuchw_Get_x_5_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_5_HIGH);
}

u32 XEuchw_Get_x_5_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_5_HIGH - XEUCHW_CONTROL_ADDR_X_5_BASE + 1);
}

u32 XEuchw_Get_x_5_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_5;
}

u32 XEuchw_Get_x_5_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_5;
}

u32 XEuchw_Write_x_5_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_5_HIGH - XEUCHW_CONTROL_ADDR_X_5_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_5_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_5_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_5_HIGH - XEUCHW_CONTROL_ADDR_X_5_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_5_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_5_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_5_HIGH - XEUCHW_CONTROL_ADDR_X_5_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_5_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_5_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_5_HIGH - XEUCHW_CONTROL_ADDR_X_5_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_5_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_6_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_6_BASE);
}

u32 XEuchw_Get_x_6_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_6_HIGH);
}

u32 XEuchw_Get_x_6_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_6_HIGH - XEUCHW_CONTROL_ADDR_X_6_BASE + 1);
}

u32 XEuchw_Get_x_6_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_6;
}

u32 XEuchw_Get_x_6_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_6;
}

u32 XEuchw_Write_x_6_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_6_HIGH - XEUCHW_CONTROL_ADDR_X_6_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_6_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_6_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_6_HIGH - XEUCHW_CONTROL_ADDR_X_6_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_6_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_6_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_6_HIGH - XEUCHW_CONTROL_ADDR_X_6_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_6_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_6_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_6_HIGH - XEUCHW_CONTROL_ADDR_X_6_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_6_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_7_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_7_BASE);
}

u32 XEuchw_Get_x_7_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_7_HIGH);
}

u32 XEuchw_Get_x_7_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_7_HIGH - XEUCHW_CONTROL_ADDR_X_7_BASE + 1);
}

u32 XEuchw_Get_x_7_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_7;
}

u32 XEuchw_Get_x_7_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_7;
}

u32 XEuchw_Write_x_7_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_7_HIGH - XEUCHW_CONTROL_ADDR_X_7_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_7_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_7_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_7_HIGH - XEUCHW_CONTROL_ADDR_X_7_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_7_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_7_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_7_HIGH - XEUCHW_CONTROL_ADDR_X_7_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_7_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_7_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_7_HIGH - XEUCHW_CONTROL_ADDR_X_7_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_7_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_8_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_8_BASE);
}

u32 XEuchw_Get_x_8_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_8_HIGH);
}

u32 XEuchw_Get_x_8_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_8_HIGH - XEUCHW_CONTROL_ADDR_X_8_BASE + 1);
}

u32 XEuchw_Get_x_8_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_8;
}

u32 XEuchw_Get_x_8_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_8;
}

u32 XEuchw_Write_x_8_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_8_HIGH - XEUCHW_CONTROL_ADDR_X_8_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_8_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_8_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_8_HIGH - XEUCHW_CONTROL_ADDR_X_8_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_8_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_8_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_8_HIGH - XEUCHW_CONTROL_ADDR_X_8_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_8_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_8_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_8_HIGH - XEUCHW_CONTROL_ADDR_X_8_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_8_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_9_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_9_BASE);
}

u32 XEuchw_Get_x_9_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_9_HIGH);
}

u32 XEuchw_Get_x_9_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_9_HIGH - XEUCHW_CONTROL_ADDR_X_9_BASE + 1);
}

u32 XEuchw_Get_x_9_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_9;
}

u32 XEuchw_Get_x_9_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_9;
}

u32 XEuchw_Write_x_9_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_9_HIGH - XEUCHW_CONTROL_ADDR_X_9_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_9_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_9_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_9_HIGH - XEUCHW_CONTROL_ADDR_X_9_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_9_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_9_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_9_HIGH - XEUCHW_CONTROL_ADDR_X_9_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_9_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_9_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_9_HIGH - XEUCHW_CONTROL_ADDR_X_9_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_9_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_10_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_10_BASE);
}

u32 XEuchw_Get_x_10_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_10_HIGH);
}

u32 XEuchw_Get_x_10_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_10_HIGH - XEUCHW_CONTROL_ADDR_X_10_BASE + 1);
}

u32 XEuchw_Get_x_10_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_10;
}

u32 XEuchw_Get_x_10_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_10;
}

u32 XEuchw_Write_x_10_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_10_HIGH - XEUCHW_CONTROL_ADDR_X_10_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_10_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_10_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_10_HIGH - XEUCHW_CONTROL_ADDR_X_10_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_10_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_10_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_10_HIGH - XEUCHW_CONTROL_ADDR_X_10_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_10_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_10_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_10_HIGH - XEUCHW_CONTROL_ADDR_X_10_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_10_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_11_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_11_BASE);
}

u32 XEuchw_Get_x_11_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_11_HIGH);
}

u32 XEuchw_Get_x_11_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_11_HIGH - XEUCHW_CONTROL_ADDR_X_11_BASE + 1);
}

u32 XEuchw_Get_x_11_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_11;
}

u32 XEuchw_Get_x_11_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_11;
}

u32 XEuchw_Write_x_11_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_11_HIGH - XEUCHW_CONTROL_ADDR_X_11_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_11_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_11_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_11_HIGH - XEUCHW_CONTROL_ADDR_X_11_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_11_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_11_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_11_HIGH - XEUCHW_CONTROL_ADDR_X_11_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_11_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_11_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_11_HIGH - XEUCHW_CONTROL_ADDR_X_11_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_11_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_12_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_12_BASE);
}

u32 XEuchw_Get_x_12_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_12_HIGH);
}

u32 XEuchw_Get_x_12_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_12_HIGH - XEUCHW_CONTROL_ADDR_X_12_BASE + 1);
}

u32 XEuchw_Get_x_12_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_12;
}

u32 XEuchw_Get_x_12_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_12;
}

u32 XEuchw_Write_x_12_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_12_HIGH - XEUCHW_CONTROL_ADDR_X_12_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_12_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_12_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_12_HIGH - XEUCHW_CONTROL_ADDR_X_12_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_12_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_12_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_12_HIGH - XEUCHW_CONTROL_ADDR_X_12_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_12_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_12_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_12_HIGH - XEUCHW_CONTROL_ADDR_X_12_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_12_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_13_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_13_BASE);
}

u32 XEuchw_Get_x_13_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_13_HIGH);
}

u32 XEuchw_Get_x_13_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_13_HIGH - XEUCHW_CONTROL_ADDR_X_13_BASE + 1);
}

u32 XEuchw_Get_x_13_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_13;
}

u32 XEuchw_Get_x_13_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_13;
}

u32 XEuchw_Write_x_13_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_13_HIGH - XEUCHW_CONTROL_ADDR_X_13_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_13_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_13_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_13_HIGH - XEUCHW_CONTROL_ADDR_X_13_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_13_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_13_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_13_HIGH - XEUCHW_CONTROL_ADDR_X_13_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_13_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_13_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_13_HIGH - XEUCHW_CONTROL_ADDR_X_13_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_13_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_14_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_14_BASE);
}

u32 XEuchw_Get_x_14_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_14_HIGH);
}

u32 XEuchw_Get_x_14_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_14_HIGH - XEUCHW_CONTROL_ADDR_X_14_BASE + 1);
}

u32 XEuchw_Get_x_14_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_14;
}

u32 XEuchw_Get_x_14_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_14;
}

u32 XEuchw_Write_x_14_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_14_HIGH - XEUCHW_CONTROL_ADDR_X_14_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_14_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_14_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_14_HIGH - XEUCHW_CONTROL_ADDR_X_14_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_14_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_14_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_14_HIGH - XEUCHW_CONTROL_ADDR_X_14_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_14_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_14_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_14_HIGH - XEUCHW_CONTROL_ADDR_X_14_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_14_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_15_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_15_BASE);
}

u32 XEuchw_Get_x_15_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_15_HIGH);
}

u32 XEuchw_Get_x_15_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_15_HIGH - XEUCHW_CONTROL_ADDR_X_15_BASE + 1);
}

u32 XEuchw_Get_x_15_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_15;
}

u32 XEuchw_Get_x_15_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_15;
}

u32 XEuchw_Write_x_15_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_15_HIGH - XEUCHW_CONTROL_ADDR_X_15_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_15_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_15_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_15_HIGH - XEUCHW_CONTROL_ADDR_X_15_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_15_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_15_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_15_HIGH - XEUCHW_CONTROL_ADDR_X_15_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_15_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_15_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_15_HIGH - XEUCHW_CONTROL_ADDR_X_15_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_15_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_16_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_16_BASE);
}

u32 XEuchw_Get_x_16_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_16_HIGH);
}

u32 XEuchw_Get_x_16_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_16_HIGH - XEUCHW_CONTROL_ADDR_X_16_BASE + 1);
}

u32 XEuchw_Get_x_16_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_16;
}

u32 XEuchw_Get_x_16_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_16;
}

u32 XEuchw_Write_x_16_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_16_HIGH - XEUCHW_CONTROL_ADDR_X_16_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_16_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_16_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_16_HIGH - XEUCHW_CONTROL_ADDR_X_16_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_16_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_16_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_16_HIGH - XEUCHW_CONTROL_ADDR_X_16_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_16_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_16_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_16_HIGH - XEUCHW_CONTROL_ADDR_X_16_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_16_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_17_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_17_BASE);
}

u32 XEuchw_Get_x_17_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_17_HIGH);
}

u32 XEuchw_Get_x_17_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_17_HIGH - XEUCHW_CONTROL_ADDR_X_17_BASE + 1);
}

u32 XEuchw_Get_x_17_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_17;
}

u32 XEuchw_Get_x_17_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_17;
}

u32 XEuchw_Write_x_17_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_17_HIGH - XEUCHW_CONTROL_ADDR_X_17_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_17_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_17_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_17_HIGH - XEUCHW_CONTROL_ADDR_X_17_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_17_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_17_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_17_HIGH - XEUCHW_CONTROL_ADDR_X_17_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_17_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_17_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_17_HIGH - XEUCHW_CONTROL_ADDR_X_17_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_17_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_18_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_18_BASE);
}

u32 XEuchw_Get_x_18_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_18_HIGH);
}

u32 XEuchw_Get_x_18_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_18_HIGH - XEUCHW_CONTROL_ADDR_X_18_BASE + 1);
}

u32 XEuchw_Get_x_18_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_18;
}

u32 XEuchw_Get_x_18_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_18;
}

u32 XEuchw_Write_x_18_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_18_HIGH - XEUCHW_CONTROL_ADDR_X_18_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_18_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_18_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_18_HIGH - XEUCHW_CONTROL_ADDR_X_18_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_18_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_18_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_18_HIGH - XEUCHW_CONTROL_ADDR_X_18_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_18_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_18_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_18_HIGH - XEUCHW_CONTROL_ADDR_X_18_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_18_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_19_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_19_BASE);
}

u32 XEuchw_Get_x_19_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_19_HIGH);
}

u32 XEuchw_Get_x_19_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_19_HIGH - XEUCHW_CONTROL_ADDR_X_19_BASE + 1);
}

u32 XEuchw_Get_x_19_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_19;
}

u32 XEuchw_Get_x_19_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_19;
}

u32 XEuchw_Write_x_19_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_19_HIGH - XEUCHW_CONTROL_ADDR_X_19_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_19_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_19_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_19_HIGH - XEUCHW_CONTROL_ADDR_X_19_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_19_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_19_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_19_HIGH - XEUCHW_CONTROL_ADDR_X_19_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_19_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_19_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_19_HIGH - XEUCHW_CONTROL_ADDR_X_19_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_19_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_20_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_20_BASE);
}

u32 XEuchw_Get_x_20_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_20_HIGH);
}

u32 XEuchw_Get_x_20_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_20_HIGH - XEUCHW_CONTROL_ADDR_X_20_BASE + 1);
}

u32 XEuchw_Get_x_20_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_20;
}

u32 XEuchw_Get_x_20_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_20;
}

u32 XEuchw_Write_x_20_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_20_HIGH - XEUCHW_CONTROL_ADDR_X_20_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_20_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_20_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_20_HIGH - XEUCHW_CONTROL_ADDR_X_20_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_20_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_20_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_20_HIGH - XEUCHW_CONTROL_ADDR_X_20_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_20_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_20_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_20_HIGH - XEUCHW_CONTROL_ADDR_X_20_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_20_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_21_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_21_BASE);
}

u32 XEuchw_Get_x_21_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_21_HIGH);
}

u32 XEuchw_Get_x_21_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_21_HIGH - XEUCHW_CONTROL_ADDR_X_21_BASE + 1);
}

u32 XEuchw_Get_x_21_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_21;
}

u32 XEuchw_Get_x_21_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_21;
}

u32 XEuchw_Write_x_21_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_21_HIGH - XEUCHW_CONTROL_ADDR_X_21_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_21_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_21_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_21_HIGH - XEUCHW_CONTROL_ADDR_X_21_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_21_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_21_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_21_HIGH - XEUCHW_CONTROL_ADDR_X_21_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_21_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_21_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_21_HIGH - XEUCHW_CONTROL_ADDR_X_21_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_21_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_22_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_22_BASE);
}

u32 XEuchw_Get_x_22_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_22_HIGH);
}

u32 XEuchw_Get_x_22_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_22_HIGH - XEUCHW_CONTROL_ADDR_X_22_BASE + 1);
}

u32 XEuchw_Get_x_22_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_22;
}

u32 XEuchw_Get_x_22_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_22;
}

u32 XEuchw_Write_x_22_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_22_HIGH - XEUCHW_CONTROL_ADDR_X_22_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_22_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_22_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_22_HIGH - XEUCHW_CONTROL_ADDR_X_22_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_22_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_22_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_22_HIGH - XEUCHW_CONTROL_ADDR_X_22_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_22_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_22_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_22_HIGH - XEUCHW_CONTROL_ADDR_X_22_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_22_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_23_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_23_BASE);
}

u32 XEuchw_Get_x_23_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_23_HIGH);
}

u32 XEuchw_Get_x_23_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_23_HIGH - XEUCHW_CONTROL_ADDR_X_23_BASE + 1);
}

u32 XEuchw_Get_x_23_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_23;
}

u32 XEuchw_Get_x_23_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_23;
}

u32 XEuchw_Write_x_23_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_23_HIGH - XEUCHW_CONTROL_ADDR_X_23_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_23_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_23_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_23_HIGH - XEUCHW_CONTROL_ADDR_X_23_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_23_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_23_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_23_HIGH - XEUCHW_CONTROL_ADDR_X_23_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_23_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_23_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_23_HIGH - XEUCHW_CONTROL_ADDR_X_23_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_23_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_24_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_24_BASE);
}

u32 XEuchw_Get_x_24_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_24_HIGH);
}

u32 XEuchw_Get_x_24_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_24_HIGH - XEUCHW_CONTROL_ADDR_X_24_BASE + 1);
}

u32 XEuchw_Get_x_24_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_24;
}

u32 XEuchw_Get_x_24_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_24;
}

u32 XEuchw_Write_x_24_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_24_HIGH - XEUCHW_CONTROL_ADDR_X_24_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_24_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_24_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_24_HIGH - XEUCHW_CONTROL_ADDR_X_24_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_24_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_24_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_24_HIGH - XEUCHW_CONTROL_ADDR_X_24_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_24_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_24_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_24_HIGH - XEUCHW_CONTROL_ADDR_X_24_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_24_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_25_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_25_BASE);
}

u32 XEuchw_Get_x_25_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_25_HIGH);
}

u32 XEuchw_Get_x_25_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_25_HIGH - XEUCHW_CONTROL_ADDR_X_25_BASE + 1);
}

u32 XEuchw_Get_x_25_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_25;
}

u32 XEuchw_Get_x_25_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_25;
}

u32 XEuchw_Write_x_25_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_25_HIGH - XEUCHW_CONTROL_ADDR_X_25_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_25_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_25_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_25_HIGH - XEUCHW_CONTROL_ADDR_X_25_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_25_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_25_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_25_HIGH - XEUCHW_CONTROL_ADDR_X_25_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_25_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_25_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_25_HIGH - XEUCHW_CONTROL_ADDR_X_25_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_25_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_26_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_26_BASE);
}

u32 XEuchw_Get_x_26_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_26_HIGH);
}

u32 XEuchw_Get_x_26_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_26_HIGH - XEUCHW_CONTROL_ADDR_X_26_BASE + 1);
}

u32 XEuchw_Get_x_26_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_26;
}

u32 XEuchw_Get_x_26_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_26;
}

u32 XEuchw_Write_x_26_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_26_HIGH - XEUCHW_CONTROL_ADDR_X_26_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_26_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_26_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_26_HIGH - XEUCHW_CONTROL_ADDR_X_26_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_26_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_26_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_26_HIGH - XEUCHW_CONTROL_ADDR_X_26_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_26_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_26_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_26_HIGH - XEUCHW_CONTROL_ADDR_X_26_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_26_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_27_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_27_BASE);
}

u32 XEuchw_Get_x_27_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_27_HIGH);
}

u32 XEuchw_Get_x_27_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_27_HIGH - XEUCHW_CONTROL_ADDR_X_27_BASE + 1);
}

u32 XEuchw_Get_x_27_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_27;
}

u32 XEuchw_Get_x_27_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_27;
}

u32 XEuchw_Write_x_27_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_27_HIGH - XEUCHW_CONTROL_ADDR_X_27_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_27_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_27_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_27_HIGH - XEUCHW_CONTROL_ADDR_X_27_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_27_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_27_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_27_HIGH - XEUCHW_CONTROL_ADDR_X_27_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_27_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_27_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_27_HIGH - XEUCHW_CONTROL_ADDR_X_27_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_27_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_28_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_28_BASE);
}

u32 XEuchw_Get_x_28_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_28_HIGH);
}

u32 XEuchw_Get_x_28_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_28_HIGH - XEUCHW_CONTROL_ADDR_X_28_BASE + 1);
}

u32 XEuchw_Get_x_28_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_28;
}

u32 XEuchw_Get_x_28_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_28;
}

u32 XEuchw_Write_x_28_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_28_HIGH - XEUCHW_CONTROL_ADDR_X_28_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_28_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_28_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_28_HIGH - XEUCHW_CONTROL_ADDR_X_28_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_28_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_28_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_28_HIGH - XEUCHW_CONTROL_ADDR_X_28_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_28_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_28_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_28_HIGH - XEUCHW_CONTROL_ADDR_X_28_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_28_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_29_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_29_BASE);
}

u32 XEuchw_Get_x_29_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_29_HIGH);
}

u32 XEuchw_Get_x_29_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_29_HIGH - XEUCHW_CONTROL_ADDR_X_29_BASE + 1);
}

u32 XEuchw_Get_x_29_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_29;
}

u32 XEuchw_Get_x_29_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_29;
}

u32 XEuchw_Write_x_29_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_29_HIGH - XEUCHW_CONTROL_ADDR_X_29_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_29_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_29_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_29_HIGH - XEUCHW_CONTROL_ADDR_X_29_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_29_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_29_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_29_HIGH - XEUCHW_CONTROL_ADDR_X_29_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_29_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_29_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_29_HIGH - XEUCHW_CONTROL_ADDR_X_29_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_29_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_30_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_30_BASE);
}

u32 XEuchw_Get_x_30_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_30_HIGH);
}

u32 XEuchw_Get_x_30_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_30_HIGH - XEUCHW_CONTROL_ADDR_X_30_BASE + 1);
}

u32 XEuchw_Get_x_30_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_30;
}

u32 XEuchw_Get_x_30_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_30;
}

u32 XEuchw_Write_x_30_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_30_HIGH - XEUCHW_CONTROL_ADDR_X_30_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_30_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_30_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_30_HIGH - XEUCHW_CONTROL_ADDR_X_30_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_30_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_30_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_30_HIGH - XEUCHW_CONTROL_ADDR_X_30_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_30_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_30_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_30_HIGH - XEUCHW_CONTROL_ADDR_X_30_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_30_BASE + offset + i);
    }
    return length;
}

u32 XEuchw_Get_x_31_BaseAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_31_BASE);
}

u32 XEuchw_Get_x_31_HighAddress(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_31_HIGH);
}

u32 XEuchw_Get_x_31_TotalBytes(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XEUCHW_CONTROL_ADDR_X_31_HIGH - XEUCHW_CONTROL_ADDR_X_31_BASE + 1);
}

u32 XEuchw_Get_x_31_BitWidth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_WIDTH_X_31;
}

u32 XEuchw_Get_x_31_Depth(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEUCHW_CONTROL_DEPTH_X_31;
}

u32 XEuchw_Write_x_31_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_31_HIGH - XEUCHW_CONTROL_ADDR_X_31_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_31_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_31_Words(XEuchw *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XEUCHW_CONTROL_ADDR_X_31_HIGH - XEUCHW_CONTROL_ADDR_X_31_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_31_BASE + (offset + i)*4);
    }
    return length;
}

u32 XEuchw_Write_x_31_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_31_HIGH - XEUCHW_CONTROL_ADDR_X_31_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_31_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XEuchw_Read_x_31_Bytes(XEuchw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XEUCHW_CONTROL_ADDR_X_31_HIGH - XEUCHW_CONTROL_ADDR_X_31_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XEUCHW_CONTROL_ADDR_X_31_BASE + offset + i);
    }
    return length;
}

void XEuchw_InterruptGlobalEnable(XEuchw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEuchw_WriteReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_GIE, 1);
}

void XEuchw_InterruptGlobalDisable(XEuchw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEuchw_WriteReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_GIE, 0);
}

void XEuchw_InterruptEnable(XEuchw *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XEuchw_ReadReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_IER);
    XEuchw_WriteReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_IER, Register | Mask);
}

void XEuchw_InterruptDisable(XEuchw *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XEuchw_ReadReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_IER);
    XEuchw_WriteReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_IER, Register & (~Mask));
}

void XEuchw_InterruptClear(XEuchw *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEuchw_WriteReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_ISR, Mask);
}

u32 XEuchw_InterruptGetEnabled(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEuchw_ReadReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_IER);
}

u32 XEuchw_InterruptGetStatus(XEuchw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEuchw_ReadReg(InstancePtr->Control_BaseAddress, XEUCHW_CONTROL_ADDR_ISR);
}

