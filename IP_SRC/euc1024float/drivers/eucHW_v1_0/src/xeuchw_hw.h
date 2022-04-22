// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x0000 : Control signals
//          bit 0  - ap_start (Read/Write/COH)
//          bit 1  - ap_done (Read/COR)
//          bit 2  - ap_idle (Read)
//          bit 3  - ap_ready (Read/COR)
//          bit 7  - auto_restart (Read/Write)
//          others - reserved
// 0x0004 : Global Interrupt Enable Register
//          bit 0  - Global Interrupt Enable (Read/Write)
//          others - reserved
// 0x0008 : IP Interrupt Enable Register (Read/Write)
//          bit 0  - enable ap_done interrupt (Read/Write)
//          bit 1  - enable ap_ready interrupt (Read/Write)
//          others - reserved
// 0x000c : IP Interrupt Status Register (Read/TOW)
//          bit 0  - ap_done (COR/TOW)
//          bit 1  - ap_ready (COR/TOW)
//          others - reserved
// 0x0010 : Data signal of y_sqrt
//          bit 31~0 - y_sqrt[31:0] (Read)
// 0x0014 : Control signal of y_sqrt
//          bit 0  - y_sqrt_ap_vld (Read/COR)
//          others - reserved
// 0x0100 ~
// 0x01ff : Memory 'x_0' (64 * 32b)
//          Word n : bit [31:0] - x_0[n]
// 0x0200 ~
// 0x02ff : Memory 'x_1' (64 * 32b)
//          Word n : bit [31:0] - x_1[n]
// 0x0300 ~
// 0x03ff : Memory 'x_2' (64 * 32b)
//          Word n : bit [31:0] - x_2[n]
// 0x0400 ~
// 0x04ff : Memory 'x_3' (64 * 32b)
//          Word n : bit [31:0] - x_3[n]
// 0x0500 ~
// 0x05ff : Memory 'x_4' (64 * 32b)
//          Word n : bit [31:0] - x_4[n]
// 0x0600 ~
// 0x06ff : Memory 'x_5' (64 * 32b)
//          Word n : bit [31:0] - x_5[n]
// 0x0700 ~
// 0x07ff : Memory 'x_6' (64 * 32b)
//          Word n : bit [31:0] - x_6[n]
// 0x0800 ~
// 0x08ff : Memory 'x_7' (64 * 32b)
//          Word n : bit [31:0] - x_7[n]
// 0x0900 ~
// 0x09ff : Memory 'x_8' (64 * 32b)
//          Word n : bit [31:0] - x_8[n]
// 0x0a00 ~
// 0x0aff : Memory 'x_9' (64 * 32b)
//          Word n : bit [31:0] - x_9[n]
// 0x0b00 ~
// 0x0bff : Memory 'x_10' (64 * 32b)
//          Word n : bit [31:0] - x_10[n]
// 0x0c00 ~
// 0x0cff : Memory 'x_11' (64 * 32b)
//          Word n : bit [31:0] - x_11[n]
// 0x0d00 ~
// 0x0dff : Memory 'x_12' (64 * 32b)
//          Word n : bit [31:0] - x_12[n]
// 0x0e00 ~
// 0x0eff : Memory 'x_13' (64 * 32b)
//          Word n : bit [31:0] - x_13[n]
// 0x0f00 ~
// 0x0fff : Memory 'x_14' (64 * 32b)
//          Word n : bit [31:0] - x_14[n]
// 0x1000 ~
// 0x10ff : Memory 'x_15' (64 * 32b)
//          Word n : bit [31:0] - x_15[n]
// 0x1100 ~
// 0x11ff : Memory 'x_16' (64 * 32b)
//          Word n : bit [31:0] - x_16[n]
// 0x1200 ~
// 0x12ff : Memory 'x_17' (64 * 32b)
//          Word n : bit [31:0] - x_17[n]
// 0x1300 ~
// 0x13ff : Memory 'x_18' (64 * 32b)
//          Word n : bit [31:0] - x_18[n]
// 0x1400 ~
// 0x14ff : Memory 'x_19' (64 * 32b)
//          Word n : bit [31:0] - x_19[n]
// 0x1500 ~
// 0x15ff : Memory 'x_20' (64 * 32b)
//          Word n : bit [31:0] - x_20[n]
// 0x1600 ~
// 0x16ff : Memory 'x_21' (64 * 32b)
//          Word n : bit [31:0] - x_21[n]
// 0x1700 ~
// 0x17ff : Memory 'x_22' (64 * 32b)
//          Word n : bit [31:0] - x_22[n]
// 0x1800 ~
// 0x18ff : Memory 'x_23' (64 * 32b)
//          Word n : bit [31:0] - x_23[n]
// 0x1900 ~
// 0x19ff : Memory 'x_24' (64 * 32b)
//          Word n : bit [31:0] - x_24[n]
// 0x1a00 ~
// 0x1aff : Memory 'x_25' (64 * 32b)
//          Word n : bit [31:0] - x_25[n]
// 0x1b00 ~
// 0x1bff : Memory 'x_26' (64 * 32b)
//          Word n : bit [31:0] - x_26[n]
// 0x1c00 ~
// 0x1cff : Memory 'x_27' (64 * 32b)
//          Word n : bit [31:0] - x_27[n]
// 0x1d00 ~
// 0x1dff : Memory 'x_28' (64 * 32b)
//          Word n : bit [31:0] - x_28[n]
// 0x1e00 ~
// 0x1eff : Memory 'x_29' (64 * 32b)
//          Word n : bit [31:0] - x_29[n]
// 0x1f00 ~
// 0x1fff : Memory 'x_30' (64 * 32b)
//          Word n : bit [31:0] - x_30[n]
// 0x2000 ~
// 0x20ff : Memory 'x_31' (64 * 32b)
//          Word n : bit [31:0] - x_31[n]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XEUCHW_CONTROL_ADDR_AP_CTRL     0x0000
#define XEUCHW_CONTROL_ADDR_GIE         0x0004
#define XEUCHW_CONTROL_ADDR_IER         0x0008
#define XEUCHW_CONTROL_ADDR_ISR         0x000c
#define XEUCHW_CONTROL_ADDR_Y_SQRT_DATA 0x0010
#define XEUCHW_CONTROL_BITS_Y_SQRT_DATA 32
#define XEUCHW_CONTROL_ADDR_Y_SQRT_CTRL 0x0014
#define XEUCHW_CONTROL_ADDR_X_0_BASE    0x0100
#define XEUCHW_CONTROL_ADDR_X_0_HIGH    0x01ff
#define XEUCHW_CONTROL_WIDTH_X_0        32
#define XEUCHW_CONTROL_DEPTH_X_0        64
#define XEUCHW_CONTROL_ADDR_X_1_BASE    0x0200
#define XEUCHW_CONTROL_ADDR_X_1_HIGH    0x02ff
#define XEUCHW_CONTROL_WIDTH_X_1        32
#define XEUCHW_CONTROL_DEPTH_X_1        64
#define XEUCHW_CONTROL_ADDR_X_2_BASE    0x0300
#define XEUCHW_CONTROL_ADDR_X_2_HIGH    0x03ff
#define XEUCHW_CONTROL_WIDTH_X_2        32
#define XEUCHW_CONTROL_DEPTH_X_2        64
#define XEUCHW_CONTROL_ADDR_X_3_BASE    0x0400
#define XEUCHW_CONTROL_ADDR_X_3_HIGH    0x04ff
#define XEUCHW_CONTROL_WIDTH_X_3        32
#define XEUCHW_CONTROL_DEPTH_X_3        64
#define XEUCHW_CONTROL_ADDR_X_4_BASE    0x0500
#define XEUCHW_CONTROL_ADDR_X_4_HIGH    0x05ff
#define XEUCHW_CONTROL_WIDTH_X_4        32
#define XEUCHW_CONTROL_DEPTH_X_4        64
#define XEUCHW_CONTROL_ADDR_X_5_BASE    0x0600
#define XEUCHW_CONTROL_ADDR_X_5_HIGH    0x06ff
#define XEUCHW_CONTROL_WIDTH_X_5        32
#define XEUCHW_CONTROL_DEPTH_X_5        64
#define XEUCHW_CONTROL_ADDR_X_6_BASE    0x0700
#define XEUCHW_CONTROL_ADDR_X_6_HIGH    0x07ff
#define XEUCHW_CONTROL_WIDTH_X_6        32
#define XEUCHW_CONTROL_DEPTH_X_6        64
#define XEUCHW_CONTROL_ADDR_X_7_BASE    0x0800
#define XEUCHW_CONTROL_ADDR_X_7_HIGH    0x08ff
#define XEUCHW_CONTROL_WIDTH_X_7        32
#define XEUCHW_CONTROL_DEPTH_X_7        64
#define XEUCHW_CONTROL_ADDR_X_8_BASE    0x0900
#define XEUCHW_CONTROL_ADDR_X_8_HIGH    0x09ff
#define XEUCHW_CONTROL_WIDTH_X_8        32
#define XEUCHW_CONTROL_DEPTH_X_8        64
#define XEUCHW_CONTROL_ADDR_X_9_BASE    0x0a00
#define XEUCHW_CONTROL_ADDR_X_9_HIGH    0x0aff
#define XEUCHW_CONTROL_WIDTH_X_9        32
#define XEUCHW_CONTROL_DEPTH_X_9        64
#define XEUCHW_CONTROL_ADDR_X_10_BASE   0x0b00
#define XEUCHW_CONTROL_ADDR_X_10_HIGH   0x0bff
#define XEUCHW_CONTROL_WIDTH_X_10       32
#define XEUCHW_CONTROL_DEPTH_X_10       64
#define XEUCHW_CONTROL_ADDR_X_11_BASE   0x0c00
#define XEUCHW_CONTROL_ADDR_X_11_HIGH   0x0cff
#define XEUCHW_CONTROL_WIDTH_X_11       32
#define XEUCHW_CONTROL_DEPTH_X_11       64
#define XEUCHW_CONTROL_ADDR_X_12_BASE   0x0d00
#define XEUCHW_CONTROL_ADDR_X_12_HIGH   0x0dff
#define XEUCHW_CONTROL_WIDTH_X_12       32
#define XEUCHW_CONTROL_DEPTH_X_12       64
#define XEUCHW_CONTROL_ADDR_X_13_BASE   0x0e00
#define XEUCHW_CONTROL_ADDR_X_13_HIGH   0x0eff
#define XEUCHW_CONTROL_WIDTH_X_13       32
#define XEUCHW_CONTROL_DEPTH_X_13       64
#define XEUCHW_CONTROL_ADDR_X_14_BASE   0x0f00
#define XEUCHW_CONTROL_ADDR_X_14_HIGH   0x0fff
#define XEUCHW_CONTROL_WIDTH_X_14       32
#define XEUCHW_CONTROL_DEPTH_X_14       64
#define XEUCHW_CONTROL_ADDR_X_15_BASE   0x1000
#define XEUCHW_CONTROL_ADDR_X_15_HIGH   0x10ff
#define XEUCHW_CONTROL_WIDTH_X_15       32
#define XEUCHW_CONTROL_DEPTH_X_15       64
#define XEUCHW_CONTROL_ADDR_X_16_BASE   0x1100
#define XEUCHW_CONTROL_ADDR_X_16_HIGH   0x11ff
#define XEUCHW_CONTROL_WIDTH_X_16       32
#define XEUCHW_CONTROL_DEPTH_X_16       64
#define XEUCHW_CONTROL_ADDR_X_17_BASE   0x1200
#define XEUCHW_CONTROL_ADDR_X_17_HIGH   0x12ff
#define XEUCHW_CONTROL_WIDTH_X_17       32
#define XEUCHW_CONTROL_DEPTH_X_17       64
#define XEUCHW_CONTROL_ADDR_X_18_BASE   0x1300
#define XEUCHW_CONTROL_ADDR_X_18_HIGH   0x13ff
#define XEUCHW_CONTROL_WIDTH_X_18       32
#define XEUCHW_CONTROL_DEPTH_X_18       64
#define XEUCHW_CONTROL_ADDR_X_19_BASE   0x1400
#define XEUCHW_CONTROL_ADDR_X_19_HIGH   0x14ff
#define XEUCHW_CONTROL_WIDTH_X_19       32
#define XEUCHW_CONTROL_DEPTH_X_19       64
#define XEUCHW_CONTROL_ADDR_X_20_BASE   0x1500
#define XEUCHW_CONTROL_ADDR_X_20_HIGH   0x15ff
#define XEUCHW_CONTROL_WIDTH_X_20       32
#define XEUCHW_CONTROL_DEPTH_X_20       64
#define XEUCHW_CONTROL_ADDR_X_21_BASE   0x1600
#define XEUCHW_CONTROL_ADDR_X_21_HIGH   0x16ff
#define XEUCHW_CONTROL_WIDTH_X_21       32
#define XEUCHW_CONTROL_DEPTH_X_21       64
#define XEUCHW_CONTROL_ADDR_X_22_BASE   0x1700
#define XEUCHW_CONTROL_ADDR_X_22_HIGH   0x17ff
#define XEUCHW_CONTROL_WIDTH_X_22       32
#define XEUCHW_CONTROL_DEPTH_X_22       64
#define XEUCHW_CONTROL_ADDR_X_23_BASE   0x1800
#define XEUCHW_CONTROL_ADDR_X_23_HIGH   0x18ff
#define XEUCHW_CONTROL_WIDTH_X_23       32
#define XEUCHW_CONTROL_DEPTH_X_23       64
#define XEUCHW_CONTROL_ADDR_X_24_BASE   0x1900
#define XEUCHW_CONTROL_ADDR_X_24_HIGH   0x19ff
#define XEUCHW_CONTROL_WIDTH_X_24       32
#define XEUCHW_CONTROL_DEPTH_X_24       64
#define XEUCHW_CONTROL_ADDR_X_25_BASE   0x1a00
#define XEUCHW_CONTROL_ADDR_X_25_HIGH   0x1aff
#define XEUCHW_CONTROL_WIDTH_X_25       32
#define XEUCHW_CONTROL_DEPTH_X_25       64
#define XEUCHW_CONTROL_ADDR_X_26_BASE   0x1b00
#define XEUCHW_CONTROL_ADDR_X_26_HIGH   0x1bff
#define XEUCHW_CONTROL_WIDTH_X_26       32
#define XEUCHW_CONTROL_DEPTH_X_26       64
#define XEUCHW_CONTROL_ADDR_X_27_BASE   0x1c00
#define XEUCHW_CONTROL_ADDR_X_27_HIGH   0x1cff
#define XEUCHW_CONTROL_WIDTH_X_27       32
#define XEUCHW_CONTROL_DEPTH_X_27       64
#define XEUCHW_CONTROL_ADDR_X_28_BASE   0x1d00
#define XEUCHW_CONTROL_ADDR_X_28_HIGH   0x1dff
#define XEUCHW_CONTROL_WIDTH_X_28       32
#define XEUCHW_CONTROL_DEPTH_X_28       64
#define XEUCHW_CONTROL_ADDR_X_29_BASE   0x1e00
#define XEUCHW_CONTROL_ADDR_X_29_HIGH   0x1eff
#define XEUCHW_CONTROL_WIDTH_X_29       32
#define XEUCHW_CONTROL_DEPTH_X_29       64
#define XEUCHW_CONTROL_ADDR_X_30_BASE   0x1f00
#define XEUCHW_CONTROL_ADDR_X_30_HIGH   0x1fff
#define XEUCHW_CONTROL_WIDTH_X_30       32
#define XEUCHW_CONTROL_DEPTH_X_30       64
#define XEUCHW_CONTROL_ADDR_X_31_BASE   0x2000
#define XEUCHW_CONTROL_ADDR_X_31_HIGH   0x20ff
#define XEUCHW_CONTROL_WIDTH_X_31       32
#define XEUCHW_CONTROL_DEPTH_X_31       64

