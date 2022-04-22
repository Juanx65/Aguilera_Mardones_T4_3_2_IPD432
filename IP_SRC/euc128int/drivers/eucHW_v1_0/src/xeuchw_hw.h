// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x000 : Control signals
//         bit 0  - ap_start (Read/Write/COH)
//         bit 1  - ap_done (Read/COR)
//         bit 2  - ap_idle (Read)
//         bit 3  - ap_ready (Read/COR)
//         bit 7  - auto_restart (Read/Write)
//         others - reserved
// 0x004 : Global Interrupt Enable Register
//         bit 0  - Global Interrupt Enable (Read/Write)
//         others - reserved
// 0x008 : IP Interrupt Enable Register (Read/Write)
//         bit 0  - enable ap_done interrupt (Read/Write)
//         bit 1  - enable ap_ready interrupt (Read/Write)
//         others - reserved
// 0x00c : IP Interrupt Status Register (Read/TOW)
//         bit 0  - ap_done (COR/TOW)
//         bit 1  - ap_ready (COR/TOW)
//         others - reserved
// 0x010 : Data signal of y_sqrt
//         bit 31~0 - y_sqrt[31:0] (Read)
// 0x014 : Control signal of y_sqrt
//         bit 0  - y_sqrt_ap_vld (Read/COR)
//         others - reserved
// 0x020 ~
// 0x03f : Memory 'x_0' (8 * 32b)
//         Word n : bit [31:0] - x_0[n]
// 0x040 ~
// 0x05f : Memory 'x_1' (8 * 32b)
//         Word n : bit [31:0] - x_1[n]
// 0x060 ~
// 0x07f : Memory 'x_2' (8 * 32b)
//         Word n : bit [31:0] - x_2[n]
// 0x080 ~
// 0x09f : Memory 'x_3' (8 * 32b)
//         Word n : bit [31:0] - x_3[n]
// 0x0a0 ~
// 0x0bf : Memory 'x_4' (8 * 32b)
//         Word n : bit [31:0] - x_4[n]
// 0x0c0 ~
// 0x0df : Memory 'x_5' (8 * 32b)
//         Word n : bit [31:0] - x_5[n]
// 0x0e0 ~
// 0x0ff : Memory 'x_6' (8 * 32b)
//         Word n : bit [31:0] - x_6[n]
// 0x100 ~
// 0x11f : Memory 'x_7' (8 * 32b)
//         Word n : bit [31:0] - x_7[n]
// 0x120 ~
// 0x13f : Memory 'x_8' (8 * 32b)
//         Word n : bit [31:0] - x_8[n]
// 0x140 ~
// 0x15f : Memory 'x_9' (8 * 32b)
//         Word n : bit [31:0] - x_9[n]
// 0x160 ~
// 0x17f : Memory 'x_10' (8 * 32b)
//         Word n : bit [31:0] - x_10[n]
// 0x180 ~
// 0x19f : Memory 'x_11' (8 * 32b)
//         Word n : bit [31:0] - x_11[n]
// 0x1a0 ~
// 0x1bf : Memory 'x_12' (8 * 32b)
//         Word n : bit [31:0] - x_12[n]
// 0x1c0 ~
// 0x1df : Memory 'x_13' (8 * 32b)
//         Word n : bit [31:0] - x_13[n]
// 0x1e0 ~
// 0x1ff : Memory 'x_14' (8 * 32b)
//         Word n : bit [31:0] - x_14[n]
// 0x200 ~
// 0x21f : Memory 'x_15' (8 * 32b)
//         Word n : bit [31:0] - x_15[n]
// 0x220 ~
// 0x23f : Memory 'x_16' (8 * 32b)
//         Word n : bit [31:0] - x_16[n]
// 0x240 ~
// 0x25f : Memory 'x_17' (8 * 32b)
//         Word n : bit [31:0] - x_17[n]
// 0x260 ~
// 0x27f : Memory 'x_18' (8 * 32b)
//         Word n : bit [31:0] - x_18[n]
// 0x280 ~
// 0x29f : Memory 'x_19' (8 * 32b)
//         Word n : bit [31:0] - x_19[n]
// 0x2a0 ~
// 0x2bf : Memory 'x_20' (8 * 32b)
//         Word n : bit [31:0] - x_20[n]
// 0x2c0 ~
// 0x2df : Memory 'x_21' (8 * 32b)
//         Word n : bit [31:0] - x_21[n]
// 0x2e0 ~
// 0x2ff : Memory 'x_22' (8 * 32b)
//         Word n : bit [31:0] - x_22[n]
// 0x300 ~
// 0x31f : Memory 'x_23' (8 * 32b)
//         Word n : bit [31:0] - x_23[n]
// 0x320 ~
// 0x33f : Memory 'x_24' (8 * 32b)
//         Word n : bit [31:0] - x_24[n]
// 0x340 ~
// 0x35f : Memory 'x_25' (8 * 32b)
//         Word n : bit [31:0] - x_25[n]
// 0x360 ~
// 0x37f : Memory 'x_26' (8 * 32b)
//         Word n : bit [31:0] - x_26[n]
// 0x380 ~
// 0x39f : Memory 'x_27' (8 * 32b)
//         Word n : bit [31:0] - x_27[n]
// 0x3a0 ~
// 0x3bf : Memory 'x_28' (8 * 32b)
//         Word n : bit [31:0] - x_28[n]
// 0x3c0 ~
// 0x3df : Memory 'x_29' (8 * 32b)
//         Word n : bit [31:0] - x_29[n]
// 0x3e0 ~
// 0x3ff : Memory 'x_30' (8 * 32b)
//         Word n : bit [31:0] - x_30[n]
// 0x400 ~
// 0x41f : Memory 'x_31' (8 * 32b)
//         Word n : bit [31:0] - x_31[n]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XEUCHW_CONTROL_ADDR_AP_CTRL     0x000
#define XEUCHW_CONTROL_ADDR_GIE         0x004
#define XEUCHW_CONTROL_ADDR_IER         0x008
#define XEUCHW_CONTROL_ADDR_ISR         0x00c
#define XEUCHW_CONTROL_ADDR_Y_SQRT_DATA 0x010
#define XEUCHW_CONTROL_BITS_Y_SQRT_DATA 32
#define XEUCHW_CONTROL_ADDR_Y_SQRT_CTRL 0x014
#define XEUCHW_CONTROL_ADDR_X_0_BASE    0x020
#define XEUCHW_CONTROL_ADDR_X_0_HIGH    0x03f
#define XEUCHW_CONTROL_WIDTH_X_0        32
#define XEUCHW_CONTROL_DEPTH_X_0        8
#define XEUCHW_CONTROL_ADDR_X_1_BASE    0x040
#define XEUCHW_CONTROL_ADDR_X_1_HIGH    0x05f
#define XEUCHW_CONTROL_WIDTH_X_1        32
#define XEUCHW_CONTROL_DEPTH_X_1        8
#define XEUCHW_CONTROL_ADDR_X_2_BASE    0x060
#define XEUCHW_CONTROL_ADDR_X_2_HIGH    0x07f
#define XEUCHW_CONTROL_WIDTH_X_2        32
#define XEUCHW_CONTROL_DEPTH_X_2        8
#define XEUCHW_CONTROL_ADDR_X_3_BASE    0x080
#define XEUCHW_CONTROL_ADDR_X_3_HIGH    0x09f
#define XEUCHW_CONTROL_WIDTH_X_3        32
#define XEUCHW_CONTROL_DEPTH_X_3        8
#define XEUCHW_CONTROL_ADDR_X_4_BASE    0x0a0
#define XEUCHW_CONTROL_ADDR_X_4_HIGH    0x0bf
#define XEUCHW_CONTROL_WIDTH_X_4        32
#define XEUCHW_CONTROL_DEPTH_X_4        8
#define XEUCHW_CONTROL_ADDR_X_5_BASE    0x0c0
#define XEUCHW_CONTROL_ADDR_X_5_HIGH    0x0df
#define XEUCHW_CONTROL_WIDTH_X_5        32
#define XEUCHW_CONTROL_DEPTH_X_5        8
#define XEUCHW_CONTROL_ADDR_X_6_BASE    0x0e0
#define XEUCHW_CONTROL_ADDR_X_6_HIGH    0x0ff
#define XEUCHW_CONTROL_WIDTH_X_6        32
#define XEUCHW_CONTROL_DEPTH_X_6        8
#define XEUCHW_CONTROL_ADDR_X_7_BASE    0x100
#define XEUCHW_CONTROL_ADDR_X_7_HIGH    0x11f
#define XEUCHW_CONTROL_WIDTH_X_7        32
#define XEUCHW_CONTROL_DEPTH_X_7        8
#define XEUCHW_CONTROL_ADDR_X_8_BASE    0x120
#define XEUCHW_CONTROL_ADDR_X_8_HIGH    0x13f
#define XEUCHW_CONTROL_WIDTH_X_8        32
#define XEUCHW_CONTROL_DEPTH_X_8        8
#define XEUCHW_CONTROL_ADDR_X_9_BASE    0x140
#define XEUCHW_CONTROL_ADDR_X_9_HIGH    0x15f
#define XEUCHW_CONTROL_WIDTH_X_9        32
#define XEUCHW_CONTROL_DEPTH_X_9        8
#define XEUCHW_CONTROL_ADDR_X_10_BASE   0x160
#define XEUCHW_CONTROL_ADDR_X_10_HIGH   0x17f
#define XEUCHW_CONTROL_WIDTH_X_10       32
#define XEUCHW_CONTROL_DEPTH_X_10       8
#define XEUCHW_CONTROL_ADDR_X_11_BASE   0x180
#define XEUCHW_CONTROL_ADDR_X_11_HIGH   0x19f
#define XEUCHW_CONTROL_WIDTH_X_11       32
#define XEUCHW_CONTROL_DEPTH_X_11       8
#define XEUCHW_CONTROL_ADDR_X_12_BASE   0x1a0
#define XEUCHW_CONTROL_ADDR_X_12_HIGH   0x1bf
#define XEUCHW_CONTROL_WIDTH_X_12       32
#define XEUCHW_CONTROL_DEPTH_X_12       8
#define XEUCHW_CONTROL_ADDR_X_13_BASE   0x1c0
#define XEUCHW_CONTROL_ADDR_X_13_HIGH   0x1df
#define XEUCHW_CONTROL_WIDTH_X_13       32
#define XEUCHW_CONTROL_DEPTH_X_13       8
#define XEUCHW_CONTROL_ADDR_X_14_BASE   0x1e0
#define XEUCHW_CONTROL_ADDR_X_14_HIGH   0x1ff
#define XEUCHW_CONTROL_WIDTH_X_14       32
#define XEUCHW_CONTROL_DEPTH_X_14       8
#define XEUCHW_CONTROL_ADDR_X_15_BASE   0x200
#define XEUCHW_CONTROL_ADDR_X_15_HIGH   0x21f
#define XEUCHW_CONTROL_WIDTH_X_15       32
#define XEUCHW_CONTROL_DEPTH_X_15       8
#define XEUCHW_CONTROL_ADDR_X_16_BASE   0x220
#define XEUCHW_CONTROL_ADDR_X_16_HIGH   0x23f
#define XEUCHW_CONTROL_WIDTH_X_16       32
#define XEUCHW_CONTROL_DEPTH_X_16       8
#define XEUCHW_CONTROL_ADDR_X_17_BASE   0x240
#define XEUCHW_CONTROL_ADDR_X_17_HIGH   0x25f
#define XEUCHW_CONTROL_WIDTH_X_17       32
#define XEUCHW_CONTROL_DEPTH_X_17       8
#define XEUCHW_CONTROL_ADDR_X_18_BASE   0x260
#define XEUCHW_CONTROL_ADDR_X_18_HIGH   0x27f
#define XEUCHW_CONTROL_WIDTH_X_18       32
#define XEUCHW_CONTROL_DEPTH_X_18       8
#define XEUCHW_CONTROL_ADDR_X_19_BASE   0x280
#define XEUCHW_CONTROL_ADDR_X_19_HIGH   0x29f
#define XEUCHW_CONTROL_WIDTH_X_19       32
#define XEUCHW_CONTROL_DEPTH_X_19       8
#define XEUCHW_CONTROL_ADDR_X_20_BASE   0x2a0
#define XEUCHW_CONTROL_ADDR_X_20_HIGH   0x2bf
#define XEUCHW_CONTROL_WIDTH_X_20       32
#define XEUCHW_CONTROL_DEPTH_X_20       8
#define XEUCHW_CONTROL_ADDR_X_21_BASE   0x2c0
#define XEUCHW_CONTROL_ADDR_X_21_HIGH   0x2df
#define XEUCHW_CONTROL_WIDTH_X_21       32
#define XEUCHW_CONTROL_DEPTH_X_21       8
#define XEUCHW_CONTROL_ADDR_X_22_BASE   0x2e0
#define XEUCHW_CONTROL_ADDR_X_22_HIGH   0x2ff
#define XEUCHW_CONTROL_WIDTH_X_22       32
#define XEUCHW_CONTROL_DEPTH_X_22       8
#define XEUCHW_CONTROL_ADDR_X_23_BASE   0x300
#define XEUCHW_CONTROL_ADDR_X_23_HIGH   0x31f
#define XEUCHW_CONTROL_WIDTH_X_23       32
#define XEUCHW_CONTROL_DEPTH_X_23       8
#define XEUCHW_CONTROL_ADDR_X_24_BASE   0x320
#define XEUCHW_CONTROL_ADDR_X_24_HIGH   0x33f
#define XEUCHW_CONTROL_WIDTH_X_24       32
#define XEUCHW_CONTROL_DEPTH_X_24       8
#define XEUCHW_CONTROL_ADDR_X_25_BASE   0x340
#define XEUCHW_CONTROL_ADDR_X_25_HIGH   0x35f
#define XEUCHW_CONTROL_WIDTH_X_25       32
#define XEUCHW_CONTROL_DEPTH_X_25       8
#define XEUCHW_CONTROL_ADDR_X_26_BASE   0x360
#define XEUCHW_CONTROL_ADDR_X_26_HIGH   0x37f
#define XEUCHW_CONTROL_WIDTH_X_26       32
#define XEUCHW_CONTROL_DEPTH_X_26       8
#define XEUCHW_CONTROL_ADDR_X_27_BASE   0x380
#define XEUCHW_CONTROL_ADDR_X_27_HIGH   0x39f
#define XEUCHW_CONTROL_WIDTH_X_27       32
#define XEUCHW_CONTROL_DEPTH_X_27       8
#define XEUCHW_CONTROL_ADDR_X_28_BASE   0x3a0
#define XEUCHW_CONTROL_ADDR_X_28_HIGH   0x3bf
#define XEUCHW_CONTROL_WIDTH_X_28       32
#define XEUCHW_CONTROL_DEPTH_X_28       8
#define XEUCHW_CONTROL_ADDR_X_29_BASE   0x3c0
#define XEUCHW_CONTROL_ADDR_X_29_HIGH   0x3df
#define XEUCHW_CONTROL_WIDTH_X_29       32
#define XEUCHW_CONTROL_DEPTH_X_29       8
#define XEUCHW_CONTROL_ADDR_X_30_BASE   0x3e0
#define XEUCHW_CONTROL_ADDR_X_30_HIGH   0x3ff
#define XEUCHW_CONTROL_WIDTH_X_30       32
#define XEUCHW_CONTROL_DEPTH_X_30       8
#define XEUCHW_CONTROL_ADDR_X_31_BASE   0x400
#define XEUCHW_CONTROL_ADDR_X_31_HIGH   0x41f
#define XEUCHW_CONTROL_WIDTH_X_31       32
#define XEUCHW_CONTROL_DEPTH_X_31       8

