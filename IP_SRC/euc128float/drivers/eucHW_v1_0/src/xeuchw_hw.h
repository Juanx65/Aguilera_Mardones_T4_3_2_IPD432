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
// 0x027 : Memory 'x_0' (4 * 8b)
//         Word n : bit [ 7: 0] - x_0[4n]
//                  bit [15: 8] - x_0[4n+1]
//                  bit [23:16] - x_0[4n+2]
//                  bit [31:24] - x_0[4n+3]
// 0x028 ~
// 0x02f : Memory 'x_1' (4 * 8b)
//         Word n : bit [ 7: 0] - x_1[4n]
//                  bit [15: 8] - x_1[4n+1]
//                  bit [23:16] - x_1[4n+2]
//                  bit [31:24] - x_1[4n+3]
// 0x030 ~
// 0x037 : Memory 'x_2' (4 * 8b)
//         Word n : bit [ 7: 0] - x_2[4n]
//                  bit [15: 8] - x_2[4n+1]
//                  bit [23:16] - x_2[4n+2]
//                  bit [31:24] - x_2[4n+3]
// 0x038 ~
// 0x03f : Memory 'x_3' (4 * 8b)
//         Word n : bit [ 7: 0] - x_3[4n]
//                  bit [15: 8] - x_3[4n+1]
//                  bit [23:16] - x_3[4n+2]
//                  bit [31:24] - x_3[4n+3]
// 0x040 ~
// 0x047 : Memory 'x_4' (4 * 8b)
//         Word n : bit [ 7: 0] - x_4[4n]
//                  bit [15: 8] - x_4[4n+1]
//                  bit [23:16] - x_4[4n+2]
//                  bit [31:24] - x_4[4n+3]
// 0x048 ~
// 0x04f : Memory 'x_5' (4 * 8b)
//         Word n : bit [ 7: 0] - x_5[4n]
//                  bit [15: 8] - x_5[4n+1]
//                  bit [23:16] - x_5[4n+2]
//                  bit [31:24] - x_5[4n+3]
// 0x050 ~
// 0x057 : Memory 'x_6' (4 * 8b)
//         Word n : bit [ 7: 0] - x_6[4n]
//                  bit [15: 8] - x_6[4n+1]
//                  bit [23:16] - x_6[4n+2]
//                  bit [31:24] - x_6[4n+3]
// 0x058 ~
// 0x05f : Memory 'x_7' (4 * 8b)
//         Word n : bit [ 7: 0] - x_7[4n]
//                  bit [15: 8] - x_7[4n+1]
//                  bit [23:16] - x_7[4n+2]
//                  bit [31:24] - x_7[4n+3]
// 0x060 ~
// 0x067 : Memory 'x_8' (4 * 8b)
//         Word n : bit [ 7: 0] - x_8[4n]
//                  bit [15: 8] - x_8[4n+1]
//                  bit [23:16] - x_8[4n+2]
//                  bit [31:24] - x_8[4n+3]
// 0x068 ~
// 0x06f : Memory 'x_9' (4 * 8b)
//         Word n : bit [ 7: 0] - x_9[4n]
//                  bit [15: 8] - x_9[4n+1]
//                  bit [23:16] - x_9[4n+2]
//                  bit [31:24] - x_9[4n+3]
// 0x070 ~
// 0x077 : Memory 'x_10' (4 * 8b)
//         Word n : bit [ 7: 0] - x_10[4n]
//                  bit [15: 8] - x_10[4n+1]
//                  bit [23:16] - x_10[4n+2]
//                  bit [31:24] - x_10[4n+3]
// 0x078 ~
// 0x07f : Memory 'x_11' (4 * 8b)
//         Word n : bit [ 7: 0] - x_11[4n]
//                  bit [15: 8] - x_11[4n+1]
//                  bit [23:16] - x_11[4n+2]
//                  bit [31:24] - x_11[4n+3]
// 0x080 ~
// 0x087 : Memory 'x_12' (4 * 8b)
//         Word n : bit [ 7: 0] - x_12[4n]
//                  bit [15: 8] - x_12[4n+1]
//                  bit [23:16] - x_12[4n+2]
//                  bit [31:24] - x_12[4n+3]
// 0x088 ~
// 0x08f : Memory 'x_13' (4 * 8b)
//         Word n : bit [ 7: 0] - x_13[4n]
//                  bit [15: 8] - x_13[4n+1]
//                  bit [23:16] - x_13[4n+2]
//                  bit [31:24] - x_13[4n+3]
// 0x090 ~
// 0x097 : Memory 'x_14' (4 * 8b)
//         Word n : bit [ 7: 0] - x_14[4n]
//                  bit [15: 8] - x_14[4n+1]
//                  bit [23:16] - x_14[4n+2]
//                  bit [31:24] - x_14[4n+3]
// 0x098 ~
// 0x09f : Memory 'x_15' (4 * 8b)
//         Word n : bit [ 7: 0] - x_15[4n]
//                  bit [15: 8] - x_15[4n+1]
//                  bit [23:16] - x_15[4n+2]
//                  bit [31:24] - x_15[4n+3]
// 0x0a0 ~
// 0x0a7 : Memory 'x_16' (4 * 8b)
//         Word n : bit [ 7: 0] - x_16[4n]
//                  bit [15: 8] - x_16[4n+1]
//                  bit [23:16] - x_16[4n+2]
//                  bit [31:24] - x_16[4n+3]
// 0x0a8 ~
// 0x0af : Memory 'x_17' (4 * 8b)
//         Word n : bit [ 7: 0] - x_17[4n]
//                  bit [15: 8] - x_17[4n+1]
//                  bit [23:16] - x_17[4n+2]
//                  bit [31:24] - x_17[4n+3]
// 0x0b0 ~
// 0x0b7 : Memory 'x_18' (4 * 8b)
//         Word n : bit [ 7: 0] - x_18[4n]
//                  bit [15: 8] - x_18[4n+1]
//                  bit [23:16] - x_18[4n+2]
//                  bit [31:24] - x_18[4n+3]
// 0x0b8 ~
// 0x0bf : Memory 'x_19' (4 * 8b)
//         Word n : bit [ 7: 0] - x_19[4n]
//                  bit [15: 8] - x_19[4n+1]
//                  bit [23:16] - x_19[4n+2]
//                  bit [31:24] - x_19[4n+3]
// 0x0c0 ~
// 0x0c7 : Memory 'x_20' (4 * 8b)
//         Word n : bit [ 7: 0] - x_20[4n]
//                  bit [15: 8] - x_20[4n+1]
//                  bit [23:16] - x_20[4n+2]
//                  bit [31:24] - x_20[4n+3]
// 0x0c8 ~
// 0x0cf : Memory 'x_21' (4 * 8b)
//         Word n : bit [ 7: 0] - x_21[4n]
//                  bit [15: 8] - x_21[4n+1]
//                  bit [23:16] - x_21[4n+2]
//                  bit [31:24] - x_21[4n+3]
// 0x0d0 ~
// 0x0d7 : Memory 'x_22' (4 * 8b)
//         Word n : bit [ 7: 0] - x_22[4n]
//                  bit [15: 8] - x_22[4n+1]
//                  bit [23:16] - x_22[4n+2]
//                  bit [31:24] - x_22[4n+3]
// 0x0d8 ~
// 0x0df : Memory 'x_23' (4 * 8b)
//         Word n : bit [ 7: 0] - x_23[4n]
//                  bit [15: 8] - x_23[4n+1]
//                  bit [23:16] - x_23[4n+2]
//                  bit [31:24] - x_23[4n+3]
// 0x0e0 ~
// 0x0e7 : Memory 'x_24' (4 * 8b)
//         Word n : bit [ 7: 0] - x_24[4n]
//                  bit [15: 8] - x_24[4n+1]
//                  bit [23:16] - x_24[4n+2]
//                  bit [31:24] - x_24[4n+3]
// 0x0e8 ~
// 0x0ef : Memory 'x_25' (4 * 8b)
//         Word n : bit [ 7: 0] - x_25[4n]
//                  bit [15: 8] - x_25[4n+1]
//                  bit [23:16] - x_25[4n+2]
//                  bit [31:24] - x_25[4n+3]
// 0x0f0 ~
// 0x0f7 : Memory 'x_26' (4 * 8b)
//         Word n : bit [ 7: 0] - x_26[4n]
//                  bit [15: 8] - x_26[4n+1]
//                  bit [23:16] - x_26[4n+2]
//                  bit [31:24] - x_26[4n+3]
// 0x0f8 ~
// 0x0ff : Memory 'x_27' (4 * 8b)
//         Word n : bit [ 7: 0] - x_27[4n]
//                  bit [15: 8] - x_27[4n+1]
//                  bit [23:16] - x_27[4n+2]
//                  bit [31:24] - x_27[4n+3]
// 0x100 ~
// 0x107 : Memory 'x_28' (4 * 8b)
//         Word n : bit [ 7: 0] - x_28[4n]
//                  bit [15: 8] - x_28[4n+1]
//                  bit [23:16] - x_28[4n+2]
//                  bit [31:24] - x_28[4n+3]
// 0x108 ~
// 0x10f : Memory 'x_29' (4 * 8b)
//         Word n : bit [ 7: 0] - x_29[4n]
//                  bit [15: 8] - x_29[4n+1]
//                  bit [23:16] - x_29[4n+2]
//                  bit [31:24] - x_29[4n+3]
// 0x110 ~
// 0x117 : Memory 'x_30' (4 * 8b)
//         Word n : bit [ 7: 0] - x_30[4n]
//                  bit [15: 8] - x_30[4n+1]
//                  bit [23:16] - x_30[4n+2]
//                  bit [31:24] - x_30[4n+3]
// 0x118 ~
// 0x11f : Memory 'x_31' (4 * 8b)
//         Word n : bit [ 7: 0] - x_31[4n]
//                  bit [15: 8] - x_31[4n+1]
//                  bit [23:16] - x_31[4n+2]
//                  bit [31:24] - x_31[4n+3]
// 0x120 ~
// 0x127 : Memory 'x_32' (4 * 8b)
//         Word n : bit [ 7: 0] - x_32[4n]
//                  bit [15: 8] - x_32[4n+1]
//                  bit [23:16] - x_32[4n+2]
//                  bit [31:24] - x_32[4n+3]
// 0x128 ~
// 0x12f : Memory 'x_33' (4 * 8b)
//         Word n : bit [ 7: 0] - x_33[4n]
//                  bit [15: 8] - x_33[4n+1]
//                  bit [23:16] - x_33[4n+2]
//                  bit [31:24] - x_33[4n+3]
// 0x130 ~
// 0x137 : Memory 'x_34' (4 * 8b)
//         Word n : bit [ 7: 0] - x_34[4n]
//                  bit [15: 8] - x_34[4n+1]
//                  bit [23:16] - x_34[4n+2]
//                  bit [31:24] - x_34[4n+3]
// 0x138 ~
// 0x13f : Memory 'x_35' (4 * 8b)
//         Word n : bit [ 7: 0] - x_35[4n]
//                  bit [15: 8] - x_35[4n+1]
//                  bit [23:16] - x_35[4n+2]
//                  bit [31:24] - x_35[4n+3]
// 0x140 ~
// 0x147 : Memory 'x_36' (4 * 8b)
//         Word n : bit [ 7: 0] - x_36[4n]
//                  bit [15: 8] - x_36[4n+1]
//                  bit [23:16] - x_36[4n+2]
//                  bit [31:24] - x_36[4n+3]
// 0x148 ~
// 0x14f : Memory 'x_37' (4 * 8b)
//         Word n : bit [ 7: 0] - x_37[4n]
//                  bit [15: 8] - x_37[4n+1]
//                  bit [23:16] - x_37[4n+2]
//                  bit [31:24] - x_37[4n+3]
// 0x150 ~
// 0x157 : Memory 'x_38' (4 * 8b)
//         Word n : bit [ 7: 0] - x_38[4n]
//                  bit [15: 8] - x_38[4n+1]
//                  bit [23:16] - x_38[4n+2]
//                  bit [31:24] - x_38[4n+3]
// 0x158 ~
// 0x15f : Memory 'x_39' (4 * 8b)
//         Word n : bit [ 7: 0] - x_39[4n]
//                  bit [15: 8] - x_39[4n+1]
//                  bit [23:16] - x_39[4n+2]
//                  bit [31:24] - x_39[4n+3]
// 0x160 ~
// 0x167 : Memory 'x_40' (4 * 8b)
//         Word n : bit [ 7: 0] - x_40[4n]
//                  bit [15: 8] - x_40[4n+1]
//                  bit [23:16] - x_40[4n+2]
//                  bit [31:24] - x_40[4n+3]
// 0x168 ~
// 0x16f : Memory 'x_41' (4 * 8b)
//         Word n : bit [ 7: 0] - x_41[4n]
//                  bit [15: 8] - x_41[4n+1]
//                  bit [23:16] - x_41[4n+2]
//                  bit [31:24] - x_41[4n+3]
// 0x170 ~
// 0x177 : Memory 'x_42' (4 * 8b)
//         Word n : bit [ 7: 0] - x_42[4n]
//                  bit [15: 8] - x_42[4n+1]
//                  bit [23:16] - x_42[4n+2]
//                  bit [31:24] - x_42[4n+3]
// 0x178 ~
// 0x17f : Memory 'x_43' (4 * 8b)
//         Word n : bit [ 7: 0] - x_43[4n]
//                  bit [15: 8] - x_43[4n+1]
//                  bit [23:16] - x_43[4n+2]
//                  bit [31:24] - x_43[4n+3]
// 0x180 ~
// 0x187 : Memory 'x_44' (4 * 8b)
//         Word n : bit [ 7: 0] - x_44[4n]
//                  bit [15: 8] - x_44[4n+1]
//                  bit [23:16] - x_44[4n+2]
//                  bit [31:24] - x_44[4n+3]
// 0x188 ~
// 0x18f : Memory 'x_45' (4 * 8b)
//         Word n : bit [ 7: 0] - x_45[4n]
//                  bit [15: 8] - x_45[4n+1]
//                  bit [23:16] - x_45[4n+2]
//                  bit [31:24] - x_45[4n+3]
// 0x190 ~
// 0x197 : Memory 'x_46' (4 * 8b)
//         Word n : bit [ 7: 0] - x_46[4n]
//                  bit [15: 8] - x_46[4n+1]
//                  bit [23:16] - x_46[4n+2]
//                  bit [31:24] - x_46[4n+3]
// 0x198 ~
// 0x19f : Memory 'x_47' (4 * 8b)
//         Word n : bit [ 7: 0] - x_47[4n]
//                  bit [15: 8] - x_47[4n+1]
//                  bit [23:16] - x_47[4n+2]
//                  bit [31:24] - x_47[4n+3]
// 0x1a0 ~
// 0x1a7 : Memory 'x_48' (4 * 8b)
//         Word n : bit [ 7: 0] - x_48[4n]
//                  bit [15: 8] - x_48[4n+1]
//                  bit [23:16] - x_48[4n+2]
//                  bit [31:24] - x_48[4n+3]
// 0x1a8 ~
// 0x1af : Memory 'x_49' (4 * 8b)
//         Word n : bit [ 7: 0] - x_49[4n]
//                  bit [15: 8] - x_49[4n+1]
//                  bit [23:16] - x_49[4n+2]
//                  bit [31:24] - x_49[4n+3]
// 0x1b0 ~
// 0x1b7 : Memory 'x_50' (4 * 8b)
//         Word n : bit [ 7: 0] - x_50[4n]
//                  bit [15: 8] - x_50[4n+1]
//                  bit [23:16] - x_50[4n+2]
//                  bit [31:24] - x_50[4n+3]
// 0x1b8 ~
// 0x1bf : Memory 'x_51' (4 * 8b)
//         Word n : bit [ 7: 0] - x_51[4n]
//                  bit [15: 8] - x_51[4n+1]
//                  bit [23:16] - x_51[4n+2]
//                  bit [31:24] - x_51[4n+3]
// 0x1c0 ~
// 0x1c7 : Memory 'x_52' (4 * 8b)
//         Word n : bit [ 7: 0] - x_52[4n]
//                  bit [15: 8] - x_52[4n+1]
//                  bit [23:16] - x_52[4n+2]
//                  bit [31:24] - x_52[4n+3]
// 0x1c8 ~
// 0x1cf : Memory 'x_53' (4 * 8b)
//         Word n : bit [ 7: 0] - x_53[4n]
//                  bit [15: 8] - x_53[4n+1]
//                  bit [23:16] - x_53[4n+2]
//                  bit [31:24] - x_53[4n+3]
// 0x1d0 ~
// 0x1d7 : Memory 'x_54' (4 * 8b)
//         Word n : bit [ 7: 0] - x_54[4n]
//                  bit [15: 8] - x_54[4n+1]
//                  bit [23:16] - x_54[4n+2]
//                  bit [31:24] - x_54[4n+3]
// 0x1d8 ~
// 0x1df : Memory 'x_55' (4 * 8b)
//         Word n : bit [ 7: 0] - x_55[4n]
//                  bit [15: 8] - x_55[4n+1]
//                  bit [23:16] - x_55[4n+2]
//                  bit [31:24] - x_55[4n+3]
// 0x1e0 ~
// 0x1e7 : Memory 'x_56' (4 * 8b)
//         Word n : bit [ 7: 0] - x_56[4n]
//                  bit [15: 8] - x_56[4n+1]
//                  bit [23:16] - x_56[4n+2]
//                  bit [31:24] - x_56[4n+3]
// 0x1e8 ~
// 0x1ef : Memory 'x_57' (4 * 8b)
//         Word n : bit [ 7: 0] - x_57[4n]
//                  bit [15: 8] - x_57[4n+1]
//                  bit [23:16] - x_57[4n+2]
//                  bit [31:24] - x_57[4n+3]
// 0x1f0 ~
// 0x1f7 : Memory 'x_58' (4 * 8b)
//         Word n : bit [ 7: 0] - x_58[4n]
//                  bit [15: 8] - x_58[4n+1]
//                  bit [23:16] - x_58[4n+2]
//                  bit [31:24] - x_58[4n+3]
// 0x1f8 ~
// 0x1ff : Memory 'x_59' (4 * 8b)
//         Word n : bit [ 7: 0] - x_59[4n]
//                  bit [15: 8] - x_59[4n+1]
//                  bit [23:16] - x_59[4n+2]
//                  bit [31:24] - x_59[4n+3]
// 0x200 ~
// 0x207 : Memory 'x_60' (4 * 8b)
//         Word n : bit [ 7: 0] - x_60[4n]
//                  bit [15: 8] - x_60[4n+1]
//                  bit [23:16] - x_60[4n+2]
//                  bit [31:24] - x_60[4n+3]
// 0x208 ~
// 0x20f : Memory 'x_61' (4 * 8b)
//         Word n : bit [ 7: 0] - x_61[4n]
//                  bit [15: 8] - x_61[4n+1]
//                  bit [23:16] - x_61[4n+2]
//                  bit [31:24] - x_61[4n+3]
// 0x210 ~
// 0x217 : Memory 'x_62' (4 * 8b)
//         Word n : bit [ 7: 0] - x_62[4n]
//                  bit [15: 8] - x_62[4n+1]
//                  bit [23:16] - x_62[4n+2]
//                  bit [31:24] - x_62[4n+3]
// 0x218 ~
// 0x21f : Memory 'x_63' (4 * 8b)
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
#define XEUCHW_CONTROL_ADDR_X_0_HIGH    0x027
#define XEUCHW_CONTROL_WIDTH_X_0        8
#define XEUCHW_CONTROL_DEPTH_X_0        4
#define XEUCHW_CONTROL_ADDR_X_1_BASE    0x028
#define XEUCHW_CONTROL_ADDR_X_1_HIGH    0x02f
#define XEUCHW_CONTROL_WIDTH_X_1        8
#define XEUCHW_CONTROL_DEPTH_X_1        4
#define XEUCHW_CONTROL_ADDR_X_2_BASE    0x030
#define XEUCHW_CONTROL_ADDR_X_2_HIGH    0x037
#define XEUCHW_CONTROL_WIDTH_X_2        8
#define XEUCHW_CONTROL_DEPTH_X_2        4
#define XEUCHW_CONTROL_ADDR_X_3_BASE    0x038
#define XEUCHW_CONTROL_ADDR_X_3_HIGH    0x03f
#define XEUCHW_CONTROL_WIDTH_X_3        8
#define XEUCHW_CONTROL_DEPTH_X_3        4
#define XEUCHW_CONTROL_ADDR_X_4_BASE    0x040
#define XEUCHW_CONTROL_ADDR_X_4_HIGH    0x047
#define XEUCHW_CONTROL_WIDTH_X_4        8
#define XEUCHW_CONTROL_DEPTH_X_4        4
#define XEUCHW_CONTROL_ADDR_X_5_BASE    0x048
#define XEUCHW_CONTROL_ADDR_X_5_HIGH    0x04f
#define XEUCHW_CONTROL_WIDTH_X_5        8
#define XEUCHW_CONTROL_DEPTH_X_5        4
#define XEUCHW_CONTROL_ADDR_X_6_BASE    0x050
#define XEUCHW_CONTROL_ADDR_X_6_HIGH    0x057
#define XEUCHW_CONTROL_WIDTH_X_6        8
#define XEUCHW_CONTROL_DEPTH_X_6        4
#define XEUCHW_CONTROL_ADDR_X_7_BASE    0x058
#define XEUCHW_CONTROL_ADDR_X_7_HIGH    0x05f
#define XEUCHW_CONTROL_WIDTH_X_7        8
#define XEUCHW_CONTROL_DEPTH_X_7        4
#define XEUCHW_CONTROL_ADDR_X_8_BASE    0x060
#define XEUCHW_CONTROL_ADDR_X_8_HIGH    0x067
#define XEUCHW_CONTROL_WIDTH_X_8        8
#define XEUCHW_CONTROL_DEPTH_X_8        4
#define XEUCHW_CONTROL_ADDR_X_9_BASE    0x068
#define XEUCHW_CONTROL_ADDR_X_9_HIGH    0x06f
#define XEUCHW_CONTROL_WIDTH_X_9        8
#define XEUCHW_CONTROL_DEPTH_X_9        4
#define XEUCHW_CONTROL_ADDR_X_10_BASE   0x070
#define XEUCHW_CONTROL_ADDR_X_10_HIGH   0x077
#define XEUCHW_CONTROL_WIDTH_X_10       8
#define XEUCHW_CONTROL_DEPTH_X_10       4
#define XEUCHW_CONTROL_ADDR_X_11_BASE   0x078
#define XEUCHW_CONTROL_ADDR_X_11_HIGH   0x07f
#define XEUCHW_CONTROL_WIDTH_X_11       8
#define XEUCHW_CONTROL_DEPTH_X_11       4
#define XEUCHW_CONTROL_ADDR_X_12_BASE   0x080
#define XEUCHW_CONTROL_ADDR_X_12_HIGH   0x087
#define XEUCHW_CONTROL_WIDTH_X_12       8
#define XEUCHW_CONTROL_DEPTH_X_12       4
#define XEUCHW_CONTROL_ADDR_X_13_BASE   0x088
#define XEUCHW_CONTROL_ADDR_X_13_HIGH   0x08f
#define XEUCHW_CONTROL_WIDTH_X_13       8
#define XEUCHW_CONTROL_DEPTH_X_13       4
#define XEUCHW_CONTROL_ADDR_X_14_BASE   0x090
#define XEUCHW_CONTROL_ADDR_X_14_HIGH   0x097
#define XEUCHW_CONTROL_WIDTH_X_14       8
#define XEUCHW_CONTROL_DEPTH_X_14       4
#define XEUCHW_CONTROL_ADDR_X_15_BASE   0x098
#define XEUCHW_CONTROL_ADDR_X_15_HIGH   0x09f
#define XEUCHW_CONTROL_WIDTH_X_15       8
#define XEUCHW_CONTROL_DEPTH_X_15       4
#define XEUCHW_CONTROL_ADDR_X_16_BASE   0x0a0
#define XEUCHW_CONTROL_ADDR_X_16_HIGH   0x0a7
#define XEUCHW_CONTROL_WIDTH_X_16       8
#define XEUCHW_CONTROL_DEPTH_X_16       4
#define XEUCHW_CONTROL_ADDR_X_17_BASE   0x0a8
#define XEUCHW_CONTROL_ADDR_X_17_HIGH   0x0af
#define XEUCHW_CONTROL_WIDTH_X_17       8
#define XEUCHW_CONTROL_DEPTH_X_17       4
#define XEUCHW_CONTROL_ADDR_X_18_BASE   0x0b0
#define XEUCHW_CONTROL_ADDR_X_18_HIGH   0x0b7
#define XEUCHW_CONTROL_WIDTH_X_18       8
#define XEUCHW_CONTROL_DEPTH_X_18       4
#define XEUCHW_CONTROL_ADDR_X_19_BASE   0x0b8
#define XEUCHW_CONTROL_ADDR_X_19_HIGH   0x0bf
#define XEUCHW_CONTROL_WIDTH_X_19       8
#define XEUCHW_CONTROL_DEPTH_X_19       4
#define XEUCHW_CONTROL_ADDR_X_20_BASE   0x0c0
#define XEUCHW_CONTROL_ADDR_X_20_HIGH   0x0c7
#define XEUCHW_CONTROL_WIDTH_X_20       8
#define XEUCHW_CONTROL_DEPTH_X_20       4
#define XEUCHW_CONTROL_ADDR_X_21_BASE   0x0c8
#define XEUCHW_CONTROL_ADDR_X_21_HIGH   0x0cf
#define XEUCHW_CONTROL_WIDTH_X_21       8
#define XEUCHW_CONTROL_DEPTH_X_21       4
#define XEUCHW_CONTROL_ADDR_X_22_BASE   0x0d0
#define XEUCHW_CONTROL_ADDR_X_22_HIGH   0x0d7
#define XEUCHW_CONTROL_WIDTH_X_22       8
#define XEUCHW_CONTROL_DEPTH_X_22       4
#define XEUCHW_CONTROL_ADDR_X_23_BASE   0x0d8
#define XEUCHW_CONTROL_ADDR_X_23_HIGH   0x0df
#define XEUCHW_CONTROL_WIDTH_X_23       8
#define XEUCHW_CONTROL_DEPTH_X_23       4
#define XEUCHW_CONTROL_ADDR_X_24_BASE   0x0e0
#define XEUCHW_CONTROL_ADDR_X_24_HIGH   0x0e7
#define XEUCHW_CONTROL_WIDTH_X_24       8
#define XEUCHW_CONTROL_DEPTH_X_24       4
#define XEUCHW_CONTROL_ADDR_X_25_BASE   0x0e8
#define XEUCHW_CONTROL_ADDR_X_25_HIGH   0x0ef
#define XEUCHW_CONTROL_WIDTH_X_25       8
#define XEUCHW_CONTROL_DEPTH_X_25       4
#define XEUCHW_CONTROL_ADDR_X_26_BASE   0x0f0
#define XEUCHW_CONTROL_ADDR_X_26_HIGH   0x0f7
#define XEUCHW_CONTROL_WIDTH_X_26       8
#define XEUCHW_CONTROL_DEPTH_X_26       4
#define XEUCHW_CONTROL_ADDR_X_27_BASE   0x0f8
#define XEUCHW_CONTROL_ADDR_X_27_HIGH   0x0ff
#define XEUCHW_CONTROL_WIDTH_X_27       8
#define XEUCHW_CONTROL_DEPTH_X_27       4
#define XEUCHW_CONTROL_ADDR_X_28_BASE   0x100
#define XEUCHW_CONTROL_ADDR_X_28_HIGH   0x107
#define XEUCHW_CONTROL_WIDTH_X_28       8
#define XEUCHW_CONTROL_DEPTH_X_28       4
#define XEUCHW_CONTROL_ADDR_X_29_BASE   0x108
#define XEUCHW_CONTROL_ADDR_X_29_HIGH   0x10f
#define XEUCHW_CONTROL_WIDTH_X_29       8
#define XEUCHW_CONTROL_DEPTH_X_29       4
#define XEUCHW_CONTROL_ADDR_X_30_BASE   0x110
#define XEUCHW_CONTROL_ADDR_X_30_HIGH   0x117
#define XEUCHW_CONTROL_WIDTH_X_30       8
#define XEUCHW_CONTROL_DEPTH_X_30       4
#define XEUCHW_CONTROL_ADDR_X_31_BASE   0x118
#define XEUCHW_CONTROL_ADDR_X_31_HIGH   0x11f
#define XEUCHW_CONTROL_WIDTH_X_31       8
#define XEUCHW_CONTROL_DEPTH_X_31       4
#define XEUCHW_CONTROL_ADDR_X_32_BASE   0x120
#define XEUCHW_CONTROL_ADDR_X_32_HIGH   0x127
#define XEUCHW_CONTROL_WIDTH_X_32       8
#define XEUCHW_CONTROL_DEPTH_X_32       4
#define XEUCHW_CONTROL_ADDR_X_33_BASE   0x128
#define XEUCHW_CONTROL_ADDR_X_33_HIGH   0x12f
#define XEUCHW_CONTROL_WIDTH_X_33       8
#define XEUCHW_CONTROL_DEPTH_X_33       4
#define XEUCHW_CONTROL_ADDR_X_34_BASE   0x130
#define XEUCHW_CONTROL_ADDR_X_34_HIGH   0x137
#define XEUCHW_CONTROL_WIDTH_X_34       8
#define XEUCHW_CONTROL_DEPTH_X_34       4
#define XEUCHW_CONTROL_ADDR_X_35_BASE   0x138
#define XEUCHW_CONTROL_ADDR_X_35_HIGH   0x13f
#define XEUCHW_CONTROL_WIDTH_X_35       8
#define XEUCHW_CONTROL_DEPTH_X_35       4
#define XEUCHW_CONTROL_ADDR_X_36_BASE   0x140
#define XEUCHW_CONTROL_ADDR_X_36_HIGH   0x147
#define XEUCHW_CONTROL_WIDTH_X_36       8
#define XEUCHW_CONTROL_DEPTH_X_36       4
#define XEUCHW_CONTROL_ADDR_X_37_BASE   0x148
#define XEUCHW_CONTROL_ADDR_X_37_HIGH   0x14f
#define XEUCHW_CONTROL_WIDTH_X_37       8
#define XEUCHW_CONTROL_DEPTH_X_37       4
#define XEUCHW_CONTROL_ADDR_X_38_BASE   0x150
#define XEUCHW_CONTROL_ADDR_X_38_HIGH   0x157
#define XEUCHW_CONTROL_WIDTH_X_38       8
#define XEUCHW_CONTROL_DEPTH_X_38       4
#define XEUCHW_CONTROL_ADDR_X_39_BASE   0x158
#define XEUCHW_CONTROL_ADDR_X_39_HIGH   0x15f
#define XEUCHW_CONTROL_WIDTH_X_39       8
#define XEUCHW_CONTROL_DEPTH_X_39       4
#define XEUCHW_CONTROL_ADDR_X_40_BASE   0x160
#define XEUCHW_CONTROL_ADDR_X_40_HIGH   0x167
#define XEUCHW_CONTROL_WIDTH_X_40       8
#define XEUCHW_CONTROL_DEPTH_X_40       4
#define XEUCHW_CONTROL_ADDR_X_41_BASE   0x168
#define XEUCHW_CONTROL_ADDR_X_41_HIGH   0x16f
#define XEUCHW_CONTROL_WIDTH_X_41       8
#define XEUCHW_CONTROL_DEPTH_X_41       4
#define XEUCHW_CONTROL_ADDR_X_42_BASE   0x170
#define XEUCHW_CONTROL_ADDR_X_42_HIGH   0x177
#define XEUCHW_CONTROL_WIDTH_X_42       8
#define XEUCHW_CONTROL_DEPTH_X_42       4
#define XEUCHW_CONTROL_ADDR_X_43_BASE   0x178
#define XEUCHW_CONTROL_ADDR_X_43_HIGH   0x17f
#define XEUCHW_CONTROL_WIDTH_X_43       8
#define XEUCHW_CONTROL_DEPTH_X_43       4
#define XEUCHW_CONTROL_ADDR_X_44_BASE   0x180
#define XEUCHW_CONTROL_ADDR_X_44_HIGH   0x187
#define XEUCHW_CONTROL_WIDTH_X_44       8
#define XEUCHW_CONTROL_DEPTH_X_44       4
#define XEUCHW_CONTROL_ADDR_X_45_BASE   0x188
#define XEUCHW_CONTROL_ADDR_X_45_HIGH   0x18f
#define XEUCHW_CONTROL_WIDTH_X_45       8
#define XEUCHW_CONTROL_DEPTH_X_45       4
#define XEUCHW_CONTROL_ADDR_X_46_BASE   0x190
#define XEUCHW_CONTROL_ADDR_X_46_HIGH   0x197
#define XEUCHW_CONTROL_WIDTH_X_46       8
#define XEUCHW_CONTROL_DEPTH_X_46       4
#define XEUCHW_CONTROL_ADDR_X_47_BASE   0x198
#define XEUCHW_CONTROL_ADDR_X_47_HIGH   0x19f
#define XEUCHW_CONTROL_WIDTH_X_47       8
#define XEUCHW_CONTROL_DEPTH_X_47       4
#define XEUCHW_CONTROL_ADDR_X_48_BASE   0x1a0
#define XEUCHW_CONTROL_ADDR_X_48_HIGH   0x1a7
#define XEUCHW_CONTROL_WIDTH_X_48       8
#define XEUCHW_CONTROL_DEPTH_X_48       4
#define XEUCHW_CONTROL_ADDR_X_49_BASE   0x1a8
#define XEUCHW_CONTROL_ADDR_X_49_HIGH   0x1af
#define XEUCHW_CONTROL_WIDTH_X_49       8
#define XEUCHW_CONTROL_DEPTH_X_49       4
#define XEUCHW_CONTROL_ADDR_X_50_BASE   0x1b0
#define XEUCHW_CONTROL_ADDR_X_50_HIGH   0x1b7
#define XEUCHW_CONTROL_WIDTH_X_50       8
#define XEUCHW_CONTROL_DEPTH_X_50       4
#define XEUCHW_CONTROL_ADDR_X_51_BASE   0x1b8
#define XEUCHW_CONTROL_ADDR_X_51_HIGH   0x1bf
#define XEUCHW_CONTROL_WIDTH_X_51       8
#define XEUCHW_CONTROL_DEPTH_X_51       4
#define XEUCHW_CONTROL_ADDR_X_52_BASE   0x1c0
#define XEUCHW_CONTROL_ADDR_X_52_HIGH   0x1c7
#define XEUCHW_CONTROL_WIDTH_X_52       8
#define XEUCHW_CONTROL_DEPTH_X_52       4
#define XEUCHW_CONTROL_ADDR_X_53_BASE   0x1c8
#define XEUCHW_CONTROL_ADDR_X_53_HIGH   0x1cf
#define XEUCHW_CONTROL_WIDTH_X_53       8
#define XEUCHW_CONTROL_DEPTH_X_53       4
#define XEUCHW_CONTROL_ADDR_X_54_BASE   0x1d0
#define XEUCHW_CONTROL_ADDR_X_54_HIGH   0x1d7
#define XEUCHW_CONTROL_WIDTH_X_54       8
#define XEUCHW_CONTROL_DEPTH_X_54       4
#define XEUCHW_CONTROL_ADDR_X_55_BASE   0x1d8
#define XEUCHW_CONTROL_ADDR_X_55_HIGH   0x1df
#define XEUCHW_CONTROL_WIDTH_X_55       8
#define XEUCHW_CONTROL_DEPTH_X_55       4
#define XEUCHW_CONTROL_ADDR_X_56_BASE   0x1e0
#define XEUCHW_CONTROL_ADDR_X_56_HIGH   0x1e7
#define XEUCHW_CONTROL_WIDTH_X_56       8
#define XEUCHW_CONTROL_DEPTH_X_56       4
#define XEUCHW_CONTROL_ADDR_X_57_BASE   0x1e8
#define XEUCHW_CONTROL_ADDR_X_57_HIGH   0x1ef
#define XEUCHW_CONTROL_WIDTH_X_57       8
#define XEUCHW_CONTROL_DEPTH_X_57       4
#define XEUCHW_CONTROL_ADDR_X_58_BASE   0x1f0
#define XEUCHW_CONTROL_ADDR_X_58_HIGH   0x1f7
#define XEUCHW_CONTROL_WIDTH_X_58       8
#define XEUCHW_CONTROL_DEPTH_X_58       4
#define XEUCHW_CONTROL_ADDR_X_59_BASE   0x1f8
#define XEUCHW_CONTROL_ADDR_X_59_HIGH   0x1ff
#define XEUCHW_CONTROL_WIDTH_X_59       8
#define XEUCHW_CONTROL_DEPTH_X_59       4
#define XEUCHW_CONTROL_ADDR_X_60_BASE   0x200
#define XEUCHW_CONTROL_ADDR_X_60_HIGH   0x207
#define XEUCHW_CONTROL_WIDTH_X_60       8
#define XEUCHW_CONTROL_DEPTH_X_60       4
#define XEUCHW_CONTROL_ADDR_X_61_BASE   0x208
#define XEUCHW_CONTROL_ADDR_X_61_HIGH   0x20f
#define XEUCHW_CONTROL_WIDTH_X_61       8
#define XEUCHW_CONTROL_DEPTH_X_61       4
#define XEUCHW_CONTROL_ADDR_X_62_BASE   0x210
#define XEUCHW_CONTROL_ADDR_X_62_HIGH   0x217
#define XEUCHW_CONTROL_WIDTH_X_62       8
#define XEUCHW_CONTROL_DEPTH_X_62       4
#define XEUCHW_CONTROL_ADDR_X_63_BASE   0x218
#define XEUCHW_CONTROL_ADDR_X_63_HIGH   0x21f
#define XEUCHW_CONTROL_WIDTH_X_63       8
#define XEUCHW_CONTROL_DEPTH_X_63       4

