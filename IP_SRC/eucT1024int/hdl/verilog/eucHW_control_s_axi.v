// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module eucHW_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 12,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    input  wire [31:0]                   y_sqrt,
    input  wire                          y_sqrt_ap_vld,
    input  wire [4:0]                    x_0_address0,
    input  wire                          x_0_ce0,
    output wire [7:0]                    x_0_q0,
    input  wire [4:0]                    x_1_address0,
    input  wire                          x_1_ce0,
    output wire [7:0]                    x_1_q0,
    input  wire [4:0]                    x_2_address0,
    input  wire                          x_2_ce0,
    output wire [7:0]                    x_2_q0,
    input  wire [4:0]                    x_3_address0,
    input  wire                          x_3_ce0,
    output wire [7:0]                    x_3_q0,
    input  wire [4:0]                    x_4_address0,
    input  wire                          x_4_ce0,
    output wire [7:0]                    x_4_q0,
    input  wire [4:0]                    x_5_address0,
    input  wire                          x_5_ce0,
    output wire [7:0]                    x_5_q0,
    input  wire [4:0]                    x_6_address0,
    input  wire                          x_6_ce0,
    output wire [7:0]                    x_6_q0,
    input  wire [4:0]                    x_7_address0,
    input  wire                          x_7_ce0,
    output wire [7:0]                    x_7_q0,
    input  wire [4:0]                    x_8_address0,
    input  wire                          x_8_ce0,
    output wire [7:0]                    x_8_q0,
    input  wire [4:0]                    x_9_address0,
    input  wire                          x_9_ce0,
    output wire [7:0]                    x_9_q0,
    input  wire [4:0]                    x_10_address0,
    input  wire                          x_10_ce0,
    output wire [7:0]                    x_10_q0,
    input  wire [4:0]                    x_11_address0,
    input  wire                          x_11_ce0,
    output wire [7:0]                    x_11_q0,
    input  wire [4:0]                    x_12_address0,
    input  wire                          x_12_ce0,
    output wire [7:0]                    x_12_q0,
    input  wire [4:0]                    x_13_address0,
    input  wire                          x_13_ce0,
    output wire [7:0]                    x_13_q0,
    input  wire [4:0]                    x_14_address0,
    input  wire                          x_14_ce0,
    output wire [7:0]                    x_14_q0,
    input  wire [4:0]                    x_15_address0,
    input  wire                          x_15_ce0,
    output wire [7:0]                    x_15_q0,
    input  wire [4:0]                    x_16_address0,
    input  wire                          x_16_ce0,
    output wire [7:0]                    x_16_q0,
    input  wire [4:0]                    x_17_address0,
    input  wire                          x_17_ce0,
    output wire [7:0]                    x_17_q0,
    input  wire [4:0]                    x_18_address0,
    input  wire                          x_18_ce0,
    output wire [7:0]                    x_18_q0,
    input  wire [4:0]                    x_19_address0,
    input  wire                          x_19_ce0,
    output wire [7:0]                    x_19_q0,
    input  wire [4:0]                    x_20_address0,
    input  wire                          x_20_ce0,
    output wire [7:0]                    x_20_q0,
    input  wire [4:0]                    x_21_address0,
    input  wire                          x_21_ce0,
    output wire [7:0]                    x_21_q0,
    input  wire [4:0]                    x_22_address0,
    input  wire                          x_22_ce0,
    output wire [7:0]                    x_22_q0,
    input  wire [4:0]                    x_23_address0,
    input  wire                          x_23_ce0,
    output wire [7:0]                    x_23_q0,
    input  wire [4:0]                    x_24_address0,
    input  wire                          x_24_ce0,
    output wire [7:0]                    x_24_q0,
    input  wire [4:0]                    x_25_address0,
    input  wire                          x_25_ce0,
    output wire [7:0]                    x_25_q0,
    input  wire [4:0]                    x_26_address0,
    input  wire                          x_26_ce0,
    output wire [7:0]                    x_26_q0,
    input  wire [4:0]                    x_27_address0,
    input  wire                          x_27_ce0,
    output wire [7:0]                    x_27_q0,
    input  wire [4:0]                    x_28_address0,
    input  wire                          x_28_ce0,
    output wire [7:0]                    x_28_q0,
    input  wire [4:0]                    x_29_address0,
    input  wire                          x_29_ce0,
    output wire [7:0]                    x_29_q0,
    input  wire [4:0]                    x_30_address0,
    input  wire                          x_30_ce0,
    output wire [7:0]                    x_30_q0,
    input  wire [4:0]                    x_31_address0,
    input  wire                          x_31_ce0,
    output wire [7:0]                    x_31_q0,
    input  wire [4:0]                    x_32_address0,
    input  wire                          x_32_ce0,
    output wire [7:0]                    x_32_q0,
    input  wire [4:0]                    x_33_address0,
    input  wire                          x_33_ce0,
    output wire [7:0]                    x_33_q0,
    input  wire [4:0]                    x_34_address0,
    input  wire                          x_34_ce0,
    output wire [7:0]                    x_34_q0,
    input  wire [4:0]                    x_35_address0,
    input  wire                          x_35_ce0,
    output wire [7:0]                    x_35_q0,
    input  wire [4:0]                    x_36_address0,
    input  wire                          x_36_ce0,
    output wire [7:0]                    x_36_q0,
    input  wire [4:0]                    x_37_address0,
    input  wire                          x_37_ce0,
    output wire [7:0]                    x_37_q0,
    input  wire [4:0]                    x_38_address0,
    input  wire                          x_38_ce0,
    output wire [7:0]                    x_38_q0,
    input  wire [4:0]                    x_39_address0,
    input  wire                          x_39_ce0,
    output wire [7:0]                    x_39_q0,
    input  wire [4:0]                    x_40_address0,
    input  wire                          x_40_ce0,
    output wire [7:0]                    x_40_q0,
    input  wire [4:0]                    x_41_address0,
    input  wire                          x_41_ce0,
    output wire [7:0]                    x_41_q0,
    input  wire [4:0]                    x_42_address0,
    input  wire                          x_42_ce0,
    output wire [7:0]                    x_42_q0,
    input  wire [4:0]                    x_43_address0,
    input  wire                          x_43_ce0,
    output wire [7:0]                    x_43_q0,
    input  wire [4:0]                    x_44_address0,
    input  wire                          x_44_ce0,
    output wire [7:0]                    x_44_q0,
    input  wire [4:0]                    x_45_address0,
    input  wire                          x_45_ce0,
    output wire [7:0]                    x_45_q0,
    input  wire [4:0]                    x_46_address0,
    input  wire                          x_46_ce0,
    output wire [7:0]                    x_46_q0,
    input  wire [4:0]                    x_47_address0,
    input  wire                          x_47_ce0,
    output wire [7:0]                    x_47_q0,
    input  wire [4:0]                    x_48_address0,
    input  wire                          x_48_ce0,
    output wire [7:0]                    x_48_q0,
    input  wire [4:0]                    x_49_address0,
    input  wire                          x_49_ce0,
    output wire [7:0]                    x_49_q0,
    input  wire [4:0]                    x_50_address0,
    input  wire                          x_50_ce0,
    output wire [7:0]                    x_50_q0,
    input  wire [4:0]                    x_51_address0,
    input  wire                          x_51_ce0,
    output wire [7:0]                    x_51_q0,
    input  wire [4:0]                    x_52_address0,
    input  wire                          x_52_ce0,
    output wire [7:0]                    x_52_q0,
    input  wire [4:0]                    x_53_address0,
    input  wire                          x_53_ce0,
    output wire [7:0]                    x_53_q0,
    input  wire [4:0]                    x_54_address0,
    input  wire                          x_54_ce0,
    output wire [7:0]                    x_54_q0,
    input  wire [4:0]                    x_55_address0,
    input  wire                          x_55_ce0,
    output wire [7:0]                    x_55_q0,
    input  wire [4:0]                    x_56_address0,
    input  wire                          x_56_ce0,
    output wire [7:0]                    x_56_q0,
    input  wire [4:0]                    x_57_address0,
    input  wire                          x_57_ce0,
    output wire [7:0]                    x_57_q0,
    input  wire [4:0]                    x_58_address0,
    input  wire                          x_58_ce0,
    output wire [7:0]                    x_58_q0,
    input  wire [4:0]                    x_59_address0,
    input  wire                          x_59_ce0,
    output wire [7:0]                    x_59_q0,
    input  wire [4:0]                    x_60_address0,
    input  wire                          x_60_ce0,
    output wire [7:0]                    x_60_q0,
    input  wire [4:0]                    x_61_address0,
    input  wire                          x_61_ce0,
    output wire [7:0]                    x_61_q0,
    input  wire [4:0]                    x_62_address0,
    input  wire                          x_62_ce0,
    output wire [7:0]                    x_62_q0,
    input  wire [4:0]                    x_63_address0,
    input  wire                          x_63_ce0,
    output wire [7:0]                    x_63_q0,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle,
    input  wire [0:0]                    ap_local_deadlock
);
//------------------------Address Info-------------------
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

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL       = 12'h000,
    ADDR_GIE           = 12'h004,
    ADDR_IER           = 12'h008,
    ADDR_ISR           = 12'h00c,
    ADDR_Y_SQRT_DATA_0 = 12'h010,
    ADDR_Y_SQRT_CTRL   = 12'h014,
    ADDR_X_0_BASE      = 12'h020,
    ADDR_X_0_HIGH      = 12'h03f,
    ADDR_X_1_BASE      = 12'h040,
    ADDR_X_1_HIGH      = 12'h05f,
    ADDR_X_2_BASE      = 12'h060,
    ADDR_X_2_HIGH      = 12'h07f,
    ADDR_X_3_BASE      = 12'h080,
    ADDR_X_3_HIGH      = 12'h09f,
    ADDR_X_4_BASE      = 12'h0a0,
    ADDR_X_4_HIGH      = 12'h0bf,
    ADDR_X_5_BASE      = 12'h0c0,
    ADDR_X_5_HIGH      = 12'h0df,
    ADDR_X_6_BASE      = 12'h0e0,
    ADDR_X_6_HIGH      = 12'h0ff,
    ADDR_X_7_BASE      = 12'h100,
    ADDR_X_7_HIGH      = 12'h11f,
    ADDR_X_8_BASE      = 12'h120,
    ADDR_X_8_HIGH      = 12'h13f,
    ADDR_X_9_BASE      = 12'h140,
    ADDR_X_9_HIGH      = 12'h15f,
    ADDR_X_10_BASE     = 12'h160,
    ADDR_X_10_HIGH     = 12'h17f,
    ADDR_X_11_BASE     = 12'h180,
    ADDR_X_11_HIGH     = 12'h19f,
    ADDR_X_12_BASE     = 12'h1a0,
    ADDR_X_12_HIGH     = 12'h1bf,
    ADDR_X_13_BASE     = 12'h1c0,
    ADDR_X_13_HIGH     = 12'h1df,
    ADDR_X_14_BASE     = 12'h1e0,
    ADDR_X_14_HIGH     = 12'h1ff,
    ADDR_X_15_BASE     = 12'h200,
    ADDR_X_15_HIGH     = 12'h21f,
    ADDR_X_16_BASE     = 12'h220,
    ADDR_X_16_HIGH     = 12'h23f,
    ADDR_X_17_BASE     = 12'h240,
    ADDR_X_17_HIGH     = 12'h25f,
    ADDR_X_18_BASE     = 12'h260,
    ADDR_X_18_HIGH     = 12'h27f,
    ADDR_X_19_BASE     = 12'h280,
    ADDR_X_19_HIGH     = 12'h29f,
    ADDR_X_20_BASE     = 12'h2a0,
    ADDR_X_20_HIGH     = 12'h2bf,
    ADDR_X_21_BASE     = 12'h2c0,
    ADDR_X_21_HIGH     = 12'h2df,
    ADDR_X_22_BASE     = 12'h2e0,
    ADDR_X_22_HIGH     = 12'h2ff,
    ADDR_X_23_BASE     = 12'h300,
    ADDR_X_23_HIGH     = 12'h31f,
    ADDR_X_24_BASE     = 12'h320,
    ADDR_X_24_HIGH     = 12'h33f,
    ADDR_X_25_BASE     = 12'h340,
    ADDR_X_25_HIGH     = 12'h35f,
    ADDR_X_26_BASE     = 12'h360,
    ADDR_X_26_HIGH     = 12'h37f,
    ADDR_X_27_BASE     = 12'h380,
    ADDR_X_27_HIGH     = 12'h39f,
    ADDR_X_28_BASE     = 12'h3a0,
    ADDR_X_28_HIGH     = 12'h3bf,
    ADDR_X_29_BASE     = 12'h3c0,
    ADDR_X_29_HIGH     = 12'h3df,
    ADDR_X_30_BASE     = 12'h3e0,
    ADDR_X_30_HIGH     = 12'h3ff,
    ADDR_X_31_BASE     = 12'h400,
    ADDR_X_31_HIGH     = 12'h41f,
    ADDR_X_32_BASE     = 12'h420,
    ADDR_X_32_HIGH     = 12'h43f,
    ADDR_X_33_BASE     = 12'h440,
    ADDR_X_33_HIGH     = 12'h45f,
    ADDR_X_34_BASE     = 12'h460,
    ADDR_X_34_HIGH     = 12'h47f,
    ADDR_X_35_BASE     = 12'h480,
    ADDR_X_35_HIGH     = 12'h49f,
    ADDR_X_36_BASE     = 12'h4a0,
    ADDR_X_36_HIGH     = 12'h4bf,
    ADDR_X_37_BASE     = 12'h4c0,
    ADDR_X_37_HIGH     = 12'h4df,
    ADDR_X_38_BASE     = 12'h4e0,
    ADDR_X_38_HIGH     = 12'h4ff,
    ADDR_X_39_BASE     = 12'h500,
    ADDR_X_39_HIGH     = 12'h51f,
    ADDR_X_40_BASE     = 12'h520,
    ADDR_X_40_HIGH     = 12'h53f,
    ADDR_X_41_BASE     = 12'h540,
    ADDR_X_41_HIGH     = 12'h55f,
    ADDR_X_42_BASE     = 12'h560,
    ADDR_X_42_HIGH     = 12'h57f,
    ADDR_X_43_BASE     = 12'h580,
    ADDR_X_43_HIGH     = 12'h59f,
    ADDR_X_44_BASE     = 12'h5a0,
    ADDR_X_44_HIGH     = 12'h5bf,
    ADDR_X_45_BASE     = 12'h5c0,
    ADDR_X_45_HIGH     = 12'h5df,
    ADDR_X_46_BASE     = 12'h5e0,
    ADDR_X_46_HIGH     = 12'h5ff,
    ADDR_X_47_BASE     = 12'h600,
    ADDR_X_47_HIGH     = 12'h61f,
    ADDR_X_48_BASE     = 12'h620,
    ADDR_X_48_HIGH     = 12'h63f,
    ADDR_X_49_BASE     = 12'h640,
    ADDR_X_49_HIGH     = 12'h65f,
    ADDR_X_50_BASE     = 12'h660,
    ADDR_X_50_HIGH     = 12'h67f,
    ADDR_X_51_BASE     = 12'h680,
    ADDR_X_51_HIGH     = 12'h69f,
    ADDR_X_52_BASE     = 12'h6a0,
    ADDR_X_52_HIGH     = 12'h6bf,
    ADDR_X_53_BASE     = 12'h6c0,
    ADDR_X_53_HIGH     = 12'h6df,
    ADDR_X_54_BASE     = 12'h6e0,
    ADDR_X_54_HIGH     = 12'h6ff,
    ADDR_X_55_BASE     = 12'h700,
    ADDR_X_55_HIGH     = 12'h71f,
    ADDR_X_56_BASE     = 12'h720,
    ADDR_X_56_HIGH     = 12'h73f,
    ADDR_X_57_BASE     = 12'h740,
    ADDR_X_57_HIGH     = 12'h75f,
    ADDR_X_58_BASE     = 12'h760,
    ADDR_X_58_HIGH     = 12'h77f,
    ADDR_X_59_BASE     = 12'h780,
    ADDR_X_59_HIGH     = 12'h79f,
    ADDR_X_60_BASE     = 12'h7a0,
    ADDR_X_60_HIGH     = 12'h7bf,
    ADDR_X_61_BASE     = 12'h7c0,
    ADDR_X_61_HIGH     = 12'h7df,
    ADDR_X_62_BASE     = 12'h7e0,
    ADDR_X_62_HIGH     = 12'h7ff,
    ADDR_X_63_BASE     = 12'h800,
    ADDR_X_63_HIGH     = 12'h81f,
    WRIDLE             = 2'd0,
    WRDATA             = 2'd1,
    WRRESP             = 2'd2,
    WRRESET            = 2'd3,
    RDIDLE             = 2'd0,
    RDDATA             = 2'd1,
    RDRESET            = 2'd2,
    ADDR_BITS                = 12;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle;
    reg                           int_ap_ready = 1'b0;
    wire                          task_ap_ready;
    reg                           int_ap_done = 1'b0;
    wire                          task_ap_done;
    reg                           int_task_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           auto_restart_status = 1'b0;
    wire                          auto_restart_done;
    reg                           int_gie = 1'b0;
    reg  [5:0]                    int_ier = 6'b0;
    reg  [5:0]                    int_isr = 6'b0;
    reg                           int_y_sqrt_ap_vld;
    reg  [31:0]                   int_y_sqrt = 'b0;
    // memory signals
    wire [2:0]                    int_x_0_address0;
    wire                          int_x_0_ce0;
    wire [31:0]                   int_x_0_q0;
    wire [2:0]                    int_x_0_address1;
    wire                          int_x_0_ce1;
    wire                          int_x_0_we1;
    wire [3:0]                    int_x_0_be1;
    wire [31:0]                   int_x_0_d1;
    wire [31:0]                   int_x_0_q1;
    reg                           int_x_0_read;
    reg                           int_x_0_write;
    reg  [1:0]                    int_x_0_shift0;
    wire [2:0]                    int_x_1_address0;
    wire                          int_x_1_ce0;
    wire [31:0]                   int_x_1_q0;
    wire [2:0]                    int_x_1_address1;
    wire                          int_x_1_ce1;
    wire                          int_x_1_we1;
    wire [3:0]                    int_x_1_be1;
    wire [31:0]                   int_x_1_d1;
    wire [31:0]                   int_x_1_q1;
    reg                           int_x_1_read;
    reg                           int_x_1_write;
    reg  [1:0]                    int_x_1_shift0;
    wire [2:0]                    int_x_2_address0;
    wire                          int_x_2_ce0;
    wire [31:0]                   int_x_2_q0;
    wire [2:0]                    int_x_2_address1;
    wire                          int_x_2_ce1;
    wire                          int_x_2_we1;
    wire [3:0]                    int_x_2_be1;
    wire [31:0]                   int_x_2_d1;
    wire [31:0]                   int_x_2_q1;
    reg                           int_x_2_read;
    reg                           int_x_2_write;
    reg  [1:0]                    int_x_2_shift0;
    wire [2:0]                    int_x_3_address0;
    wire                          int_x_3_ce0;
    wire [31:0]                   int_x_3_q0;
    wire [2:0]                    int_x_3_address1;
    wire                          int_x_3_ce1;
    wire                          int_x_3_we1;
    wire [3:0]                    int_x_3_be1;
    wire [31:0]                   int_x_3_d1;
    wire [31:0]                   int_x_3_q1;
    reg                           int_x_3_read;
    reg                           int_x_3_write;
    reg  [1:0]                    int_x_3_shift0;
    wire [2:0]                    int_x_4_address0;
    wire                          int_x_4_ce0;
    wire [31:0]                   int_x_4_q0;
    wire [2:0]                    int_x_4_address1;
    wire                          int_x_4_ce1;
    wire                          int_x_4_we1;
    wire [3:0]                    int_x_4_be1;
    wire [31:0]                   int_x_4_d1;
    wire [31:0]                   int_x_4_q1;
    reg                           int_x_4_read;
    reg                           int_x_4_write;
    reg  [1:0]                    int_x_4_shift0;
    wire [2:0]                    int_x_5_address0;
    wire                          int_x_5_ce0;
    wire [31:0]                   int_x_5_q0;
    wire [2:0]                    int_x_5_address1;
    wire                          int_x_5_ce1;
    wire                          int_x_5_we1;
    wire [3:0]                    int_x_5_be1;
    wire [31:0]                   int_x_5_d1;
    wire [31:0]                   int_x_5_q1;
    reg                           int_x_5_read;
    reg                           int_x_5_write;
    reg  [1:0]                    int_x_5_shift0;
    wire [2:0]                    int_x_6_address0;
    wire                          int_x_6_ce0;
    wire [31:0]                   int_x_6_q0;
    wire [2:0]                    int_x_6_address1;
    wire                          int_x_6_ce1;
    wire                          int_x_6_we1;
    wire [3:0]                    int_x_6_be1;
    wire [31:0]                   int_x_6_d1;
    wire [31:0]                   int_x_6_q1;
    reg                           int_x_6_read;
    reg                           int_x_6_write;
    reg  [1:0]                    int_x_6_shift0;
    wire [2:0]                    int_x_7_address0;
    wire                          int_x_7_ce0;
    wire [31:0]                   int_x_7_q0;
    wire [2:0]                    int_x_7_address1;
    wire                          int_x_7_ce1;
    wire                          int_x_7_we1;
    wire [3:0]                    int_x_7_be1;
    wire [31:0]                   int_x_7_d1;
    wire [31:0]                   int_x_7_q1;
    reg                           int_x_7_read;
    reg                           int_x_7_write;
    reg  [1:0]                    int_x_7_shift0;
    wire [2:0]                    int_x_8_address0;
    wire                          int_x_8_ce0;
    wire [31:0]                   int_x_8_q0;
    wire [2:0]                    int_x_8_address1;
    wire                          int_x_8_ce1;
    wire                          int_x_8_we1;
    wire [3:0]                    int_x_8_be1;
    wire [31:0]                   int_x_8_d1;
    wire [31:0]                   int_x_8_q1;
    reg                           int_x_8_read;
    reg                           int_x_8_write;
    reg  [1:0]                    int_x_8_shift0;
    wire [2:0]                    int_x_9_address0;
    wire                          int_x_9_ce0;
    wire [31:0]                   int_x_9_q0;
    wire [2:0]                    int_x_9_address1;
    wire                          int_x_9_ce1;
    wire                          int_x_9_we1;
    wire [3:0]                    int_x_9_be1;
    wire [31:0]                   int_x_9_d1;
    wire [31:0]                   int_x_9_q1;
    reg                           int_x_9_read;
    reg                           int_x_9_write;
    reg  [1:0]                    int_x_9_shift0;
    wire [2:0]                    int_x_10_address0;
    wire                          int_x_10_ce0;
    wire [31:0]                   int_x_10_q0;
    wire [2:0]                    int_x_10_address1;
    wire                          int_x_10_ce1;
    wire                          int_x_10_we1;
    wire [3:0]                    int_x_10_be1;
    wire [31:0]                   int_x_10_d1;
    wire [31:0]                   int_x_10_q1;
    reg                           int_x_10_read;
    reg                           int_x_10_write;
    reg  [1:0]                    int_x_10_shift0;
    wire [2:0]                    int_x_11_address0;
    wire                          int_x_11_ce0;
    wire [31:0]                   int_x_11_q0;
    wire [2:0]                    int_x_11_address1;
    wire                          int_x_11_ce1;
    wire                          int_x_11_we1;
    wire [3:0]                    int_x_11_be1;
    wire [31:0]                   int_x_11_d1;
    wire [31:0]                   int_x_11_q1;
    reg                           int_x_11_read;
    reg                           int_x_11_write;
    reg  [1:0]                    int_x_11_shift0;
    wire [2:0]                    int_x_12_address0;
    wire                          int_x_12_ce0;
    wire [31:0]                   int_x_12_q0;
    wire [2:0]                    int_x_12_address1;
    wire                          int_x_12_ce1;
    wire                          int_x_12_we1;
    wire [3:0]                    int_x_12_be1;
    wire [31:0]                   int_x_12_d1;
    wire [31:0]                   int_x_12_q1;
    reg                           int_x_12_read;
    reg                           int_x_12_write;
    reg  [1:0]                    int_x_12_shift0;
    wire [2:0]                    int_x_13_address0;
    wire                          int_x_13_ce0;
    wire [31:0]                   int_x_13_q0;
    wire [2:0]                    int_x_13_address1;
    wire                          int_x_13_ce1;
    wire                          int_x_13_we1;
    wire [3:0]                    int_x_13_be1;
    wire [31:0]                   int_x_13_d1;
    wire [31:0]                   int_x_13_q1;
    reg                           int_x_13_read;
    reg                           int_x_13_write;
    reg  [1:0]                    int_x_13_shift0;
    wire [2:0]                    int_x_14_address0;
    wire                          int_x_14_ce0;
    wire [31:0]                   int_x_14_q0;
    wire [2:0]                    int_x_14_address1;
    wire                          int_x_14_ce1;
    wire                          int_x_14_we1;
    wire [3:0]                    int_x_14_be1;
    wire [31:0]                   int_x_14_d1;
    wire [31:0]                   int_x_14_q1;
    reg                           int_x_14_read;
    reg                           int_x_14_write;
    reg  [1:0]                    int_x_14_shift0;
    wire [2:0]                    int_x_15_address0;
    wire                          int_x_15_ce0;
    wire [31:0]                   int_x_15_q0;
    wire [2:0]                    int_x_15_address1;
    wire                          int_x_15_ce1;
    wire                          int_x_15_we1;
    wire [3:0]                    int_x_15_be1;
    wire [31:0]                   int_x_15_d1;
    wire [31:0]                   int_x_15_q1;
    reg                           int_x_15_read;
    reg                           int_x_15_write;
    reg  [1:0]                    int_x_15_shift0;
    wire [2:0]                    int_x_16_address0;
    wire                          int_x_16_ce0;
    wire [31:0]                   int_x_16_q0;
    wire [2:0]                    int_x_16_address1;
    wire                          int_x_16_ce1;
    wire                          int_x_16_we1;
    wire [3:0]                    int_x_16_be1;
    wire [31:0]                   int_x_16_d1;
    wire [31:0]                   int_x_16_q1;
    reg                           int_x_16_read;
    reg                           int_x_16_write;
    reg  [1:0]                    int_x_16_shift0;
    wire [2:0]                    int_x_17_address0;
    wire                          int_x_17_ce0;
    wire [31:0]                   int_x_17_q0;
    wire [2:0]                    int_x_17_address1;
    wire                          int_x_17_ce1;
    wire                          int_x_17_we1;
    wire [3:0]                    int_x_17_be1;
    wire [31:0]                   int_x_17_d1;
    wire [31:0]                   int_x_17_q1;
    reg                           int_x_17_read;
    reg                           int_x_17_write;
    reg  [1:0]                    int_x_17_shift0;
    wire [2:0]                    int_x_18_address0;
    wire                          int_x_18_ce0;
    wire [31:0]                   int_x_18_q0;
    wire [2:0]                    int_x_18_address1;
    wire                          int_x_18_ce1;
    wire                          int_x_18_we1;
    wire [3:0]                    int_x_18_be1;
    wire [31:0]                   int_x_18_d1;
    wire [31:0]                   int_x_18_q1;
    reg                           int_x_18_read;
    reg                           int_x_18_write;
    reg  [1:0]                    int_x_18_shift0;
    wire [2:0]                    int_x_19_address0;
    wire                          int_x_19_ce0;
    wire [31:0]                   int_x_19_q0;
    wire [2:0]                    int_x_19_address1;
    wire                          int_x_19_ce1;
    wire                          int_x_19_we1;
    wire [3:0]                    int_x_19_be1;
    wire [31:0]                   int_x_19_d1;
    wire [31:0]                   int_x_19_q1;
    reg                           int_x_19_read;
    reg                           int_x_19_write;
    reg  [1:0]                    int_x_19_shift0;
    wire [2:0]                    int_x_20_address0;
    wire                          int_x_20_ce0;
    wire [31:0]                   int_x_20_q0;
    wire [2:0]                    int_x_20_address1;
    wire                          int_x_20_ce1;
    wire                          int_x_20_we1;
    wire [3:0]                    int_x_20_be1;
    wire [31:0]                   int_x_20_d1;
    wire [31:0]                   int_x_20_q1;
    reg                           int_x_20_read;
    reg                           int_x_20_write;
    reg  [1:0]                    int_x_20_shift0;
    wire [2:0]                    int_x_21_address0;
    wire                          int_x_21_ce0;
    wire [31:0]                   int_x_21_q0;
    wire [2:0]                    int_x_21_address1;
    wire                          int_x_21_ce1;
    wire                          int_x_21_we1;
    wire [3:0]                    int_x_21_be1;
    wire [31:0]                   int_x_21_d1;
    wire [31:0]                   int_x_21_q1;
    reg                           int_x_21_read;
    reg                           int_x_21_write;
    reg  [1:0]                    int_x_21_shift0;
    wire [2:0]                    int_x_22_address0;
    wire                          int_x_22_ce0;
    wire [31:0]                   int_x_22_q0;
    wire [2:0]                    int_x_22_address1;
    wire                          int_x_22_ce1;
    wire                          int_x_22_we1;
    wire [3:0]                    int_x_22_be1;
    wire [31:0]                   int_x_22_d1;
    wire [31:0]                   int_x_22_q1;
    reg                           int_x_22_read;
    reg                           int_x_22_write;
    reg  [1:0]                    int_x_22_shift0;
    wire [2:0]                    int_x_23_address0;
    wire                          int_x_23_ce0;
    wire [31:0]                   int_x_23_q0;
    wire [2:0]                    int_x_23_address1;
    wire                          int_x_23_ce1;
    wire                          int_x_23_we1;
    wire [3:0]                    int_x_23_be1;
    wire [31:0]                   int_x_23_d1;
    wire [31:0]                   int_x_23_q1;
    reg                           int_x_23_read;
    reg                           int_x_23_write;
    reg  [1:0]                    int_x_23_shift0;
    wire [2:0]                    int_x_24_address0;
    wire                          int_x_24_ce0;
    wire [31:0]                   int_x_24_q0;
    wire [2:0]                    int_x_24_address1;
    wire                          int_x_24_ce1;
    wire                          int_x_24_we1;
    wire [3:0]                    int_x_24_be1;
    wire [31:0]                   int_x_24_d1;
    wire [31:0]                   int_x_24_q1;
    reg                           int_x_24_read;
    reg                           int_x_24_write;
    reg  [1:0]                    int_x_24_shift0;
    wire [2:0]                    int_x_25_address0;
    wire                          int_x_25_ce0;
    wire [31:0]                   int_x_25_q0;
    wire [2:0]                    int_x_25_address1;
    wire                          int_x_25_ce1;
    wire                          int_x_25_we1;
    wire [3:0]                    int_x_25_be1;
    wire [31:0]                   int_x_25_d1;
    wire [31:0]                   int_x_25_q1;
    reg                           int_x_25_read;
    reg                           int_x_25_write;
    reg  [1:0]                    int_x_25_shift0;
    wire [2:0]                    int_x_26_address0;
    wire                          int_x_26_ce0;
    wire [31:0]                   int_x_26_q0;
    wire [2:0]                    int_x_26_address1;
    wire                          int_x_26_ce1;
    wire                          int_x_26_we1;
    wire [3:0]                    int_x_26_be1;
    wire [31:0]                   int_x_26_d1;
    wire [31:0]                   int_x_26_q1;
    reg                           int_x_26_read;
    reg                           int_x_26_write;
    reg  [1:0]                    int_x_26_shift0;
    wire [2:0]                    int_x_27_address0;
    wire                          int_x_27_ce0;
    wire [31:0]                   int_x_27_q0;
    wire [2:0]                    int_x_27_address1;
    wire                          int_x_27_ce1;
    wire                          int_x_27_we1;
    wire [3:0]                    int_x_27_be1;
    wire [31:0]                   int_x_27_d1;
    wire [31:0]                   int_x_27_q1;
    reg                           int_x_27_read;
    reg                           int_x_27_write;
    reg  [1:0]                    int_x_27_shift0;
    wire [2:0]                    int_x_28_address0;
    wire                          int_x_28_ce0;
    wire [31:0]                   int_x_28_q0;
    wire [2:0]                    int_x_28_address1;
    wire                          int_x_28_ce1;
    wire                          int_x_28_we1;
    wire [3:0]                    int_x_28_be1;
    wire [31:0]                   int_x_28_d1;
    wire [31:0]                   int_x_28_q1;
    reg                           int_x_28_read;
    reg                           int_x_28_write;
    reg  [1:0]                    int_x_28_shift0;
    wire [2:0]                    int_x_29_address0;
    wire                          int_x_29_ce0;
    wire [31:0]                   int_x_29_q0;
    wire [2:0]                    int_x_29_address1;
    wire                          int_x_29_ce1;
    wire                          int_x_29_we1;
    wire [3:0]                    int_x_29_be1;
    wire [31:0]                   int_x_29_d1;
    wire [31:0]                   int_x_29_q1;
    reg                           int_x_29_read;
    reg                           int_x_29_write;
    reg  [1:0]                    int_x_29_shift0;
    wire [2:0]                    int_x_30_address0;
    wire                          int_x_30_ce0;
    wire [31:0]                   int_x_30_q0;
    wire [2:0]                    int_x_30_address1;
    wire                          int_x_30_ce1;
    wire                          int_x_30_we1;
    wire [3:0]                    int_x_30_be1;
    wire [31:0]                   int_x_30_d1;
    wire [31:0]                   int_x_30_q1;
    reg                           int_x_30_read;
    reg                           int_x_30_write;
    reg  [1:0]                    int_x_30_shift0;
    wire [2:0]                    int_x_31_address0;
    wire                          int_x_31_ce0;
    wire [31:0]                   int_x_31_q0;
    wire [2:0]                    int_x_31_address1;
    wire                          int_x_31_ce1;
    wire                          int_x_31_we1;
    wire [3:0]                    int_x_31_be1;
    wire [31:0]                   int_x_31_d1;
    wire [31:0]                   int_x_31_q1;
    reg                           int_x_31_read;
    reg                           int_x_31_write;
    reg  [1:0]                    int_x_31_shift0;
    wire [2:0]                    int_x_32_address0;
    wire                          int_x_32_ce0;
    wire [31:0]                   int_x_32_q0;
    wire [2:0]                    int_x_32_address1;
    wire                          int_x_32_ce1;
    wire                          int_x_32_we1;
    wire [3:0]                    int_x_32_be1;
    wire [31:0]                   int_x_32_d1;
    wire [31:0]                   int_x_32_q1;
    reg                           int_x_32_read;
    reg                           int_x_32_write;
    reg  [1:0]                    int_x_32_shift0;
    wire [2:0]                    int_x_33_address0;
    wire                          int_x_33_ce0;
    wire [31:0]                   int_x_33_q0;
    wire [2:0]                    int_x_33_address1;
    wire                          int_x_33_ce1;
    wire                          int_x_33_we1;
    wire [3:0]                    int_x_33_be1;
    wire [31:0]                   int_x_33_d1;
    wire [31:0]                   int_x_33_q1;
    reg                           int_x_33_read;
    reg                           int_x_33_write;
    reg  [1:0]                    int_x_33_shift0;
    wire [2:0]                    int_x_34_address0;
    wire                          int_x_34_ce0;
    wire [31:0]                   int_x_34_q0;
    wire [2:0]                    int_x_34_address1;
    wire                          int_x_34_ce1;
    wire                          int_x_34_we1;
    wire [3:0]                    int_x_34_be1;
    wire [31:0]                   int_x_34_d1;
    wire [31:0]                   int_x_34_q1;
    reg                           int_x_34_read;
    reg                           int_x_34_write;
    reg  [1:0]                    int_x_34_shift0;
    wire [2:0]                    int_x_35_address0;
    wire                          int_x_35_ce0;
    wire [31:0]                   int_x_35_q0;
    wire [2:0]                    int_x_35_address1;
    wire                          int_x_35_ce1;
    wire                          int_x_35_we1;
    wire [3:0]                    int_x_35_be1;
    wire [31:0]                   int_x_35_d1;
    wire [31:0]                   int_x_35_q1;
    reg                           int_x_35_read;
    reg                           int_x_35_write;
    reg  [1:0]                    int_x_35_shift0;
    wire [2:0]                    int_x_36_address0;
    wire                          int_x_36_ce0;
    wire [31:0]                   int_x_36_q0;
    wire [2:0]                    int_x_36_address1;
    wire                          int_x_36_ce1;
    wire                          int_x_36_we1;
    wire [3:0]                    int_x_36_be1;
    wire [31:0]                   int_x_36_d1;
    wire [31:0]                   int_x_36_q1;
    reg                           int_x_36_read;
    reg                           int_x_36_write;
    reg  [1:0]                    int_x_36_shift0;
    wire [2:0]                    int_x_37_address0;
    wire                          int_x_37_ce0;
    wire [31:0]                   int_x_37_q0;
    wire [2:0]                    int_x_37_address1;
    wire                          int_x_37_ce1;
    wire                          int_x_37_we1;
    wire [3:0]                    int_x_37_be1;
    wire [31:0]                   int_x_37_d1;
    wire [31:0]                   int_x_37_q1;
    reg                           int_x_37_read;
    reg                           int_x_37_write;
    reg  [1:0]                    int_x_37_shift0;
    wire [2:0]                    int_x_38_address0;
    wire                          int_x_38_ce0;
    wire [31:0]                   int_x_38_q0;
    wire [2:0]                    int_x_38_address1;
    wire                          int_x_38_ce1;
    wire                          int_x_38_we1;
    wire [3:0]                    int_x_38_be1;
    wire [31:0]                   int_x_38_d1;
    wire [31:0]                   int_x_38_q1;
    reg                           int_x_38_read;
    reg                           int_x_38_write;
    reg  [1:0]                    int_x_38_shift0;
    wire [2:0]                    int_x_39_address0;
    wire                          int_x_39_ce0;
    wire [31:0]                   int_x_39_q0;
    wire [2:0]                    int_x_39_address1;
    wire                          int_x_39_ce1;
    wire                          int_x_39_we1;
    wire [3:0]                    int_x_39_be1;
    wire [31:0]                   int_x_39_d1;
    wire [31:0]                   int_x_39_q1;
    reg                           int_x_39_read;
    reg                           int_x_39_write;
    reg  [1:0]                    int_x_39_shift0;
    wire [2:0]                    int_x_40_address0;
    wire                          int_x_40_ce0;
    wire [31:0]                   int_x_40_q0;
    wire [2:0]                    int_x_40_address1;
    wire                          int_x_40_ce1;
    wire                          int_x_40_we1;
    wire [3:0]                    int_x_40_be1;
    wire [31:0]                   int_x_40_d1;
    wire [31:0]                   int_x_40_q1;
    reg                           int_x_40_read;
    reg                           int_x_40_write;
    reg  [1:0]                    int_x_40_shift0;
    wire [2:0]                    int_x_41_address0;
    wire                          int_x_41_ce0;
    wire [31:0]                   int_x_41_q0;
    wire [2:0]                    int_x_41_address1;
    wire                          int_x_41_ce1;
    wire                          int_x_41_we1;
    wire [3:0]                    int_x_41_be1;
    wire [31:0]                   int_x_41_d1;
    wire [31:0]                   int_x_41_q1;
    reg                           int_x_41_read;
    reg                           int_x_41_write;
    reg  [1:0]                    int_x_41_shift0;
    wire [2:0]                    int_x_42_address0;
    wire                          int_x_42_ce0;
    wire [31:0]                   int_x_42_q0;
    wire [2:0]                    int_x_42_address1;
    wire                          int_x_42_ce1;
    wire                          int_x_42_we1;
    wire [3:0]                    int_x_42_be1;
    wire [31:0]                   int_x_42_d1;
    wire [31:0]                   int_x_42_q1;
    reg                           int_x_42_read;
    reg                           int_x_42_write;
    reg  [1:0]                    int_x_42_shift0;
    wire [2:0]                    int_x_43_address0;
    wire                          int_x_43_ce0;
    wire [31:0]                   int_x_43_q0;
    wire [2:0]                    int_x_43_address1;
    wire                          int_x_43_ce1;
    wire                          int_x_43_we1;
    wire [3:0]                    int_x_43_be1;
    wire [31:0]                   int_x_43_d1;
    wire [31:0]                   int_x_43_q1;
    reg                           int_x_43_read;
    reg                           int_x_43_write;
    reg  [1:0]                    int_x_43_shift0;
    wire [2:0]                    int_x_44_address0;
    wire                          int_x_44_ce0;
    wire [31:0]                   int_x_44_q0;
    wire [2:0]                    int_x_44_address1;
    wire                          int_x_44_ce1;
    wire                          int_x_44_we1;
    wire [3:0]                    int_x_44_be1;
    wire [31:0]                   int_x_44_d1;
    wire [31:0]                   int_x_44_q1;
    reg                           int_x_44_read;
    reg                           int_x_44_write;
    reg  [1:0]                    int_x_44_shift0;
    wire [2:0]                    int_x_45_address0;
    wire                          int_x_45_ce0;
    wire [31:0]                   int_x_45_q0;
    wire [2:0]                    int_x_45_address1;
    wire                          int_x_45_ce1;
    wire                          int_x_45_we1;
    wire [3:0]                    int_x_45_be1;
    wire [31:0]                   int_x_45_d1;
    wire [31:0]                   int_x_45_q1;
    reg                           int_x_45_read;
    reg                           int_x_45_write;
    reg  [1:0]                    int_x_45_shift0;
    wire [2:0]                    int_x_46_address0;
    wire                          int_x_46_ce0;
    wire [31:0]                   int_x_46_q0;
    wire [2:0]                    int_x_46_address1;
    wire                          int_x_46_ce1;
    wire                          int_x_46_we1;
    wire [3:0]                    int_x_46_be1;
    wire [31:0]                   int_x_46_d1;
    wire [31:0]                   int_x_46_q1;
    reg                           int_x_46_read;
    reg                           int_x_46_write;
    reg  [1:0]                    int_x_46_shift0;
    wire [2:0]                    int_x_47_address0;
    wire                          int_x_47_ce0;
    wire [31:0]                   int_x_47_q0;
    wire [2:0]                    int_x_47_address1;
    wire                          int_x_47_ce1;
    wire                          int_x_47_we1;
    wire [3:0]                    int_x_47_be1;
    wire [31:0]                   int_x_47_d1;
    wire [31:0]                   int_x_47_q1;
    reg                           int_x_47_read;
    reg                           int_x_47_write;
    reg  [1:0]                    int_x_47_shift0;
    wire [2:0]                    int_x_48_address0;
    wire                          int_x_48_ce0;
    wire [31:0]                   int_x_48_q0;
    wire [2:0]                    int_x_48_address1;
    wire                          int_x_48_ce1;
    wire                          int_x_48_we1;
    wire [3:0]                    int_x_48_be1;
    wire [31:0]                   int_x_48_d1;
    wire [31:0]                   int_x_48_q1;
    reg                           int_x_48_read;
    reg                           int_x_48_write;
    reg  [1:0]                    int_x_48_shift0;
    wire [2:0]                    int_x_49_address0;
    wire                          int_x_49_ce0;
    wire [31:0]                   int_x_49_q0;
    wire [2:0]                    int_x_49_address1;
    wire                          int_x_49_ce1;
    wire                          int_x_49_we1;
    wire [3:0]                    int_x_49_be1;
    wire [31:0]                   int_x_49_d1;
    wire [31:0]                   int_x_49_q1;
    reg                           int_x_49_read;
    reg                           int_x_49_write;
    reg  [1:0]                    int_x_49_shift0;
    wire [2:0]                    int_x_50_address0;
    wire                          int_x_50_ce0;
    wire [31:0]                   int_x_50_q0;
    wire [2:0]                    int_x_50_address1;
    wire                          int_x_50_ce1;
    wire                          int_x_50_we1;
    wire [3:0]                    int_x_50_be1;
    wire [31:0]                   int_x_50_d1;
    wire [31:0]                   int_x_50_q1;
    reg                           int_x_50_read;
    reg                           int_x_50_write;
    reg  [1:0]                    int_x_50_shift0;
    wire [2:0]                    int_x_51_address0;
    wire                          int_x_51_ce0;
    wire [31:0]                   int_x_51_q0;
    wire [2:0]                    int_x_51_address1;
    wire                          int_x_51_ce1;
    wire                          int_x_51_we1;
    wire [3:0]                    int_x_51_be1;
    wire [31:0]                   int_x_51_d1;
    wire [31:0]                   int_x_51_q1;
    reg                           int_x_51_read;
    reg                           int_x_51_write;
    reg  [1:0]                    int_x_51_shift0;
    wire [2:0]                    int_x_52_address0;
    wire                          int_x_52_ce0;
    wire [31:0]                   int_x_52_q0;
    wire [2:0]                    int_x_52_address1;
    wire                          int_x_52_ce1;
    wire                          int_x_52_we1;
    wire [3:0]                    int_x_52_be1;
    wire [31:0]                   int_x_52_d1;
    wire [31:0]                   int_x_52_q1;
    reg                           int_x_52_read;
    reg                           int_x_52_write;
    reg  [1:0]                    int_x_52_shift0;
    wire [2:0]                    int_x_53_address0;
    wire                          int_x_53_ce0;
    wire [31:0]                   int_x_53_q0;
    wire [2:0]                    int_x_53_address1;
    wire                          int_x_53_ce1;
    wire                          int_x_53_we1;
    wire [3:0]                    int_x_53_be1;
    wire [31:0]                   int_x_53_d1;
    wire [31:0]                   int_x_53_q1;
    reg                           int_x_53_read;
    reg                           int_x_53_write;
    reg  [1:0]                    int_x_53_shift0;
    wire [2:0]                    int_x_54_address0;
    wire                          int_x_54_ce0;
    wire [31:0]                   int_x_54_q0;
    wire [2:0]                    int_x_54_address1;
    wire                          int_x_54_ce1;
    wire                          int_x_54_we1;
    wire [3:0]                    int_x_54_be1;
    wire [31:0]                   int_x_54_d1;
    wire [31:0]                   int_x_54_q1;
    reg                           int_x_54_read;
    reg                           int_x_54_write;
    reg  [1:0]                    int_x_54_shift0;
    wire [2:0]                    int_x_55_address0;
    wire                          int_x_55_ce0;
    wire [31:0]                   int_x_55_q0;
    wire [2:0]                    int_x_55_address1;
    wire                          int_x_55_ce1;
    wire                          int_x_55_we1;
    wire [3:0]                    int_x_55_be1;
    wire [31:0]                   int_x_55_d1;
    wire [31:0]                   int_x_55_q1;
    reg                           int_x_55_read;
    reg                           int_x_55_write;
    reg  [1:0]                    int_x_55_shift0;
    wire [2:0]                    int_x_56_address0;
    wire                          int_x_56_ce0;
    wire [31:0]                   int_x_56_q0;
    wire [2:0]                    int_x_56_address1;
    wire                          int_x_56_ce1;
    wire                          int_x_56_we1;
    wire [3:0]                    int_x_56_be1;
    wire [31:0]                   int_x_56_d1;
    wire [31:0]                   int_x_56_q1;
    reg                           int_x_56_read;
    reg                           int_x_56_write;
    reg  [1:0]                    int_x_56_shift0;
    wire [2:0]                    int_x_57_address0;
    wire                          int_x_57_ce0;
    wire [31:0]                   int_x_57_q0;
    wire [2:0]                    int_x_57_address1;
    wire                          int_x_57_ce1;
    wire                          int_x_57_we1;
    wire [3:0]                    int_x_57_be1;
    wire [31:0]                   int_x_57_d1;
    wire [31:0]                   int_x_57_q1;
    reg                           int_x_57_read;
    reg                           int_x_57_write;
    reg  [1:0]                    int_x_57_shift0;
    wire [2:0]                    int_x_58_address0;
    wire                          int_x_58_ce0;
    wire [31:0]                   int_x_58_q0;
    wire [2:0]                    int_x_58_address1;
    wire                          int_x_58_ce1;
    wire                          int_x_58_we1;
    wire [3:0]                    int_x_58_be1;
    wire [31:0]                   int_x_58_d1;
    wire [31:0]                   int_x_58_q1;
    reg                           int_x_58_read;
    reg                           int_x_58_write;
    reg  [1:0]                    int_x_58_shift0;
    wire [2:0]                    int_x_59_address0;
    wire                          int_x_59_ce0;
    wire [31:0]                   int_x_59_q0;
    wire [2:0]                    int_x_59_address1;
    wire                          int_x_59_ce1;
    wire                          int_x_59_we1;
    wire [3:0]                    int_x_59_be1;
    wire [31:0]                   int_x_59_d1;
    wire [31:0]                   int_x_59_q1;
    reg                           int_x_59_read;
    reg                           int_x_59_write;
    reg  [1:0]                    int_x_59_shift0;
    wire [2:0]                    int_x_60_address0;
    wire                          int_x_60_ce0;
    wire [31:0]                   int_x_60_q0;
    wire [2:0]                    int_x_60_address1;
    wire                          int_x_60_ce1;
    wire                          int_x_60_we1;
    wire [3:0]                    int_x_60_be1;
    wire [31:0]                   int_x_60_d1;
    wire [31:0]                   int_x_60_q1;
    reg                           int_x_60_read;
    reg                           int_x_60_write;
    reg  [1:0]                    int_x_60_shift0;
    wire [2:0]                    int_x_61_address0;
    wire                          int_x_61_ce0;
    wire [31:0]                   int_x_61_q0;
    wire [2:0]                    int_x_61_address1;
    wire                          int_x_61_ce1;
    wire                          int_x_61_we1;
    wire [3:0]                    int_x_61_be1;
    wire [31:0]                   int_x_61_d1;
    wire [31:0]                   int_x_61_q1;
    reg                           int_x_61_read;
    reg                           int_x_61_write;
    reg  [1:0]                    int_x_61_shift0;
    wire [2:0]                    int_x_62_address0;
    wire                          int_x_62_ce0;
    wire [31:0]                   int_x_62_q0;
    wire [2:0]                    int_x_62_address1;
    wire                          int_x_62_ce1;
    wire                          int_x_62_we1;
    wire [3:0]                    int_x_62_be1;
    wire [31:0]                   int_x_62_d1;
    wire [31:0]                   int_x_62_q1;
    reg                           int_x_62_read;
    reg                           int_x_62_write;
    reg  [1:0]                    int_x_62_shift0;
    wire [2:0]                    int_x_63_address0;
    wire                          int_x_63_ce0;
    wire [31:0]                   int_x_63_q0;
    wire [2:0]                    int_x_63_address1;
    wire                          int_x_63_ce1;
    wire                          int_x_63_we1;
    wire [3:0]                    int_x_63_be1;
    wire [31:0]                   int_x_63_d1;
    wire [31:0]                   int_x_63_q1;
    reg                           int_x_63_read;
    reg                           int_x_63_write;
    reg  [1:0]                    int_x_63_shift0;

//------------------------Instantiation------------------
// int_x_0
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_0 (
    .clk0      ( ACLK ),
    .address0  ( int_x_0_address0 ),
    .ce0       ( int_x_0_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_0_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_0_address1 ),
    .ce1       ( int_x_0_ce1 ),
    .we1       ( int_x_0_be1 ),
    .d1        ( int_x_0_d1 ),
    .q1        ( int_x_0_q1 )
);
// int_x_1
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_1 (
    .clk0      ( ACLK ),
    .address0  ( int_x_1_address0 ),
    .ce0       ( int_x_1_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_1_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_1_address1 ),
    .ce1       ( int_x_1_ce1 ),
    .we1       ( int_x_1_be1 ),
    .d1        ( int_x_1_d1 ),
    .q1        ( int_x_1_q1 )
);
// int_x_2
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_2 (
    .clk0      ( ACLK ),
    .address0  ( int_x_2_address0 ),
    .ce0       ( int_x_2_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_2_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_2_address1 ),
    .ce1       ( int_x_2_ce1 ),
    .we1       ( int_x_2_be1 ),
    .d1        ( int_x_2_d1 ),
    .q1        ( int_x_2_q1 )
);
// int_x_3
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_3 (
    .clk0      ( ACLK ),
    .address0  ( int_x_3_address0 ),
    .ce0       ( int_x_3_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_3_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_3_address1 ),
    .ce1       ( int_x_3_ce1 ),
    .we1       ( int_x_3_be1 ),
    .d1        ( int_x_3_d1 ),
    .q1        ( int_x_3_q1 )
);
// int_x_4
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_4 (
    .clk0      ( ACLK ),
    .address0  ( int_x_4_address0 ),
    .ce0       ( int_x_4_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_4_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_4_address1 ),
    .ce1       ( int_x_4_ce1 ),
    .we1       ( int_x_4_be1 ),
    .d1        ( int_x_4_d1 ),
    .q1        ( int_x_4_q1 )
);
// int_x_5
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_5 (
    .clk0      ( ACLK ),
    .address0  ( int_x_5_address0 ),
    .ce0       ( int_x_5_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_5_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_5_address1 ),
    .ce1       ( int_x_5_ce1 ),
    .we1       ( int_x_5_be1 ),
    .d1        ( int_x_5_d1 ),
    .q1        ( int_x_5_q1 )
);
// int_x_6
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_6 (
    .clk0      ( ACLK ),
    .address0  ( int_x_6_address0 ),
    .ce0       ( int_x_6_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_6_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_6_address1 ),
    .ce1       ( int_x_6_ce1 ),
    .we1       ( int_x_6_be1 ),
    .d1        ( int_x_6_d1 ),
    .q1        ( int_x_6_q1 )
);
// int_x_7
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_7 (
    .clk0      ( ACLK ),
    .address0  ( int_x_7_address0 ),
    .ce0       ( int_x_7_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_7_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_7_address1 ),
    .ce1       ( int_x_7_ce1 ),
    .we1       ( int_x_7_be1 ),
    .d1        ( int_x_7_d1 ),
    .q1        ( int_x_7_q1 )
);
// int_x_8
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_8 (
    .clk0      ( ACLK ),
    .address0  ( int_x_8_address0 ),
    .ce0       ( int_x_8_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_8_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_8_address1 ),
    .ce1       ( int_x_8_ce1 ),
    .we1       ( int_x_8_be1 ),
    .d1        ( int_x_8_d1 ),
    .q1        ( int_x_8_q1 )
);
// int_x_9
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_9 (
    .clk0      ( ACLK ),
    .address0  ( int_x_9_address0 ),
    .ce0       ( int_x_9_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_9_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_9_address1 ),
    .ce1       ( int_x_9_ce1 ),
    .we1       ( int_x_9_be1 ),
    .d1        ( int_x_9_d1 ),
    .q1        ( int_x_9_q1 )
);
// int_x_10
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_10 (
    .clk0      ( ACLK ),
    .address0  ( int_x_10_address0 ),
    .ce0       ( int_x_10_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_10_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_10_address1 ),
    .ce1       ( int_x_10_ce1 ),
    .we1       ( int_x_10_be1 ),
    .d1        ( int_x_10_d1 ),
    .q1        ( int_x_10_q1 )
);
// int_x_11
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_11 (
    .clk0      ( ACLK ),
    .address0  ( int_x_11_address0 ),
    .ce0       ( int_x_11_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_11_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_11_address1 ),
    .ce1       ( int_x_11_ce1 ),
    .we1       ( int_x_11_be1 ),
    .d1        ( int_x_11_d1 ),
    .q1        ( int_x_11_q1 )
);
// int_x_12
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_12 (
    .clk0      ( ACLK ),
    .address0  ( int_x_12_address0 ),
    .ce0       ( int_x_12_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_12_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_12_address1 ),
    .ce1       ( int_x_12_ce1 ),
    .we1       ( int_x_12_be1 ),
    .d1        ( int_x_12_d1 ),
    .q1        ( int_x_12_q1 )
);
// int_x_13
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_13 (
    .clk0      ( ACLK ),
    .address0  ( int_x_13_address0 ),
    .ce0       ( int_x_13_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_13_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_13_address1 ),
    .ce1       ( int_x_13_ce1 ),
    .we1       ( int_x_13_be1 ),
    .d1        ( int_x_13_d1 ),
    .q1        ( int_x_13_q1 )
);
// int_x_14
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_14 (
    .clk0      ( ACLK ),
    .address0  ( int_x_14_address0 ),
    .ce0       ( int_x_14_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_14_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_14_address1 ),
    .ce1       ( int_x_14_ce1 ),
    .we1       ( int_x_14_be1 ),
    .d1        ( int_x_14_d1 ),
    .q1        ( int_x_14_q1 )
);
// int_x_15
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_15 (
    .clk0      ( ACLK ),
    .address0  ( int_x_15_address0 ),
    .ce0       ( int_x_15_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_15_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_15_address1 ),
    .ce1       ( int_x_15_ce1 ),
    .we1       ( int_x_15_be1 ),
    .d1        ( int_x_15_d1 ),
    .q1        ( int_x_15_q1 )
);
// int_x_16
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_16 (
    .clk0      ( ACLK ),
    .address0  ( int_x_16_address0 ),
    .ce0       ( int_x_16_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_16_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_16_address1 ),
    .ce1       ( int_x_16_ce1 ),
    .we1       ( int_x_16_be1 ),
    .d1        ( int_x_16_d1 ),
    .q1        ( int_x_16_q1 )
);
// int_x_17
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_17 (
    .clk0      ( ACLK ),
    .address0  ( int_x_17_address0 ),
    .ce0       ( int_x_17_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_17_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_17_address1 ),
    .ce1       ( int_x_17_ce1 ),
    .we1       ( int_x_17_be1 ),
    .d1        ( int_x_17_d1 ),
    .q1        ( int_x_17_q1 )
);
// int_x_18
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_18 (
    .clk0      ( ACLK ),
    .address0  ( int_x_18_address0 ),
    .ce0       ( int_x_18_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_18_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_18_address1 ),
    .ce1       ( int_x_18_ce1 ),
    .we1       ( int_x_18_be1 ),
    .d1        ( int_x_18_d1 ),
    .q1        ( int_x_18_q1 )
);
// int_x_19
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_19 (
    .clk0      ( ACLK ),
    .address0  ( int_x_19_address0 ),
    .ce0       ( int_x_19_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_19_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_19_address1 ),
    .ce1       ( int_x_19_ce1 ),
    .we1       ( int_x_19_be1 ),
    .d1        ( int_x_19_d1 ),
    .q1        ( int_x_19_q1 )
);
// int_x_20
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_20 (
    .clk0      ( ACLK ),
    .address0  ( int_x_20_address0 ),
    .ce0       ( int_x_20_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_20_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_20_address1 ),
    .ce1       ( int_x_20_ce1 ),
    .we1       ( int_x_20_be1 ),
    .d1        ( int_x_20_d1 ),
    .q1        ( int_x_20_q1 )
);
// int_x_21
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_21 (
    .clk0      ( ACLK ),
    .address0  ( int_x_21_address0 ),
    .ce0       ( int_x_21_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_21_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_21_address1 ),
    .ce1       ( int_x_21_ce1 ),
    .we1       ( int_x_21_be1 ),
    .d1        ( int_x_21_d1 ),
    .q1        ( int_x_21_q1 )
);
// int_x_22
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_22 (
    .clk0      ( ACLK ),
    .address0  ( int_x_22_address0 ),
    .ce0       ( int_x_22_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_22_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_22_address1 ),
    .ce1       ( int_x_22_ce1 ),
    .we1       ( int_x_22_be1 ),
    .d1        ( int_x_22_d1 ),
    .q1        ( int_x_22_q1 )
);
// int_x_23
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_23 (
    .clk0      ( ACLK ),
    .address0  ( int_x_23_address0 ),
    .ce0       ( int_x_23_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_23_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_23_address1 ),
    .ce1       ( int_x_23_ce1 ),
    .we1       ( int_x_23_be1 ),
    .d1        ( int_x_23_d1 ),
    .q1        ( int_x_23_q1 )
);
// int_x_24
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_24 (
    .clk0      ( ACLK ),
    .address0  ( int_x_24_address0 ),
    .ce0       ( int_x_24_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_24_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_24_address1 ),
    .ce1       ( int_x_24_ce1 ),
    .we1       ( int_x_24_be1 ),
    .d1        ( int_x_24_d1 ),
    .q1        ( int_x_24_q1 )
);
// int_x_25
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_25 (
    .clk0      ( ACLK ),
    .address0  ( int_x_25_address0 ),
    .ce0       ( int_x_25_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_25_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_25_address1 ),
    .ce1       ( int_x_25_ce1 ),
    .we1       ( int_x_25_be1 ),
    .d1        ( int_x_25_d1 ),
    .q1        ( int_x_25_q1 )
);
// int_x_26
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_26 (
    .clk0      ( ACLK ),
    .address0  ( int_x_26_address0 ),
    .ce0       ( int_x_26_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_26_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_26_address1 ),
    .ce1       ( int_x_26_ce1 ),
    .we1       ( int_x_26_be1 ),
    .d1        ( int_x_26_d1 ),
    .q1        ( int_x_26_q1 )
);
// int_x_27
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_27 (
    .clk0      ( ACLK ),
    .address0  ( int_x_27_address0 ),
    .ce0       ( int_x_27_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_27_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_27_address1 ),
    .ce1       ( int_x_27_ce1 ),
    .we1       ( int_x_27_be1 ),
    .d1        ( int_x_27_d1 ),
    .q1        ( int_x_27_q1 )
);
// int_x_28
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_28 (
    .clk0      ( ACLK ),
    .address0  ( int_x_28_address0 ),
    .ce0       ( int_x_28_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_28_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_28_address1 ),
    .ce1       ( int_x_28_ce1 ),
    .we1       ( int_x_28_be1 ),
    .d1        ( int_x_28_d1 ),
    .q1        ( int_x_28_q1 )
);
// int_x_29
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_29 (
    .clk0      ( ACLK ),
    .address0  ( int_x_29_address0 ),
    .ce0       ( int_x_29_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_29_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_29_address1 ),
    .ce1       ( int_x_29_ce1 ),
    .we1       ( int_x_29_be1 ),
    .d1        ( int_x_29_d1 ),
    .q1        ( int_x_29_q1 )
);
// int_x_30
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_30 (
    .clk0      ( ACLK ),
    .address0  ( int_x_30_address0 ),
    .ce0       ( int_x_30_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_30_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_30_address1 ),
    .ce1       ( int_x_30_ce1 ),
    .we1       ( int_x_30_be1 ),
    .d1        ( int_x_30_d1 ),
    .q1        ( int_x_30_q1 )
);
// int_x_31
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_31 (
    .clk0      ( ACLK ),
    .address0  ( int_x_31_address0 ),
    .ce0       ( int_x_31_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_31_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_31_address1 ),
    .ce1       ( int_x_31_ce1 ),
    .we1       ( int_x_31_be1 ),
    .d1        ( int_x_31_d1 ),
    .q1        ( int_x_31_q1 )
);
// int_x_32
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_32 (
    .clk0      ( ACLK ),
    .address0  ( int_x_32_address0 ),
    .ce0       ( int_x_32_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_32_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_32_address1 ),
    .ce1       ( int_x_32_ce1 ),
    .we1       ( int_x_32_be1 ),
    .d1        ( int_x_32_d1 ),
    .q1        ( int_x_32_q1 )
);
// int_x_33
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_33 (
    .clk0      ( ACLK ),
    .address0  ( int_x_33_address0 ),
    .ce0       ( int_x_33_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_33_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_33_address1 ),
    .ce1       ( int_x_33_ce1 ),
    .we1       ( int_x_33_be1 ),
    .d1        ( int_x_33_d1 ),
    .q1        ( int_x_33_q1 )
);
// int_x_34
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_34 (
    .clk0      ( ACLK ),
    .address0  ( int_x_34_address0 ),
    .ce0       ( int_x_34_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_34_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_34_address1 ),
    .ce1       ( int_x_34_ce1 ),
    .we1       ( int_x_34_be1 ),
    .d1        ( int_x_34_d1 ),
    .q1        ( int_x_34_q1 )
);
// int_x_35
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_35 (
    .clk0      ( ACLK ),
    .address0  ( int_x_35_address0 ),
    .ce0       ( int_x_35_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_35_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_35_address1 ),
    .ce1       ( int_x_35_ce1 ),
    .we1       ( int_x_35_be1 ),
    .d1        ( int_x_35_d1 ),
    .q1        ( int_x_35_q1 )
);
// int_x_36
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_36 (
    .clk0      ( ACLK ),
    .address0  ( int_x_36_address0 ),
    .ce0       ( int_x_36_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_36_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_36_address1 ),
    .ce1       ( int_x_36_ce1 ),
    .we1       ( int_x_36_be1 ),
    .d1        ( int_x_36_d1 ),
    .q1        ( int_x_36_q1 )
);
// int_x_37
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_37 (
    .clk0      ( ACLK ),
    .address0  ( int_x_37_address0 ),
    .ce0       ( int_x_37_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_37_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_37_address1 ),
    .ce1       ( int_x_37_ce1 ),
    .we1       ( int_x_37_be1 ),
    .d1        ( int_x_37_d1 ),
    .q1        ( int_x_37_q1 )
);
// int_x_38
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_38 (
    .clk0      ( ACLK ),
    .address0  ( int_x_38_address0 ),
    .ce0       ( int_x_38_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_38_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_38_address1 ),
    .ce1       ( int_x_38_ce1 ),
    .we1       ( int_x_38_be1 ),
    .d1        ( int_x_38_d1 ),
    .q1        ( int_x_38_q1 )
);
// int_x_39
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_39 (
    .clk0      ( ACLK ),
    .address0  ( int_x_39_address0 ),
    .ce0       ( int_x_39_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_39_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_39_address1 ),
    .ce1       ( int_x_39_ce1 ),
    .we1       ( int_x_39_be1 ),
    .d1        ( int_x_39_d1 ),
    .q1        ( int_x_39_q1 )
);
// int_x_40
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_40 (
    .clk0      ( ACLK ),
    .address0  ( int_x_40_address0 ),
    .ce0       ( int_x_40_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_40_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_40_address1 ),
    .ce1       ( int_x_40_ce1 ),
    .we1       ( int_x_40_be1 ),
    .d1        ( int_x_40_d1 ),
    .q1        ( int_x_40_q1 )
);
// int_x_41
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_41 (
    .clk0      ( ACLK ),
    .address0  ( int_x_41_address0 ),
    .ce0       ( int_x_41_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_41_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_41_address1 ),
    .ce1       ( int_x_41_ce1 ),
    .we1       ( int_x_41_be1 ),
    .d1        ( int_x_41_d1 ),
    .q1        ( int_x_41_q1 )
);
// int_x_42
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_42 (
    .clk0      ( ACLK ),
    .address0  ( int_x_42_address0 ),
    .ce0       ( int_x_42_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_42_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_42_address1 ),
    .ce1       ( int_x_42_ce1 ),
    .we1       ( int_x_42_be1 ),
    .d1        ( int_x_42_d1 ),
    .q1        ( int_x_42_q1 )
);
// int_x_43
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_43 (
    .clk0      ( ACLK ),
    .address0  ( int_x_43_address0 ),
    .ce0       ( int_x_43_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_43_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_43_address1 ),
    .ce1       ( int_x_43_ce1 ),
    .we1       ( int_x_43_be1 ),
    .d1        ( int_x_43_d1 ),
    .q1        ( int_x_43_q1 )
);
// int_x_44
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_44 (
    .clk0      ( ACLK ),
    .address0  ( int_x_44_address0 ),
    .ce0       ( int_x_44_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_44_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_44_address1 ),
    .ce1       ( int_x_44_ce1 ),
    .we1       ( int_x_44_be1 ),
    .d1        ( int_x_44_d1 ),
    .q1        ( int_x_44_q1 )
);
// int_x_45
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_45 (
    .clk0      ( ACLK ),
    .address0  ( int_x_45_address0 ),
    .ce0       ( int_x_45_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_45_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_45_address1 ),
    .ce1       ( int_x_45_ce1 ),
    .we1       ( int_x_45_be1 ),
    .d1        ( int_x_45_d1 ),
    .q1        ( int_x_45_q1 )
);
// int_x_46
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_46 (
    .clk0      ( ACLK ),
    .address0  ( int_x_46_address0 ),
    .ce0       ( int_x_46_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_46_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_46_address1 ),
    .ce1       ( int_x_46_ce1 ),
    .we1       ( int_x_46_be1 ),
    .d1        ( int_x_46_d1 ),
    .q1        ( int_x_46_q1 )
);
// int_x_47
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_47 (
    .clk0      ( ACLK ),
    .address0  ( int_x_47_address0 ),
    .ce0       ( int_x_47_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_47_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_47_address1 ),
    .ce1       ( int_x_47_ce1 ),
    .we1       ( int_x_47_be1 ),
    .d1        ( int_x_47_d1 ),
    .q1        ( int_x_47_q1 )
);
// int_x_48
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_48 (
    .clk0      ( ACLK ),
    .address0  ( int_x_48_address0 ),
    .ce0       ( int_x_48_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_48_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_48_address1 ),
    .ce1       ( int_x_48_ce1 ),
    .we1       ( int_x_48_be1 ),
    .d1        ( int_x_48_d1 ),
    .q1        ( int_x_48_q1 )
);
// int_x_49
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_49 (
    .clk0      ( ACLK ),
    .address0  ( int_x_49_address0 ),
    .ce0       ( int_x_49_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_49_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_49_address1 ),
    .ce1       ( int_x_49_ce1 ),
    .we1       ( int_x_49_be1 ),
    .d1        ( int_x_49_d1 ),
    .q1        ( int_x_49_q1 )
);
// int_x_50
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_50 (
    .clk0      ( ACLK ),
    .address0  ( int_x_50_address0 ),
    .ce0       ( int_x_50_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_50_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_50_address1 ),
    .ce1       ( int_x_50_ce1 ),
    .we1       ( int_x_50_be1 ),
    .d1        ( int_x_50_d1 ),
    .q1        ( int_x_50_q1 )
);
// int_x_51
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_51 (
    .clk0      ( ACLK ),
    .address0  ( int_x_51_address0 ),
    .ce0       ( int_x_51_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_51_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_51_address1 ),
    .ce1       ( int_x_51_ce1 ),
    .we1       ( int_x_51_be1 ),
    .d1        ( int_x_51_d1 ),
    .q1        ( int_x_51_q1 )
);
// int_x_52
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_52 (
    .clk0      ( ACLK ),
    .address0  ( int_x_52_address0 ),
    .ce0       ( int_x_52_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_52_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_52_address1 ),
    .ce1       ( int_x_52_ce1 ),
    .we1       ( int_x_52_be1 ),
    .d1        ( int_x_52_d1 ),
    .q1        ( int_x_52_q1 )
);
// int_x_53
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_53 (
    .clk0      ( ACLK ),
    .address0  ( int_x_53_address0 ),
    .ce0       ( int_x_53_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_53_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_53_address1 ),
    .ce1       ( int_x_53_ce1 ),
    .we1       ( int_x_53_be1 ),
    .d1        ( int_x_53_d1 ),
    .q1        ( int_x_53_q1 )
);
// int_x_54
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_54 (
    .clk0      ( ACLK ),
    .address0  ( int_x_54_address0 ),
    .ce0       ( int_x_54_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_54_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_54_address1 ),
    .ce1       ( int_x_54_ce1 ),
    .we1       ( int_x_54_be1 ),
    .d1        ( int_x_54_d1 ),
    .q1        ( int_x_54_q1 )
);
// int_x_55
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_55 (
    .clk0      ( ACLK ),
    .address0  ( int_x_55_address0 ),
    .ce0       ( int_x_55_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_55_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_55_address1 ),
    .ce1       ( int_x_55_ce1 ),
    .we1       ( int_x_55_be1 ),
    .d1        ( int_x_55_d1 ),
    .q1        ( int_x_55_q1 )
);
// int_x_56
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_56 (
    .clk0      ( ACLK ),
    .address0  ( int_x_56_address0 ),
    .ce0       ( int_x_56_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_56_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_56_address1 ),
    .ce1       ( int_x_56_ce1 ),
    .we1       ( int_x_56_be1 ),
    .d1        ( int_x_56_d1 ),
    .q1        ( int_x_56_q1 )
);
// int_x_57
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_57 (
    .clk0      ( ACLK ),
    .address0  ( int_x_57_address0 ),
    .ce0       ( int_x_57_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_57_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_57_address1 ),
    .ce1       ( int_x_57_ce1 ),
    .we1       ( int_x_57_be1 ),
    .d1        ( int_x_57_d1 ),
    .q1        ( int_x_57_q1 )
);
// int_x_58
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_58 (
    .clk0      ( ACLK ),
    .address0  ( int_x_58_address0 ),
    .ce0       ( int_x_58_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_58_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_58_address1 ),
    .ce1       ( int_x_58_ce1 ),
    .we1       ( int_x_58_be1 ),
    .d1        ( int_x_58_d1 ),
    .q1        ( int_x_58_q1 )
);
// int_x_59
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_59 (
    .clk0      ( ACLK ),
    .address0  ( int_x_59_address0 ),
    .ce0       ( int_x_59_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_59_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_59_address1 ),
    .ce1       ( int_x_59_ce1 ),
    .we1       ( int_x_59_be1 ),
    .d1        ( int_x_59_d1 ),
    .q1        ( int_x_59_q1 )
);
// int_x_60
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_60 (
    .clk0      ( ACLK ),
    .address0  ( int_x_60_address0 ),
    .ce0       ( int_x_60_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_60_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_60_address1 ),
    .ce1       ( int_x_60_ce1 ),
    .we1       ( int_x_60_be1 ),
    .d1        ( int_x_60_d1 ),
    .q1        ( int_x_60_q1 )
);
// int_x_61
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_61 (
    .clk0      ( ACLK ),
    .address0  ( int_x_61_address0 ),
    .ce0       ( int_x_61_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_61_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_61_address1 ),
    .ce1       ( int_x_61_ce1 ),
    .we1       ( int_x_61_be1 ),
    .d1        ( int_x_61_d1 ),
    .q1        ( int_x_61_q1 )
);
// int_x_62
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_62 (
    .clk0      ( ACLK ),
    .address0  ( int_x_62_address0 ),
    .ce0       ( int_x_62_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_62_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_62_address1 ),
    .ce1       ( int_x_62_ce1 ),
    .we1       ( int_x_62_be1 ),
    .d1        ( int_x_62_d1 ),
    .q1        ( int_x_62_q1 )
);
// int_x_63
eucHW_control_s_axi_ram #(
    .MEM_STYLE ( "block" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_x_63 (
    .clk0      ( ACLK ),
    .address0  ( int_x_63_address0 ),
    .ce0       ( int_x_63_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_x_63_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_x_63_address1 ),
    .ce1       ( int_x_63_ce1 ),
    .we1       ( int_x_63_be1 ),
    .d1        ( int_x_63_d1 ),
    .q1        ( int_x_63_q1 )
);


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA) && (!ar_hs);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (w_hs)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA) & !int_x_0_read & !int_x_1_read & !int_x_2_read & !int_x_3_read & !int_x_4_read & !int_x_5_read & !int_x_6_read & !int_x_7_read & !int_x_8_read & !int_x_9_read & !int_x_10_read & !int_x_11_read & !int_x_12_read & !int_x_13_read & !int_x_14_read & !int_x_15_read & !int_x_16_read & !int_x_17_read & !int_x_18_read & !int_x_19_read & !int_x_20_read & !int_x_21_read & !int_x_22_read & !int_x_23_read & !int_x_24_read & !int_x_25_read & !int_x_26_read & !int_x_27_read & !int_x_28_read & !int_x_29_read & !int_x_30_read & !int_x_31_read & !int_x_32_read & !int_x_33_read & !int_x_34_read & !int_x_35_read & !int_x_36_read & !int_x_37_read & !int_x_38_read & !int_x_39_read & !int_x_40_read & !int_x_41_read & !int_x_42_read & !int_x_43_read & !int_x_44_read & !int_x_45_read & !int_x_46_read & !int_x_47_read & !int_x_48_read & !int_x_49_read & !int_x_50_read & !int_x_51_read & !int_x_52_read & !int_x_53_read & !int_x_54_read & !int_x_55_read & !int_x_56_read & !int_x_57_read & !int_x_58_read & !int_x_59_read & !int_x_60_read & !int_x_61_read & !int_x_62_read & !int_x_63_read;
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_task_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_Y_SQRT_DATA_0: begin
                    rdata <= int_y_sqrt[31:0];
                end
                ADDR_Y_SQRT_CTRL: begin
                    rdata[0] <= int_y_sqrt_ap_vld;
                end
            endcase
        end
        else if (int_x_0_read) begin
            rdata <= int_x_0_q1;
        end
        else if (int_x_1_read) begin
            rdata <= int_x_1_q1;
        end
        else if (int_x_2_read) begin
            rdata <= int_x_2_q1;
        end
        else if (int_x_3_read) begin
            rdata <= int_x_3_q1;
        end
        else if (int_x_4_read) begin
            rdata <= int_x_4_q1;
        end
        else if (int_x_5_read) begin
            rdata <= int_x_5_q1;
        end
        else if (int_x_6_read) begin
            rdata <= int_x_6_q1;
        end
        else if (int_x_7_read) begin
            rdata <= int_x_7_q1;
        end
        else if (int_x_8_read) begin
            rdata <= int_x_8_q1;
        end
        else if (int_x_9_read) begin
            rdata <= int_x_9_q1;
        end
        else if (int_x_10_read) begin
            rdata <= int_x_10_q1;
        end
        else if (int_x_11_read) begin
            rdata <= int_x_11_q1;
        end
        else if (int_x_12_read) begin
            rdata <= int_x_12_q1;
        end
        else if (int_x_13_read) begin
            rdata <= int_x_13_q1;
        end
        else if (int_x_14_read) begin
            rdata <= int_x_14_q1;
        end
        else if (int_x_15_read) begin
            rdata <= int_x_15_q1;
        end
        else if (int_x_16_read) begin
            rdata <= int_x_16_q1;
        end
        else if (int_x_17_read) begin
            rdata <= int_x_17_q1;
        end
        else if (int_x_18_read) begin
            rdata <= int_x_18_q1;
        end
        else if (int_x_19_read) begin
            rdata <= int_x_19_q1;
        end
        else if (int_x_20_read) begin
            rdata <= int_x_20_q1;
        end
        else if (int_x_21_read) begin
            rdata <= int_x_21_q1;
        end
        else if (int_x_22_read) begin
            rdata <= int_x_22_q1;
        end
        else if (int_x_23_read) begin
            rdata <= int_x_23_q1;
        end
        else if (int_x_24_read) begin
            rdata <= int_x_24_q1;
        end
        else if (int_x_25_read) begin
            rdata <= int_x_25_q1;
        end
        else if (int_x_26_read) begin
            rdata <= int_x_26_q1;
        end
        else if (int_x_27_read) begin
            rdata <= int_x_27_q1;
        end
        else if (int_x_28_read) begin
            rdata <= int_x_28_q1;
        end
        else if (int_x_29_read) begin
            rdata <= int_x_29_q1;
        end
        else if (int_x_30_read) begin
            rdata <= int_x_30_q1;
        end
        else if (int_x_31_read) begin
            rdata <= int_x_31_q1;
        end
        else if (int_x_32_read) begin
            rdata <= int_x_32_q1;
        end
        else if (int_x_33_read) begin
            rdata <= int_x_33_q1;
        end
        else if (int_x_34_read) begin
            rdata <= int_x_34_q1;
        end
        else if (int_x_35_read) begin
            rdata <= int_x_35_q1;
        end
        else if (int_x_36_read) begin
            rdata <= int_x_36_q1;
        end
        else if (int_x_37_read) begin
            rdata <= int_x_37_q1;
        end
        else if (int_x_38_read) begin
            rdata <= int_x_38_q1;
        end
        else if (int_x_39_read) begin
            rdata <= int_x_39_q1;
        end
        else if (int_x_40_read) begin
            rdata <= int_x_40_q1;
        end
        else if (int_x_41_read) begin
            rdata <= int_x_41_q1;
        end
        else if (int_x_42_read) begin
            rdata <= int_x_42_q1;
        end
        else if (int_x_43_read) begin
            rdata <= int_x_43_q1;
        end
        else if (int_x_44_read) begin
            rdata <= int_x_44_q1;
        end
        else if (int_x_45_read) begin
            rdata <= int_x_45_q1;
        end
        else if (int_x_46_read) begin
            rdata <= int_x_46_q1;
        end
        else if (int_x_47_read) begin
            rdata <= int_x_47_q1;
        end
        else if (int_x_48_read) begin
            rdata <= int_x_48_q1;
        end
        else if (int_x_49_read) begin
            rdata <= int_x_49_q1;
        end
        else if (int_x_50_read) begin
            rdata <= int_x_50_q1;
        end
        else if (int_x_51_read) begin
            rdata <= int_x_51_q1;
        end
        else if (int_x_52_read) begin
            rdata <= int_x_52_q1;
        end
        else if (int_x_53_read) begin
            rdata <= int_x_53_q1;
        end
        else if (int_x_54_read) begin
            rdata <= int_x_54_q1;
        end
        else if (int_x_55_read) begin
            rdata <= int_x_55_q1;
        end
        else if (int_x_56_read) begin
            rdata <= int_x_56_q1;
        end
        else if (int_x_57_read) begin
            rdata <= int_x_57_q1;
        end
        else if (int_x_58_read) begin
            rdata <= int_x_58_q1;
        end
        else if (int_x_59_read) begin
            rdata <= int_x_59_q1;
        end
        else if (int_x_60_read) begin
            rdata <= int_x_60_q1;
        end
        else if (int_x_61_read) begin
            rdata <= int_x_61_q1;
        end
        else if (int_x_62_read) begin
            rdata <= int_x_62_q1;
        end
        else if (int_x_63_read) begin
            rdata <= int_x_63_q1;
        end
    end
end


//------------------------Register logic-----------------
assign interrupt         = int_gie & (|int_isr);
assign ap_start          = int_ap_start;
assign task_ap_done      = (ap_done && !auto_restart_status) || auto_restart_done;
assign task_ap_ready     = ap_ready && !int_auto_restart;
assign auto_restart_done = auto_restart_status && (ap_idle && !int_ap_idle);
// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_done <= ap_done;
    end
end

// int_task_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_task_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_done)
            int_task_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_task_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_ready)
            int_ap_ready <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_ready <= 1'b0;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <=  WDATA[7];
    end
end

// auto_restart_status
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_status <= 1'b0;
    else if (ACLK_EN) begin
        if (int_auto_restart)
            auto_restart_status <= 1'b1;
        else if (ap_idle)
            auto_restart_status <= 1'b0;
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[5:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_isr[5]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[5] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[5] & ap_local_deadlock)
            int_isr[5] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[5] <= int_isr[5] ^ WDATA[5]; // toggle on write
    end
end

// int_y_sqrt
always @(posedge ACLK) begin
    if (ARESET)
        int_y_sqrt <= 0;
    else if (ACLK_EN) begin
        if (y_sqrt_ap_vld)
            int_y_sqrt <= y_sqrt;
    end
end

// int_y_sqrt_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_y_sqrt_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (y_sqrt_ap_vld)
            int_y_sqrt_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_Y_SQRT_CTRL)
            int_y_sqrt_ap_vld <= 1'b0; // clear on read
    end
end


//------------------------Memory logic-------------------
// x_0
assign int_x_0_address0  = x_0_address0 >> 2;
assign int_x_0_ce0       = x_0_ce0;
assign x_0_q0            = int_x_0_q0 >> (int_x_0_shift0 * 8);
assign int_x_0_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_0_ce1       = ar_hs | (int_x_0_write & WVALID);
assign int_x_0_we1       = int_x_0_write & w_hs;
assign int_x_0_be1       = int_x_0_we1 ? WSTRB : 'b0;
assign int_x_0_d1        = WDATA;
// x_1
assign int_x_1_address0  = x_1_address0 >> 2;
assign int_x_1_ce0       = x_1_ce0;
assign x_1_q0            = int_x_1_q0 >> (int_x_1_shift0 * 8);
assign int_x_1_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_1_ce1       = ar_hs | (int_x_1_write & WVALID);
assign int_x_1_we1       = int_x_1_write & w_hs;
assign int_x_1_be1       = int_x_1_we1 ? WSTRB : 'b0;
assign int_x_1_d1        = WDATA;
// x_2
assign int_x_2_address0  = x_2_address0 >> 2;
assign int_x_2_ce0       = x_2_ce0;
assign x_2_q0            = int_x_2_q0 >> (int_x_2_shift0 * 8);
assign int_x_2_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_2_ce1       = ar_hs | (int_x_2_write & WVALID);
assign int_x_2_we1       = int_x_2_write & w_hs;
assign int_x_2_be1       = int_x_2_we1 ? WSTRB : 'b0;
assign int_x_2_d1        = WDATA;
// x_3
assign int_x_3_address0  = x_3_address0 >> 2;
assign int_x_3_ce0       = x_3_ce0;
assign x_3_q0            = int_x_3_q0 >> (int_x_3_shift0 * 8);
assign int_x_3_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_3_ce1       = ar_hs | (int_x_3_write & WVALID);
assign int_x_3_we1       = int_x_3_write & w_hs;
assign int_x_3_be1       = int_x_3_we1 ? WSTRB : 'b0;
assign int_x_3_d1        = WDATA;
// x_4
assign int_x_4_address0  = x_4_address0 >> 2;
assign int_x_4_ce0       = x_4_ce0;
assign x_4_q0            = int_x_4_q0 >> (int_x_4_shift0 * 8);
assign int_x_4_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_4_ce1       = ar_hs | (int_x_4_write & WVALID);
assign int_x_4_we1       = int_x_4_write & w_hs;
assign int_x_4_be1       = int_x_4_we1 ? WSTRB : 'b0;
assign int_x_4_d1        = WDATA;
// x_5
assign int_x_5_address0  = x_5_address0 >> 2;
assign int_x_5_ce0       = x_5_ce0;
assign x_5_q0            = int_x_5_q0 >> (int_x_5_shift0 * 8);
assign int_x_5_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_5_ce1       = ar_hs | (int_x_5_write & WVALID);
assign int_x_5_we1       = int_x_5_write & w_hs;
assign int_x_5_be1       = int_x_5_we1 ? WSTRB : 'b0;
assign int_x_5_d1        = WDATA;
// x_6
assign int_x_6_address0  = x_6_address0 >> 2;
assign int_x_6_ce0       = x_6_ce0;
assign x_6_q0            = int_x_6_q0 >> (int_x_6_shift0 * 8);
assign int_x_6_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_6_ce1       = ar_hs | (int_x_6_write & WVALID);
assign int_x_6_we1       = int_x_6_write & w_hs;
assign int_x_6_be1       = int_x_6_we1 ? WSTRB : 'b0;
assign int_x_6_d1        = WDATA;
// x_7
assign int_x_7_address0  = x_7_address0 >> 2;
assign int_x_7_ce0       = x_7_ce0;
assign x_7_q0            = int_x_7_q0 >> (int_x_7_shift0 * 8);
assign int_x_7_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_7_ce1       = ar_hs | (int_x_7_write & WVALID);
assign int_x_7_we1       = int_x_7_write & w_hs;
assign int_x_7_be1       = int_x_7_we1 ? WSTRB : 'b0;
assign int_x_7_d1        = WDATA;
// x_8
assign int_x_8_address0  = x_8_address0 >> 2;
assign int_x_8_ce0       = x_8_ce0;
assign x_8_q0            = int_x_8_q0 >> (int_x_8_shift0 * 8);
assign int_x_8_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_8_ce1       = ar_hs | (int_x_8_write & WVALID);
assign int_x_8_we1       = int_x_8_write & w_hs;
assign int_x_8_be1       = int_x_8_we1 ? WSTRB : 'b0;
assign int_x_8_d1        = WDATA;
// x_9
assign int_x_9_address0  = x_9_address0 >> 2;
assign int_x_9_ce0       = x_9_ce0;
assign x_9_q0            = int_x_9_q0 >> (int_x_9_shift0 * 8);
assign int_x_9_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_9_ce1       = ar_hs | (int_x_9_write & WVALID);
assign int_x_9_we1       = int_x_9_write & w_hs;
assign int_x_9_be1       = int_x_9_we1 ? WSTRB : 'b0;
assign int_x_9_d1        = WDATA;
// x_10
assign int_x_10_address0 = x_10_address0 >> 2;
assign int_x_10_ce0      = x_10_ce0;
assign x_10_q0           = int_x_10_q0 >> (int_x_10_shift0 * 8);
assign int_x_10_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_10_ce1      = ar_hs | (int_x_10_write & WVALID);
assign int_x_10_we1      = int_x_10_write & w_hs;
assign int_x_10_be1      = int_x_10_we1 ? WSTRB : 'b0;
assign int_x_10_d1       = WDATA;
// x_11
assign int_x_11_address0 = x_11_address0 >> 2;
assign int_x_11_ce0      = x_11_ce0;
assign x_11_q0           = int_x_11_q0 >> (int_x_11_shift0 * 8);
assign int_x_11_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_11_ce1      = ar_hs | (int_x_11_write & WVALID);
assign int_x_11_we1      = int_x_11_write & w_hs;
assign int_x_11_be1      = int_x_11_we1 ? WSTRB : 'b0;
assign int_x_11_d1       = WDATA;
// x_12
assign int_x_12_address0 = x_12_address0 >> 2;
assign int_x_12_ce0      = x_12_ce0;
assign x_12_q0           = int_x_12_q0 >> (int_x_12_shift0 * 8);
assign int_x_12_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_12_ce1      = ar_hs | (int_x_12_write & WVALID);
assign int_x_12_we1      = int_x_12_write & w_hs;
assign int_x_12_be1      = int_x_12_we1 ? WSTRB : 'b0;
assign int_x_12_d1       = WDATA;
// x_13
assign int_x_13_address0 = x_13_address0 >> 2;
assign int_x_13_ce0      = x_13_ce0;
assign x_13_q0           = int_x_13_q0 >> (int_x_13_shift0 * 8);
assign int_x_13_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_13_ce1      = ar_hs | (int_x_13_write & WVALID);
assign int_x_13_we1      = int_x_13_write & w_hs;
assign int_x_13_be1      = int_x_13_we1 ? WSTRB : 'b0;
assign int_x_13_d1       = WDATA;
// x_14
assign int_x_14_address0 = x_14_address0 >> 2;
assign int_x_14_ce0      = x_14_ce0;
assign x_14_q0           = int_x_14_q0 >> (int_x_14_shift0 * 8);
assign int_x_14_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_14_ce1      = ar_hs | (int_x_14_write & WVALID);
assign int_x_14_we1      = int_x_14_write & w_hs;
assign int_x_14_be1      = int_x_14_we1 ? WSTRB : 'b0;
assign int_x_14_d1       = WDATA;
// x_15
assign int_x_15_address0 = x_15_address0 >> 2;
assign int_x_15_ce0      = x_15_ce0;
assign x_15_q0           = int_x_15_q0 >> (int_x_15_shift0 * 8);
assign int_x_15_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_15_ce1      = ar_hs | (int_x_15_write & WVALID);
assign int_x_15_we1      = int_x_15_write & w_hs;
assign int_x_15_be1      = int_x_15_we1 ? WSTRB : 'b0;
assign int_x_15_d1       = WDATA;
// x_16
assign int_x_16_address0 = x_16_address0 >> 2;
assign int_x_16_ce0      = x_16_ce0;
assign x_16_q0           = int_x_16_q0 >> (int_x_16_shift0 * 8);
assign int_x_16_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_16_ce1      = ar_hs | (int_x_16_write & WVALID);
assign int_x_16_we1      = int_x_16_write & w_hs;
assign int_x_16_be1      = int_x_16_we1 ? WSTRB : 'b0;
assign int_x_16_d1       = WDATA;
// x_17
assign int_x_17_address0 = x_17_address0 >> 2;
assign int_x_17_ce0      = x_17_ce0;
assign x_17_q0           = int_x_17_q0 >> (int_x_17_shift0 * 8);
assign int_x_17_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_17_ce1      = ar_hs | (int_x_17_write & WVALID);
assign int_x_17_we1      = int_x_17_write & w_hs;
assign int_x_17_be1      = int_x_17_we1 ? WSTRB : 'b0;
assign int_x_17_d1       = WDATA;
// x_18
assign int_x_18_address0 = x_18_address0 >> 2;
assign int_x_18_ce0      = x_18_ce0;
assign x_18_q0           = int_x_18_q0 >> (int_x_18_shift0 * 8);
assign int_x_18_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_18_ce1      = ar_hs | (int_x_18_write & WVALID);
assign int_x_18_we1      = int_x_18_write & w_hs;
assign int_x_18_be1      = int_x_18_we1 ? WSTRB : 'b0;
assign int_x_18_d1       = WDATA;
// x_19
assign int_x_19_address0 = x_19_address0 >> 2;
assign int_x_19_ce0      = x_19_ce0;
assign x_19_q0           = int_x_19_q0 >> (int_x_19_shift0 * 8);
assign int_x_19_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_19_ce1      = ar_hs | (int_x_19_write & WVALID);
assign int_x_19_we1      = int_x_19_write & w_hs;
assign int_x_19_be1      = int_x_19_we1 ? WSTRB : 'b0;
assign int_x_19_d1       = WDATA;
// x_20
assign int_x_20_address0 = x_20_address0 >> 2;
assign int_x_20_ce0      = x_20_ce0;
assign x_20_q0           = int_x_20_q0 >> (int_x_20_shift0 * 8);
assign int_x_20_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_20_ce1      = ar_hs | (int_x_20_write & WVALID);
assign int_x_20_we1      = int_x_20_write & w_hs;
assign int_x_20_be1      = int_x_20_we1 ? WSTRB : 'b0;
assign int_x_20_d1       = WDATA;
// x_21
assign int_x_21_address0 = x_21_address0 >> 2;
assign int_x_21_ce0      = x_21_ce0;
assign x_21_q0           = int_x_21_q0 >> (int_x_21_shift0 * 8);
assign int_x_21_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_21_ce1      = ar_hs | (int_x_21_write & WVALID);
assign int_x_21_we1      = int_x_21_write & w_hs;
assign int_x_21_be1      = int_x_21_we1 ? WSTRB : 'b0;
assign int_x_21_d1       = WDATA;
// x_22
assign int_x_22_address0 = x_22_address0 >> 2;
assign int_x_22_ce0      = x_22_ce0;
assign x_22_q0           = int_x_22_q0 >> (int_x_22_shift0 * 8);
assign int_x_22_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_22_ce1      = ar_hs | (int_x_22_write & WVALID);
assign int_x_22_we1      = int_x_22_write & w_hs;
assign int_x_22_be1      = int_x_22_we1 ? WSTRB : 'b0;
assign int_x_22_d1       = WDATA;
// x_23
assign int_x_23_address0 = x_23_address0 >> 2;
assign int_x_23_ce0      = x_23_ce0;
assign x_23_q0           = int_x_23_q0 >> (int_x_23_shift0 * 8);
assign int_x_23_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_23_ce1      = ar_hs | (int_x_23_write & WVALID);
assign int_x_23_we1      = int_x_23_write & w_hs;
assign int_x_23_be1      = int_x_23_we1 ? WSTRB : 'b0;
assign int_x_23_d1       = WDATA;
// x_24
assign int_x_24_address0 = x_24_address0 >> 2;
assign int_x_24_ce0      = x_24_ce0;
assign x_24_q0           = int_x_24_q0 >> (int_x_24_shift0 * 8);
assign int_x_24_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_24_ce1      = ar_hs | (int_x_24_write & WVALID);
assign int_x_24_we1      = int_x_24_write & w_hs;
assign int_x_24_be1      = int_x_24_we1 ? WSTRB : 'b0;
assign int_x_24_d1       = WDATA;
// x_25
assign int_x_25_address0 = x_25_address0 >> 2;
assign int_x_25_ce0      = x_25_ce0;
assign x_25_q0           = int_x_25_q0 >> (int_x_25_shift0 * 8);
assign int_x_25_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_25_ce1      = ar_hs | (int_x_25_write & WVALID);
assign int_x_25_we1      = int_x_25_write & w_hs;
assign int_x_25_be1      = int_x_25_we1 ? WSTRB : 'b0;
assign int_x_25_d1       = WDATA;
// x_26
assign int_x_26_address0 = x_26_address0 >> 2;
assign int_x_26_ce0      = x_26_ce0;
assign x_26_q0           = int_x_26_q0 >> (int_x_26_shift0 * 8);
assign int_x_26_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_26_ce1      = ar_hs | (int_x_26_write & WVALID);
assign int_x_26_we1      = int_x_26_write & w_hs;
assign int_x_26_be1      = int_x_26_we1 ? WSTRB : 'b0;
assign int_x_26_d1       = WDATA;
// x_27
assign int_x_27_address0 = x_27_address0 >> 2;
assign int_x_27_ce0      = x_27_ce0;
assign x_27_q0           = int_x_27_q0 >> (int_x_27_shift0 * 8);
assign int_x_27_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_27_ce1      = ar_hs | (int_x_27_write & WVALID);
assign int_x_27_we1      = int_x_27_write & w_hs;
assign int_x_27_be1      = int_x_27_we1 ? WSTRB : 'b0;
assign int_x_27_d1       = WDATA;
// x_28
assign int_x_28_address0 = x_28_address0 >> 2;
assign int_x_28_ce0      = x_28_ce0;
assign x_28_q0           = int_x_28_q0 >> (int_x_28_shift0 * 8);
assign int_x_28_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_28_ce1      = ar_hs | (int_x_28_write & WVALID);
assign int_x_28_we1      = int_x_28_write & w_hs;
assign int_x_28_be1      = int_x_28_we1 ? WSTRB : 'b0;
assign int_x_28_d1       = WDATA;
// x_29
assign int_x_29_address0 = x_29_address0 >> 2;
assign int_x_29_ce0      = x_29_ce0;
assign x_29_q0           = int_x_29_q0 >> (int_x_29_shift0 * 8);
assign int_x_29_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_29_ce1      = ar_hs | (int_x_29_write & WVALID);
assign int_x_29_we1      = int_x_29_write & w_hs;
assign int_x_29_be1      = int_x_29_we1 ? WSTRB : 'b0;
assign int_x_29_d1       = WDATA;
// x_30
assign int_x_30_address0 = x_30_address0 >> 2;
assign int_x_30_ce0      = x_30_ce0;
assign x_30_q0           = int_x_30_q0 >> (int_x_30_shift0 * 8);
assign int_x_30_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_30_ce1      = ar_hs | (int_x_30_write & WVALID);
assign int_x_30_we1      = int_x_30_write & w_hs;
assign int_x_30_be1      = int_x_30_we1 ? WSTRB : 'b0;
assign int_x_30_d1       = WDATA;
// x_31
assign int_x_31_address0 = x_31_address0 >> 2;
assign int_x_31_ce0      = x_31_ce0;
assign x_31_q0           = int_x_31_q0 >> (int_x_31_shift0 * 8);
assign int_x_31_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_31_ce1      = ar_hs | (int_x_31_write & WVALID);
assign int_x_31_we1      = int_x_31_write & w_hs;
assign int_x_31_be1      = int_x_31_we1 ? WSTRB : 'b0;
assign int_x_31_d1       = WDATA;
// x_32
assign int_x_32_address0 = x_32_address0 >> 2;
assign int_x_32_ce0      = x_32_ce0;
assign x_32_q0           = int_x_32_q0 >> (int_x_32_shift0 * 8);
assign int_x_32_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_32_ce1      = ar_hs | (int_x_32_write & WVALID);
assign int_x_32_we1      = int_x_32_write & w_hs;
assign int_x_32_be1      = int_x_32_we1 ? WSTRB : 'b0;
assign int_x_32_d1       = WDATA;
// x_33
assign int_x_33_address0 = x_33_address0 >> 2;
assign int_x_33_ce0      = x_33_ce0;
assign x_33_q0           = int_x_33_q0 >> (int_x_33_shift0 * 8);
assign int_x_33_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_33_ce1      = ar_hs | (int_x_33_write & WVALID);
assign int_x_33_we1      = int_x_33_write & w_hs;
assign int_x_33_be1      = int_x_33_we1 ? WSTRB : 'b0;
assign int_x_33_d1       = WDATA;
// x_34
assign int_x_34_address0 = x_34_address0 >> 2;
assign int_x_34_ce0      = x_34_ce0;
assign x_34_q0           = int_x_34_q0 >> (int_x_34_shift0 * 8);
assign int_x_34_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_34_ce1      = ar_hs | (int_x_34_write & WVALID);
assign int_x_34_we1      = int_x_34_write & w_hs;
assign int_x_34_be1      = int_x_34_we1 ? WSTRB : 'b0;
assign int_x_34_d1       = WDATA;
// x_35
assign int_x_35_address0 = x_35_address0 >> 2;
assign int_x_35_ce0      = x_35_ce0;
assign x_35_q0           = int_x_35_q0 >> (int_x_35_shift0 * 8);
assign int_x_35_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_35_ce1      = ar_hs | (int_x_35_write & WVALID);
assign int_x_35_we1      = int_x_35_write & w_hs;
assign int_x_35_be1      = int_x_35_we1 ? WSTRB : 'b0;
assign int_x_35_d1       = WDATA;
// x_36
assign int_x_36_address0 = x_36_address0 >> 2;
assign int_x_36_ce0      = x_36_ce0;
assign x_36_q0           = int_x_36_q0 >> (int_x_36_shift0 * 8);
assign int_x_36_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_36_ce1      = ar_hs | (int_x_36_write & WVALID);
assign int_x_36_we1      = int_x_36_write & w_hs;
assign int_x_36_be1      = int_x_36_we1 ? WSTRB : 'b0;
assign int_x_36_d1       = WDATA;
// x_37
assign int_x_37_address0 = x_37_address0 >> 2;
assign int_x_37_ce0      = x_37_ce0;
assign x_37_q0           = int_x_37_q0 >> (int_x_37_shift0 * 8);
assign int_x_37_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_37_ce1      = ar_hs | (int_x_37_write & WVALID);
assign int_x_37_we1      = int_x_37_write & w_hs;
assign int_x_37_be1      = int_x_37_we1 ? WSTRB : 'b0;
assign int_x_37_d1       = WDATA;
// x_38
assign int_x_38_address0 = x_38_address0 >> 2;
assign int_x_38_ce0      = x_38_ce0;
assign x_38_q0           = int_x_38_q0 >> (int_x_38_shift0 * 8);
assign int_x_38_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_38_ce1      = ar_hs | (int_x_38_write & WVALID);
assign int_x_38_we1      = int_x_38_write & w_hs;
assign int_x_38_be1      = int_x_38_we1 ? WSTRB : 'b0;
assign int_x_38_d1       = WDATA;
// x_39
assign int_x_39_address0 = x_39_address0 >> 2;
assign int_x_39_ce0      = x_39_ce0;
assign x_39_q0           = int_x_39_q0 >> (int_x_39_shift0 * 8);
assign int_x_39_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_39_ce1      = ar_hs | (int_x_39_write & WVALID);
assign int_x_39_we1      = int_x_39_write & w_hs;
assign int_x_39_be1      = int_x_39_we1 ? WSTRB : 'b0;
assign int_x_39_d1       = WDATA;
// x_40
assign int_x_40_address0 = x_40_address0 >> 2;
assign int_x_40_ce0      = x_40_ce0;
assign x_40_q0           = int_x_40_q0 >> (int_x_40_shift0 * 8);
assign int_x_40_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_40_ce1      = ar_hs | (int_x_40_write & WVALID);
assign int_x_40_we1      = int_x_40_write & w_hs;
assign int_x_40_be1      = int_x_40_we1 ? WSTRB : 'b0;
assign int_x_40_d1       = WDATA;
// x_41
assign int_x_41_address0 = x_41_address0 >> 2;
assign int_x_41_ce0      = x_41_ce0;
assign x_41_q0           = int_x_41_q0 >> (int_x_41_shift0 * 8);
assign int_x_41_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_41_ce1      = ar_hs | (int_x_41_write & WVALID);
assign int_x_41_we1      = int_x_41_write & w_hs;
assign int_x_41_be1      = int_x_41_we1 ? WSTRB : 'b0;
assign int_x_41_d1       = WDATA;
// x_42
assign int_x_42_address0 = x_42_address0 >> 2;
assign int_x_42_ce0      = x_42_ce0;
assign x_42_q0           = int_x_42_q0 >> (int_x_42_shift0 * 8);
assign int_x_42_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_42_ce1      = ar_hs | (int_x_42_write & WVALID);
assign int_x_42_we1      = int_x_42_write & w_hs;
assign int_x_42_be1      = int_x_42_we1 ? WSTRB : 'b0;
assign int_x_42_d1       = WDATA;
// x_43
assign int_x_43_address0 = x_43_address0 >> 2;
assign int_x_43_ce0      = x_43_ce0;
assign x_43_q0           = int_x_43_q0 >> (int_x_43_shift0 * 8);
assign int_x_43_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_43_ce1      = ar_hs | (int_x_43_write & WVALID);
assign int_x_43_we1      = int_x_43_write & w_hs;
assign int_x_43_be1      = int_x_43_we1 ? WSTRB : 'b0;
assign int_x_43_d1       = WDATA;
// x_44
assign int_x_44_address0 = x_44_address0 >> 2;
assign int_x_44_ce0      = x_44_ce0;
assign x_44_q0           = int_x_44_q0 >> (int_x_44_shift0 * 8);
assign int_x_44_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_44_ce1      = ar_hs | (int_x_44_write & WVALID);
assign int_x_44_we1      = int_x_44_write & w_hs;
assign int_x_44_be1      = int_x_44_we1 ? WSTRB : 'b0;
assign int_x_44_d1       = WDATA;
// x_45
assign int_x_45_address0 = x_45_address0 >> 2;
assign int_x_45_ce0      = x_45_ce0;
assign x_45_q0           = int_x_45_q0 >> (int_x_45_shift0 * 8);
assign int_x_45_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_45_ce1      = ar_hs | (int_x_45_write & WVALID);
assign int_x_45_we1      = int_x_45_write & w_hs;
assign int_x_45_be1      = int_x_45_we1 ? WSTRB : 'b0;
assign int_x_45_d1       = WDATA;
// x_46
assign int_x_46_address0 = x_46_address0 >> 2;
assign int_x_46_ce0      = x_46_ce0;
assign x_46_q0           = int_x_46_q0 >> (int_x_46_shift0 * 8);
assign int_x_46_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_46_ce1      = ar_hs | (int_x_46_write & WVALID);
assign int_x_46_we1      = int_x_46_write & w_hs;
assign int_x_46_be1      = int_x_46_we1 ? WSTRB : 'b0;
assign int_x_46_d1       = WDATA;
// x_47
assign int_x_47_address0 = x_47_address0 >> 2;
assign int_x_47_ce0      = x_47_ce0;
assign x_47_q0           = int_x_47_q0 >> (int_x_47_shift0 * 8);
assign int_x_47_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_47_ce1      = ar_hs | (int_x_47_write & WVALID);
assign int_x_47_we1      = int_x_47_write & w_hs;
assign int_x_47_be1      = int_x_47_we1 ? WSTRB : 'b0;
assign int_x_47_d1       = WDATA;
// x_48
assign int_x_48_address0 = x_48_address0 >> 2;
assign int_x_48_ce0      = x_48_ce0;
assign x_48_q0           = int_x_48_q0 >> (int_x_48_shift0 * 8);
assign int_x_48_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_48_ce1      = ar_hs | (int_x_48_write & WVALID);
assign int_x_48_we1      = int_x_48_write & w_hs;
assign int_x_48_be1      = int_x_48_we1 ? WSTRB : 'b0;
assign int_x_48_d1       = WDATA;
// x_49
assign int_x_49_address0 = x_49_address0 >> 2;
assign int_x_49_ce0      = x_49_ce0;
assign x_49_q0           = int_x_49_q0 >> (int_x_49_shift0 * 8);
assign int_x_49_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_49_ce1      = ar_hs | (int_x_49_write & WVALID);
assign int_x_49_we1      = int_x_49_write & w_hs;
assign int_x_49_be1      = int_x_49_we1 ? WSTRB : 'b0;
assign int_x_49_d1       = WDATA;
// x_50
assign int_x_50_address0 = x_50_address0 >> 2;
assign int_x_50_ce0      = x_50_ce0;
assign x_50_q0           = int_x_50_q0 >> (int_x_50_shift0 * 8);
assign int_x_50_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_50_ce1      = ar_hs | (int_x_50_write & WVALID);
assign int_x_50_we1      = int_x_50_write & w_hs;
assign int_x_50_be1      = int_x_50_we1 ? WSTRB : 'b0;
assign int_x_50_d1       = WDATA;
// x_51
assign int_x_51_address0 = x_51_address0 >> 2;
assign int_x_51_ce0      = x_51_ce0;
assign x_51_q0           = int_x_51_q0 >> (int_x_51_shift0 * 8);
assign int_x_51_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_51_ce1      = ar_hs | (int_x_51_write & WVALID);
assign int_x_51_we1      = int_x_51_write & w_hs;
assign int_x_51_be1      = int_x_51_we1 ? WSTRB : 'b0;
assign int_x_51_d1       = WDATA;
// x_52
assign int_x_52_address0 = x_52_address0 >> 2;
assign int_x_52_ce0      = x_52_ce0;
assign x_52_q0           = int_x_52_q0 >> (int_x_52_shift0 * 8);
assign int_x_52_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_52_ce1      = ar_hs | (int_x_52_write & WVALID);
assign int_x_52_we1      = int_x_52_write & w_hs;
assign int_x_52_be1      = int_x_52_we1 ? WSTRB : 'b0;
assign int_x_52_d1       = WDATA;
// x_53
assign int_x_53_address0 = x_53_address0 >> 2;
assign int_x_53_ce0      = x_53_ce0;
assign x_53_q0           = int_x_53_q0 >> (int_x_53_shift0 * 8);
assign int_x_53_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_53_ce1      = ar_hs | (int_x_53_write & WVALID);
assign int_x_53_we1      = int_x_53_write & w_hs;
assign int_x_53_be1      = int_x_53_we1 ? WSTRB : 'b0;
assign int_x_53_d1       = WDATA;
// x_54
assign int_x_54_address0 = x_54_address0 >> 2;
assign int_x_54_ce0      = x_54_ce0;
assign x_54_q0           = int_x_54_q0 >> (int_x_54_shift0 * 8);
assign int_x_54_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_54_ce1      = ar_hs | (int_x_54_write & WVALID);
assign int_x_54_we1      = int_x_54_write & w_hs;
assign int_x_54_be1      = int_x_54_we1 ? WSTRB : 'b0;
assign int_x_54_d1       = WDATA;
// x_55
assign int_x_55_address0 = x_55_address0 >> 2;
assign int_x_55_ce0      = x_55_ce0;
assign x_55_q0           = int_x_55_q0 >> (int_x_55_shift0 * 8);
assign int_x_55_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_55_ce1      = ar_hs | (int_x_55_write & WVALID);
assign int_x_55_we1      = int_x_55_write & w_hs;
assign int_x_55_be1      = int_x_55_we1 ? WSTRB : 'b0;
assign int_x_55_d1       = WDATA;
// x_56
assign int_x_56_address0 = x_56_address0 >> 2;
assign int_x_56_ce0      = x_56_ce0;
assign x_56_q0           = int_x_56_q0 >> (int_x_56_shift0 * 8);
assign int_x_56_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_56_ce1      = ar_hs | (int_x_56_write & WVALID);
assign int_x_56_we1      = int_x_56_write & w_hs;
assign int_x_56_be1      = int_x_56_we1 ? WSTRB : 'b0;
assign int_x_56_d1       = WDATA;
// x_57
assign int_x_57_address0 = x_57_address0 >> 2;
assign int_x_57_ce0      = x_57_ce0;
assign x_57_q0           = int_x_57_q0 >> (int_x_57_shift0 * 8);
assign int_x_57_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_57_ce1      = ar_hs | (int_x_57_write & WVALID);
assign int_x_57_we1      = int_x_57_write & w_hs;
assign int_x_57_be1      = int_x_57_we1 ? WSTRB : 'b0;
assign int_x_57_d1       = WDATA;
// x_58
assign int_x_58_address0 = x_58_address0 >> 2;
assign int_x_58_ce0      = x_58_ce0;
assign x_58_q0           = int_x_58_q0 >> (int_x_58_shift0 * 8);
assign int_x_58_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_58_ce1      = ar_hs | (int_x_58_write & WVALID);
assign int_x_58_we1      = int_x_58_write & w_hs;
assign int_x_58_be1      = int_x_58_we1 ? WSTRB : 'b0;
assign int_x_58_d1       = WDATA;
// x_59
assign int_x_59_address0 = x_59_address0 >> 2;
assign int_x_59_ce0      = x_59_ce0;
assign x_59_q0           = int_x_59_q0 >> (int_x_59_shift0 * 8);
assign int_x_59_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_59_ce1      = ar_hs | (int_x_59_write & WVALID);
assign int_x_59_we1      = int_x_59_write & w_hs;
assign int_x_59_be1      = int_x_59_we1 ? WSTRB : 'b0;
assign int_x_59_d1       = WDATA;
// x_60
assign int_x_60_address0 = x_60_address0 >> 2;
assign int_x_60_ce0      = x_60_ce0;
assign x_60_q0           = int_x_60_q0 >> (int_x_60_shift0 * 8);
assign int_x_60_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_60_ce1      = ar_hs | (int_x_60_write & WVALID);
assign int_x_60_we1      = int_x_60_write & w_hs;
assign int_x_60_be1      = int_x_60_we1 ? WSTRB : 'b0;
assign int_x_60_d1       = WDATA;
// x_61
assign int_x_61_address0 = x_61_address0 >> 2;
assign int_x_61_ce0      = x_61_ce0;
assign x_61_q0           = int_x_61_q0 >> (int_x_61_shift0 * 8);
assign int_x_61_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_61_ce1      = ar_hs | (int_x_61_write & WVALID);
assign int_x_61_we1      = int_x_61_write & w_hs;
assign int_x_61_be1      = int_x_61_we1 ? WSTRB : 'b0;
assign int_x_61_d1       = WDATA;
// x_62
assign int_x_62_address0 = x_62_address0 >> 2;
assign int_x_62_ce0      = x_62_ce0;
assign x_62_q0           = int_x_62_q0 >> (int_x_62_shift0 * 8);
assign int_x_62_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_62_ce1      = ar_hs | (int_x_62_write & WVALID);
assign int_x_62_we1      = int_x_62_write & w_hs;
assign int_x_62_be1      = int_x_62_we1 ? WSTRB : 'b0;
assign int_x_62_d1       = WDATA;
// x_63
assign int_x_63_address0 = x_63_address0 >> 2;
assign int_x_63_ce0      = x_63_ce0;
assign x_63_q0           = int_x_63_q0 >> (int_x_63_shift0 * 8);
assign int_x_63_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_63_ce1      = ar_hs | (int_x_63_write & WVALID);
assign int_x_63_we1      = int_x_63_write & w_hs;
assign int_x_63_be1      = int_x_63_we1 ? WSTRB : 'b0;
assign int_x_63_d1       = WDATA;
// int_x_0_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_0_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_0_BASE && raddr <= ADDR_X_0_HIGH)
            int_x_0_read <= 1'b1;
        else
            int_x_0_read <= 1'b0;
    end
end

// int_x_0_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_0_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_0_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_0_HIGH)
            int_x_0_write <= 1'b1;
        else if (w_hs)
            int_x_0_write <= 1'b0;
    end
end

// int_x_0_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_0_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_0_ce0)
            int_x_0_shift0 <= x_0_address0[1:0];
    end
end

// int_x_1_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_1_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_1_BASE && raddr <= ADDR_X_1_HIGH)
            int_x_1_read <= 1'b1;
        else
            int_x_1_read <= 1'b0;
    end
end

// int_x_1_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_1_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_1_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_1_HIGH)
            int_x_1_write <= 1'b1;
        else if (w_hs)
            int_x_1_write <= 1'b0;
    end
end

// int_x_1_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_1_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_1_ce0)
            int_x_1_shift0 <= x_1_address0[1:0];
    end
end

// int_x_2_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_2_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_2_BASE && raddr <= ADDR_X_2_HIGH)
            int_x_2_read <= 1'b1;
        else
            int_x_2_read <= 1'b0;
    end
end

// int_x_2_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_2_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_2_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_2_HIGH)
            int_x_2_write <= 1'b1;
        else if (w_hs)
            int_x_2_write <= 1'b0;
    end
end

// int_x_2_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_2_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_2_ce0)
            int_x_2_shift0 <= x_2_address0[1:0];
    end
end

// int_x_3_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_3_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_3_BASE && raddr <= ADDR_X_3_HIGH)
            int_x_3_read <= 1'b1;
        else
            int_x_3_read <= 1'b0;
    end
end

// int_x_3_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_3_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_3_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_3_HIGH)
            int_x_3_write <= 1'b1;
        else if (w_hs)
            int_x_3_write <= 1'b0;
    end
end

// int_x_3_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_3_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_3_ce0)
            int_x_3_shift0 <= x_3_address0[1:0];
    end
end

// int_x_4_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_4_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_4_BASE && raddr <= ADDR_X_4_HIGH)
            int_x_4_read <= 1'b1;
        else
            int_x_4_read <= 1'b0;
    end
end

// int_x_4_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_4_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_4_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_4_HIGH)
            int_x_4_write <= 1'b1;
        else if (w_hs)
            int_x_4_write <= 1'b0;
    end
end

// int_x_4_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_4_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_4_ce0)
            int_x_4_shift0 <= x_4_address0[1:0];
    end
end

// int_x_5_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_5_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_5_BASE && raddr <= ADDR_X_5_HIGH)
            int_x_5_read <= 1'b1;
        else
            int_x_5_read <= 1'b0;
    end
end

// int_x_5_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_5_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_5_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_5_HIGH)
            int_x_5_write <= 1'b1;
        else if (w_hs)
            int_x_5_write <= 1'b0;
    end
end

// int_x_5_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_5_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_5_ce0)
            int_x_5_shift0 <= x_5_address0[1:0];
    end
end

// int_x_6_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_6_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_6_BASE && raddr <= ADDR_X_6_HIGH)
            int_x_6_read <= 1'b1;
        else
            int_x_6_read <= 1'b0;
    end
end

// int_x_6_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_6_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_6_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_6_HIGH)
            int_x_6_write <= 1'b1;
        else if (w_hs)
            int_x_6_write <= 1'b0;
    end
end

// int_x_6_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_6_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_6_ce0)
            int_x_6_shift0 <= x_6_address0[1:0];
    end
end

// int_x_7_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_7_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_7_BASE && raddr <= ADDR_X_7_HIGH)
            int_x_7_read <= 1'b1;
        else
            int_x_7_read <= 1'b0;
    end
end

// int_x_7_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_7_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_7_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_7_HIGH)
            int_x_7_write <= 1'b1;
        else if (w_hs)
            int_x_7_write <= 1'b0;
    end
end

// int_x_7_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_7_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_7_ce0)
            int_x_7_shift0 <= x_7_address0[1:0];
    end
end

// int_x_8_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_8_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_8_BASE && raddr <= ADDR_X_8_HIGH)
            int_x_8_read <= 1'b1;
        else
            int_x_8_read <= 1'b0;
    end
end

// int_x_8_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_8_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_8_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_8_HIGH)
            int_x_8_write <= 1'b1;
        else if (w_hs)
            int_x_8_write <= 1'b0;
    end
end

// int_x_8_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_8_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_8_ce0)
            int_x_8_shift0 <= x_8_address0[1:0];
    end
end

// int_x_9_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_9_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_9_BASE && raddr <= ADDR_X_9_HIGH)
            int_x_9_read <= 1'b1;
        else
            int_x_9_read <= 1'b0;
    end
end

// int_x_9_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_9_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_9_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_9_HIGH)
            int_x_9_write <= 1'b1;
        else if (w_hs)
            int_x_9_write <= 1'b0;
    end
end

// int_x_9_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_9_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_9_ce0)
            int_x_9_shift0 <= x_9_address0[1:0];
    end
end

// int_x_10_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_10_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_10_BASE && raddr <= ADDR_X_10_HIGH)
            int_x_10_read <= 1'b1;
        else
            int_x_10_read <= 1'b0;
    end
end

// int_x_10_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_10_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_10_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_10_HIGH)
            int_x_10_write <= 1'b1;
        else if (w_hs)
            int_x_10_write <= 1'b0;
    end
end

// int_x_10_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_10_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_10_ce0)
            int_x_10_shift0 <= x_10_address0[1:0];
    end
end

// int_x_11_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_11_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_11_BASE && raddr <= ADDR_X_11_HIGH)
            int_x_11_read <= 1'b1;
        else
            int_x_11_read <= 1'b0;
    end
end

// int_x_11_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_11_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_11_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_11_HIGH)
            int_x_11_write <= 1'b1;
        else if (w_hs)
            int_x_11_write <= 1'b0;
    end
end

// int_x_11_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_11_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_11_ce0)
            int_x_11_shift0 <= x_11_address0[1:0];
    end
end

// int_x_12_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_12_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_12_BASE && raddr <= ADDR_X_12_HIGH)
            int_x_12_read <= 1'b1;
        else
            int_x_12_read <= 1'b0;
    end
end

// int_x_12_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_12_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_12_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_12_HIGH)
            int_x_12_write <= 1'b1;
        else if (w_hs)
            int_x_12_write <= 1'b0;
    end
end

// int_x_12_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_12_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_12_ce0)
            int_x_12_shift0 <= x_12_address0[1:0];
    end
end

// int_x_13_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_13_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_13_BASE && raddr <= ADDR_X_13_HIGH)
            int_x_13_read <= 1'b1;
        else
            int_x_13_read <= 1'b0;
    end
end

// int_x_13_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_13_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_13_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_13_HIGH)
            int_x_13_write <= 1'b1;
        else if (w_hs)
            int_x_13_write <= 1'b0;
    end
end

// int_x_13_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_13_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_13_ce0)
            int_x_13_shift0 <= x_13_address0[1:0];
    end
end

// int_x_14_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_14_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_14_BASE && raddr <= ADDR_X_14_HIGH)
            int_x_14_read <= 1'b1;
        else
            int_x_14_read <= 1'b0;
    end
end

// int_x_14_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_14_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_14_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_14_HIGH)
            int_x_14_write <= 1'b1;
        else if (w_hs)
            int_x_14_write <= 1'b0;
    end
end

// int_x_14_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_14_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_14_ce0)
            int_x_14_shift0 <= x_14_address0[1:0];
    end
end

// int_x_15_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_15_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_15_BASE && raddr <= ADDR_X_15_HIGH)
            int_x_15_read <= 1'b1;
        else
            int_x_15_read <= 1'b0;
    end
end

// int_x_15_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_15_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_15_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_15_HIGH)
            int_x_15_write <= 1'b1;
        else if (w_hs)
            int_x_15_write <= 1'b0;
    end
end

// int_x_15_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_15_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_15_ce0)
            int_x_15_shift0 <= x_15_address0[1:0];
    end
end

// int_x_16_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_16_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_16_BASE && raddr <= ADDR_X_16_HIGH)
            int_x_16_read <= 1'b1;
        else
            int_x_16_read <= 1'b0;
    end
end

// int_x_16_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_16_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_16_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_16_HIGH)
            int_x_16_write <= 1'b1;
        else if (w_hs)
            int_x_16_write <= 1'b0;
    end
end

// int_x_16_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_16_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_16_ce0)
            int_x_16_shift0 <= x_16_address0[1:0];
    end
end

// int_x_17_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_17_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_17_BASE && raddr <= ADDR_X_17_HIGH)
            int_x_17_read <= 1'b1;
        else
            int_x_17_read <= 1'b0;
    end
end

// int_x_17_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_17_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_17_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_17_HIGH)
            int_x_17_write <= 1'b1;
        else if (w_hs)
            int_x_17_write <= 1'b0;
    end
end

// int_x_17_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_17_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_17_ce0)
            int_x_17_shift0 <= x_17_address0[1:0];
    end
end

// int_x_18_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_18_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_18_BASE && raddr <= ADDR_X_18_HIGH)
            int_x_18_read <= 1'b1;
        else
            int_x_18_read <= 1'b0;
    end
end

// int_x_18_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_18_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_18_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_18_HIGH)
            int_x_18_write <= 1'b1;
        else if (w_hs)
            int_x_18_write <= 1'b0;
    end
end

// int_x_18_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_18_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_18_ce0)
            int_x_18_shift0 <= x_18_address0[1:0];
    end
end

// int_x_19_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_19_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_19_BASE && raddr <= ADDR_X_19_HIGH)
            int_x_19_read <= 1'b1;
        else
            int_x_19_read <= 1'b0;
    end
end

// int_x_19_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_19_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_19_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_19_HIGH)
            int_x_19_write <= 1'b1;
        else if (w_hs)
            int_x_19_write <= 1'b0;
    end
end

// int_x_19_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_19_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_19_ce0)
            int_x_19_shift0 <= x_19_address0[1:0];
    end
end

// int_x_20_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_20_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_20_BASE && raddr <= ADDR_X_20_HIGH)
            int_x_20_read <= 1'b1;
        else
            int_x_20_read <= 1'b0;
    end
end

// int_x_20_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_20_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_20_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_20_HIGH)
            int_x_20_write <= 1'b1;
        else if (w_hs)
            int_x_20_write <= 1'b0;
    end
end

// int_x_20_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_20_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_20_ce0)
            int_x_20_shift0 <= x_20_address0[1:0];
    end
end

// int_x_21_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_21_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_21_BASE && raddr <= ADDR_X_21_HIGH)
            int_x_21_read <= 1'b1;
        else
            int_x_21_read <= 1'b0;
    end
end

// int_x_21_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_21_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_21_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_21_HIGH)
            int_x_21_write <= 1'b1;
        else if (w_hs)
            int_x_21_write <= 1'b0;
    end
end

// int_x_21_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_21_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_21_ce0)
            int_x_21_shift0 <= x_21_address0[1:0];
    end
end

// int_x_22_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_22_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_22_BASE && raddr <= ADDR_X_22_HIGH)
            int_x_22_read <= 1'b1;
        else
            int_x_22_read <= 1'b0;
    end
end

// int_x_22_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_22_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_22_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_22_HIGH)
            int_x_22_write <= 1'b1;
        else if (w_hs)
            int_x_22_write <= 1'b0;
    end
end

// int_x_22_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_22_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_22_ce0)
            int_x_22_shift0 <= x_22_address0[1:0];
    end
end

// int_x_23_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_23_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_23_BASE && raddr <= ADDR_X_23_HIGH)
            int_x_23_read <= 1'b1;
        else
            int_x_23_read <= 1'b0;
    end
end

// int_x_23_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_23_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_23_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_23_HIGH)
            int_x_23_write <= 1'b1;
        else if (w_hs)
            int_x_23_write <= 1'b0;
    end
end

// int_x_23_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_23_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_23_ce0)
            int_x_23_shift0 <= x_23_address0[1:0];
    end
end

// int_x_24_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_24_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_24_BASE && raddr <= ADDR_X_24_HIGH)
            int_x_24_read <= 1'b1;
        else
            int_x_24_read <= 1'b0;
    end
end

// int_x_24_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_24_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_24_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_24_HIGH)
            int_x_24_write <= 1'b1;
        else if (w_hs)
            int_x_24_write <= 1'b0;
    end
end

// int_x_24_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_24_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_24_ce0)
            int_x_24_shift0 <= x_24_address0[1:0];
    end
end

// int_x_25_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_25_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_25_BASE && raddr <= ADDR_X_25_HIGH)
            int_x_25_read <= 1'b1;
        else
            int_x_25_read <= 1'b0;
    end
end

// int_x_25_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_25_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_25_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_25_HIGH)
            int_x_25_write <= 1'b1;
        else if (w_hs)
            int_x_25_write <= 1'b0;
    end
end

// int_x_25_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_25_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_25_ce0)
            int_x_25_shift0 <= x_25_address0[1:0];
    end
end

// int_x_26_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_26_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_26_BASE && raddr <= ADDR_X_26_HIGH)
            int_x_26_read <= 1'b1;
        else
            int_x_26_read <= 1'b0;
    end
end

// int_x_26_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_26_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_26_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_26_HIGH)
            int_x_26_write <= 1'b1;
        else if (w_hs)
            int_x_26_write <= 1'b0;
    end
end

// int_x_26_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_26_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_26_ce0)
            int_x_26_shift0 <= x_26_address0[1:0];
    end
end

// int_x_27_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_27_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_27_BASE && raddr <= ADDR_X_27_HIGH)
            int_x_27_read <= 1'b1;
        else
            int_x_27_read <= 1'b0;
    end
end

// int_x_27_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_27_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_27_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_27_HIGH)
            int_x_27_write <= 1'b1;
        else if (w_hs)
            int_x_27_write <= 1'b0;
    end
end

// int_x_27_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_27_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_27_ce0)
            int_x_27_shift0 <= x_27_address0[1:0];
    end
end

// int_x_28_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_28_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_28_BASE && raddr <= ADDR_X_28_HIGH)
            int_x_28_read <= 1'b1;
        else
            int_x_28_read <= 1'b0;
    end
end

// int_x_28_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_28_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_28_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_28_HIGH)
            int_x_28_write <= 1'b1;
        else if (w_hs)
            int_x_28_write <= 1'b0;
    end
end

// int_x_28_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_28_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_28_ce0)
            int_x_28_shift0 <= x_28_address0[1:0];
    end
end

// int_x_29_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_29_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_29_BASE && raddr <= ADDR_X_29_HIGH)
            int_x_29_read <= 1'b1;
        else
            int_x_29_read <= 1'b0;
    end
end

// int_x_29_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_29_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_29_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_29_HIGH)
            int_x_29_write <= 1'b1;
        else if (w_hs)
            int_x_29_write <= 1'b0;
    end
end

// int_x_29_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_29_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_29_ce0)
            int_x_29_shift0 <= x_29_address0[1:0];
    end
end

// int_x_30_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_30_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_30_BASE && raddr <= ADDR_X_30_HIGH)
            int_x_30_read <= 1'b1;
        else
            int_x_30_read <= 1'b0;
    end
end

// int_x_30_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_30_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_30_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_30_HIGH)
            int_x_30_write <= 1'b1;
        else if (w_hs)
            int_x_30_write <= 1'b0;
    end
end

// int_x_30_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_30_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_30_ce0)
            int_x_30_shift0 <= x_30_address0[1:0];
    end
end

// int_x_31_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_31_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_31_BASE && raddr <= ADDR_X_31_HIGH)
            int_x_31_read <= 1'b1;
        else
            int_x_31_read <= 1'b0;
    end
end

// int_x_31_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_31_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_31_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_31_HIGH)
            int_x_31_write <= 1'b1;
        else if (w_hs)
            int_x_31_write <= 1'b0;
    end
end

// int_x_31_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_31_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_31_ce0)
            int_x_31_shift0 <= x_31_address0[1:0];
    end
end

// int_x_32_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_32_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_32_BASE && raddr <= ADDR_X_32_HIGH)
            int_x_32_read <= 1'b1;
        else
            int_x_32_read <= 1'b0;
    end
end

// int_x_32_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_32_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_32_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_32_HIGH)
            int_x_32_write <= 1'b1;
        else if (w_hs)
            int_x_32_write <= 1'b0;
    end
end

// int_x_32_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_32_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_32_ce0)
            int_x_32_shift0 <= x_32_address0[1:0];
    end
end

// int_x_33_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_33_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_33_BASE && raddr <= ADDR_X_33_HIGH)
            int_x_33_read <= 1'b1;
        else
            int_x_33_read <= 1'b0;
    end
end

// int_x_33_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_33_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_33_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_33_HIGH)
            int_x_33_write <= 1'b1;
        else if (w_hs)
            int_x_33_write <= 1'b0;
    end
end

// int_x_33_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_33_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_33_ce0)
            int_x_33_shift0 <= x_33_address0[1:0];
    end
end

// int_x_34_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_34_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_34_BASE && raddr <= ADDR_X_34_HIGH)
            int_x_34_read <= 1'b1;
        else
            int_x_34_read <= 1'b0;
    end
end

// int_x_34_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_34_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_34_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_34_HIGH)
            int_x_34_write <= 1'b1;
        else if (w_hs)
            int_x_34_write <= 1'b0;
    end
end

// int_x_34_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_34_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_34_ce0)
            int_x_34_shift0 <= x_34_address0[1:0];
    end
end

// int_x_35_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_35_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_35_BASE && raddr <= ADDR_X_35_HIGH)
            int_x_35_read <= 1'b1;
        else
            int_x_35_read <= 1'b0;
    end
end

// int_x_35_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_35_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_35_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_35_HIGH)
            int_x_35_write <= 1'b1;
        else if (w_hs)
            int_x_35_write <= 1'b0;
    end
end

// int_x_35_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_35_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_35_ce0)
            int_x_35_shift0 <= x_35_address0[1:0];
    end
end

// int_x_36_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_36_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_36_BASE && raddr <= ADDR_X_36_HIGH)
            int_x_36_read <= 1'b1;
        else
            int_x_36_read <= 1'b0;
    end
end

// int_x_36_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_36_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_36_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_36_HIGH)
            int_x_36_write <= 1'b1;
        else if (w_hs)
            int_x_36_write <= 1'b0;
    end
end

// int_x_36_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_36_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_36_ce0)
            int_x_36_shift0 <= x_36_address0[1:0];
    end
end

// int_x_37_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_37_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_37_BASE && raddr <= ADDR_X_37_HIGH)
            int_x_37_read <= 1'b1;
        else
            int_x_37_read <= 1'b0;
    end
end

// int_x_37_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_37_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_37_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_37_HIGH)
            int_x_37_write <= 1'b1;
        else if (w_hs)
            int_x_37_write <= 1'b0;
    end
end

// int_x_37_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_37_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_37_ce0)
            int_x_37_shift0 <= x_37_address0[1:0];
    end
end

// int_x_38_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_38_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_38_BASE && raddr <= ADDR_X_38_HIGH)
            int_x_38_read <= 1'b1;
        else
            int_x_38_read <= 1'b0;
    end
end

// int_x_38_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_38_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_38_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_38_HIGH)
            int_x_38_write <= 1'b1;
        else if (w_hs)
            int_x_38_write <= 1'b0;
    end
end

// int_x_38_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_38_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_38_ce0)
            int_x_38_shift0 <= x_38_address0[1:0];
    end
end

// int_x_39_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_39_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_39_BASE && raddr <= ADDR_X_39_HIGH)
            int_x_39_read <= 1'b1;
        else
            int_x_39_read <= 1'b0;
    end
end

// int_x_39_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_39_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_39_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_39_HIGH)
            int_x_39_write <= 1'b1;
        else if (w_hs)
            int_x_39_write <= 1'b0;
    end
end

// int_x_39_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_39_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_39_ce0)
            int_x_39_shift0 <= x_39_address0[1:0];
    end
end

// int_x_40_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_40_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_40_BASE && raddr <= ADDR_X_40_HIGH)
            int_x_40_read <= 1'b1;
        else
            int_x_40_read <= 1'b0;
    end
end

// int_x_40_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_40_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_40_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_40_HIGH)
            int_x_40_write <= 1'b1;
        else if (w_hs)
            int_x_40_write <= 1'b0;
    end
end

// int_x_40_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_40_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_40_ce0)
            int_x_40_shift0 <= x_40_address0[1:0];
    end
end

// int_x_41_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_41_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_41_BASE && raddr <= ADDR_X_41_HIGH)
            int_x_41_read <= 1'b1;
        else
            int_x_41_read <= 1'b0;
    end
end

// int_x_41_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_41_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_41_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_41_HIGH)
            int_x_41_write <= 1'b1;
        else if (w_hs)
            int_x_41_write <= 1'b0;
    end
end

// int_x_41_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_41_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_41_ce0)
            int_x_41_shift0 <= x_41_address0[1:0];
    end
end

// int_x_42_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_42_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_42_BASE && raddr <= ADDR_X_42_HIGH)
            int_x_42_read <= 1'b1;
        else
            int_x_42_read <= 1'b0;
    end
end

// int_x_42_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_42_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_42_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_42_HIGH)
            int_x_42_write <= 1'b1;
        else if (w_hs)
            int_x_42_write <= 1'b0;
    end
end

// int_x_42_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_42_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_42_ce0)
            int_x_42_shift0 <= x_42_address0[1:0];
    end
end

// int_x_43_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_43_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_43_BASE && raddr <= ADDR_X_43_HIGH)
            int_x_43_read <= 1'b1;
        else
            int_x_43_read <= 1'b0;
    end
end

// int_x_43_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_43_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_43_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_43_HIGH)
            int_x_43_write <= 1'b1;
        else if (w_hs)
            int_x_43_write <= 1'b0;
    end
end

// int_x_43_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_43_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_43_ce0)
            int_x_43_shift0 <= x_43_address0[1:0];
    end
end

// int_x_44_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_44_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_44_BASE && raddr <= ADDR_X_44_HIGH)
            int_x_44_read <= 1'b1;
        else
            int_x_44_read <= 1'b0;
    end
end

// int_x_44_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_44_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_44_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_44_HIGH)
            int_x_44_write <= 1'b1;
        else if (w_hs)
            int_x_44_write <= 1'b0;
    end
end

// int_x_44_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_44_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_44_ce0)
            int_x_44_shift0 <= x_44_address0[1:0];
    end
end

// int_x_45_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_45_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_45_BASE && raddr <= ADDR_X_45_HIGH)
            int_x_45_read <= 1'b1;
        else
            int_x_45_read <= 1'b0;
    end
end

// int_x_45_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_45_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_45_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_45_HIGH)
            int_x_45_write <= 1'b1;
        else if (w_hs)
            int_x_45_write <= 1'b0;
    end
end

// int_x_45_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_45_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_45_ce0)
            int_x_45_shift0 <= x_45_address0[1:0];
    end
end

// int_x_46_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_46_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_46_BASE && raddr <= ADDR_X_46_HIGH)
            int_x_46_read <= 1'b1;
        else
            int_x_46_read <= 1'b0;
    end
end

// int_x_46_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_46_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_46_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_46_HIGH)
            int_x_46_write <= 1'b1;
        else if (w_hs)
            int_x_46_write <= 1'b0;
    end
end

// int_x_46_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_46_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_46_ce0)
            int_x_46_shift0 <= x_46_address0[1:0];
    end
end

// int_x_47_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_47_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_47_BASE && raddr <= ADDR_X_47_HIGH)
            int_x_47_read <= 1'b1;
        else
            int_x_47_read <= 1'b0;
    end
end

// int_x_47_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_47_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_47_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_47_HIGH)
            int_x_47_write <= 1'b1;
        else if (w_hs)
            int_x_47_write <= 1'b0;
    end
end

// int_x_47_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_47_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_47_ce0)
            int_x_47_shift0 <= x_47_address0[1:0];
    end
end

// int_x_48_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_48_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_48_BASE && raddr <= ADDR_X_48_HIGH)
            int_x_48_read <= 1'b1;
        else
            int_x_48_read <= 1'b0;
    end
end

// int_x_48_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_48_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_48_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_48_HIGH)
            int_x_48_write <= 1'b1;
        else if (w_hs)
            int_x_48_write <= 1'b0;
    end
end

// int_x_48_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_48_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_48_ce0)
            int_x_48_shift0 <= x_48_address0[1:0];
    end
end

// int_x_49_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_49_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_49_BASE && raddr <= ADDR_X_49_HIGH)
            int_x_49_read <= 1'b1;
        else
            int_x_49_read <= 1'b0;
    end
end

// int_x_49_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_49_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_49_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_49_HIGH)
            int_x_49_write <= 1'b1;
        else if (w_hs)
            int_x_49_write <= 1'b0;
    end
end

// int_x_49_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_49_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_49_ce0)
            int_x_49_shift0 <= x_49_address0[1:0];
    end
end

// int_x_50_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_50_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_50_BASE && raddr <= ADDR_X_50_HIGH)
            int_x_50_read <= 1'b1;
        else
            int_x_50_read <= 1'b0;
    end
end

// int_x_50_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_50_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_50_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_50_HIGH)
            int_x_50_write <= 1'b1;
        else if (w_hs)
            int_x_50_write <= 1'b0;
    end
end

// int_x_50_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_50_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_50_ce0)
            int_x_50_shift0 <= x_50_address0[1:0];
    end
end

// int_x_51_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_51_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_51_BASE && raddr <= ADDR_X_51_HIGH)
            int_x_51_read <= 1'b1;
        else
            int_x_51_read <= 1'b0;
    end
end

// int_x_51_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_51_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_51_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_51_HIGH)
            int_x_51_write <= 1'b1;
        else if (w_hs)
            int_x_51_write <= 1'b0;
    end
end

// int_x_51_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_51_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_51_ce0)
            int_x_51_shift0 <= x_51_address0[1:0];
    end
end

// int_x_52_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_52_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_52_BASE && raddr <= ADDR_X_52_HIGH)
            int_x_52_read <= 1'b1;
        else
            int_x_52_read <= 1'b0;
    end
end

// int_x_52_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_52_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_52_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_52_HIGH)
            int_x_52_write <= 1'b1;
        else if (w_hs)
            int_x_52_write <= 1'b0;
    end
end

// int_x_52_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_52_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_52_ce0)
            int_x_52_shift0 <= x_52_address0[1:0];
    end
end

// int_x_53_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_53_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_53_BASE && raddr <= ADDR_X_53_HIGH)
            int_x_53_read <= 1'b1;
        else
            int_x_53_read <= 1'b0;
    end
end

// int_x_53_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_53_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_53_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_53_HIGH)
            int_x_53_write <= 1'b1;
        else if (w_hs)
            int_x_53_write <= 1'b0;
    end
end

// int_x_53_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_53_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_53_ce0)
            int_x_53_shift0 <= x_53_address0[1:0];
    end
end

// int_x_54_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_54_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_54_BASE && raddr <= ADDR_X_54_HIGH)
            int_x_54_read <= 1'b1;
        else
            int_x_54_read <= 1'b0;
    end
end

// int_x_54_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_54_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_54_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_54_HIGH)
            int_x_54_write <= 1'b1;
        else if (w_hs)
            int_x_54_write <= 1'b0;
    end
end

// int_x_54_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_54_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_54_ce0)
            int_x_54_shift0 <= x_54_address0[1:0];
    end
end

// int_x_55_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_55_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_55_BASE && raddr <= ADDR_X_55_HIGH)
            int_x_55_read <= 1'b1;
        else
            int_x_55_read <= 1'b0;
    end
end

// int_x_55_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_55_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_55_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_55_HIGH)
            int_x_55_write <= 1'b1;
        else if (w_hs)
            int_x_55_write <= 1'b0;
    end
end

// int_x_55_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_55_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_55_ce0)
            int_x_55_shift0 <= x_55_address0[1:0];
    end
end

// int_x_56_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_56_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_56_BASE && raddr <= ADDR_X_56_HIGH)
            int_x_56_read <= 1'b1;
        else
            int_x_56_read <= 1'b0;
    end
end

// int_x_56_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_56_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_56_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_56_HIGH)
            int_x_56_write <= 1'b1;
        else if (w_hs)
            int_x_56_write <= 1'b0;
    end
end

// int_x_56_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_56_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_56_ce0)
            int_x_56_shift0 <= x_56_address0[1:0];
    end
end

// int_x_57_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_57_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_57_BASE && raddr <= ADDR_X_57_HIGH)
            int_x_57_read <= 1'b1;
        else
            int_x_57_read <= 1'b0;
    end
end

// int_x_57_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_57_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_57_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_57_HIGH)
            int_x_57_write <= 1'b1;
        else if (w_hs)
            int_x_57_write <= 1'b0;
    end
end

// int_x_57_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_57_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_57_ce0)
            int_x_57_shift0 <= x_57_address0[1:0];
    end
end

// int_x_58_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_58_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_58_BASE && raddr <= ADDR_X_58_HIGH)
            int_x_58_read <= 1'b1;
        else
            int_x_58_read <= 1'b0;
    end
end

// int_x_58_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_58_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_58_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_58_HIGH)
            int_x_58_write <= 1'b1;
        else if (w_hs)
            int_x_58_write <= 1'b0;
    end
end

// int_x_58_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_58_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_58_ce0)
            int_x_58_shift0 <= x_58_address0[1:0];
    end
end

// int_x_59_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_59_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_59_BASE && raddr <= ADDR_X_59_HIGH)
            int_x_59_read <= 1'b1;
        else
            int_x_59_read <= 1'b0;
    end
end

// int_x_59_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_59_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_59_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_59_HIGH)
            int_x_59_write <= 1'b1;
        else if (w_hs)
            int_x_59_write <= 1'b0;
    end
end

// int_x_59_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_59_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_59_ce0)
            int_x_59_shift0 <= x_59_address0[1:0];
    end
end

// int_x_60_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_60_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_60_BASE && raddr <= ADDR_X_60_HIGH)
            int_x_60_read <= 1'b1;
        else
            int_x_60_read <= 1'b0;
    end
end

// int_x_60_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_60_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_60_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_60_HIGH)
            int_x_60_write <= 1'b1;
        else if (w_hs)
            int_x_60_write <= 1'b0;
    end
end

// int_x_60_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_60_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_60_ce0)
            int_x_60_shift0 <= x_60_address0[1:0];
    end
end

// int_x_61_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_61_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_61_BASE && raddr <= ADDR_X_61_HIGH)
            int_x_61_read <= 1'b1;
        else
            int_x_61_read <= 1'b0;
    end
end

// int_x_61_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_61_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_61_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_61_HIGH)
            int_x_61_write <= 1'b1;
        else if (w_hs)
            int_x_61_write <= 1'b0;
    end
end

// int_x_61_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_61_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_61_ce0)
            int_x_61_shift0 <= x_61_address0[1:0];
    end
end

// int_x_62_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_62_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_62_BASE && raddr <= ADDR_X_62_HIGH)
            int_x_62_read <= 1'b1;
        else
            int_x_62_read <= 1'b0;
    end
end

// int_x_62_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_62_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_62_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_62_HIGH)
            int_x_62_write <= 1'b1;
        else if (w_hs)
            int_x_62_write <= 1'b0;
    end
end

// int_x_62_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_62_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_62_ce0)
            int_x_62_shift0 <= x_62_address0[1:0];
    end
end

// int_x_63_read
always @(posedge ACLK) begin
    if (ARESET)
        int_x_63_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_X_63_BASE && raddr <= ADDR_X_63_HIGH)
            int_x_63_read <= 1'b1;
        else
            int_x_63_read <= 1'b0;
    end
end

// int_x_63_write
always @(posedge ACLK) begin
    if (ARESET)
        int_x_63_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_X_63_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_X_63_HIGH)
            int_x_63_write <= 1'b1;
        else if (w_hs)
            int_x_63_write <= 1'b0;
    end
end

// int_x_63_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_x_63_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (x_63_ce0)
            int_x_63_shift0 <= x_63_address0[1:0];
    end
end


endmodule


`timescale 1ns/1ps

module eucHW_control_s_axi_ram
#(parameter
    MEM_STYLE = "auto",
    MEM_TYPE  = "S2P",
    BYTES  = 4,
    DEPTH  = 256,
    AWIDTH = log2(DEPTH)
) (
    input  wire               clk0,
    input  wire [AWIDTH-1:0]  address0,
    input  wire               ce0,
    input  wire [BYTES-1:0]   we0,
    input  wire [BYTES*8-1:0] d0,
    output reg  [BYTES*8-1:0] q0,
    input  wire               clk1,
    input  wire [AWIDTH-1:0]  address1,
    input  wire               ce1,
    input  wire [BYTES-1:0]   we1,
    input  wire [BYTES*8-1:0] d1,
    output reg  [BYTES*8-1:0] q1
);
//------------------------ Parameters -------------------
localparam
    BYTE_WIDTH = 8,
    PORT0 = (MEM_TYPE == "S2P") ? "WO" : ((MEM_TYPE == "2P") ? "RO" : "RW"),
    PORT1 = (MEM_TYPE == "S2P") ? "RO" : "RW";
//------------------------Local signal-------------------
(* ram_style = MEM_STYLE*)
reg  [BYTES*8-1:0] mem[0:DEPTH-1];
wire re0, re1;
//------------------------Task and function--------------
function integer log2;
    input integer x;
    integer n, m;
begin
    n = 1;
    m = 2;
    while (m < x) begin
        n = n + 1;
        m = m * 2;
    end
    log2 = n;
end
endfunction
//------------------------Body---------------------------
generate
    if (MEM_STYLE == "hls_ultra" && PORT0 == "RW") begin
        assign re0 = ce0 & ~|we0;
    end else begin
        assign re0 = ce0;
    end
endgenerate

generate
    if (MEM_STYLE == "hls_ultra" && PORT1 == "RW") begin
        assign re1 = ce1 & ~|we1;
    end else begin
        assign re1 = ce1;
    end
endgenerate

// read port 0
generate if (PORT0 != "WO") begin
    always @(posedge clk0) begin
        if (re0) q0 <= mem[address0];
    end
end
endgenerate

// read port 1
generate if (PORT1 != "WO") begin
    always @(posedge clk1) begin
        if (re1) q1 <= mem[address1];
    end
end
endgenerate

integer i;
// write port 0
generate if (PORT0 != "RO") begin
    always @(posedge clk0) begin
        if (ce0)
        for (i = 0; i < BYTES; i = i + 1)
            if (we0[i])
                mem[address0][i*BYTE_WIDTH +: BYTE_WIDTH] <= d0[i*BYTE_WIDTH +: BYTE_WIDTH];
    end
end
endgenerate

// write port 1
generate if (PORT1 != "RO") begin
    always @(posedge clk1) begin
        if (ce1)
        for (i = 0; i < BYTES; i = i + 1)
            if (we1[i])
                mem[address1][i*BYTE_WIDTH +: BYTE_WIDTH] <= d1[i*BYTE_WIDTH +: BYTE_WIDTH];
    end
end
endgenerate

endmodule

