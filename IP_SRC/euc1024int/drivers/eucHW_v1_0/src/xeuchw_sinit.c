// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xeuchw.h"

extern XEuchw_Config XEuchw_ConfigTable[];

XEuchw_Config *XEuchw_LookupConfig(u16 DeviceId) {
	XEuchw_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XEUCHW_NUM_INSTANCES; Index++) {
		if (XEuchw_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XEuchw_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XEuchw_Initialize(XEuchw *InstancePtr, u16 DeviceId) {
	XEuchw_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XEuchw_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XEuchw_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

