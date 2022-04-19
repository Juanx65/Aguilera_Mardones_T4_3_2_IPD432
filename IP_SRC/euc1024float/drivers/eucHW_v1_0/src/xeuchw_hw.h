// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
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
//         bit 0 - enable ap_done interrupt (Read/Write)
//         bit 1 - enable ap_ready interrupt (Read/Write)
//         bit 5 - enable ap_local_deadlock interrupt (Read/Write)
//         others - reserved
// 0x00c : IP Interrupt Status Register (Read/TOW)
//         bit 0 - ap_done (COR/TOW)
//         bit 1 - ap_ready (COR/TOW)
//         bit 5 - ap_local_deadlock (COR/TOW)
//         others - reserved
// 0x010 : Data signal of y_sqrt
//         bit 31~0 - y_sqrt[31:0] (Read)
// 0x014 : Control signal of y_sqrt
//         bit 0  - y_sqrt_ap_vld (Read/COR)
//         others - reserved
// 0x020 ~
// 0x03f : Memory 'x_0' (32 * 8b)
//         Word n : bit [ 7: 0] - x_0[4n]
//                  bit [15: 8] - x_0[4n+1]
//                  bit [23:16] - x_0[4n+2]
//                  bit [31:24] - x_0[4n+3]
// 0x040 ~
// 0x05f : Memory 'x_1' (32 * 8b)
//         Word n : bit [ 7: 0] - x_1[4n]
//                  bit [15: 8] - x_1[4n+1]
//                  bit [23:16] - x_1[4n+2]
//                  bit [31:24] - x_1[4n+3]
// 0x060 ~
// 0x07f : Memory 'x_2' (32 * 8b)
//         Word n : bit [ 7: 0] - x_2[4n]
//                  bit [15: 8] - x_2[4n+1]
//                  bit [23:16] - x_2[4n+2]
//                  bit [31:24] - x_2[4n+3]
// 0x080 ~
// 0x09f : Memory 'x_3' (32 * 8b)
//         Word n : bit [ 7: 0] - x_3[4n]
//                  bit [15: 8] - x_3[4n+1]
//                  bit [23:16] - x_3[4n+2]
//                  bit [31:24] - x_3[4n+3]
// 0x0a0 ~
// 0x0bf : Memory 'x_4' (32 * 8b)
//         Word n : bit [ 7: 0] - x_4[4n]
//                  bit [15: 8] - x_4[4n+1]
//                  bit [23:16] - x_4[4n+2]
//                  bit [31:24] - x_4[4n+3]
// 0x0c0 ~
// 0x0df : Memory 'x_5' (32 * 8b)
//         Word n : bit [ 7: 0] - x_5[4n]
//                  bit [15: 8] - x_5[4n+1]
//                  bit [23:16] - x_5[4n+2]
//                  bit [31:24] - x_5[4n+3]
// 0x0e0 ~
// 0x0ff : Memory 'x_6' (32 * 8b)
//         Word n : bit [ 7: 0] - x_6[4n]
//                  bit [15: 8] - x_6[4n+1]
//                  bit [23:16] - x_6[4n+2]
//                  bit [31:24] - x_6[4n+3]
// 0x100 ~
// 0x11f : Memory 'x_7' (32 * 8b)
//         Word n : bit [ 7: 0] - x_7[4n]
//                  bit [15: 8] - x_7[4n+1]
//                  bit [23:16] - x_7[4n+2]
//                  bit [31:24] - x_7[4n+3]
// 0x120 ~
// 0x13f : Memory 'x_8' (32 * 8b)
//         Word n : bit [ 7: 0] - x_8[4n]
//                  bit [15: 8] - x_8[4n+1]
//                  bit [23:16] - x_8[4n+2]
//                  bit [31:24] - x_8[4n+3]
// 0x140 ~
// 0x15f : Memory 'x_9' (32 * 8b)
//         Word n : bit [ 7: 0] - x_9[4n]
//                  bit [15: 8] - x_9[4n+1]
//                  bit [23:16] - x_9[4n+2]
//                  bit [31:24] - x_9[4n+3]
// 0x160 ~
// 0x17f : Memory 'x_10' (32 * 8b)
//         Word n : bit [ 7: 0] - x_10[4n]
//                  bit [15: 8] - x_10[4n+1]
//                  bit [23:16] - x_10[4n+2]
//                  bit [31:24] - x_10[4n+3]
// 0x180 ~
// 0x19f : Memory 'x_11' (32 * 8b)
//         Word n : bit [ 7: 0] - x_11[4n]
//                  bit [15: 8] - x_11[4n+1]
//                  bit [23:16] - x_11[4n+2]
//                  bit [31:24] - x_11[4n+3]
// 0x1a0 ~
// 0x1bf : Memory 'x_12' (32 * 8b)
//         Word n : bit [ 7: 0] - x_12[4n]
//                  bit [15: 8] - x_12[4n+1]
//                  bit [23:16] - x_12[4n+2]
//                  bit [31:24] - x_12[4n+3]
// 0x1c0 ~
// 0x1df : Memory 'x_13' (32 * 8b)
//         Word n : bit [ 7: 0] - x_13[4n]
//                  bit [15: 8] - x_13[4n+1]
//                  bit [23:16] - x_13[4n+2]
//                  bit [31:24] - x_13[4n+3]
// 0x1e0 ~
// 0x1ff : Memory 'x_14' (32 * 8b)
//         Word n : bit [ 7: 0] - x_14[4n]
//                  bit [15: 8] - x_14[4n+1]
//                  bit [23:16] - x_14[4n+2]
//                  bit [31:24] - x_14[4n+3]
// 0x200 ~
// 0x21f : Memory 'x_15' (32 * 8b)
//         Word n : bit [ 7: 0] - x_15[4n]
//                  bit [15: 8] - x_15[4n+1]
//                  bit [23:16] - x_15[4n+2]
//                  bit [31:24] - x_15[4n+3]
// 0x220 ~
// 0x23f : Memory 'x_16' (32 * 8b)
//         Word n : bit [ 7: 0] - x_16[4n]
//                  bit [15: 8] - x_16[4n+1]
//                  bit [23:16] - x_16[4n+2]
//                  bit [31:24] - x_16[4n+3]
// 0x240 ~
// 0x25f : Memory 'x_17' (32 * 8b)
//         Word n : bit [ 7: 0] - x_17[4n]
//                  bit [15: 8] - x_17[4n+1]
//                  bit [23:16] - x_17[4n+2]
//                  bit [31:24] - x_17[4n+3]
// 0x260 ~
// 0x27f : Memory 'x_18' (32 * 8b)
//         Word n : bit [ 7: 0] - x_18[4n]
//                  bit [15: 8] - x_18[4n+1]
//                  bit [23:16] - x_18[4n+2]
//                  bit [31:24] - x_18[4n+3]
// 0x280 ~
// 0x29f : Memory 'x_19' (32 * 8b)
//         Word n : bit [ 7: 0] - x_19[4n]
//                  bit [15: 8] - x_19[4n+1]
//                  bit [23:16] - x_19[4n+2]
//                  bit [31:24] - x_19[4n+3]
// 0x2a0 ~
// 0x2bf : Memory 'x_20' (32 * 8b)
//         Word n : bit [ 7: 0] - x_20[4n]
//                  bit [15: 8] - x_20[4n+1]
//                  bit [23:16] - x_20[4n+2]
//                  bit [31:24] - x_20[4n+3]
// 0x2c0 ~
// 0x2df : Memory 'x_21' (32 * 8b)
//         Word n : bit [ 7: 0] - x_21[4n]
//                  bit [15: 8] - x_21[4n+1]
//                  bit [23:16] - x_21[4n+2]
//                  bit [31:24] - x_21[4n+3]
// 0x2e0 ~
// 0x2ff : Memory 'x_22' (32 * 8b)
//         Word n : bit [ 7: 0] - x_22[4n]
//                  bit [15: 8] - x_22[4n+1]
//                  bit [23:16] - x_22[4n+2]
//                  bit [31:24] - x_22[4n+3]
// 0x300 ~
// 0x31f : Memory 'x_23' (32 * 8b)
//         Word n : bit [ 7: 0] - x_23[4n]
//                  bit [15: 8] - x_23[4n+1]
//                  bit [23:16] - x_23[4n+2]
//                  bit [31:24] - x_23[4n+3]
// 0x320 ~
// 0x33f : Memory 'x_24' (32 * 8b)
//         Word n : bit [ 7: 0] - x_24[4n]
//                  bit [15: 8] - x_24[4n+1]
//                  bit [23:16] - x_24[4n+2]
//                  bit [31:24] - x_24[4n+3]
// 0x340 ~
// 0x35f : Memory 'x_25' (32 * 8b)
//         Word n : bit [ 7: 0] - x_25[4n]
//                  bit [15: 8] - x_25[4n+1]
//                  bit [23:16] - x_25[4n+2]
//                  bit [31:24] - x_25[4n+3]
// 0x360 ~
// 0x37f : Memory 'x_26' (32 * 8b)
//         Word n : bit [ 7: 0] - x_26[4n]
//                  bit [15: 8] - x_26[4n+1]
//                  bit [23:16] - x_26[4n+2]
//                  bit [31:24] - x_26[4n+3]
// 0x380 ~
// 0x39f : Memory 'x_27' (32 * 8b)
//         Word n : bit [ 7: 0] - x_27[4n]
//                  bit [15: 8] - x_27[4n+1]
//                  bit [23:16] - x_27[4n+2]
//                  bit [31:24] - x_27[4n+3]
// 0x3a0 ~
// 0x3bf : Memory 'x_28' (32 * 8b)
//         Word n : bit [ 7: 0] - x_28[4n]
//                  bit [15: 8] - x_28[4n+1]
//                  bit [23:16] - x_28[4n+2]
//                  bit [31:24] - x_28[4n+3]
// 0x3c0 ~
// 0x3df : Memory 'x_29' (32 * 8b)
//         Word n : bit [ 7: 0] - x_29[4n]
//                  bit [15: 8] - x_29[4n+1]
//                  bit [23:16] - x_29[4n+2]
//                  bit [31:24] - x_29[4n+3]
// 0x3e0 ~
// 0x3ff : Memory 'x_30' (32 * 8b)
//         Word n : bit [ 7: 0] - x_30[4n]
//                  bit [15: 8] - x_30[4n+1]
//                  bit [23:16] - x_30[4n+2]
//                  bit [31:24] - x_30[4n+3]
// 0x400 ~
// 0x41f : Memory 'x_31' (32 * 8b)
//         Word n : bit [ 7: 0] - x_31[4n]
//                  bit [15: 8] - x_31[4n+1]
//                  bit [23:16] - x_31[4n+2]
//                  bit [31:24] - x_31[4n+3]
// 0x420 ~
// 0x43f : Memory 'x_32' (32 * 8b)
//         Word n : bit [ 7: 0] - x_32[4n]
//                  bit [15: 8] - x_32[4n+1]
//                  bit [23:16] - x_32[4n+2]
//                  bit [31:24] - x_32[4n+3]
// 0x440 ~
// 0x45f : Memory 'x_33' (32 * 8b)
//         Word n : bit [ 7: 0] - x_33[4n]
//                  bit [15: 8] - x_33[4n+1]
//                  bit [23:16] - x_33[4n+2]
//                  bit [31:24] - x_33[4n+3]
// 0x460 ~
// 0x47f : Memory 'x_34' (32 * 8b)
//         Word n : bit [ 7: 0] - x_34[4n]
//                  bit [15: 8] - x_34[4n+1]
//                  bit [23:16] - x_34[4n+2]
//                  bit [31:24] - x_34[4n+3]
// 0x480 ~
// 0x49f : Memory 'x_35' (32 * 8b)
//         Word n : bit [ 7: 0] - x_35[4n]
//                  bit [15: 8] - x_35[4n+1]
//                  bit [23:16] - x_35[4n+2]
//                  bit [31:24] - x_35[4n+3]
// 0x4a0 ~
// 0x4bf : Memory 'x_36' (32 * 8b)
//         Word n : bit [ 7: 0] - x_36[4n]
//                  bit [15: 8] - x_36[4n+1]
//                  bit [23:16] - x_36[4n+2]
//                  bit [31:24] - x_36[4n+3]
// 0x4c0 ~
// 0x4df : Memory 'x_37' (32 * 8b)
//         Word n : bit [ 7: 0] - x_37[4n]
//                  bit [15: 8] - x_37[4n+1]
//                  bit [23:16] - x_37[4n+2]
//                  bit [31:24] - x_37[4n+3]
// 0x4e0 ~
// 0x4ff : Memory 'x_38' (32 * 8b)
//         Word n : bit [ 7: 0] - x_38[4n]
//                  bit [15: 8] - x_38[4n+1]
//                  bit [23:16] - x_38[4n+2]
//                  bit [31:24] - x_38[4n+3]
// 0x500 ~
// 0x51f : Memory 'x_39' (32 * 8b)
//         Word n : bit [ 7: 0] - x_39[4n]
//                  bit [15: 8] - x_39[4n+1]
//                  bit [23:16] - x_39[4n+2]
//                  bit [31:24] - x_39[4n+3]
// 0x520 ~
// 0x53f : Memory 'x_40' (32 * 8b)
//         Word n : bit [ 7: 0] - x_40[4n]
//                  bit [15: 8] - x_40[4n+1]
//                  bit [23:16] - x_40[4n+2]
//                  bit [31:24] - x_40[4n+3]
// 0x540 ~
// 0x55f : Memory 'x_41' (32 * 8b)
//         Word n : bit [ 7: 0] - x_41[4n]
//                  bit [15: 8] - x_41[4n+1]
//                  bit [23:16] - x_41[4n+2]
//                  bit [31:24] - x_41[4n+3]
// 0x560 ~
// 0x57f : Memory 'x_42' (32 * 8b)
//         Word n : bit [ 7: 0] - x_42[4n]
//                  bit [15: 8] - x_42[4n+1]
//                  bit [23:16] - x_42[4n+2]
//                  bit [31:24] - x_42[4n+3]
// 0x580 ~
// 0x59f : Memory 'x_43' (32 * 8b)
//         Word n : bit [ 7: 0] - x_43[4n]
//                  bit [15: 8] - x_43[4n+1]
//                  bit [23:16] - x_43[4n+2]
//                  bit [31:24] - x_43[4n+3]
// 0x5a0 ~
// 0x5bf : Memory 'x_44' (32 * 8b)
//         Word n : bit [ 7: 0] - x_44[4n]
//                  bit [15: 8] - x_44[4n+1]
//                  bit [23:16] - x_44[4n+2]
//                  bit [31:24] - x_44[4n+3]
// 0x5c0 ~
// 0x5df : Memory 'x_45' (32 * 8b)
//         Word n : bit [ 7: 0] - x_45[4n]
//                  bit [15: 8] - x_45[4n+1]
//                  bit [23:16] - x_45[4n+2]
//                  bit [31:24] - x_45[4n+3]
// 0x5e0 ~
// 0x5ff : Memory 'x_46' (32 * 8b)
//         Word n : bit [ 7: 0] - x_46[4n]
//                  bit [15: 8] - x_46[4n+1]
//                  bit [23:16] - x_46[4n+2]
//                  bit [31:24] - x_46[4n+3]
// 0x600 ~
// 0x61f : Memory 'x_47' (32 * 8b)
//         Word n : bit [ 7: 0] - x_47[4n]
//                  bit [15: 8] - x_47[4n+1]
//                  bit [23:16] - x_47[4n+2]
//                  bit [31:24] - x_47[4n+3]
// 0x620 ~
// 0x63f : Memory 'x_48' (32 * 8b)
//         Word n : bit [ 7: 0] - x_48[4n]
//                  bit [15: 8] - x_48[4n+1]
//                  bit [23:16] - x_48[4n+2]
//                  bit [31:24] - x_48[4n+3]
// 0x640 ~
// 0x65f : Memory 'x_49' (32 * 8b)
//         Word n : bit [ 7: 0] - x_49[4n]
//                  bit [15: 8] - x_49[4n+1]
//                  bit [23:16] - x_49[4n+2]
//                  bit [31:24] - x_49[4n+3]
// 0x660 ~
// 0x67f : Memory 'x_50' (32 * 8b)
//         Word n : bit [ 7: 0] - x_50[4n]
//                  bit [15: 8] - x_50[4n+1]
//                  bit [23:16] - x_50[4n+2]
//                  bit [31:24] - x_50[4n+3]
// 0x680 ~
// 0x69f : Memory 'x_51' (32 * 8b)
//         Word n : bit [ 7: 0] - x_51[4n]
//                  bit [15: 8] - x_51[4n+1]
//                  bit [23:16] - x_51[4n+2]
//                  bit [31:24] - x_51[4n+3]
// 0x6a0 ~
// 0x6bf : Memory 'x_52' (32 * 8b)
//         Word n : bit [ 7: 0] - x_52[4n]
//                  bit [15: 8] - x_52[4n+1]
//                  bit [23:16] - x_52[4n+2]
//                  bit [31:24] - x_52[4n+3]
// 0x6c0 ~
// 0x6df : Memory 'x_53' (32 * 8b)
//         Word n : bit [ 7: 0] - x_53[4n]
//                  bit [15: 8] - x_53[4n+1]
//                  bit [23:16] - x_53[4n+2]
//                  bit [31:24] - x_53[4n+3]
// 0x6e0 ~
// 0x6ff : Memory 'x_54' (32 * 8b)
//         Word n : bit [ 7: 0] - x_54[4n]
//                  bit [15: 8] - x_54[4n+1]
//                  bit [23:16] - x_54[4n+2]
//                  bit [31:24] - x_54[4n+3]
// 0x700 ~
// 0x71f : Memory 'x_55' (32 * 8b)
//         Word n : bit [ 7: 0] - x_55[4n]
//                  bit [15: 8] - x_55[4n+1]
//                  bit [23:16] - x_55[4n+2]
//                  bit [31:24] - x_55[4n+3]
// 0x720 ~
// 0x73f : Memory 'x_56' (32 * 8b)
//         Word n : bit [ 7: 0] - x_56[4n]
//                  bit [15: 8] - x_56[4n+1]
//                  bit [23:16] - x_56[4n+2]
//                  bit [31:24] - x_56[4n+3]
// 0x740 ~
// 0x75f : Memory 'x_57' (32 * 8b)
//         Word n : bit [ 7: 0] - x_57[4n]
//                  bit [15: 8] - x_57[4n+1]
//                  bit [23:16] - x_57[4n+2]
//                  bit [31:24] - x_57[4n+3]
// 0x760 ~
// 0x77f : Memory 'x_58' (32 * 8b)
//         Word n : bit [ 7: 0] - x_58[4n]
//                  bit [15: 8] - x_58[4n+1]
//                  bit [23:16] - x_58[4n+2]
//                  bit [31:24] - x_58[4n+3]
// 0x780 ~
// 0x79f : Memory 'x_59' (32 * 8b)
//         Word n : bit [ 7: 0] - x_59[4n]
//                  bit [15: 8] - x_59[4n+1]
//                  bit [23:16] - x_59[4n+2]
//                  bit [31:24] - x_59[4n+3]
// 0x7a0 ~
// 0x7bf : Memory 'x_60' (32 * 8b)
//         Word n : bit [ 7: 0] - x_60[4n]
//                  bit [15: 8] - x_60[4n+1]
//                  bit [23:16] - x_60[4n+2]
//                  bit [31:24] - x_60[4n+3]
// 0x7c0 ~
// 0x7df : Memory 'x_61' (32 * 8b)
//         Word n : bit [ 7: 0] - x_61[4n]
//                  bit [15: 8] - x_61[4n+1]
//                  bit [23:16] - x_61[4n+2]
//                  bit [31:24] - x_61[4n+3]
// 0x7e0 ~
// 0x7ff : Memory 'x_62' (32 * 8b)
//         Word n : bit [ 7: 0] - x_62[4n]
//                  bit [15: 8] - x_62[4n+1]
//                  bit [23:16] - x_62[4n+2]
//                  bit [31:24] - x_62[4n+3]
// 0x800 ~
// 0x81f : Memory 'x_63' (32 * 8b)
//         Word n : bit [ 7: 0] - x_63[4n]
//                  bit [15: 8] - x_63[4n+1]
//                  bit [23:16] - x_63[4n+2]
//                  bit [31:24] - x_63[4n+3]
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
#define XEUCHW_CONTROL_WIDTH_X_0        8
#define XEUCHW_CONTROL_DEPTH_X_0        32
#define XEUCHW_CONTROL_ADDR_X_1_BASE    0x040
#define XEUCHW_CONTROL_ADDR_X_1_HIGH    0x05f
#define XEUCHW_CONTROL_WIDTH_X_1        8
#define XEUCHW_CONTROL_DEPTH_X_1        32
#define XEUCHW_CONTROL_ADDR_X_2_BASE    0x060
#define XEUCHW_CONTROL_ADDR_X_2_HIGH    0x07f
#define XEUCHW_CONTROL_WIDTH_X_2        8
#define XEUCHW_CONTROL_DEPTH_X_2        32
#define XEUCHW_CONTROL_ADDR_X_3_BASE    0x080
#define XEUCHW_CONTROL_ADDR_X_3_HIGH    0x09f
#define XEUCHW_CONTROL_WIDTH_X_3        8
#define XEUCHW_CONTROL_DEPTH_X_3        32
#define XEUCHW_CONTROL_ADDR_X_4_BASE    0x0a0
#define XEUCHW_CONTROL_ADDR_X_4_HIGH    0x0bf
#define XEUCHW_CONTROL_WIDTH_X_4        8
#define XEUCHW_CONTROL_DEPTH_X_4        32
#define XEUCHW_CONTROL_ADDR_X_5_BASE    0x0c0
#define XEUCHW_CONTROL_ADDR_X_5_HIGH    0x0df
#define XEUCHW_CONTROL_WIDTH_X_5        8
#define XEUCHW_CONTROL_DEPTH_X_5        32
#define XEUCHW_CONTROL_ADDR_X_6_BASE    0x0e0
#define XEUCHW_CONTROL_ADDR_X_6_HIGH    0x0ff
#define XEUCHW_CONTROL_WIDTH_X_6        8
#define XEUCHW_CONTROL_DEPTH_X_6        32
#define XEUCHW_CONTROL_ADDR_X_7_BASE    0x100
#define XEUCHW_CONTROL_ADDR_X_7_HIGH    0x11f
#define XEUCHW_CONTROL_WIDTH_X_7        8
#define XEUCHW_CONTROL_DEPTH_X_7        32
#define XEUCHW_CONTROL_ADDR_X_8_BASE    0x120
#define XEUCHW_CONTROL_ADDR_X_8_HIGH    0x13f
#define XEUCHW_CONTROL_WIDTH_X_8        8
#define XEUCHW_CONTROL_DEPTH_X_8        32
#define XEUCHW_CONTROL_ADDR_X_9_BASE    0x140
#define XEUCHW_CONTROL_ADDR_X_9_HIGH    0x15f
#define XEUCHW_CONTROL_WIDTH_X_9        8
#define XEUCHW_CONTROL_DEPTH_X_9        32
#define XEUCHW_CONTROL_ADDR_X_10_BASE   0x160
#define XEUCHW_CONTROL_ADDR_X_10_HIGH   0x17f
#define XEUCHW_CONTROL_WIDTH_X_10       8
#define XEUCHW_CONTROL_DEPTH_X_10       32
#define XEUCHW_CONTROL_ADDR_X_11_BASE   0x180
#define XEUCHW_CONTROL_ADDR_X_11_HIGH   0x19f
#define XEUCHW_CONTROL_WIDTH_X_11       8
#define XEUCHW_CONTROL_DEPTH_X_11       32
#define XEUCHW_CONTROL_ADDR_X_12_BASE   0x1a0
#define XEUCHW_CONTROL_ADDR_X_12_HIGH   0x1bf
#define XEUCHW_CONTROL_WIDTH_X_12       8
#define XEUCHW_CONTROL_DEPTH_X_12       32
#define XEUCHW_CONTROL_ADDR_X_13_BASE   0x1c0
#define XEUCHW_CONTROL_ADDR_X_13_HIGH   0x1df
#define XEUCHW_CONTROL_WIDTH_X_13       8
#define XEUCHW_CONTROL_DEPTH_X_13       32
#define XEUCHW_CONTROL_ADDR_X_14_BASE   0x1e0
#define XEUCHW_CONTROL_ADDR_X_14_HIGH   0x1ff
#define XEUCHW_CONTROL_WIDTH_X_14       8
#define XEUCHW_CONTROL_DEPTH_X_14       32
#define XEUCHW_CONTROL_ADDR_X_15_BASE   0x200
#define XEUCHW_CONTROL_ADDR_X_15_HIGH   0x21f
#define XEUCHW_CONTROL_WIDTH_X_15       8
#define XEUCHW_CONTROL_DEPTH_X_15       32
#define XEUCHW_CONTROL_ADDR_X_16_BASE   0x220
#define XEUCHW_CONTROL_ADDR_X_16_HIGH   0x23f
#define XEUCHW_CONTROL_WIDTH_X_16       8
#define XEUCHW_CONTROL_DEPTH_X_16       32
#define XEUCHW_CONTROL_ADDR_X_17_BASE   0x240
#define XEUCHW_CONTROL_ADDR_X_17_HIGH   0x25f
#define XEUCHW_CONTROL_WIDTH_X_17       8
#define XEUCHW_CONTROL_DEPTH_X_17       32
#define XEUCHW_CONTROL_ADDR_X_18_BASE   0x260
#define XEUCHW_CONTROL_ADDR_X_18_HIGH   0x27f
#define XEUCHW_CONTROL_WIDTH_X_18       8
#define XEUCHW_CONTROL_DEPTH_X_18       32
#define XEUCHW_CONTROL_ADDR_X_19_BASE   0x280
#define XEUCHW_CONTROL_ADDR_X_19_HIGH   0x29f
#define XEUCHW_CONTROL_WIDTH_X_19       8
#define XEUCHW_CONTROL_DEPTH_X_19       32
#define XEUCHW_CONTROL_ADDR_X_20_BASE   0x2a0
#define XEUCHW_CONTROL_ADDR_X_20_HIGH   0x2bf
#define XEUCHW_CONTROL_WIDTH_X_20       8
#define XEUCHW_CONTROL_DEPTH_X_20       32
#define XEUCHW_CONTROL_ADDR_X_21_BASE   0x2c0
#define XEUCHW_CONTROL_ADDR_X_21_HIGH   0x2df
#define XEUCHW_CONTROL_WIDTH_X_21       8
#define XEUCHW_CONTROL_DEPTH_X_21       32
#define XEUCHW_CONTROL_ADDR_X_22_BASE   0x2e0
#define XEUCHW_CONTROL_ADDR_X_22_HIGH   0x2ff
#define XEUCHW_CONTROL_WIDTH_X_22       8
#define XEUCHW_CONTROL_DEPTH_X_22       32
#define XEUCHW_CONTROL_ADDR_X_23_BASE   0x300
#define XEUCHW_CONTROL_ADDR_X_23_HIGH   0x31f
#define XEUCHW_CONTROL_WIDTH_X_23       8
#define XEUCHW_CONTROL_DEPTH_X_23       32
#define XEUCHW_CONTROL_ADDR_X_24_BASE   0x320
#define XEUCHW_CONTROL_ADDR_X_24_HIGH   0x33f
#define XEUCHW_CONTROL_WIDTH_X_24       8
#define XEUCHW_CONTROL_DEPTH_X_24       32
#define XEUCHW_CONTROL_ADDR_X_25_BASE   0x340
#define XEUCHW_CONTROL_ADDR_X_25_HIGH   0x35f
#define XEUCHW_CONTROL_WIDTH_X_25       8
#define XEUCHW_CONTROL_DEPTH_X_25       32
#define XEUCHW_CONTROL_ADDR_X_26_BASE   0x360
#define XEUCHW_CONTROL_ADDR_X_26_HIGH   0x37f
#define XEUCHW_CONTROL_WIDTH_X_26       8
#define XEUCHW_CONTROL_DEPTH_X_26       32
#define XEUCHW_CONTROL_ADDR_X_27_BASE   0x380
#define XEUCHW_CONTROL_ADDR_X_27_HIGH   0x39f
#define XEUCHW_CONTROL_WIDTH_X_27       8
#define XEUCHW_CONTROL_DEPTH_X_27       32
#define XEUCHW_CONTROL_ADDR_X_28_BASE   0x3a0
#define XEUCHW_CONTROL_ADDR_X_28_HIGH   0x3bf
#define XEUCHW_CONTROL_WIDTH_X_28       8
#define XEUCHW_CONTROL_DEPTH_X_28       32
#define XEUCHW_CONTROL_ADDR_X_29_BASE   0x3c0
#define XEUCHW_CONTROL_ADDR_X_29_HIGH   0x3df
#define XEUCHW_CONTROL_WIDTH_X_29       8
#define XEUCHW_CONTROL_DEPTH_X_29       32
#define XEUCHW_CONTROL_ADDR_X_30_BASE   0x3e0
#define XEUCHW_CONTROL_ADDR_X_30_HIGH   0x3ff
#define XEUCHW_CONTROL_WIDTH_X_30       8
#define XEUCHW_CONTROL_DEPTH_X_30       32
#define XEUCHW_CONTROL_ADDR_X_31_BASE   0x400
#define XEUCHW_CONTROL_ADDR_X_31_HIGH   0x41f
#define XEUCHW_CONTROL_WIDTH_X_31       8
#define XEUCHW_CONTROL_DEPTH_X_31       32
#define XEUCHW_CONTROL_ADDR_X_32_BASE   0x420
#define XEUCHW_CONTROL_ADDR_X_32_HIGH   0x43f
#define XEUCHW_CONTROL_WIDTH_X_32       8
#define XEUCHW_CONTROL_DEPTH_X_32       32
#define XEUCHW_CONTROL_ADDR_X_33_BASE   0x440
#define XEUCHW_CONTROL_ADDR_X_33_HIGH   0x45f
#define XEUCHW_CONTROL_WIDTH_X_33       8
#define XEUCHW_CONTROL_DEPTH_X_33       32
#define XEUCHW_CONTROL_ADDR_X_34_BASE   0x460
#define XEUCHW_CONTROL_ADDR_X_34_HIGH   0x47f
#define XEUCHW_CONTROL_WIDTH_X_34       8
#define XEUCHW_CONTROL_DEPTH_X_34       32
#define XEUCHW_CONTROL_ADDR_X_35_BASE   0x480
#define XEUCHW_CONTROL_ADDR_X_35_HIGH   0x49f
#define XEUCHW_CONTROL_WIDTH_X_35       8
#define XEUCHW_CONTROL_DEPTH_X_35       32
#define XEUCHW_CONTROL_ADDR_X_36_BASE   0x4a0
#define XEUCHW_CONTROL_ADDR_X_36_HIGH   0x4bf
#define XEUCHW_CONTROL_WIDTH_X_36       8
#define XEUCHW_CONTROL_DEPTH_X_36       32
#define XEUCHW_CONTROL_ADDR_X_37_BASE   0x4c0
#define XEUCHW_CONTROL_ADDR_X_37_HIGH   0x4df
#define XEUCHW_CONTROL_WIDTH_X_37       8
#define XEUCHW_CONTROL_DEPTH_X_37       32
#define XEUCHW_CONTROL_ADDR_X_38_BASE   0x4e0
#define XEUCHW_CONTROL_ADDR_X_38_HIGH   0x4ff
#define XEUCHW_CONTROL_WIDTH_X_38       8
#define XEUCHW_CONTROL_DEPTH_X_38       32
#define XEUCHW_CONTROL_ADDR_X_39_BASE   0x500
#define XEUCHW_CONTROL_ADDR_X_39_HIGH   0x51f
#define XEUCHW_CONTROL_WIDTH_X_39       8
#define XEUCHW_CONTROL_DEPTH_X_39       32
#define XEUCHW_CONTROL_ADDR_X_40_BASE   0x520
#define XEUCHW_CONTROL_ADDR_X_40_HIGH   0x53f
#define XEUCHW_CONTROL_WIDTH_X_40       8
#define XEUCHW_CONTROL_DEPTH_X_40       32
#define XEUCHW_CONTROL_ADDR_X_41_BASE   0x540
#define XEUCHW_CONTROL_ADDR_X_41_HIGH   0x55f
#define XEUCHW_CONTROL_WIDTH_X_41       8
#define XEUCHW_CONTROL_DEPTH_X_41       32
#define XEUCHW_CONTROL_ADDR_X_42_BASE   0x560
#define XEUCHW_CONTROL_ADDR_X_42_HIGH   0x57f
#define XEUCHW_CONTROL_WIDTH_X_42       8
#define XEUCHW_CONTROL_DEPTH_X_42       32
#define XEUCHW_CONTROL_ADDR_X_43_BASE   0x580
#define XEUCHW_CONTROL_ADDR_X_43_HIGH   0x59f
#define XEUCHW_CONTROL_WIDTH_X_43       8
#define XEUCHW_CONTROL_DEPTH_X_43       32
#define XEUCHW_CONTROL_ADDR_X_44_BASE   0x5a0
#define XEUCHW_CONTROL_ADDR_X_44_HIGH   0x5bf
#define XEUCHW_CONTROL_WIDTH_X_44       8
#define XEUCHW_CONTROL_DEPTH_X_44       32
#define XEUCHW_CONTROL_ADDR_X_45_BASE   0x5c0
#define XEUCHW_CONTROL_ADDR_X_45_HIGH   0x5df
#define XEUCHW_CONTROL_WIDTH_X_45       8
#define XEUCHW_CONTROL_DEPTH_X_45       32
#define XEUCHW_CONTROL_ADDR_X_46_BASE   0x5e0
#define XEUCHW_CONTROL_ADDR_X_46_HIGH   0x5ff
#define XEUCHW_CONTROL_WIDTH_X_46       8
#define XEUCHW_CONTROL_DEPTH_X_46       32
#define XEUCHW_CONTROL_ADDR_X_47_BASE   0x600
#define XEUCHW_CONTROL_ADDR_X_47_HIGH   0x61f
#define XEUCHW_CONTROL_WIDTH_X_47       8
#define XEUCHW_CONTROL_DEPTH_X_47       32
#define XEUCHW_CONTROL_ADDR_X_48_BASE   0x620
#define XEUCHW_CONTROL_ADDR_X_48_HIGH   0x63f
#define XEUCHW_CONTROL_WIDTH_X_48       8
#define XEUCHW_CONTROL_DEPTH_X_48       32
#define XEUCHW_CONTROL_ADDR_X_49_BASE   0x640
#define XEUCHW_CONTROL_ADDR_X_49_HIGH   0x65f
#define XEUCHW_CONTROL_WIDTH_X_49       8
#define XEUCHW_CONTROL_DEPTH_X_49       32
#define XEUCHW_CONTROL_ADDR_X_50_BASE   0x660
#define XEUCHW_CONTROL_ADDR_X_50_HIGH   0x67f
#define XEUCHW_CONTROL_WIDTH_X_50       8
#define XEUCHW_CONTROL_DEPTH_X_50       32
#define XEUCHW_CONTROL_ADDR_X_51_BASE   0x680
#define XEUCHW_CONTROL_ADDR_X_51_HIGH   0x69f
#define XEUCHW_CONTROL_WIDTH_X_51       8
#define XEUCHW_CONTROL_DEPTH_X_51       32
#define XEUCHW_CONTROL_ADDR_X_52_BASE   0x6a0
#define XEUCHW_CONTROL_ADDR_X_52_HIGH   0x6bf
#define XEUCHW_CONTROL_WIDTH_X_52       8
#define XEUCHW_CONTROL_DEPTH_X_52       32
#define XEUCHW_CONTROL_ADDR_X_53_BASE   0x6c0
#define XEUCHW_CONTROL_ADDR_X_53_HIGH   0x6df
#define XEUCHW_CONTROL_WIDTH_X_53       8
#define XEUCHW_CONTROL_DEPTH_X_53       32
#define XEUCHW_CONTROL_ADDR_X_54_BASE   0x6e0
#define XEUCHW_CONTROL_ADDR_X_54_HIGH   0x6ff
#define XEUCHW_CONTROL_WIDTH_X_54       8
#define XEUCHW_CONTROL_DEPTH_X_54       32
#define XEUCHW_CONTROL_ADDR_X_55_BASE   0x700
#define XEUCHW_CONTROL_ADDR_X_55_HIGH   0x71f
#define XEUCHW_CONTROL_WIDTH_X_55       8
#define XEUCHW_CONTROL_DEPTH_X_55       32
#define XEUCHW_CONTROL_ADDR_X_56_BASE   0x720
#define XEUCHW_CONTROL_ADDR_X_56_HIGH   0x73f
#define XEUCHW_CONTROL_WIDTH_X_56       8
#define XEUCHW_CONTROL_DEPTH_X_56       32
#define XEUCHW_CONTROL_ADDR_X_57_BASE   0x740
#define XEUCHW_CONTROL_ADDR_X_57_HIGH   0x75f
#define XEUCHW_CONTROL_WIDTH_X_57       8
#define XEUCHW_CONTROL_DEPTH_X_57       32
#define XEUCHW_CONTROL_ADDR_X_58_BASE   0x760
#define XEUCHW_CONTROL_ADDR_X_58_HIGH   0x77f
#define XEUCHW_CONTROL_WIDTH_X_58       8
#define XEUCHW_CONTROL_DEPTH_X_58       32
#define XEUCHW_CONTROL_ADDR_X_59_BASE   0x780
#define XEUCHW_CONTROL_ADDR_X_59_HIGH   0x79f
#define XEUCHW_CONTROL_WIDTH_X_59       8
#define XEUCHW_CONTROL_DEPTH_X_59       32
#define XEUCHW_CONTROL_ADDR_X_60_BASE   0x7a0
#define XEUCHW_CONTROL_ADDR_X_60_HIGH   0x7bf
#define XEUCHW_CONTROL_WIDTH_X_60       8
#define XEUCHW_CONTROL_DEPTH_X_60       32
#define XEUCHW_CONTROL_ADDR_X_61_BASE   0x7c0
#define XEUCHW_CONTROL_ADDR_X_61_HIGH   0x7df
#define XEUCHW_CONTROL_WIDTH_X_61       8
#define XEUCHW_CONTROL_DEPTH_X_61       32
#define XEUCHW_CONTROL_ADDR_X_62_BASE   0x7e0
#define XEUCHW_CONTROL_ADDR_X_62_HIGH   0x7ff
#define XEUCHW_CONTROL_WIDTH_X_62       8
#define XEUCHW_CONTROL_DEPTH_X_62       32
#define XEUCHW_CONTROL_ADDR_X_63_BASE   0x800
#define XEUCHW_CONTROL_ADDR_X_63_HIGH   0x81f
#define XEUCHW_CONTROL_WIDTH_X_63       8
#define XEUCHW_CONTROL_DEPTH_X_63       32

