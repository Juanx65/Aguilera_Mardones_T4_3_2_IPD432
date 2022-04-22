// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module eucHW_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 11,
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
    input  wire [2:0]                    x_0_address0,
    input  wire                          x_0_ce0,
    output wire [31:0]                   x_0_q0,
    input  wire [2:0]                    x_1_address0,
    input  wire                          x_1_ce0,
    output wire [31:0]                   x_1_q0,
    input  wire [2:0]                    x_2_address0,
    input  wire                          x_2_ce0,
    output wire [31:0]                   x_2_q0,
    input  wire [2:0]                    x_3_address0,
    input  wire                          x_3_ce0,
    output wire [31:0]                   x_3_q0,
    input  wire [2:0]                    x_4_address0,
    input  wire                          x_4_ce0,
    output wire [31:0]                   x_4_q0,
    input  wire [2:0]                    x_5_address0,
    input  wire                          x_5_ce0,
    output wire [31:0]                   x_5_q0,
    input  wire [2:0]                    x_6_address0,
    input  wire                          x_6_ce0,
    output wire [31:0]                   x_6_q0,
    input  wire [2:0]                    x_7_address0,
    input  wire                          x_7_ce0,
    output wire [31:0]                   x_7_q0,
    input  wire [2:0]                    x_8_address0,
    input  wire                          x_8_ce0,
    output wire [31:0]                   x_8_q0,
    input  wire [2:0]                    x_9_address0,
    input  wire                          x_9_ce0,
    output wire [31:0]                   x_9_q0,
    input  wire [2:0]                    x_10_address0,
    input  wire                          x_10_ce0,
    output wire [31:0]                   x_10_q0,
    input  wire [2:0]                    x_11_address0,
    input  wire                          x_11_ce0,
    output wire [31:0]                   x_11_q0,
    input  wire [2:0]                    x_12_address0,
    input  wire                          x_12_ce0,
    output wire [31:0]                   x_12_q0,
    input  wire [2:0]                    x_13_address0,
    input  wire                          x_13_ce0,
    output wire [31:0]                   x_13_q0,
    input  wire [2:0]                    x_14_address0,
    input  wire                          x_14_ce0,
    output wire [31:0]                   x_14_q0,
    input  wire [2:0]                    x_15_address0,
    input  wire                          x_15_ce0,
    output wire [31:0]                   x_15_q0,
    input  wire [2:0]                    x_16_address0,
    input  wire                          x_16_ce0,
    output wire [31:0]                   x_16_q0,
    input  wire [2:0]                    x_17_address0,
    input  wire                          x_17_ce0,
    output wire [31:0]                   x_17_q0,
    input  wire [2:0]                    x_18_address0,
    input  wire                          x_18_ce0,
    output wire [31:0]                   x_18_q0,
    input  wire [2:0]                    x_19_address0,
    input  wire                          x_19_ce0,
    output wire [31:0]                   x_19_q0,
    input  wire [2:0]                    x_20_address0,
    input  wire                          x_20_ce0,
    output wire [31:0]                   x_20_q0,
    input  wire [2:0]                    x_21_address0,
    input  wire                          x_21_ce0,
    output wire [31:0]                   x_21_q0,
    input  wire [2:0]                    x_22_address0,
    input  wire                          x_22_ce0,
    output wire [31:0]                   x_22_q0,
    input  wire [2:0]                    x_23_address0,
    input  wire                          x_23_ce0,
    output wire [31:0]                   x_23_q0,
    input  wire [2:0]                    x_24_address0,
    input  wire                          x_24_ce0,
    output wire [31:0]                   x_24_q0,
    input  wire [2:0]                    x_25_address0,
    input  wire                          x_25_ce0,
    output wire [31:0]                   x_25_q0,
    input  wire [2:0]                    x_26_address0,
    input  wire                          x_26_ce0,
    output wire [31:0]                   x_26_q0,
    input  wire [2:0]                    x_27_address0,
    input  wire                          x_27_ce0,
    output wire [31:0]                   x_27_q0,
    input  wire [2:0]                    x_28_address0,
    input  wire                          x_28_ce0,
    output wire [31:0]                   x_28_q0,
    input  wire [2:0]                    x_29_address0,
    input  wire                          x_29_ce0,
    output wire [31:0]                   x_29_q0,
    input  wire [2:0]                    x_30_address0,
    input  wire                          x_30_ce0,
    output wire [31:0]                   x_30_q0,
    input  wire [2:0]                    x_31_address0,
    input  wire                          x_31_ce0,
    output wire [31:0]                   x_31_q0,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle
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

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL       = 11'h000,
    ADDR_GIE           = 11'h004,
    ADDR_IER           = 11'h008,
    ADDR_ISR           = 11'h00c,
    ADDR_Y_SQRT_DATA_0 = 11'h010,
    ADDR_Y_SQRT_CTRL   = 11'h014,
    ADDR_X_0_BASE      = 11'h020,
    ADDR_X_0_HIGH      = 11'h03f,
    ADDR_X_1_BASE      = 11'h040,
    ADDR_X_1_HIGH      = 11'h05f,
    ADDR_X_2_BASE      = 11'h060,
    ADDR_X_2_HIGH      = 11'h07f,
    ADDR_X_3_BASE      = 11'h080,
    ADDR_X_3_HIGH      = 11'h09f,
    ADDR_X_4_BASE      = 11'h0a0,
    ADDR_X_4_HIGH      = 11'h0bf,
    ADDR_X_5_BASE      = 11'h0c0,
    ADDR_X_5_HIGH      = 11'h0df,
    ADDR_X_6_BASE      = 11'h0e0,
    ADDR_X_6_HIGH      = 11'h0ff,
    ADDR_X_7_BASE      = 11'h100,
    ADDR_X_7_HIGH      = 11'h11f,
    ADDR_X_8_BASE      = 11'h120,
    ADDR_X_8_HIGH      = 11'h13f,
    ADDR_X_9_BASE      = 11'h140,
    ADDR_X_9_HIGH      = 11'h15f,
    ADDR_X_10_BASE     = 11'h160,
    ADDR_X_10_HIGH     = 11'h17f,
    ADDR_X_11_BASE     = 11'h180,
    ADDR_X_11_HIGH     = 11'h19f,
    ADDR_X_12_BASE     = 11'h1a0,
    ADDR_X_12_HIGH     = 11'h1bf,
    ADDR_X_13_BASE     = 11'h1c0,
    ADDR_X_13_HIGH     = 11'h1df,
    ADDR_X_14_BASE     = 11'h1e0,
    ADDR_X_14_HIGH     = 11'h1ff,
    ADDR_X_15_BASE     = 11'h200,
    ADDR_X_15_HIGH     = 11'h21f,
    ADDR_X_16_BASE     = 11'h220,
    ADDR_X_16_HIGH     = 11'h23f,
    ADDR_X_17_BASE     = 11'h240,
    ADDR_X_17_HIGH     = 11'h25f,
    ADDR_X_18_BASE     = 11'h260,
    ADDR_X_18_HIGH     = 11'h27f,
    ADDR_X_19_BASE     = 11'h280,
    ADDR_X_19_HIGH     = 11'h29f,
    ADDR_X_20_BASE     = 11'h2a0,
    ADDR_X_20_HIGH     = 11'h2bf,
    ADDR_X_21_BASE     = 11'h2c0,
    ADDR_X_21_HIGH     = 11'h2df,
    ADDR_X_22_BASE     = 11'h2e0,
    ADDR_X_22_HIGH     = 11'h2ff,
    ADDR_X_23_BASE     = 11'h300,
    ADDR_X_23_HIGH     = 11'h31f,
    ADDR_X_24_BASE     = 11'h320,
    ADDR_X_24_HIGH     = 11'h33f,
    ADDR_X_25_BASE     = 11'h340,
    ADDR_X_25_HIGH     = 11'h35f,
    ADDR_X_26_BASE     = 11'h360,
    ADDR_X_26_HIGH     = 11'h37f,
    ADDR_X_27_BASE     = 11'h380,
    ADDR_X_27_HIGH     = 11'h39f,
    ADDR_X_28_BASE     = 11'h3a0,
    ADDR_X_28_HIGH     = 11'h3bf,
    ADDR_X_29_BASE     = 11'h3c0,
    ADDR_X_29_HIGH     = 11'h3df,
    ADDR_X_30_BASE     = 11'h3e0,
    ADDR_X_30_HIGH     = 11'h3ff,
    ADDR_X_31_BASE     = 11'h400,
    ADDR_X_31_HIGH     = 11'h41f,
    WRIDLE             = 2'd0,
    WRDATA             = 2'd1,
    WRRESP             = 2'd2,
    WRRESET            = 2'd3,
    RDIDLE             = 2'd0,
    RDDATA             = 2'd1,
    RDRESET            = 2'd2,
    ADDR_BITS                = 11;

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
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
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
assign RVALID  = (rstate == RDDATA) & !int_x_0_read & !int_x_1_read & !int_x_2_read & !int_x_3_read & !int_x_4_read & !int_x_5_read & !int_x_6_read & !int_x_7_read & !int_x_8_read & !int_x_9_read & !int_x_10_read & !int_x_11_read & !int_x_12_read & !int_x_13_read & !int_x_14_read & !int_x_15_read & !int_x_16_read & !int_x_17_read & !int_x_18_read & !int_x_19_read & !int_x_20_read & !int_x_21_read & !int_x_22_read & !int_x_23_read & !int_x_24_read & !int_x_25_read & !int_x_26_read & !int_x_27_read & !int_x_28_read & !int_x_29_read & !int_x_30_read & !int_x_31_read;
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
            int_ier <= WDATA[1:0];
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
assign int_x_0_address0  = x_0_address0;
assign int_x_0_ce0       = x_0_ce0;
assign x_0_q0            = int_x_0_q0;
assign int_x_0_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_0_ce1       = ar_hs | (int_x_0_write & WVALID);
assign int_x_0_we1       = int_x_0_write & w_hs;
assign int_x_0_be1       = int_x_0_we1 ? WSTRB : 'b0;
assign int_x_0_d1        = WDATA;
// x_1
assign int_x_1_address0  = x_1_address0;
assign int_x_1_ce0       = x_1_ce0;
assign x_1_q0            = int_x_1_q0;
assign int_x_1_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_1_ce1       = ar_hs | (int_x_1_write & WVALID);
assign int_x_1_we1       = int_x_1_write & w_hs;
assign int_x_1_be1       = int_x_1_we1 ? WSTRB : 'b0;
assign int_x_1_d1        = WDATA;
// x_2
assign int_x_2_address0  = x_2_address0;
assign int_x_2_ce0       = x_2_ce0;
assign x_2_q0            = int_x_2_q0;
assign int_x_2_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_2_ce1       = ar_hs | (int_x_2_write & WVALID);
assign int_x_2_we1       = int_x_2_write & w_hs;
assign int_x_2_be1       = int_x_2_we1 ? WSTRB : 'b0;
assign int_x_2_d1        = WDATA;
// x_3
assign int_x_3_address0  = x_3_address0;
assign int_x_3_ce0       = x_3_ce0;
assign x_3_q0            = int_x_3_q0;
assign int_x_3_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_3_ce1       = ar_hs | (int_x_3_write & WVALID);
assign int_x_3_we1       = int_x_3_write & w_hs;
assign int_x_3_be1       = int_x_3_we1 ? WSTRB : 'b0;
assign int_x_3_d1        = WDATA;
// x_4
assign int_x_4_address0  = x_4_address0;
assign int_x_4_ce0       = x_4_ce0;
assign x_4_q0            = int_x_4_q0;
assign int_x_4_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_4_ce1       = ar_hs | (int_x_4_write & WVALID);
assign int_x_4_we1       = int_x_4_write & w_hs;
assign int_x_4_be1       = int_x_4_we1 ? WSTRB : 'b0;
assign int_x_4_d1        = WDATA;
// x_5
assign int_x_5_address0  = x_5_address0;
assign int_x_5_ce0       = x_5_ce0;
assign x_5_q0            = int_x_5_q0;
assign int_x_5_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_5_ce1       = ar_hs | (int_x_5_write & WVALID);
assign int_x_5_we1       = int_x_5_write & w_hs;
assign int_x_5_be1       = int_x_5_we1 ? WSTRB : 'b0;
assign int_x_5_d1        = WDATA;
// x_6
assign int_x_6_address0  = x_6_address0;
assign int_x_6_ce0       = x_6_ce0;
assign x_6_q0            = int_x_6_q0;
assign int_x_6_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_6_ce1       = ar_hs | (int_x_6_write & WVALID);
assign int_x_6_we1       = int_x_6_write & w_hs;
assign int_x_6_be1       = int_x_6_we1 ? WSTRB : 'b0;
assign int_x_6_d1        = WDATA;
// x_7
assign int_x_7_address0  = x_7_address0;
assign int_x_7_ce0       = x_7_ce0;
assign x_7_q0            = int_x_7_q0;
assign int_x_7_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_7_ce1       = ar_hs | (int_x_7_write & WVALID);
assign int_x_7_we1       = int_x_7_write & w_hs;
assign int_x_7_be1       = int_x_7_we1 ? WSTRB : 'b0;
assign int_x_7_d1        = WDATA;
// x_8
assign int_x_8_address0  = x_8_address0;
assign int_x_8_ce0       = x_8_ce0;
assign x_8_q0            = int_x_8_q0;
assign int_x_8_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_8_ce1       = ar_hs | (int_x_8_write & WVALID);
assign int_x_8_we1       = int_x_8_write & w_hs;
assign int_x_8_be1       = int_x_8_we1 ? WSTRB : 'b0;
assign int_x_8_d1        = WDATA;
// x_9
assign int_x_9_address0  = x_9_address0;
assign int_x_9_ce0       = x_9_ce0;
assign x_9_q0            = int_x_9_q0;
assign int_x_9_address1  = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_9_ce1       = ar_hs | (int_x_9_write & WVALID);
assign int_x_9_we1       = int_x_9_write & w_hs;
assign int_x_9_be1       = int_x_9_we1 ? WSTRB : 'b0;
assign int_x_9_d1        = WDATA;
// x_10
assign int_x_10_address0 = x_10_address0;
assign int_x_10_ce0      = x_10_ce0;
assign x_10_q0           = int_x_10_q0;
assign int_x_10_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_10_ce1      = ar_hs | (int_x_10_write & WVALID);
assign int_x_10_we1      = int_x_10_write & w_hs;
assign int_x_10_be1      = int_x_10_we1 ? WSTRB : 'b0;
assign int_x_10_d1       = WDATA;
// x_11
assign int_x_11_address0 = x_11_address0;
assign int_x_11_ce0      = x_11_ce0;
assign x_11_q0           = int_x_11_q0;
assign int_x_11_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_11_ce1      = ar_hs | (int_x_11_write & WVALID);
assign int_x_11_we1      = int_x_11_write & w_hs;
assign int_x_11_be1      = int_x_11_we1 ? WSTRB : 'b0;
assign int_x_11_d1       = WDATA;
// x_12
assign int_x_12_address0 = x_12_address0;
assign int_x_12_ce0      = x_12_ce0;
assign x_12_q0           = int_x_12_q0;
assign int_x_12_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_12_ce1      = ar_hs | (int_x_12_write & WVALID);
assign int_x_12_we1      = int_x_12_write & w_hs;
assign int_x_12_be1      = int_x_12_we1 ? WSTRB : 'b0;
assign int_x_12_d1       = WDATA;
// x_13
assign int_x_13_address0 = x_13_address0;
assign int_x_13_ce0      = x_13_ce0;
assign x_13_q0           = int_x_13_q0;
assign int_x_13_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_13_ce1      = ar_hs | (int_x_13_write & WVALID);
assign int_x_13_we1      = int_x_13_write & w_hs;
assign int_x_13_be1      = int_x_13_we1 ? WSTRB : 'b0;
assign int_x_13_d1       = WDATA;
// x_14
assign int_x_14_address0 = x_14_address0;
assign int_x_14_ce0      = x_14_ce0;
assign x_14_q0           = int_x_14_q0;
assign int_x_14_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_14_ce1      = ar_hs | (int_x_14_write & WVALID);
assign int_x_14_we1      = int_x_14_write & w_hs;
assign int_x_14_be1      = int_x_14_we1 ? WSTRB : 'b0;
assign int_x_14_d1       = WDATA;
// x_15
assign int_x_15_address0 = x_15_address0;
assign int_x_15_ce0      = x_15_ce0;
assign x_15_q0           = int_x_15_q0;
assign int_x_15_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_15_ce1      = ar_hs | (int_x_15_write & WVALID);
assign int_x_15_we1      = int_x_15_write & w_hs;
assign int_x_15_be1      = int_x_15_we1 ? WSTRB : 'b0;
assign int_x_15_d1       = WDATA;
// x_16
assign int_x_16_address0 = x_16_address0;
assign int_x_16_ce0      = x_16_ce0;
assign x_16_q0           = int_x_16_q0;
assign int_x_16_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_16_ce1      = ar_hs | (int_x_16_write & WVALID);
assign int_x_16_we1      = int_x_16_write & w_hs;
assign int_x_16_be1      = int_x_16_we1 ? WSTRB : 'b0;
assign int_x_16_d1       = WDATA;
// x_17
assign int_x_17_address0 = x_17_address0;
assign int_x_17_ce0      = x_17_ce0;
assign x_17_q0           = int_x_17_q0;
assign int_x_17_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_17_ce1      = ar_hs | (int_x_17_write & WVALID);
assign int_x_17_we1      = int_x_17_write & w_hs;
assign int_x_17_be1      = int_x_17_we1 ? WSTRB : 'b0;
assign int_x_17_d1       = WDATA;
// x_18
assign int_x_18_address0 = x_18_address0;
assign int_x_18_ce0      = x_18_ce0;
assign x_18_q0           = int_x_18_q0;
assign int_x_18_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_18_ce1      = ar_hs | (int_x_18_write & WVALID);
assign int_x_18_we1      = int_x_18_write & w_hs;
assign int_x_18_be1      = int_x_18_we1 ? WSTRB : 'b0;
assign int_x_18_d1       = WDATA;
// x_19
assign int_x_19_address0 = x_19_address0;
assign int_x_19_ce0      = x_19_ce0;
assign x_19_q0           = int_x_19_q0;
assign int_x_19_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_19_ce1      = ar_hs | (int_x_19_write & WVALID);
assign int_x_19_we1      = int_x_19_write & w_hs;
assign int_x_19_be1      = int_x_19_we1 ? WSTRB : 'b0;
assign int_x_19_d1       = WDATA;
// x_20
assign int_x_20_address0 = x_20_address0;
assign int_x_20_ce0      = x_20_ce0;
assign x_20_q0           = int_x_20_q0;
assign int_x_20_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_20_ce1      = ar_hs | (int_x_20_write & WVALID);
assign int_x_20_we1      = int_x_20_write & w_hs;
assign int_x_20_be1      = int_x_20_we1 ? WSTRB : 'b0;
assign int_x_20_d1       = WDATA;
// x_21
assign int_x_21_address0 = x_21_address0;
assign int_x_21_ce0      = x_21_ce0;
assign x_21_q0           = int_x_21_q0;
assign int_x_21_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_21_ce1      = ar_hs | (int_x_21_write & WVALID);
assign int_x_21_we1      = int_x_21_write & w_hs;
assign int_x_21_be1      = int_x_21_we1 ? WSTRB : 'b0;
assign int_x_21_d1       = WDATA;
// x_22
assign int_x_22_address0 = x_22_address0;
assign int_x_22_ce0      = x_22_ce0;
assign x_22_q0           = int_x_22_q0;
assign int_x_22_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_22_ce1      = ar_hs | (int_x_22_write & WVALID);
assign int_x_22_we1      = int_x_22_write & w_hs;
assign int_x_22_be1      = int_x_22_we1 ? WSTRB : 'b0;
assign int_x_22_d1       = WDATA;
// x_23
assign int_x_23_address0 = x_23_address0;
assign int_x_23_ce0      = x_23_ce0;
assign x_23_q0           = int_x_23_q0;
assign int_x_23_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_23_ce1      = ar_hs | (int_x_23_write & WVALID);
assign int_x_23_we1      = int_x_23_write & w_hs;
assign int_x_23_be1      = int_x_23_we1 ? WSTRB : 'b0;
assign int_x_23_d1       = WDATA;
// x_24
assign int_x_24_address0 = x_24_address0;
assign int_x_24_ce0      = x_24_ce0;
assign x_24_q0           = int_x_24_q0;
assign int_x_24_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_24_ce1      = ar_hs | (int_x_24_write & WVALID);
assign int_x_24_we1      = int_x_24_write & w_hs;
assign int_x_24_be1      = int_x_24_we1 ? WSTRB : 'b0;
assign int_x_24_d1       = WDATA;
// x_25
assign int_x_25_address0 = x_25_address0;
assign int_x_25_ce0      = x_25_ce0;
assign x_25_q0           = int_x_25_q0;
assign int_x_25_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_25_ce1      = ar_hs | (int_x_25_write & WVALID);
assign int_x_25_we1      = int_x_25_write & w_hs;
assign int_x_25_be1      = int_x_25_we1 ? WSTRB : 'b0;
assign int_x_25_d1       = WDATA;
// x_26
assign int_x_26_address0 = x_26_address0;
assign int_x_26_ce0      = x_26_ce0;
assign x_26_q0           = int_x_26_q0;
assign int_x_26_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_26_ce1      = ar_hs | (int_x_26_write & WVALID);
assign int_x_26_we1      = int_x_26_write & w_hs;
assign int_x_26_be1      = int_x_26_we1 ? WSTRB : 'b0;
assign int_x_26_d1       = WDATA;
// x_27
assign int_x_27_address0 = x_27_address0;
assign int_x_27_ce0      = x_27_ce0;
assign x_27_q0           = int_x_27_q0;
assign int_x_27_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_27_ce1      = ar_hs | (int_x_27_write & WVALID);
assign int_x_27_we1      = int_x_27_write & w_hs;
assign int_x_27_be1      = int_x_27_we1 ? WSTRB : 'b0;
assign int_x_27_d1       = WDATA;
// x_28
assign int_x_28_address0 = x_28_address0;
assign int_x_28_ce0      = x_28_ce0;
assign x_28_q0           = int_x_28_q0;
assign int_x_28_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_28_ce1      = ar_hs | (int_x_28_write & WVALID);
assign int_x_28_we1      = int_x_28_write & w_hs;
assign int_x_28_be1      = int_x_28_we1 ? WSTRB : 'b0;
assign int_x_28_d1       = WDATA;
// x_29
assign int_x_29_address0 = x_29_address0;
assign int_x_29_ce0      = x_29_ce0;
assign x_29_q0           = int_x_29_q0;
assign int_x_29_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_29_ce1      = ar_hs | (int_x_29_write & WVALID);
assign int_x_29_we1      = int_x_29_write & w_hs;
assign int_x_29_be1      = int_x_29_we1 ? WSTRB : 'b0;
assign int_x_29_d1       = WDATA;
// x_30
assign int_x_30_address0 = x_30_address0;
assign int_x_30_ce0      = x_30_ce0;
assign x_30_q0           = int_x_30_q0;
assign int_x_30_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_30_ce1      = ar_hs | (int_x_30_write & WVALID);
assign int_x_30_we1      = int_x_30_write & w_hs;
assign int_x_30_be1      = int_x_30_we1 ? WSTRB : 'b0;
assign int_x_30_d1       = WDATA;
// x_31
assign int_x_31_address0 = x_31_address0;
assign int_x_31_ce0      = x_31_ce0;
assign x_31_q0           = int_x_31_q0;
assign int_x_31_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_x_31_ce1      = ar_hs | (int_x_31_write & WVALID);
assign int_x_31_we1      = int_x_31_write & w_hs;
assign int_x_31_be1      = int_x_31_we1 ? WSTRB : 'b0;
assign int_x_31_d1       = WDATA;
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

