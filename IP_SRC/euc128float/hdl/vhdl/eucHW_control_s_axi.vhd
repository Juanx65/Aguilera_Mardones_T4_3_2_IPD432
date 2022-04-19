-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity eucHW_control_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 10;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    interrupt             :out  STD_LOGIC;
    y_sqrt                :in   STD_LOGIC_VECTOR(31 downto 0);
    y_sqrt_ap_vld         :in   STD_LOGIC;
    x_0_address0          :in   STD_LOGIC_VECTOR(1 downto 0);
    x_0_ce0               :in   STD_LOGIC;
    x_0_q0                :out  STD_LOGIC_VECTOR(7 downto 0);
    x_1_address0          :in   STD_LOGIC_VECTOR(1 downto 0);
    x_1_ce0               :in   STD_LOGIC;
    x_1_q0                :out  STD_LOGIC_VECTOR(7 downto 0);
    x_2_address0          :in   STD_LOGIC_VECTOR(1 downto 0);
    x_2_ce0               :in   STD_LOGIC;
    x_2_q0                :out  STD_LOGIC_VECTOR(7 downto 0);
    x_3_address0          :in   STD_LOGIC_VECTOR(1 downto 0);
    x_3_ce0               :in   STD_LOGIC;
    x_3_q0                :out  STD_LOGIC_VECTOR(7 downto 0);
    x_4_address0          :in   STD_LOGIC_VECTOR(1 downto 0);
    x_4_ce0               :in   STD_LOGIC;
    x_4_q0                :out  STD_LOGIC_VECTOR(7 downto 0);
    x_5_address0          :in   STD_LOGIC_VECTOR(1 downto 0);
    x_5_ce0               :in   STD_LOGIC;
    x_5_q0                :out  STD_LOGIC_VECTOR(7 downto 0);
    x_6_address0          :in   STD_LOGIC_VECTOR(1 downto 0);
    x_6_ce0               :in   STD_LOGIC;
    x_6_q0                :out  STD_LOGIC_VECTOR(7 downto 0);
    x_7_address0          :in   STD_LOGIC_VECTOR(1 downto 0);
    x_7_ce0               :in   STD_LOGIC;
    x_7_q0                :out  STD_LOGIC_VECTOR(7 downto 0);
    x_8_address0          :in   STD_LOGIC_VECTOR(1 downto 0);
    x_8_ce0               :in   STD_LOGIC;
    x_8_q0                :out  STD_LOGIC_VECTOR(7 downto 0);
    x_9_address0          :in   STD_LOGIC_VECTOR(1 downto 0);
    x_9_ce0               :in   STD_LOGIC;
    x_9_q0                :out  STD_LOGIC_VECTOR(7 downto 0);
    x_10_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_10_ce0              :in   STD_LOGIC;
    x_10_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_11_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_11_ce0              :in   STD_LOGIC;
    x_11_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_12_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_12_ce0              :in   STD_LOGIC;
    x_12_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_13_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_13_ce0              :in   STD_LOGIC;
    x_13_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_14_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_14_ce0              :in   STD_LOGIC;
    x_14_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_15_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_15_ce0              :in   STD_LOGIC;
    x_15_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_16_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_16_ce0              :in   STD_LOGIC;
    x_16_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_17_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_17_ce0              :in   STD_LOGIC;
    x_17_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_18_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_18_ce0              :in   STD_LOGIC;
    x_18_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_19_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_19_ce0              :in   STD_LOGIC;
    x_19_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_20_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_20_ce0              :in   STD_LOGIC;
    x_20_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_21_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_21_ce0              :in   STD_LOGIC;
    x_21_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_22_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_22_ce0              :in   STD_LOGIC;
    x_22_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_23_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_23_ce0              :in   STD_LOGIC;
    x_23_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_24_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_24_ce0              :in   STD_LOGIC;
    x_24_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_25_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_25_ce0              :in   STD_LOGIC;
    x_25_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_26_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_26_ce0              :in   STD_LOGIC;
    x_26_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_27_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_27_ce0              :in   STD_LOGIC;
    x_27_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_28_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_28_ce0              :in   STD_LOGIC;
    x_28_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_29_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_29_ce0              :in   STD_LOGIC;
    x_29_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_30_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_30_ce0              :in   STD_LOGIC;
    x_30_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_31_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_31_ce0              :in   STD_LOGIC;
    x_31_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_32_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_32_ce0              :in   STD_LOGIC;
    x_32_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_33_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_33_ce0              :in   STD_LOGIC;
    x_33_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_34_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_34_ce0              :in   STD_LOGIC;
    x_34_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_35_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_35_ce0              :in   STD_LOGIC;
    x_35_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_36_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_36_ce0              :in   STD_LOGIC;
    x_36_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_37_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_37_ce0              :in   STD_LOGIC;
    x_37_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_38_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_38_ce0              :in   STD_LOGIC;
    x_38_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_39_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_39_ce0              :in   STD_LOGIC;
    x_39_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_40_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_40_ce0              :in   STD_LOGIC;
    x_40_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_41_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_41_ce0              :in   STD_LOGIC;
    x_41_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_42_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_42_ce0              :in   STD_LOGIC;
    x_42_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_43_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_43_ce0              :in   STD_LOGIC;
    x_43_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_44_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_44_ce0              :in   STD_LOGIC;
    x_44_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_45_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_45_ce0              :in   STD_LOGIC;
    x_45_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_46_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_46_ce0              :in   STD_LOGIC;
    x_46_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_47_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_47_ce0              :in   STD_LOGIC;
    x_47_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_48_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_48_ce0              :in   STD_LOGIC;
    x_48_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_49_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_49_ce0              :in   STD_LOGIC;
    x_49_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_50_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_50_ce0              :in   STD_LOGIC;
    x_50_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_51_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_51_ce0              :in   STD_LOGIC;
    x_51_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_52_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_52_ce0              :in   STD_LOGIC;
    x_52_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_53_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_53_ce0              :in   STD_LOGIC;
    x_53_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_54_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_54_ce0              :in   STD_LOGIC;
    x_54_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_55_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_55_ce0              :in   STD_LOGIC;
    x_55_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_56_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_56_ce0              :in   STD_LOGIC;
    x_56_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_57_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_57_ce0              :in   STD_LOGIC;
    x_57_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_58_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_58_ce0              :in   STD_LOGIC;
    x_58_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_59_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_59_ce0              :in   STD_LOGIC;
    x_59_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_60_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_60_ce0              :in   STD_LOGIC;
    x_60_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_61_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_61_ce0              :in   STD_LOGIC;
    x_61_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_62_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_62_ce0              :in   STD_LOGIC;
    x_62_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    x_63_address0         :in   STD_LOGIC_VECTOR(1 downto 0);
    x_63_ce0              :in   STD_LOGIC;
    x_63_q0               :out  STD_LOGIC_VECTOR(7 downto 0);
    ap_start              :out  STD_LOGIC;
    ap_done               :in   STD_LOGIC;
    ap_ready              :in   STD_LOGIC;
    ap_idle               :in   STD_LOGIC;
    ap_local_deadlock     :in   STD_LOGIC_VECTOR(0 downto 0)
);
end entity eucHW_control_s_axi;

-- ------------------------Address Info-------------------
-- 0x000 : Control signals
--         bit 0  - ap_start (Read/Write/COH)
--         bit 1  - ap_done (Read/COR)
--         bit 2  - ap_idle (Read)
--         bit 3  - ap_ready (Read/COR)
--         bit 7  - auto_restart (Read/Write)
--         others - reserved
-- 0x004 : Global Interrupt Enable Register
--         bit 0  - Global Interrupt Enable (Read/Write)
--         others - reserved
-- 0x008 : IP Interrupt Enable Register (Read/Write)
--         bit 0 - enable ap_done interrupt (Read/Write)
--         bit 1 - enable ap_ready interrupt (Read/Write)
--         bit 5 - enable ap_local_deadlock interrupt (Read/Write)
--         others - reserved
-- 0x00c : IP Interrupt Status Register (Read/TOW)
--         bit 0 - ap_done (COR/TOW)
--         bit 1 - ap_ready (COR/TOW)
--         bit 5 - ap_local_deadlock (COR/TOW)
--         others - reserved
-- 0x010 : Data signal of y_sqrt
--         bit 31~0 - y_sqrt[31:0] (Read)
-- 0x014 : Control signal of y_sqrt
--         bit 0  - y_sqrt_ap_vld (Read/COR)
--         others - reserved
-- 0x020 ~
-- 0x027 : Memory 'x_0' (4 * 8b)
--         Word n : bit [ 7: 0] - x_0[4n]
--                  bit [15: 8] - x_0[4n+1]
--                  bit [23:16] - x_0[4n+2]
--                  bit [31:24] - x_0[4n+3]
-- 0x028 ~
-- 0x02f : Memory 'x_1' (4 * 8b)
--         Word n : bit [ 7: 0] - x_1[4n]
--                  bit [15: 8] - x_1[4n+1]
--                  bit [23:16] - x_1[4n+2]
--                  bit [31:24] - x_1[4n+3]
-- 0x030 ~
-- 0x037 : Memory 'x_2' (4 * 8b)
--         Word n : bit [ 7: 0] - x_2[4n]
--                  bit [15: 8] - x_2[4n+1]
--                  bit [23:16] - x_2[4n+2]
--                  bit [31:24] - x_2[4n+3]
-- 0x038 ~
-- 0x03f : Memory 'x_3' (4 * 8b)
--         Word n : bit [ 7: 0] - x_3[4n]
--                  bit [15: 8] - x_3[4n+1]
--                  bit [23:16] - x_3[4n+2]
--                  bit [31:24] - x_3[4n+3]
-- 0x040 ~
-- 0x047 : Memory 'x_4' (4 * 8b)
--         Word n : bit [ 7: 0] - x_4[4n]
--                  bit [15: 8] - x_4[4n+1]
--                  bit [23:16] - x_4[4n+2]
--                  bit [31:24] - x_4[4n+3]
-- 0x048 ~
-- 0x04f : Memory 'x_5' (4 * 8b)
--         Word n : bit [ 7: 0] - x_5[4n]
--                  bit [15: 8] - x_5[4n+1]
--                  bit [23:16] - x_5[4n+2]
--                  bit [31:24] - x_5[4n+3]
-- 0x050 ~
-- 0x057 : Memory 'x_6' (4 * 8b)
--         Word n : bit [ 7: 0] - x_6[4n]
--                  bit [15: 8] - x_6[4n+1]
--                  bit [23:16] - x_6[4n+2]
--                  bit [31:24] - x_6[4n+3]
-- 0x058 ~
-- 0x05f : Memory 'x_7' (4 * 8b)
--         Word n : bit [ 7: 0] - x_7[4n]
--                  bit [15: 8] - x_7[4n+1]
--                  bit [23:16] - x_7[4n+2]
--                  bit [31:24] - x_7[4n+3]
-- 0x060 ~
-- 0x067 : Memory 'x_8' (4 * 8b)
--         Word n : bit [ 7: 0] - x_8[4n]
--                  bit [15: 8] - x_8[4n+1]
--                  bit [23:16] - x_8[4n+2]
--                  bit [31:24] - x_8[4n+3]
-- 0x068 ~
-- 0x06f : Memory 'x_9' (4 * 8b)
--         Word n : bit [ 7: 0] - x_9[4n]
--                  bit [15: 8] - x_9[4n+1]
--                  bit [23:16] - x_9[4n+2]
--                  bit [31:24] - x_9[4n+3]
-- 0x070 ~
-- 0x077 : Memory 'x_10' (4 * 8b)
--         Word n : bit [ 7: 0] - x_10[4n]
--                  bit [15: 8] - x_10[4n+1]
--                  bit [23:16] - x_10[4n+2]
--                  bit [31:24] - x_10[4n+3]
-- 0x078 ~
-- 0x07f : Memory 'x_11' (4 * 8b)
--         Word n : bit [ 7: 0] - x_11[4n]
--                  bit [15: 8] - x_11[4n+1]
--                  bit [23:16] - x_11[4n+2]
--                  bit [31:24] - x_11[4n+3]
-- 0x080 ~
-- 0x087 : Memory 'x_12' (4 * 8b)
--         Word n : bit [ 7: 0] - x_12[4n]
--                  bit [15: 8] - x_12[4n+1]
--                  bit [23:16] - x_12[4n+2]
--                  bit [31:24] - x_12[4n+3]
-- 0x088 ~
-- 0x08f : Memory 'x_13' (4 * 8b)
--         Word n : bit [ 7: 0] - x_13[4n]
--                  bit [15: 8] - x_13[4n+1]
--                  bit [23:16] - x_13[4n+2]
--                  bit [31:24] - x_13[4n+3]
-- 0x090 ~
-- 0x097 : Memory 'x_14' (4 * 8b)
--         Word n : bit [ 7: 0] - x_14[4n]
--                  bit [15: 8] - x_14[4n+1]
--                  bit [23:16] - x_14[4n+2]
--                  bit [31:24] - x_14[4n+3]
-- 0x098 ~
-- 0x09f : Memory 'x_15' (4 * 8b)
--         Word n : bit [ 7: 0] - x_15[4n]
--                  bit [15: 8] - x_15[4n+1]
--                  bit [23:16] - x_15[4n+2]
--                  bit [31:24] - x_15[4n+3]
-- 0x0a0 ~
-- 0x0a7 : Memory 'x_16' (4 * 8b)
--         Word n : bit [ 7: 0] - x_16[4n]
--                  bit [15: 8] - x_16[4n+1]
--                  bit [23:16] - x_16[4n+2]
--                  bit [31:24] - x_16[4n+3]
-- 0x0a8 ~
-- 0x0af : Memory 'x_17' (4 * 8b)
--         Word n : bit [ 7: 0] - x_17[4n]
--                  bit [15: 8] - x_17[4n+1]
--                  bit [23:16] - x_17[4n+2]
--                  bit [31:24] - x_17[4n+3]
-- 0x0b0 ~
-- 0x0b7 : Memory 'x_18' (4 * 8b)
--         Word n : bit [ 7: 0] - x_18[4n]
--                  bit [15: 8] - x_18[4n+1]
--                  bit [23:16] - x_18[4n+2]
--                  bit [31:24] - x_18[4n+3]
-- 0x0b8 ~
-- 0x0bf : Memory 'x_19' (4 * 8b)
--         Word n : bit [ 7: 0] - x_19[4n]
--                  bit [15: 8] - x_19[4n+1]
--                  bit [23:16] - x_19[4n+2]
--                  bit [31:24] - x_19[4n+3]
-- 0x0c0 ~
-- 0x0c7 : Memory 'x_20' (4 * 8b)
--         Word n : bit [ 7: 0] - x_20[4n]
--                  bit [15: 8] - x_20[4n+1]
--                  bit [23:16] - x_20[4n+2]
--                  bit [31:24] - x_20[4n+3]
-- 0x0c8 ~
-- 0x0cf : Memory 'x_21' (4 * 8b)
--         Word n : bit [ 7: 0] - x_21[4n]
--                  bit [15: 8] - x_21[4n+1]
--                  bit [23:16] - x_21[4n+2]
--                  bit [31:24] - x_21[4n+3]
-- 0x0d0 ~
-- 0x0d7 : Memory 'x_22' (4 * 8b)
--         Word n : bit [ 7: 0] - x_22[4n]
--                  bit [15: 8] - x_22[4n+1]
--                  bit [23:16] - x_22[4n+2]
--                  bit [31:24] - x_22[4n+3]
-- 0x0d8 ~
-- 0x0df : Memory 'x_23' (4 * 8b)
--         Word n : bit [ 7: 0] - x_23[4n]
--                  bit [15: 8] - x_23[4n+1]
--                  bit [23:16] - x_23[4n+2]
--                  bit [31:24] - x_23[4n+3]
-- 0x0e0 ~
-- 0x0e7 : Memory 'x_24' (4 * 8b)
--         Word n : bit [ 7: 0] - x_24[4n]
--                  bit [15: 8] - x_24[4n+1]
--                  bit [23:16] - x_24[4n+2]
--                  bit [31:24] - x_24[4n+3]
-- 0x0e8 ~
-- 0x0ef : Memory 'x_25' (4 * 8b)
--         Word n : bit [ 7: 0] - x_25[4n]
--                  bit [15: 8] - x_25[4n+1]
--                  bit [23:16] - x_25[4n+2]
--                  bit [31:24] - x_25[4n+3]
-- 0x0f0 ~
-- 0x0f7 : Memory 'x_26' (4 * 8b)
--         Word n : bit [ 7: 0] - x_26[4n]
--                  bit [15: 8] - x_26[4n+1]
--                  bit [23:16] - x_26[4n+2]
--                  bit [31:24] - x_26[4n+3]
-- 0x0f8 ~
-- 0x0ff : Memory 'x_27' (4 * 8b)
--         Word n : bit [ 7: 0] - x_27[4n]
--                  bit [15: 8] - x_27[4n+1]
--                  bit [23:16] - x_27[4n+2]
--                  bit [31:24] - x_27[4n+3]
-- 0x100 ~
-- 0x107 : Memory 'x_28' (4 * 8b)
--         Word n : bit [ 7: 0] - x_28[4n]
--                  bit [15: 8] - x_28[4n+1]
--                  bit [23:16] - x_28[4n+2]
--                  bit [31:24] - x_28[4n+3]
-- 0x108 ~
-- 0x10f : Memory 'x_29' (4 * 8b)
--         Word n : bit [ 7: 0] - x_29[4n]
--                  bit [15: 8] - x_29[4n+1]
--                  bit [23:16] - x_29[4n+2]
--                  bit [31:24] - x_29[4n+3]
-- 0x110 ~
-- 0x117 : Memory 'x_30' (4 * 8b)
--         Word n : bit [ 7: 0] - x_30[4n]
--                  bit [15: 8] - x_30[4n+1]
--                  bit [23:16] - x_30[4n+2]
--                  bit [31:24] - x_30[4n+3]
-- 0x118 ~
-- 0x11f : Memory 'x_31' (4 * 8b)
--         Word n : bit [ 7: 0] - x_31[4n]
--                  bit [15: 8] - x_31[4n+1]
--                  bit [23:16] - x_31[4n+2]
--                  bit [31:24] - x_31[4n+3]
-- 0x120 ~
-- 0x127 : Memory 'x_32' (4 * 8b)
--         Word n : bit [ 7: 0] - x_32[4n]
--                  bit [15: 8] - x_32[4n+1]
--                  bit [23:16] - x_32[4n+2]
--                  bit [31:24] - x_32[4n+3]
-- 0x128 ~
-- 0x12f : Memory 'x_33' (4 * 8b)
--         Word n : bit [ 7: 0] - x_33[4n]
--                  bit [15: 8] - x_33[4n+1]
--                  bit [23:16] - x_33[4n+2]
--                  bit [31:24] - x_33[4n+3]
-- 0x130 ~
-- 0x137 : Memory 'x_34' (4 * 8b)
--         Word n : bit [ 7: 0] - x_34[4n]
--                  bit [15: 8] - x_34[4n+1]
--                  bit [23:16] - x_34[4n+2]
--                  bit [31:24] - x_34[4n+3]
-- 0x138 ~
-- 0x13f : Memory 'x_35' (4 * 8b)
--         Word n : bit [ 7: 0] - x_35[4n]
--                  bit [15: 8] - x_35[4n+1]
--                  bit [23:16] - x_35[4n+2]
--                  bit [31:24] - x_35[4n+3]
-- 0x140 ~
-- 0x147 : Memory 'x_36' (4 * 8b)
--         Word n : bit [ 7: 0] - x_36[4n]
--                  bit [15: 8] - x_36[4n+1]
--                  bit [23:16] - x_36[4n+2]
--                  bit [31:24] - x_36[4n+3]
-- 0x148 ~
-- 0x14f : Memory 'x_37' (4 * 8b)
--         Word n : bit [ 7: 0] - x_37[4n]
--                  bit [15: 8] - x_37[4n+1]
--                  bit [23:16] - x_37[4n+2]
--                  bit [31:24] - x_37[4n+3]
-- 0x150 ~
-- 0x157 : Memory 'x_38' (4 * 8b)
--         Word n : bit [ 7: 0] - x_38[4n]
--                  bit [15: 8] - x_38[4n+1]
--                  bit [23:16] - x_38[4n+2]
--                  bit [31:24] - x_38[4n+3]
-- 0x158 ~
-- 0x15f : Memory 'x_39' (4 * 8b)
--         Word n : bit [ 7: 0] - x_39[4n]
--                  bit [15: 8] - x_39[4n+1]
--                  bit [23:16] - x_39[4n+2]
--                  bit [31:24] - x_39[4n+3]
-- 0x160 ~
-- 0x167 : Memory 'x_40' (4 * 8b)
--         Word n : bit [ 7: 0] - x_40[4n]
--                  bit [15: 8] - x_40[4n+1]
--                  bit [23:16] - x_40[4n+2]
--                  bit [31:24] - x_40[4n+3]
-- 0x168 ~
-- 0x16f : Memory 'x_41' (4 * 8b)
--         Word n : bit [ 7: 0] - x_41[4n]
--                  bit [15: 8] - x_41[4n+1]
--                  bit [23:16] - x_41[4n+2]
--                  bit [31:24] - x_41[4n+3]
-- 0x170 ~
-- 0x177 : Memory 'x_42' (4 * 8b)
--         Word n : bit [ 7: 0] - x_42[4n]
--                  bit [15: 8] - x_42[4n+1]
--                  bit [23:16] - x_42[4n+2]
--                  bit [31:24] - x_42[4n+3]
-- 0x178 ~
-- 0x17f : Memory 'x_43' (4 * 8b)
--         Word n : bit [ 7: 0] - x_43[4n]
--                  bit [15: 8] - x_43[4n+1]
--                  bit [23:16] - x_43[4n+2]
--                  bit [31:24] - x_43[4n+3]
-- 0x180 ~
-- 0x187 : Memory 'x_44' (4 * 8b)
--         Word n : bit [ 7: 0] - x_44[4n]
--                  bit [15: 8] - x_44[4n+1]
--                  bit [23:16] - x_44[4n+2]
--                  bit [31:24] - x_44[4n+3]
-- 0x188 ~
-- 0x18f : Memory 'x_45' (4 * 8b)
--         Word n : bit [ 7: 0] - x_45[4n]
--                  bit [15: 8] - x_45[4n+1]
--                  bit [23:16] - x_45[4n+2]
--                  bit [31:24] - x_45[4n+3]
-- 0x190 ~
-- 0x197 : Memory 'x_46' (4 * 8b)
--         Word n : bit [ 7: 0] - x_46[4n]
--                  bit [15: 8] - x_46[4n+1]
--                  bit [23:16] - x_46[4n+2]
--                  bit [31:24] - x_46[4n+3]
-- 0x198 ~
-- 0x19f : Memory 'x_47' (4 * 8b)
--         Word n : bit [ 7: 0] - x_47[4n]
--                  bit [15: 8] - x_47[4n+1]
--                  bit [23:16] - x_47[4n+2]
--                  bit [31:24] - x_47[4n+3]
-- 0x1a0 ~
-- 0x1a7 : Memory 'x_48' (4 * 8b)
--         Word n : bit [ 7: 0] - x_48[4n]
--                  bit [15: 8] - x_48[4n+1]
--                  bit [23:16] - x_48[4n+2]
--                  bit [31:24] - x_48[4n+3]
-- 0x1a8 ~
-- 0x1af : Memory 'x_49' (4 * 8b)
--         Word n : bit [ 7: 0] - x_49[4n]
--                  bit [15: 8] - x_49[4n+1]
--                  bit [23:16] - x_49[4n+2]
--                  bit [31:24] - x_49[4n+3]
-- 0x1b0 ~
-- 0x1b7 : Memory 'x_50' (4 * 8b)
--         Word n : bit [ 7: 0] - x_50[4n]
--                  bit [15: 8] - x_50[4n+1]
--                  bit [23:16] - x_50[4n+2]
--                  bit [31:24] - x_50[4n+3]
-- 0x1b8 ~
-- 0x1bf : Memory 'x_51' (4 * 8b)
--         Word n : bit [ 7: 0] - x_51[4n]
--                  bit [15: 8] - x_51[4n+1]
--                  bit [23:16] - x_51[4n+2]
--                  bit [31:24] - x_51[4n+3]
-- 0x1c0 ~
-- 0x1c7 : Memory 'x_52' (4 * 8b)
--         Word n : bit [ 7: 0] - x_52[4n]
--                  bit [15: 8] - x_52[4n+1]
--                  bit [23:16] - x_52[4n+2]
--                  bit [31:24] - x_52[4n+3]
-- 0x1c8 ~
-- 0x1cf : Memory 'x_53' (4 * 8b)
--         Word n : bit [ 7: 0] - x_53[4n]
--                  bit [15: 8] - x_53[4n+1]
--                  bit [23:16] - x_53[4n+2]
--                  bit [31:24] - x_53[4n+3]
-- 0x1d0 ~
-- 0x1d7 : Memory 'x_54' (4 * 8b)
--         Word n : bit [ 7: 0] - x_54[4n]
--                  bit [15: 8] - x_54[4n+1]
--                  bit [23:16] - x_54[4n+2]
--                  bit [31:24] - x_54[4n+3]
-- 0x1d8 ~
-- 0x1df : Memory 'x_55' (4 * 8b)
--         Word n : bit [ 7: 0] - x_55[4n]
--                  bit [15: 8] - x_55[4n+1]
--                  bit [23:16] - x_55[4n+2]
--                  bit [31:24] - x_55[4n+3]
-- 0x1e0 ~
-- 0x1e7 : Memory 'x_56' (4 * 8b)
--         Word n : bit [ 7: 0] - x_56[4n]
--                  bit [15: 8] - x_56[4n+1]
--                  bit [23:16] - x_56[4n+2]
--                  bit [31:24] - x_56[4n+3]
-- 0x1e8 ~
-- 0x1ef : Memory 'x_57' (4 * 8b)
--         Word n : bit [ 7: 0] - x_57[4n]
--                  bit [15: 8] - x_57[4n+1]
--                  bit [23:16] - x_57[4n+2]
--                  bit [31:24] - x_57[4n+3]
-- 0x1f0 ~
-- 0x1f7 : Memory 'x_58' (4 * 8b)
--         Word n : bit [ 7: 0] - x_58[4n]
--                  bit [15: 8] - x_58[4n+1]
--                  bit [23:16] - x_58[4n+2]
--                  bit [31:24] - x_58[4n+3]
-- 0x1f8 ~
-- 0x1ff : Memory 'x_59' (4 * 8b)
--         Word n : bit [ 7: 0] - x_59[4n]
--                  bit [15: 8] - x_59[4n+1]
--                  bit [23:16] - x_59[4n+2]
--                  bit [31:24] - x_59[4n+3]
-- 0x200 ~
-- 0x207 : Memory 'x_60' (4 * 8b)
--         Word n : bit [ 7: 0] - x_60[4n]
--                  bit [15: 8] - x_60[4n+1]
--                  bit [23:16] - x_60[4n+2]
--                  bit [31:24] - x_60[4n+3]
-- 0x208 ~
-- 0x20f : Memory 'x_61' (4 * 8b)
--         Word n : bit [ 7: 0] - x_61[4n]
--                  bit [15: 8] - x_61[4n+1]
--                  bit [23:16] - x_61[4n+2]
--                  bit [31:24] - x_61[4n+3]
-- 0x210 ~
-- 0x217 : Memory 'x_62' (4 * 8b)
--         Word n : bit [ 7: 0] - x_62[4n]
--                  bit [15: 8] - x_62[4n+1]
--                  bit [23:16] - x_62[4n+2]
--                  bit [31:24] - x_62[4n+3]
-- 0x218 ~
-- 0x21f : Memory 'x_63' (4 * 8b)
--         Word n : bit [ 7: 0] - x_63[4n]
--                  bit [15: 8] - x_63[4n+1]
--                  bit [23:16] - x_63[4n+2]
--                  bit [31:24] - x_63[4n+3]
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of eucHW_control_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_AP_CTRL       : INTEGER := 16#000#;
    constant ADDR_GIE           : INTEGER := 16#004#;
    constant ADDR_IER           : INTEGER := 16#008#;
    constant ADDR_ISR           : INTEGER := 16#00c#;
    constant ADDR_Y_SQRT_DATA_0 : INTEGER := 16#010#;
    constant ADDR_Y_SQRT_CTRL   : INTEGER := 16#014#;
    constant ADDR_X_0_BASE      : INTEGER := 16#020#;
    constant ADDR_X_0_HIGH      : INTEGER := 16#027#;
    constant ADDR_X_1_BASE      : INTEGER := 16#028#;
    constant ADDR_X_1_HIGH      : INTEGER := 16#02f#;
    constant ADDR_X_2_BASE      : INTEGER := 16#030#;
    constant ADDR_X_2_HIGH      : INTEGER := 16#037#;
    constant ADDR_X_3_BASE      : INTEGER := 16#038#;
    constant ADDR_X_3_HIGH      : INTEGER := 16#03f#;
    constant ADDR_X_4_BASE      : INTEGER := 16#040#;
    constant ADDR_X_4_HIGH      : INTEGER := 16#047#;
    constant ADDR_X_5_BASE      : INTEGER := 16#048#;
    constant ADDR_X_5_HIGH      : INTEGER := 16#04f#;
    constant ADDR_X_6_BASE      : INTEGER := 16#050#;
    constant ADDR_X_6_HIGH      : INTEGER := 16#057#;
    constant ADDR_X_7_BASE      : INTEGER := 16#058#;
    constant ADDR_X_7_HIGH      : INTEGER := 16#05f#;
    constant ADDR_X_8_BASE      : INTEGER := 16#060#;
    constant ADDR_X_8_HIGH      : INTEGER := 16#067#;
    constant ADDR_X_9_BASE      : INTEGER := 16#068#;
    constant ADDR_X_9_HIGH      : INTEGER := 16#06f#;
    constant ADDR_X_10_BASE     : INTEGER := 16#070#;
    constant ADDR_X_10_HIGH     : INTEGER := 16#077#;
    constant ADDR_X_11_BASE     : INTEGER := 16#078#;
    constant ADDR_X_11_HIGH     : INTEGER := 16#07f#;
    constant ADDR_X_12_BASE     : INTEGER := 16#080#;
    constant ADDR_X_12_HIGH     : INTEGER := 16#087#;
    constant ADDR_X_13_BASE     : INTEGER := 16#088#;
    constant ADDR_X_13_HIGH     : INTEGER := 16#08f#;
    constant ADDR_X_14_BASE     : INTEGER := 16#090#;
    constant ADDR_X_14_HIGH     : INTEGER := 16#097#;
    constant ADDR_X_15_BASE     : INTEGER := 16#098#;
    constant ADDR_X_15_HIGH     : INTEGER := 16#09f#;
    constant ADDR_X_16_BASE     : INTEGER := 16#0a0#;
    constant ADDR_X_16_HIGH     : INTEGER := 16#0a7#;
    constant ADDR_X_17_BASE     : INTEGER := 16#0a8#;
    constant ADDR_X_17_HIGH     : INTEGER := 16#0af#;
    constant ADDR_X_18_BASE     : INTEGER := 16#0b0#;
    constant ADDR_X_18_HIGH     : INTEGER := 16#0b7#;
    constant ADDR_X_19_BASE     : INTEGER := 16#0b8#;
    constant ADDR_X_19_HIGH     : INTEGER := 16#0bf#;
    constant ADDR_X_20_BASE     : INTEGER := 16#0c0#;
    constant ADDR_X_20_HIGH     : INTEGER := 16#0c7#;
    constant ADDR_X_21_BASE     : INTEGER := 16#0c8#;
    constant ADDR_X_21_HIGH     : INTEGER := 16#0cf#;
    constant ADDR_X_22_BASE     : INTEGER := 16#0d0#;
    constant ADDR_X_22_HIGH     : INTEGER := 16#0d7#;
    constant ADDR_X_23_BASE     : INTEGER := 16#0d8#;
    constant ADDR_X_23_HIGH     : INTEGER := 16#0df#;
    constant ADDR_X_24_BASE     : INTEGER := 16#0e0#;
    constant ADDR_X_24_HIGH     : INTEGER := 16#0e7#;
    constant ADDR_X_25_BASE     : INTEGER := 16#0e8#;
    constant ADDR_X_25_HIGH     : INTEGER := 16#0ef#;
    constant ADDR_X_26_BASE     : INTEGER := 16#0f0#;
    constant ADDR_X_26_HIGH     : INTEGER := 16#0f7#;
    constant ADDR_X_27_BASE     : INTEGER := 16#0f8#;
    constant ADDR_X_27_HIGH     : INTEGER := 16#0ff#;
    constant ADDR_X_28_BASE     : INTEGER := 16#100#;
    constant ADDR_X_28_HIGH     : INTEGER := 16#107#;
    constant ADDR_X_29_BASE     : INTEGER := 16#108#;
    constant ADDR_X_29_HIGH     : INTEGER := 16#10f#;
    constant ADDR_X_30_BASE     : INTEGER := 16#110#;
    constant ADDR_X_30_HIGH     : INTEGER := 16#117#;
    constant ADDR_X_31_BASE     : INTEGER := 16#118#;
    constant ADDR_X_31_HIGH     : INTEGER := 16#11f#;
    constant ADDR_X_32_BASE     : INTEGER := 16#120#;
    constant ADDR_X_32_HIGH     : INTEGER := 16#127#;
    constant ADDR_X_33_BASE     : INTEGER := 16#128#;
    constant ADDR_X_33_HIGH     : INTEGER := 16#12f#;
    constant ADDR_X_34_BASE     : INTEGER := 16#130#;
    constant ADDR_X_34_HIGH     : INTEGER := 16#137#;
    constant ADDR_X_35_BASE     : INTEGER := 16#138#;
    constant ADDR_X_35_HIGH     : INTEGER := 16#13f#;
    constant ADDR_X_36_BASE     : INTEGER := 16#140#;
    constant ADDR_X_36_HIGH     : INTEGER := 16#147#;
    constant ADDR_X_37_BASE     : INTEGER := 16#148#;
    constant ADDR_X_37_HIGH     : INTEGER := 16#14f#;
    constant ADDR_X_38_BASE     : INTEGER := 16#150#;
    constant ADDR_X_38_HIGH     : INTEGER := 16#157#;
    constant ADDR_X_39_BASE     : INTEGER := 16#158#;
    constant ADDR_X_39_HIGH     : INTEGER := 16#15f#;
    constant ADDR_X_40_BASE     : INTEGER := 16#160#;
    constant ADDR_X_40_HIGH     : INTEGER := 16#167#;
    constant ADDR_X_41_BASE     : INTEGER := 16#168#;
    constant ADDR_X_41_HIGH     : INTEGER := 16#16f#;
    constant ADDR_X_42_BASE     : INTEGER := 16#170#;
    constant ADDR_X_42_HIGH     : INTEGER := 16#177#;
    constant ADDR_X_43_BASE     : INTEGER := 16#178#;
    constant ADDR_X_43_HIGH     : INTEGER := 16#17f#;
    constant ADDR_X_44_BASE     : INTEGER := 16#180#;
    constant ADDR_X_44_HIGH     : INTEGER := 16#187#;
    constant ADDR_X_45_BASE     : INTEGER := 16#188#;
    constant ADDR_X_45_HIGH     : INTEGER := 16#18f#;
    constant ADDR_X_46_BASE     : INTEGER := 16#190#;
    constant ADDR_X_46_HIGH     : INTEGER := 16#197#;
    constant ADDR_X_47_BASE     : INTEGER := 16#198#;
    constant ADDR_X_47_HIGH     : INTEGER := 16#19f#;
    constant ADDR_X_48_BASE     : INTEGER := 16#1a0#;
    constant ADDR_X_48_HIGH     : INTEGER := 16#1a7#;
    constant ADDR_X_49_BASE     : INTEGER := 16#1a8#;
    constant ADDR_X_49_HIGH     : INTEGER := 16#1af#;
    constant ADDR_X_50_BASE     : INTEGER := 16#1b0#;
    constant ADDR_X_50_HIGH     : INTEGER := 16#1b7#;
    constant ADDR_X_51_BASE     : INTEGER := 16#1b8#;
    constant ADDR_X_51_HIGH     : INTEGER := 16#1bf#;
    constant ADDR_X_52_BASE     : INTEGER := 16#1c0#;
    constant ADDR_X_52_HIGH     : INTEGER := 16#1c7#;
    constant ADDR_X_53_BASE     : INTEGER := 16#1c8#;
    constant ADDR_X_53_HIGH     : INTEGER := 16#1cf#;
    constant ADDR_X_54_BASE     : INTEGER := 16#1d0#;
    constant ADDR_X_54_HIGH     : INTEGER := 16#1d7#;
    constant ADDR_X_55_BASE     : INTEGER := 16#1d8#;
    constant ADDR_X_55_HIGH     : INTEGER := 16#1df#;
    constant ADDR_X_56_BASE     : INTEGER := 16#1e0#;
    constant ADDR_X_56_HIGH     : INTEGER := 16#1e7#;
    constant ADDR_X_57_BASE     : INTEGER := 16#1e8#;
    constant ADDR_X_57_HIGH     : INTEGER := 16#1ef#;
    constant ADDR_X_58_BASE     : INTEGER := 16#1f0#;
    constant ADDR_X_58_HIGH     : INTEGER := 16#1f7#;
    constant ADDR_X_59_BASE     : INTEGER := 16#1f8#;
    constant ADDR_X_59_HIGH     : INTEGER := 16#1ff#;
    constant ADDR_X_60_BASE     : INTEGER := 16#200#;
    constant ADDR_X_60_HIGH     : INTEGER := 16#207#;
    constant ADDR_X_61_BASE     : INTEGER := 16#208#;
    constant ADDR_X_61_HIGH     : INTEGER := 16#20f#;
    constant ADDR_X_62_BASE     : INTEGER := 16#210#;
    constant ADDR_X_62_HIGH     : INTEGER := 16#217#;
    constant ADDR_X_63_BASE     : INTEGER := 16#218#;
    constant ADDR_X_63_HIGH     : INTEGER := 16#21f#;
    constant ADDR_BITS         : INTEGER := 10;

    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    -- internal registers
    signal int_ap_idle         : STD_LOGIC := '0';
    signal int_ap_ready        : STD_LOGIC := '0';
    signal task_ap_ready       : STD_LOGIC;
    signal int_ap_done         : STD_LOGIC := '0';
    signal task_ap_done        : STD_LOGIC;
    signal int_task_ap_done    : STD_LOGIC := '0';
    signal int_ap_start        : STD_LOGIC := '0';
    signal int_auto_restart    : STD_LOGIC := '0';
    signal auto_restart_status : STD_LOGIC := '0';
    signal auto_restart_done   : STD_LOGIC;
    signal int_gie             : STD_LOGIC := '0';
    signal int_ier             : UNSIGNED(5 downto 0) := (others => '0');
    signal int_isr             : UNSIGNED(5 downto 0) := (others => '0');
    signal int_y_sqrt_ap_vld   : STD_LOGIC;
    signal int_y_sqrt          : UNSIGNED(31 downto 0) := (others => '0');
    -- memory signals
    signal int_x_0_address0    : UNSIGNED(0 downto 0);
    signal int_x_0_ce0         : STD_LOGIC;
    signal int_x_0_q0          : UNSIGNED(31 downto 0);
    signal int_x_0_address1    : UNSIGNED(0 downto 0);
    signal int_x_0_ce1         : STD_LOGIC;
    signal int_x_0_we1         : STD_LOGIC;
    signal int_x_0_be1         : UNSIGNED(3 downto 0);
    signal int_x_0_d1          : UNSIGNED(31 downto 0);
    signal int_x_0_q1          : UNSIGNED(31 downto 0);
    signal int_x_0_read        : STD_LOGIC;
    signal int_x_0_write       : STD_LOGIC;
    signal int_x_0_shift0      : UNSIGNED(1 downto 0);
    signal int_x_1_address0    : UNSIGNED(0 downto 0);
    signal int_x_1_ce0         : STD_LOGIC;
    signal int_x_1_q0          : UNSIGNED(31 downto 0);
    signal int_x_1_address1    : UNSIGNED(0 downto 0);
    signal int_x_1_ce1         : STD_LOGIC;
    signal int_x_1_we1         : STD_LOGIC;
    signal int_x_1_be1         : UNSIGNED(3 downto 0);
    signal int_x_1_d1          : UNSIGNED(31 downto 0);
    signal int_x_1_q1          : UNSIGNED(31 downto 0);
    signal int_x_1_read        : STD_LOGIC;
    signal int_x_1_write       : STD_LOGIC;
    signal int_x_1_shift0      : UNSIGNED(1 downto 0);
    signal int_x_2_address0    : UNSIGNED(0 downto 0);
    signal int_x_2_ce0         : STD_LOGIC;
    signal int_x_2_q0          : UNSIGNED(31 downto 0);
    signal int_x_2_address1    : UNSIGNED(0 downto 0);
    signal int_x_2_ce1         : STD_LOGIC;
    signal int_x_2_we1         : STD_LOGIC;
    signal int_x_2_be1         : UNSIGNED(3 downto 0);
    signal int_x_2_d1          : UNSIGNED(31 downto 0);
    signal int_x_2_q1          : UNSIGNED(31 downto 0);
    signal int_x_2_read        : STD_LOGIC;
    signal int_x_2_write       : STD_LOGIC;
    signal int_x_2_shift0      : UNSIGNED(1 downto 0);
    signal int_x_3_address0    : UNSIGNED(0 downto 0);
    signal int_x_3_ce0         : STD_LOGIC;
    signal int_x_3_q0          : UNSIGNED(31 downto 0);
    signal int_x_3_address1    : UNSIGNED(0 downto 0);
    signal int_x_3_ce1         : STD_LOGIC;
    signal int_x_3_we1         : STD_LOGIC;
    signal int_x_3_be1         : UNSIGNED(3 downto 0);
    signal int_x_3_d1          : UNSIGNED(31 downto 0);
    signal int_x_3_q1          : UNSIGNED(31 downto 0);
    signal int_x_3_read        : STD_LOGIC;
    signal int_x_3_write       : STD_LOGIC;
    signal int_x_3_shift0      : UNSIGNED(1 downto 0);
    signal int_x_4_address0    : UNSIGNED(0 downto 0);
    signal int_x_4_ce0         : STD_LOGIC;
    signal int_x_4_q0          : UNSIGNED(31 downto 0);
    signal int_x_4_address1    : UNSIGNED(0 downto 0);
    signal int_x_4_ce1         : STD_LOGIC;
    signal int_x_4_we1         : STD_LOGIC;
    signal int_x_4_be1         : UNSIGNED(3 downto 0);
    signal int_x_4_d1          : UNSIGNED(31 downto 0);
    signal int_x_4_q1          : UNSIGNED(31 downto 0);
    signal int_x_4_read        : STD_LOGIC;
    signal int_x_4_write       : STD_LOGIC;
    signal int_x_4_shift0      : UNSIGNED(1 downto 0);
    signal int_x_5_address0    : UNSIGNED(0 downto 0);
    signal int_x_5_ce0         : STD_LOGIC;
    signal int_x_5_q0          : UNSIGNED(31 downto 0);
    signal int_x_5_address1    : UNSIGNED(0 downto 0);
    signal int_x_5_ce1         : STD_LOGIC;
    signal int_x_5_we1         : STD_LOGIC;
    signal int_x_5_be1         : UNSIGNED(3 downto 0);
    signal int_x_5_d1          : UNSIGNED(31 downto 0);
    signal int_x_5_q1          : UNSIGNED(31 downto 0);
    signal int_x_5_read        : STD_LOGIC;
    signal int_x_5_write       : STD_LOGIC;
    signal int_x_5_shift0      : UNSIGNED(1 downto 0);
    signal int_x_6_address0    : UNSIGNED(0 downto 0);
    signal int_x_6_ce0         : STD_LOGIC;
    signal int_x_6_q0          : UNSIGNED(31 downto 0);
    signal int_x_6_address1    : UNSIGNED(0 downto 0);
    signal int_x_6_ce1         : STD_LOGIC;
    signal int_x_6_we1         : STD_LOGIC;
    signal int_x_6_be1         : UNSIGNED(3 downto 0);
    signal int_x_6_d1          : UNSIGNED(31 downto 0);
    signal int_x_6_q1          : UNSIGNED(31 downto 0);
    signal int_x_6_read        : STD_LOGIC;
    signal int_x_6_write       : STD_LOGIC;
    signal int_x_6_shift0      : UNSIGNED(1 downto 0);
    signal int_x_7_address0    : UNSIGNED(0 downto 0);
    signal int_x_7_ce0         : STD_LOGIC;
    signal int_x_7_q0          : UNSIGNED(31 downto 0);
    signal int_x_7_address1    : UNSIGNED(0 downto 0);
    signal int_x_7_ce1         : STD_LOGIC;
    signal int_x_7_we1         : STD_LOGIC;
    signal int_x_7_be1         : UNSIGNED(3 downto 0);
    signal int_x_7_d1          : UNSIGNED(31 downto 0);
    signal int_x_7_q1          : UNSIGNED(31 downto 0);
    signal int_x_7_read        : STD_LOGIC;
    signal int_x_7_write       : STD_LOGIC;
    signal int_x_7_shift0      : UNSIGNED(1 downto 0);
    signal int_x_8_address0    : UNSIGNED(0 downto 0);
    signal int_x_8_ce0         : STD_LOGIC;
    signal int_x_8_q0          : UNSIGNED(31 downto 0);
    signal int_x_8_address1    : UNSIGNED(0 downto 0);
    signal int_x_8_ce1         : STD_LOGIC;
    signal int_x_8_we1         : STD_LOGIC;
    signal int_x_8_be1         : UNSIGNED(3 downto 0);
    signal int_x_8_d1          : UNSIGNED(31 downto 0);
    signal int_x_8_q1          : UNSIGNED(31 downto 0);
    signal int_x_8_read        : STD_LOGIC;
    signal int_x_8_write       : STD_LOGIC;
    signal int_x_8_shift0      : UNSIGNED(1 downto 0);
    signal int_x_9_address0    : UNSIGNED(0 downto 0);
    signal int_x_9_ce0         : STD_LOGIC;
    signal int_x_9_q0          : UNSIGNED(31 downto 0);
    signal int_x_9_address1    : UNSIGNED(0 downto 0);
    signal int_x_9_ce1         : STD_LOGIC;
    signal int_x_9_we1         : STD_LOGIC;
    signal int_x_9_be1         : UNSIGNED(3 downto 0);
    signal int_x_9_d1          : UNSIGNED(31 downto 0);
    signal int_x_9_q1          : UNSIGNED(31 downto 0);
    signal int_x_9_read        : STD_LOGIC;
    signal int_x_9_write       : STD_LOGIC;
    signal int_x_9_shift0      : UNSIGNED(1 downto 0);
    signal int_x_10_address0   : UNSIGNED(0 downto 0);
    signal int_x_10_ce0        : STD_LOGIC;
    signal int_x_10_q0         : UNSIGNED(31 downto 0);
    signal int_x_10_address1   : UNSIGNED(0 downto 0);
    signal int_x_10_ce1        : STD_LOGIC;
    signal int_x_10_we1        : STD_LOGIC;
    signal int_x_10_be1        : UNSIGNED(3 downto 0);
    signal int_x_10_d1         : UNSIGNED(31 downto 0);
    signal int_x_10_q1         : UNSIGNED(31 downto 0);
    signal int_x_10_read       : STD_LOGIC;
    signal int_x_10_write      : STD_LOGIC;
    signal int_x_10_shift0     : UNSIGNED(1 downto 0);
    signal int_x_11_address0   : UNSIGNED(0 downto 0);
    signal int_x_11_ce0        : STD_LOGIC;
    signal int_x_11_q0         : UNSIGNED(31 downto 0);
    signal int_x_11_address1   : UNSIGNED(0 downto 0);
    signal int_x_11_ce1        : STD_LOGIC;
    signal int_x_11_we1        : STD_LOGIC;
    signal int_x_11_be1        : UNSIGNED(3 downto 0);
    signal int_x_11_d1         : UNSIGNED(31 downto 0);
    signal int_x_11_q1         : UNSIGNED(31 downto 0);
    signal int_x_11_read       : STD_LOGIC;
    signal int_x_11_write      : STD_LOGIC;
    signal int_x_11_shift0     : UNSIGNED(1 downto 0);
    signal int_x_12_address0   : UNSIGNED(0 downto 0);
    signal int_x_12_ce0        : STD_LOGIC;
    signal int_x_12_q0         : UNSIGNED(31 downto 0);
    signal int_x_12_address1   : UNSIGNED(0 downto 0);
    signal int_x_12_ce1        : STD_LOGIC;
    signal int_x_12_we1        : STD_LOGIC;
    signal int_x_12_be1        : UNSIGNED(3 downto 0);
    signal int_x_12_d1         : UNSIGNED(31 downto 0);
    signal int_x_12_q1         : UNSIGNED(31 downto 0);
    signal int_x_12_read       : STD_LOGIC;
    signal int_x_12_write      : STD_LOGIC;
    signal int_x_12_shift0     : UNSIGNED(1 downto 0);
    signal int_x_13_address0   : UNSIGNED(0 downto 0);
    signal int_x_13_ce0        : STD_LOGIC;
    signal int_x_13_q0         : UNSIGNED(31 downto 0);
    signal int_x_13_address1   : UNSIGNED(0 downto 0);
    signal int_x_13_ce1        : STD_LOGIC;
    signal int_x_13_we1        : STD_LOGIC;
    signal int_x_13_be1        : UNSIGNED(3 downto 0);
    signal int_x_13_d1         : UNSIGNED(31 downto 0);
    signal int_x_13_q1         : UNSIGNED(31 downto 0);
    signal int_x_13_read       : STD_LOGIC;
    signal int_x_13_write      : STD_LOGIC;
    signal int_x_13_shift0     : UNSIGNED(1 downto 0);
    signal int_x_14_address0   : UNSIGNED(0 downto 0);
    signal int_x_14_ce0        : STD_LOGIC;
    signal int_x_14_q0         : UNSIGNED(31 downto 0);
    signal int_x_14_address1   : UNSIGNED(0 downto 0);
    signal int_x_14_ce1        : STD_LOGIC;
    signal int_x_14_we1        : STD_LOGIC;
    signal int_x_14_be1        : UNSIGNED(3 downto 0);
    signal int_x_14_d1         : UNSIGNED(31 downto 0);
    signal int_x_14_q1         : UNSIGNED(31 downto 0);
    signal int_x_14_read       : STD_LOGIC;
    signal int_x_14_write      : STD_LOGIC;
    signal int_x_14_shift0     : UNSIGNED(1 downto 0);
    signal int_x_15_address0   : UNSIGNED(0 downto 0);
    signal int_x_15_ce0        : STD_LOGIC;
    signal int_x_15_q0         : UNSIGNED(31 downto 0);
    signal int_x_15_address1   : UNSIGNED(0 downto 0);
    signal int_x_15_ce1        : STD_LOGIC;
    signal int_x_15_we1        : STD_LOGIC;
    signal int_x_15_be1        : UNSIGNED(3 downto 0);
    signal int_x_15_d1         : UNSIGNED(31 downto 0);
    signal int_x_15_q1         : UNSIGNED(31 downto 0);
    signal int_x_15_read       : STD_LOGIC;
    signal int_x_15_write      : STD_LOGIC;
    signal int_x_15_shift0     : UNSIGNED(1 downto 0);
    signal int_x_16_address0   : UNSIGNED(0 downto 0);
    signal int_x_16_ce0        : STD_LOGIC;
    signal int_x_16_q0         : UNSIGNED(31 downto 0);
    signal int_x_16_address1   : UNSIGNED(0 downto 0);
    signal int_x_16_ce1        : STD_LOGIC;
    signal int_x_16_we1        : STD_LOGIC;
    signal int_x_16_be1        : UNSIGNED(3 downto 0);
    signal int_x_16_d1         : UNSIGNED(31 downto 0);
    signal int_x_16_q1         : UNSIGNED(31 downto 0);
    signal int_x_16_read       : STD_LOGIC;
    signal int_x_16_write      : STD_LOGIC;
    signal int_x_16_shift0     : UNSIGNED(1 downto 0);
    signal int_x_17_address0   : UNSIGNED(0 downto 0);
    signal int_x_17_ce0        : STD_LOGIC;
    signal int_x_17_q0         : UNSIGNED(31 downto 0);
    signal int_x_17_address1   : UNSIGNED(0 downto 0);
    signal int_x_17_ce1        : STD_LOGIC;
    signal int_x_17_we1        : STD_LOGIC;
    signal int_x_17_be1        : UNSIGNED(3 downto 0);
    signal int_x_17_d1         : UNSIGNED(31 downto 0);
    signal int_x_17_q1         : UNSIGNED(31 downto 0);
    signal int_x_17_read       : STD_LOGIC;
    signal int_x_17_write      : STD_LOGIC;
    signal int_x_17_shift0     : UNSIGNED(1 downto 0);
    signal int_x_18_address0   : UNSIGNED(0 downto 0);
    signal int_x_18_ce0        : STD_LOGIC;
    signal int_x_18_q0         : UNSIGNED(31 downto 0);
    signal int_x_18_address1   : UNSIGNED(0 downto 0);
    signal int_x_18_ce1        : STD_LOGIC;
    signal int_x_18_we1        : STD_LOGIC;
    signal int_x_18_be1        : UNSIGNED(3 downto 0);
    signal int_x_18_d1         : UNSIGNED(31 downto 0);
    signal int_x_18_q1         : UNSIGNED(31 downto 0);
    signal int_x_18_read       : STD_LOGIC;
    signal int_x_18_write      : STD_LOGIC;
    signal int_x_18_shift0     : UNSIGNED(1 downto 0);
    signal int_x_19_address0   : UNSIGNED(0 downto 0);
    signal int_x_19_ce0        : STD_LOGIC;
    signal int_x_19_q0         : UNSIGNED(31 downto 0);
    signal int_x_19_address1   : UNSIGNED(0 downto 0);
    signal int_x_19_ce1        : STD_LOGIC;
    signal int_x_19_we1        : STD_LOGIC;
    signal int_x_19_be1        : UNSIGNED(3 downto 0);
    signal int_x_19_d1         : UNSIGNED(31 downto 0);
    signal int_x_19_q1         : UNSIGNED(31 downto 0);
    signal int_x_19_read       : STD_LOGIC;
    signal int_x_19_write      : STD_LOGIC;
    signal int_x_19_shift0     : UNSIGNED(1 downto 0);
    signal int_x_20_address0   : UNSIGNED(0 downto 0);
    signal int_x_20_ce0        : STD_LOGIC;
    signal int_x_20_q0         : UNSIGNED(31 downto 0);
    signal int_x_20_address1   : UNSIGNED(0 downto 0);
    signal int_x_20_ce1        : STD_LOGIC;
    signal int_x_20_we1        : STD_LOGIC;
    signal int_x_20_be1        : UNSIGNED(3 downto 0);
    signal int_x_20_d1         : UNSIGNED(31 downto 0);
    signal int_x_20_q1         : UNSIGNED(31 downto 0);
    signal int_x_20_read       : STD_LOGIC;
    signal int_x_20_write      : STD_LOGIC;
    signal int_x_20_shift0     : UNSIGNED(1 downto 0);
    signal int_x_21_address0   : UNSIGNED(0 downto 0);
    signal int_x_21_ce0        : STD_LOGIC;
    signal int_x_21_q0         : UNSIGNED(31 downto 0);
    signal int_x_21_address1   : UNSIGNED(0 downto 0);
    signal int_x_21_ce1        : STD_LOGIC;
    signal int_x_21_we1        : STD_LOGIC;
    signal int_x_21_be1        : UNSIGNED(3 downto 0);
    signal int_x_21_d1         : UNSIGNED(31 downto 0);
    signal int_x_21_q1         : UNSIGNED(31 downto 0);
    signal int_x_21_read       : STD_LOGIC;
    signal int_x_21_write      : STD_LOGIC;
    signal int_x_21_shift0     : UNSIGNED(1 downto 0);
    signal int_x_22_address0   : UNSIGNED(0 downto 0);
    signal int_x_22_ce0        : STD_LOGIC;
    signal int_x_22_q0         : UNSIGNED(31 downto 0);
    signal int_x_22_address1   : UNSIGNED(0 downto 0);
    signal int_x_22_ce1        : STD_LOGIC;
    signal int_x_22_we1        : STD_LOGIC;
    signal int_x_22_be1        : UNSIGNED(3 downto 0);
    signal int_x_22_d1         : UNSIGNED(31 downto 0);
    signal int_x_22_q1         : UNSIGNED(31 downto 0);
    signal int_x_22_read       : STD_LOGIC;
    signal int_x_22_write      : STD_LOGIC;
    signal int_x_22_shift0     : UNSIGNED(1 downto 0);
    signal int_x_23_address0   : UNSIGNED(0 downto 0);
    signal int_x_23_ce0        : STD_LOGIC;
    signal int_x_23_q0         : UNSIGNED(31 downto 0);
    signal int_x_23_address1   : UNSIGNED(0 downto 0);
    signal int_x_23_ce1        : STD_LOGIC;
    signal int_x_23_we1        : STD_LOGIC;
    signal int_x_23_be1        : UNSIGNED(3 downto 0);
    signal int_x_23_d1         : UNSIGNED(31 downto 0);
    signal int_x_23_q1         : UNSIGNED(31 downto 0);
    signal int_x_23_read       : STD_LOGIC;
    signal int_x_23_write      : STD_LOGIC;
    signal int_x_23_shift0     : UNSIGNED(1 downto 0);
    signal int_x_24_address0   : UNSIGNED(0 downto 0);
    signal int_x_24_ce0        : STD_LOGIC;
    signal int_x_24_q0         : UNSIGNED(31 downto 0);
    signal int_x_24_address1   : UNSIGNED(0 downto 0);
    signal int_x_24_ce1        : STD_LOGIC;
    signal int_x_24_we1        : STD_LOGIC;
    signal int_x_24_be1        : UNSIGNED(3 downto 0);
    signal int_x_24_d1         : UNSIGNED(31 downto 0);
    signal int_x_24_q1         : UNSIGNED(31 downto 0);
    signal int_x_24_read       : STD_LOGIC;
    signal int_x_24_write      : STD_LOGIC;
    signal int_x_24_shift0     : UNSIGNED(1 downto 0);
    signal int_x_25_address0   : UNSIGNED(0 downto 0);
    signal int_x_25_ce0        : STD_LOGIC;
    signal int_x_25_q0         : UNSIGNED(31 downto 0);
    signal int_x_25_address1   : UNSIGNED(0 downto 0);
    signal int_x_25_ce1        : STD_LOGIC;
    signal int_x_25_we1        : STD_LOGIC;
    signal int_x_25_be1        : UNSIGNED(3 downto 0);
    signal int_x_25_d1         : UNSIGNED(31 downto 0);
    signal int_x_25_q1         : UNSIGNED(31 downto 0);
    signal int_x_25_read       : STD_LOGIC;
    signal int_x_25_write      : STD_LOGIC;
    signal int_x_25_shift0     : UNSIGNED(1 downto 0);
    signal int_x_26_address0   : UNSIGNED(0 downto 0);
    signal int_x_26_ce0        : STD_LOGIC;
    signal int_x_26_q0         : UNSIGNED(31 downto 0);
    signal int_x_26_address1   : UNSIGNED(0 downto 0);
    signal int_x_26_ce1        : STD_LOGIC;
    signal int_x_26_we1        : STD_LOGIC;
    signal int_x_26_be1        : UNSIGNED(3 downto 0);
    signal int_x_26_d1         : UNSIGNED(31 downto 0);
    signal int_x_26_q1         : UNSIGNED(31 downto 0);
    signal int_x_26_read       : STD_LOGIC;
    signal int_x_26_write      : STD_LOGIC;
    signal int_x_26_shift0     : UNSIGNED(1 downto 0);
    signal int_x_27_address0   : UNSIGNED(0 downto 0);
    signal int_x_27_ce0        : STD_LOGIC;
    signal int_x_27_q0         : UNSIGNED(31 downto 0);
    signal int_x_27_address1   : UNSIGNED(0 downto 0);
    signal int_x_27_ce1        : STD_LOGIC;
    signal int_x_27_we1        : STD_LOGIC;
    signal int_x_27_be1        : UNSIGNED(3 downto 0);
    signal int_x_27_d1         : UNSIGNED(31 downto 0);
    signal int_x_27_q1         : UNSIGNED(31 downto 0);
    signal int_x_27_read       : STD_LOGIC;
    signal int_x_27_write      : STD_LOGIC;
    signal int_x_27_shift0     : UNSIGNED(1 downto 0);
    signal int_x_28_address0   : UNSIGNED(0 downto 0);
    signal int_x_28_ce0        : STD_LOGIC;
    signal int_x_28_q0         : UNSIGNED(31 downto 0);
    signal int_x_28_address1   : UNSIGNED(0 downto 0);
    signal int_x_28_ce1        : STD_LOGIC;
    signal int_x_28_we1        : STD_LOGIC;
    signal int_x_28_be1        : UNSIGNED(3 downto 0);
    signal int_x_28_d1         : UNSIGNED(31 downto 0);
    signal int_x_28_q1         : UNSIGNED(31 downto 0);
    signal int_x_28_read       : STD_LOGIC;
    signal int_x_28_write      : STD_LOGIC;
    signal int_x_28_shift0     : UNSIGNED(1 downto 0);
    signal int_x_29_address0   : UNSIGNED(0 downto 0);
    signal int_x_29_ce0        : STD_LOGIC;
    signal int_x_29_q0         : UNSIGNED(31 downto 0);
    signal int_x_29_address1   : UNSIGNED(0 downto 0);
    signal int_x_29_ce1        : STD_LOGIC;
    signal int_x_29_we1        : STD_LOGIC;
    signal int_x_29_be1        : UNSIGNED(3 downto 0);
    signal int_x_29_d1         : UNSIGNED(31 downto 0);
    signal int_x_29_q1         : UNSIGNED(31 downto 0);
    signal int_x_29_read       : STD_LOGIC;
    signal int_x_29_write      : STD_LOGIC;
    signal int_x_29_shift0     : UNSIGNED(1 downto 0);
    signal int_x_30_address0   : UNSIGNED(0 downto 0);
    signal int_x_30_ce0        : STD_LOGIC;
    signal int_x_30_q0         : UNSIGNED(31 downto 0);
    signal int_x_30_address1   : UNSIGNED(0 downto 0);
    signal int_x_30_ce1        : STD_LOGIC;
    signal int_x_30_we1        : STD_LOGIC;
    signal int_x_30_be1        : UNSIGNED(3 downto 0);
    signal int_x_30_d1         : UNSIGNED(31 downto 0);
    signal int_x_30_q1         : UNSIGNED(31 downto 0);
    signal int_x_30_read       : STD_LOGIC;
    signal int_x_30_write      : STD_LOGIC;
    signal int_x_30_shift0     : UNSIGNED(1 downto 0);
    signal int_x_31_address0   : UNSIGNED(0 downto 0);
    signal int_x_31_ce0        : STD_LOGIC;
    signal int_x_31_q0         : UNSIGNED(31 downto 0);
    signal int_x_31_address1   : UNSIGNED(0 downto 0);
    signal int_x_31_ce1        : STD_LOGIC;
    signal int_x_31_we1        : STD_LOGIC;
    signal int_x_31_be1        : UNSIGNED(3 downto 0);
    signal int_x_31_d1         : UNSIGNED(31 downto 0);
    signal int_x_31_q1         : UNSIGNED(31 downto 0);
    signal int_x_31_read       : STD_LOGIC;
    signal int_x_31_write      : STD_LOGIC;
    signal int_x_31_shift0     : UNSIGNED(1 downto 0);
    signal int_x_32_address0   : UNSIGNED(0 downto 0);
    signal int_x_32_ce0        : STD_LOGIC;
    signal int_x_32_q0         : UNSIGNED(31 downto 0);
    signal int_x_32_address1   : UNSIGNED(0 downto 0);
    signal int_x_32_ce1        : STD_LOGIC;
    signal int_x_32_we1        : STD_LOGIC;
    signal int_x_32_be1        : UNSIGNED(3 downto 0);
    signal int_x_32_d1         : UNSIGNED(31 downto 0);
    signal int_x_32_q1         : UNSIGNED(31 downto 0);
    signal int_x_32_read       : STD_LOGIC;
    signal int_x_32_write      : STD_LOGIC;
    signal int_x_32_shift0     : UNSIGNED(1 downto 0);
    signal int_x_33_address0   : UNSIGNED(0 downto 0);
    signal int_x_33_ce0        : STD_LOGIC;
    signal int_x_33_q0         : UNSIGNED(31 downto 0);
    signal int_x_33_address1   : UNSIGNED(0 downto 0);
    signal int_x_33_ce1        : STD_LOGIC;
    signal int_x_33_we1        : STD_LOGIC;
    signal int_x_33_be1        : UNSIGNED(3 downto 0);
    signal int_x_33_d1         : UNSIGNED(31 downto 0);
    signal int_x_33_q1         : UNSIGNED(31 downto 0);
    signal int_x_33_read       : STD_LOGIC;
    signal int_x_33_write      : STD_LOGIC;
    signal int_x_33_shift0     : UNSIGNED(1 downto 0);
    signal int_x_34_address0   : UNSIGNED(0 downto 0);
    signal int_x_34_ce0        : STD_LOGIC;
    signal int_x_34_q0         : UNSIGNED(31 downto 0);
    signal int_x_34_address1   : UNSIGNED(0 downto 0);
    signal int_x_34_ce1        : STD_LOGIC;
    signal int_x_34_we1        : STD_LOGIC;
    signal int_x_34_be1        : UNSIGNED(3 downto 0);
    signal int_x_34_d1         : UNSIGNED(31 downto 0);
    signal int_x_34_q1         : UNSIGNED(31 downto 0);
    signal int_x_34_read       : STD_LOGIC;
    signal int_x_34_write      : STD_LOGIC;
    signal int_x_34_shift0     : UNSIGNED(1 downto 0);
    signal int_x_35_address0   : UNSIGNED(0 downto 0);
    signal int_x_35_ce0        : STD_LOGIC;
    signal int_x_35_q0         : UNSIGNED(31 downto 0);
    signal int_x_35_address1   : UNSIGNED(0 downto 0);
    signal int_x_35_ce1        : STD_LOGIC;
    signal int_x_35_we1        : STD_LOGIC;
    signal int_x_35_be1        : UNSIGNED(3 downto 0);
    signal int_x_35_d1         : UNSIGNED(31 downto 0);
    signal int_x_35_q1         : UNSIGNED(31 downto 0);
    signal int_x_35_read       : STD_LOGIC;
    signal int_x_35_write      : STD_LOGIC;
    signal int_x_35_shift0     : UNSIGNED(1 downto 0);
    signal int_x_36_address0   : UNSIGNED(0 downto 0);
    signal int_x_36_ce0        : STD_LOGIC;
    signal int_x_36_q0         : UNSIGNED(31 downto 0);
    signal int_x_36_address1   : UNSIGNED(0 downto 0);
    signal int_x_36_ce1        : STD_LOGIC;
    signal int_x_36_we1        : STD_LOGIC;
    signal int_x_36_be1        : UNSIGNED(3 downto 0);
    signal int_x_36_d1         : UNSIGNED(31 downto 0);
    signal int_x_36_q1         : UNSIGNED(31 downto 0);
    signal int_x_36_read       : STD_LOGIC;
    signal int_x_36_write      : STD_LOGIC;
    signal int_x_36_shift0     : UNSIGNED(1 downto 0);
    signal int_x_37_address0   : UNSIGNED(0 downto 0);
    signal int_x_37_ce0        : STD_LOGIC;
    signal int_x_37_q0         : UNSIGNED(31 downto 0);
    signal int_x_37_address1   : UNSIGNED(0 downto 0);
    signal int_x_37_ce1        : STD_LOGIC;
    signal int_x_37_we1        : STD_LOGIC;
    signal int_x_37_be1        : UNSIGNED(3 downto 0);
    signal int_x_37_d1         : UNSIGNED(31 downto 0);
    signal int_x_37_q1         : UNSIGNED(31 downto 0);
    signal int_x_37_read       : STD_LOGIC;
    signal int_x_37_write      : STD_LOGIC;
    signal int_x_37_shift0     : UNSIGNED(1 downto 0);
    signal int_x_38_address0   : UNSIGNED(0 downto 0);
    signal int_x_38_ce0        : STD_LOGIC;
    signal int_x_38_q0         : UNSIGNED(31 downto 0);
    signal int_x_38_address1   : UNSIGNED(0 downto 0);
    signal int_x_38_ce1        : STD_LOGIC;
    signal int_x_38_we1        : STD_LOGIC;
    signal int_x_38_be1        : UNSIGNED(3 downto 0);
    signal int_x_38_d1         : UNSIGNED(31 downto 0);
    signal int_x_38_q1         : UNSIGNED(31 downto 0);
    signal int_x_38_read       : STD_LOGIC;
    signal int_x_38_write      : STD_LOGIC;
    signal int_x_38_shift0     : UNSIGNED(1 downto 0);
    signal int_x_39_address0   : UNSIGNED(0 downto 0);
    signal int_x_39_ce0        : STD_LOGIC;
    signal int_x_39_q0         : UNSIGNED(31 downto 0);
    signal int_x_39_address1   : UNSIGNED(0 downto 0);
    signal int_x_39_ce1        : STD_LOGIC;
    signal int_x_39_we1        : STD_LOGIC;
    signal int_x_39_be1        : UNSIGNED(3 downto 0);
    signal int_x_39_d1         : UNSIGNED(31 downto 0);
    signal int_x_39_q1         : UNSIGNED(31 downto 0);
    signal int_x_39_read       : STD_LOGIC;
    signal int_x_39_write      : STD_LOGIC;
    signal int_x_39_shift0     : UNSIGNED(1 downto 0);
    signal int_x_40_address0   : UNSIGNED(0 downto 0);
    signal int_x_40_ce0        : STD_LOGIC;
    signal int_x_40_q0         : UNSIGNED(31 downto 0);
    signal int_x_40_address1   : UNSIGNED(0 downto 0);
    signal int_x_40_ce1        : STD_LOGIC;
    signal int_x_40_we1        : STD_LOGIC;
    signal int_x_40_be1        : UNSIGNED(3 downto 0);
    signal int_x_40_d1         : UNSIGNED(31 downto 0);
    signal int_x_40_q1         : UNSIGNED(31 downto 0);
    signal int_x_40_read       : STD_LOGIC;
    signal int_x_40_write      : STD_LOGIC;
    signal int_x_40_shift0     : UNSIGNED(1 downto 0);
    signal int_x_41_address0   : UNSIGNED(0 downto 0);
    signal int_x_41_ce0        : STD_LOGIC;
    signal int_x_41_q0         : UNSIGNED(31 downto 0);
    signal int_x_41_address1   : UNSIGNED(0 downto 0);
    signal int_x_41_ce1        : STD_LOGIC;
    signal int_x_41_we1        : STD_LOGIC;
    signal int_x_41_be1        : UNSIGNED(3 downto 0);
    signal int_x_41_d1         : UNSIGNED(31 downto 0);
    signal int_x_41_q1         : UNSIGNED(31 downto 0);
    signal int_x_41_read       : STD_LOGIC;
    signal int_x_41_write      : STD_LOGIC;
    signal int_x_41_shift0     : UNSIGNED(1 downto 0);
    signal int_x_42_address0   : UNSIGNED(0 downto 0);
    signal int_x_42_ce0        : STD_LOGIC;
    signal int_x_42_q0         : UNSIGNED(31 downto 0);
    signal int_x_42_address1   : UNSIGNED(0 downto 0);
    signal int_x_42_ce1        : STD_LOGIC;
    signal int_x_42_we1        : STD_LOGIC;
    signal int_x_42_be1        : UNSIGNED(3 downto 0);
    signal int_x_42_d1         : UNSIGNED(31 downto 0);
    signal int_x_42_q1         : UNSIGNED(31 downto 0);
    signal int_x_42_read       : STD_LOGIC;
    signal int_x_42_write      : STD_LOGIC;
    signal int_x_42_shift0     : UNSIGNED(1 downto 0);
    signal int_x_43_address0   : UNSIGNED(0 downto 0);
    signal int_x_43_ce0        : STD_LOGIC;
    signal int_x_43_q0         : UNSIGNED(31 downto 0);
    signal int_x_43_address1   : UNSIGNED(0 downto 0);
    signal int_x_43_ce1        : STD_LOGIC;
    signal int_x_43_we1        : STD_LOGIC;
    signal int_x_43_be1        : UNSIGNED(3 downto 0);
    signal int_x_43_d1         : UNSIGNED(31 downto 0);
    signal int_x_43_q1         : UNSIGNED(31 downto 0);
    signal int_x_43_read       : STD_LOGIC;
    signal int_x_43_write      : STD_LOGIC;
    signal int_x_43_shift0     : UNSIGNED(1 downto 0);
    signal int_x_44_address0   : UNSIGNED(0 downto 0);
    signal int_x_44_ce0        : STD_LOGIC;
    signal int_x_44_q0         : UNSIGNED(31 downto 0);
    signal int_x_44_address1   : UNSIGNED(0 downto 0);
    signal int_x_44_ce1        : STD_LOGIC;
    signal int_x_44_we1        : STD_LOGIC;
    signal int_x_44_be1        : UNSIGNED(3 downto 0);
    signal int_x_44_d1         : UNSIGNED(31 downto 0);
    signal int_x_44_q1         : UNSIGNED(31 downto 0);
    signal int_x_44_read       : STD_LOGIC;
    signal int_x_44_write      : STD_LOGIC;
    signal int_x_44_shift0     : UNSIGNED(1 downto 0);
    signal int_x_45_address0   : UNSIGNED(0 downto 0);
    signal int_x_45_ce0        : STD_LOGIC;
    signal int_x_45_q0         : UNSIGNED(31 downto 0);
    signal int_x_45_address1   : UNSIGNED(0 downto 0);
    signal int_x_45_ce1        : STD_LOGIC;
    signal int_x_45_we1        : STD_LOGIC;
    signal int_x_45_be1        : UNSIGNED(3 downto 0);
    signal int_x_45_d1         : UNSIGNED(31 downto 0);
    signal int_x_45_q1         : UNSIGNED(31 downto 0);
    signal int_x_45_read       : STD_LOGIC;
    signal int_x_45_write      : STD_LOGIC;
    signal int_x_45_shift0     : UNSIGNED(1 downto 0);
    signal int_x_46_address0   : UNSIGNED(0 downto 0);
    signal int_x_46_ce0        : STD_LOGIC;
    signal int_x_46_q0         : UNSIGNED(31 downto 0);
    signal int_x_46_address1   : UNSIGNED(0 downto 0);
    signal int_x_46_ce1        : STD_LOGIC;
    signal int_x_46_we1        : STD_LOGIC;
    signal int_x_46_be1        : UNSIGNED(3 downto 0);
    signal int_x_46_d1         : UNSIGNED(31 downto 0);
    signal int_x_46_q1         : UNSIGNED(31 downto 0);
    signal int_x_46_read       : STD_LOGIC;
    signal int_x_46_write      : STD_LOGIC;
    signal int_x_46_shift0     : UNSIGNED(1 downto 0);
    signal int_x_47_address0   : UNSIGNED(0 downto 0);
    signal int_x_47_ce0        : STD_LOGIC;
    signal int_x_47_q0         : UNSIGNED(31 downto 0);
    signal int_x_47_address1   : UNSIGNED(0 downto 0);
    signal int_x_47_ce1        : STD_LOGIC;
    signal int_x_47_we1        : STD_LOGIC;
    signal int_x_47_be1        : UNSIGNED(3 downto 0);
    signal int_x_47_d1         : UNSIGNED(31 downto 0);
    signal int_x_47_q1         : UNSIGNED(31 downto 0);
    signal int_x_47_read       : STD_LOGIC;
    signal int_x_47_write      : STD_LOGIC;
    signal int_x_47_shift0     : UNSIGNED(1 downto 0);
    signal int_x_48_address0   : UNSIGNED(0 downto 0);
    signal int_x_48_ce0        : STD_LOGIC;
    signal int_x_48_q0         : UNSIGNED(31 downto 0);
    signal int_x_48_address1   : UNSIGNED(0 downto 0);
    signal int_x_48_ce1        : STD_LOGIC;
    signal int_x_48_we1        : STD_LOGIC;
    signal int_x_48_be1        : UNSIGNED(3 downto 0);
    signal int_x_48_d1         : UNSIGNED(31 downto 0);
    signal int_x_48_q1         : UNSIGNED(31 downto 0);
    signal int_x_48_read       : STD_LOGIC;
    signal int_x_48_write      : STD_LOGIC;
    signal int_x_48_shift0     : UNSIGNED(1 downto 0);
    signal int_x_49_address0   : UNSIGNED(0 downto 0);
    signal int_x_49_ce0        : STD_LOGIC;
    signal int_x_49_q0         : UNSIGNED(31 downto 0);
    signal int_x_49_address1   : UNSIGNED(0 downto 0);
    signal int_x_49_ce1        : STD_LOGIC;
    signal int_x_49_we1        : STD_LOGIC;
    signal int_x_49_be1        : UNSIGNED(3 downto 0);
    signal int_x_49_d1         : UNSIGNED(31 downto 0);
    signal int_x_49_q1         : UNSIGNED(31 downto 0);
    signal int_x_49_read       : STD_LOGIC;
    signal int_x_49_write      : STD_LOGIC;
    signal int_x_49_shift0     : UNSIGNED(1 downto 0);
    signal int_x_50_address0   : UNSIGNED(0 downto 0);
    signal int_x_50_ce0        : STD_LOGIC;
    signal int_x_50_q0         : UNSIGNED(31 downto 0);
    signal int_x_50_address1   : UNSIGNED(0 downto 0);
    signal int_x_50_ce1        : STD_LOGIC;
    signal int_x_50_we1        : STD_LOGIC;
    signal int_x_50_be1        : UNSIGNED(3 downto 0);
    signal int_x_50_d1         : UNSIGNED(31 downto 0);
    signal int_x_50_q1         : UNSIGNED(31 downto 0);
    signal int_x_50_read       : STD_LOGIC;
    signal int_x_50_write      : STD_LOGIC;
    signal int_x_50_shift0     : UNSIGNED(1 downto 0);
    signal int_x_51_address0   : UNSIGNED(0 downto 0);
    signal int_x_51_ce0        : STD_LOGIC;
    signal int_x_51_q0         : UNSIGNED(31 downto 0);
    signal int_x_51_address1   : UNSIGNED(0 downto 0);
    signal int_x_51_ce1        : STD_LOGIC;
    signal int_x_51_we1        : STD_LOGIC;
    signal int_x_51_be1        : UNSIGNED(3 downto 0);
    signal int_x_51_d1         : UNSIGNED(31 downto 0);
    signal int_x_51_q1         : UNSIGNED(31 downto 0);
    signal int_x_51_read       : STD_LOGIC;
    signal int_x_51_write      : STD_LOGIC;
    signal int_x_51_shift0     : UNSIGNED(1 downto 0);
    signal int_x_52_address0   : UNSIGNED(0 downto 0);
    signal int_x_52_ce0        : STD_LOGIC;
    signal int_x_52_q0         : UNSIGNED(31 downto 0);
    signal int_x_52_address1   : UNSIGNED(0 downto 0);
    signal int_x_52_ce1        : STD_LOGIC;
    signal int_x_52_we1        : STD_LOGIC;
    signal int_x_52_be1        : UNSIGNED(3 downto 0);
    signal int_x_52_d1         : UNSIGNED(31 downto 0);
    signal int_x_52_q1         : UNSIGNED(31 downto 0);
    signal int_x_52_read       : STD_LOGIC;
    signal int_x_52_write      : STD_LOGIC;
    signal int_x_52_shift0     : UNSIGNED(1 downto 0);
    signal int_x_53_address0   : UNSIGNED(0 downto 0);
    signal int_x_53_ce0        : STD_LOGIC;
    signal int_x_53_q0         : UNSIGNED(31 downto 0);
    signal int_x_53_address1   : UNSIGNED(0 downto 0);
    signal int_x_53_ce1        : STD_LOGIC;
    signal int_x_53_we1        : STD_LOGIC;
    signal int_x_53_be1        : UNSIGNED(3 downto 0);
    signal int_x_53_d1         : UNSIGNED(31 downto 0);
    signal int_x_53_q1         : UNSIGNED(31 downto 0);
    signal int_x_53_read       : STD_LOGIC;
    signal int_x_53_write      : STD_LOGIC;
    signal int_x_53_shift0     : UNSIGNED(1 downto 0);
    signal int_x_54_address0   : UNSIGNED(0 downto 0);
    signal int_x_54_ce0        : STD_LOGIC;
    signal int_x_54_q0         : UNSIGNED(31 downto 0);
    signal int_x_54_address1   : UNSIGNED(0 downto 0);
    signal int_x_54_ce1        : STD_LOGIC;
    signal int_x_54_we1        : STD_LOGIC;
    signal int_x_54_be1        : UNSIGNED(3 downto 0);
    signal int_x_54_d1         : UNSIGNED(31 downto 0);
    signal int_x_54_q1         : UNSIGNED(31 downto 0);
    signal int_x_54_read       : STD_LOGIC;
    signal int_x_54_write      : STD_LOGIC;
    signal int_x_54_shift0     : UNSIGNED(1 downto 0);
    signal int_x_55_address0   : UNSIGNED(0 downto 0);
    signal int_x_55_ce0        : STD_LOGIC;
    signal int_x_55_q0         : UNSIGNED(31 downto 0);
    signal int_x_55_address1   : UNSIGNED(0 downto 0);
    signal int_x_55_ce1        : STD_LOGIC;
    signal int_x_55_we1        : STD_LOGIC;
    signal int_x_55_be1        : UNSIGNED(3 downto 0);
    signal int_x_55_d1         : UNSIGNED(31 downto 0);
    signal int_x_55_q1         : UNSIGNED(31 downto 0);
    signal int_x_55_read       : STD_LOGIC;
    signal int_x_55_write      : STD_LOGIC;
    signal int_x_55_shift0     : UNSIGNED(1 downto 0);
    signal int_x_56_address0   : UNSIGNED(0 downto 0);
    signal int_x_56_ce0        : STD_LOGIC;
    signal int_x_56_q0         : UNSIGNED(31 downto 0);
    signal int_x_56_address1   : UNSIGNED(0 downto 0);
    signal int_x_56_ce1        : STD_LOGIC;
    signal int_x_56_we1        : STD_LOGIC;
    signal int_x_56_be1        : UNSIGNED(3 downto 0);
    signal int_x_56_d1         : UNSIGNED(31 downto 0);
    signal int_x_56_q1         : UNSIGNED(31 downto 0);
    signal int_x_56_read       : STD_LOGIC;
    signal int_x_56_write      : STD_LOGIC;
    signal int_x_56_shift0     : UNSIGNED(1 downto 0);
    signal int_x_57_address0   : UNSIGNED(0 downto 0);
    signal int_x_57_ce0        : STD_LOGIC;
    signal int_x_57_q0         : UNSIGNED(31 downto 0);
    signal int_x_57_address1   : UNSIGNED(0 downto 0);
    signal int_x_57_ce1        : STD_LOGIC;
    signal int_x_57_we1        : STD_LOGIC;
    signal int_x_57_be1        : UNSIGNED(3 downto 0);
    signal int_x_57_d1         : UNSIGNED(31 downto 0);
    signal int_x_57_q1         : UNSIGNED(31 downto 0);
    signal int_x_57_read       : STD_LOGIC;
    signal int_x_57_write      : STD_LOGIC;
    signal int_x_57_shift0     : UNSIGNED(1 downto 0);
    signal int_x_58_address0   : UNSIGNED(0 downto 0);
    signal int_x_58_ce0        : STD_LOGIC;
    signal int_x_58_q0         : UNSIGNED(31 downto 0);
    signal int_x_58_address1   : UNSIGNED(0 downto 0);
    signal int_x_58_ce1        : STD_LOGIC;
    signal int_x_58_we1        : STD_LOGIC;
    signal int_x_58_be1        : UNSIGNED(3 downto 0);
    signal int_x_58_d1         : UNSIGNED(31 downto 0);
    signal int_x_58_q1         : UNSIGNED(31 downto 0);
    signal int_x_58_read       : STD_LOGIC;
    signal int_x_58_write      : STD_LOGIC;
    signal int_x_58_shift0     : UNSIGNED(1 downto 0);
    signal int_x_59_address0   : UNSIGNED(0 downto 0);
    signal int_x_59_ce0        : STD_LOGIC;
    signal int_x_59_q0         : UNSIGNED(31 downto 0);
    signal int_x_59_address1   : UNSIGNED(0 downto 0);
    signal int_x_59_ce1        : STD_LOGIC;
    signal int_x_59_we1        : STD_LOGIC;
    signal int_x_59_be1        : UNSIGNED(3 downto 0);
    signal int_x_59_d1         : UNSIGNED(31 downto 0);
    signal int_x_59_q1         : UNSIGNED(31 downto 0);
    signal int_x_59_read       : STD_LOGIC;
    signal int_x_59_write      : STD_LOGIC;
    signal int_x_59_shift0     : UNSIGNED(1 downto 0);
    signal int_x_60_address0   : UNSIGNED(0 downto 0);
    signal int_x_60_ce0        : STD_LOGIC;
    signal int_x_60_q0         : UNSIGNED(31 downto 0);
    signal int_x_60_address1   : UNSIGNED(0 downto 0);
    signal int_x_60_ce1        : STD_LOGIC;
    signal int_x_60_we1        : STD_LOGIC;
    signal int_x_60_be1        : UNSIGNED(3 downto 0);
    signal int_x_60_d1         : UNSIGNED(31 downto 0);
    signal int_x_60_q1         : UNSIGNED(31 downto 0);
    signal int_x_60_read       : STD_LOGIC;
    signal int_x_60_write      : STD_LOGIC;
    signal int_x_60_shift0     : UNSIGNED(1 downto 0);
    signal int_x_61_address0   : UNSIGNED(0 downto 0);
    signal int_x_61_ce0        : STD_LOGIC;
    signal int_x_61_q0         : UNSIGNED(31 downto 0);
    signal int_x_61_address1   : UNSIGNED(0 downto 0);
    signal int_x_61_ce1        : STD_LOGIC;
    signal int_x_61_we1        : STD_LOGIC;
    signal int_x_61_be1        : UNSIGNED(3 downto 0);
    signal int_x_61_d1         : UNSIGNED(31 downto 0);
    signal int_x_61_q1         : UNSIGNED(31 downto 0);
    signal int_x_61_read       : STD_LOGIC;
    signal int_x_61_write      : STD_LOGIC;
    signal int_x_61_shift0     : UNSIGNED(1 downto 0);
    signal int_x_62_address0   : UNSIGNED(0 downto 0);
    signal int_x_62_ce0        : STD_LOGIC;
    signal int_x_62_q0         : UNSIGNED(31 downto 0);
    signal int_x_62_address1   : UNSIGNED(0 downto 0);
    signal int_x_62_ce1        : STD_LOGIC;
    signal int_x_62_we1        : STD_LOGIC;
    signal int_x_62_be1        : UNSIGNED(3 downto 0);
    signal int_x_62_d1         : UNSIGNED(31 downto 0);
    signal int_x_62_q1         : UNSIGNED(31 downto 0);
    signal int_x_62_read       : STD_LOGIC;
    signal int_x_62_write      : STD_LOGIC;
    signal int_x_62_shift0     : UNSIGNED(1 downto 0);
    signal int_x_63_address0   : UNSIGNED(0 downto 0);
    signal int_x_63_ce0        : STD_LOGIC;
    signal int_x_63_q0         : UNSIGNED(31 downto 0);
    signal int_x_63_address1   : UNSIGNED(0 downto 0);
    signal int_x_63_ce1        : STD_LOGIC;
    signal int_x_63_we1        : STD_LOGIC;
    signal int_x_63_be1        : UNSIGNED(3 downto 0);
    signal int_x_63_d1         : UNSIGNED(31 downto 0);
    signal int_x_63_q1         : UNSIGNED(31 downto 0);
    signal int_x_63_read       : STD_LOGIC;
    signal int_x_63_write      : STD_LOGIC;
    signal int_x_63_shift0     : UNSIGNED(1 downto 0);

    component eucHW_control_s_axi_ram is
        generic (
            MEM_STYLE : STRING :="auto";
            MEM_TYPE  : STRING :="S2P";
            BYTES   : INTEGER :=4;
            DEPTH   : INTEGER :=256;
            AWIDTH  : INTEGER :=8);
        port (
            clk0    : in  STD_LOGIC;
            address0: in  UNSIGNED(AWIDTH-1 downto 0);
            ce0     : in  STD_LOGIC;
            we0     : in  UNSIGNED(BYTES-1 downto 0);
            d0      : in  UNSIGNED(BYTES*8-1 downto 0);
            q0      : out UNSIGNED(BYTES*8-1 downto 0);
            clk1    : in  STD_LOGIC;
            address1: in  UNSIGNED(AWIDTH-1 downto 0);
            ce1     : in  STD_LOGIC;
            we1     : in  UNSIGNED(BYTES-1 downto 0);
            d1      : in  UNSIGNED(BYTES*8-1 downto 0);
            q1      : out UNSIGNED(BYTES*8-1 downto 0));
    end component eucHW_control_s_axi_ram;

    function log2 (x : INTEGER) return INTEGER is
        variable n, m : INTEGER;
    begin
        n := 1;
        m := 2;
        while m < x loop
            n := n + 1;
            m := m * 2;
        end loop;
        return n;
    end function log2;

begin
-- ----------------------- Instantiation------------------
-- int_x_0
int_x_0 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_0_address0,
     ce0       => int_x_0_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_0_q0,
     clk1      => ACLK,
     address1  => int_x_0_address1,
     ce1       => int_x_0_ce1,
     we1       => int_x_0_be1,
     d1        => int_x_0_d1,
     q1        => int_x_0_q1);
-- int_x_1
int_x_1 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_1_address0,
     ce0       => int_x_1_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_1_q0,
     clk1      => ACLK,
     address1  => int_x_1_address1,
     ce1       => int_x_1_ce1,
     we1       => int_x_1_be1,
     d1        => int_x_1_d1,
     q1        => int_x_1_q1);
-- int_x_2
int_x_2 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_2_address0,
     ce0       => int_x_2_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_2_q0,
     clk1      => ACLK,
     address1  => int_x_2_address1,
     ce1       => int_x_2_ce1,
     we1       => int_x_2_be1,
     d1        => int_x_2_d1,
     q1        => int_x_2_q1);
-- int_x_3
int_x_3 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_3_address0,
     ce0       => int_x_3_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_3_q0,
     clk1      => ACLK,
     address1  => int_x_3_address1,
     ce1       => int_x_3_ce1,
     we1       => int_x_3_be1,
     d1        => int_x_3_d1,
     q1        => int_x_3_q1);
-- int_x_4
int_x_4 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_4_address0,
     ce0       => int_x_4_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_4_q0,
     clk1      => ACLK,
     address1  => int_x_4_address1,
     ce1       => int_x_4_ce1,
     we1       => int_x_4_be1,
     d1        => int_x_4_d1,
     q1        => int_x_4_q1);
-- int_x_5
int_x_5 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_5_address0,
     ce0       => int_x_5_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_5_q0,
     clk1      => ACLK,
     address1  => int_x_5_address1,
     ce1       => int_x_5_ce1,
     we1       => int_x_5_be1,
     d1        => int_x_5_d1,
     q1        => int_x_5_q1);
-- int_x_6
int_x_6 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_6_address0,
     ce0       => int_x_6_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_6_q0,
     clk1      => ACLK,
     address1  => int_x_6_address1,
     ce1       => int_x_6_ce1,
     we1       => int_x_6_be1,
     d1        => int_x_6_d1,
     q1        => int_x_6_q1);
-- int_x_7
int_x_7 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_7_address0,
     ce0       => int_x_7_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_7_q0,
     clk1      => ACLK,
     address1  => int_x_7_address1,
     ce1       => int_x_7_ce1,
     we1       => int_x_7_be1,
     d1        => int_x_7_d1,
     q1        => int_x_7_q1);
-- int_x_8
int_x_8 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_8_address0,
     ce0       => int_x_8_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_8_q0,
     clk1      => ACLK,
     address1  => int_x_8_address1,
     ce1       => int_x_8_ce1,
     we1       => int_x_8_be1,
     d1        => int_x_8_d1,
     q1        => int_x_8_q1);
-- int_x_9
int_x_9 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_9_address0,
     ce0       => int_x_9_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_9_q0,
     clk1      => ACLK,
     address1  => int_x_9_address1,
     ce1       => int_x_9_ce1,
     we1       => int_x_9_be1,
     d1        => int_x_9_d1,
     q1        => int_x_9_q1);
-- int_x_10
int_x_10 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_10_address0,
     ce0       => int_x_10_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_10_q0,
     clk1      => ACLK,
     address1  => int_x_10_address1,
     ce1       => int_x_10_ce1,
     we1       => int_x_10_be1,
     d1        => int_x_10_d1,
     q1        => int_x_10_q1);
-- int_x_11
int_x_11 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_11_address0,
     ce0       => int_x_11_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_11_q0,
     clk1      => ACLK,
     address1  => int_x_11_address1,
     ce1       => int_x_11_ce1,
     we1       => int_x_11_be1,
     d1        => int_x_11_d1,
     q1        => int_x_11_q1);
-- int_x_12
int_x_12 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_12_address0,
     ce0       => int_x_12_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_12_q0,
     clk1      => ACLK,
     address1  => int_x_12_address1,
     ce1       => int_x_12_ce1,
     we1       => int_x_12_be1,
     d1        => int_x_12_d1,
     q1        => int_x_12_q1);
-- int_x_13
int_x_13 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_13_address0,
     ce0       => int_x_13_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_13_q0,
     clk1      => ACLK,
     address1  => int_x_13_address1,
     ce1       => int_x_13_ce1,
     we1       => int_x_13_be1,
     d1        => int_x_13_d1,
     q1        => int_x_13_q1);
-- int_x_14
int_x_14 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_14_address0,
     ce0       => int_x_14_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_14_q0,
     clk1      => ACLK,
     address1  => int_x_14_address1,
     ce1       => int_x_14_ce1,
     we1       => int_x_14_be1,
     d1        => int_x_14_d1,
     q1        => int_x_14_q1);
-- int_x_15
int_x_15 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_15_address0,
     ce0       => int_x_15_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_15_q0,
     clk1      => ACLK,
     address1  => int_x_15_address1,
     ce1       => int_x_15_ce1,
     we1       => int_x_15_be1,
     d1        => int_x_15_d1,
     q1        => int_x_15_q1);
-- int_x_16
int_x_16 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_16_address0,
     ce0       => int_x_16_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_16_q0,
     clk1      => ACLK,
     address1  => int_x_16_address1,
     ce1       => int_x_16_ce1,
     we1       => int_x_16_be1,
     d1        => int_x_16_d1,
     q1        => int_x_16_q1);
-- int_x_17
int_x_17 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_17_address0,
     ce0       => int_x_17_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_17_q0,
     clk1      => ACLK,
     address1  => int_x_17_address1,
     ce1       => int_x_17_ce1,
     we1       => int_x_17_be1,
     d1        => int_x_17_d1,
     q1        => int_x_17_q1);
-- int_x_18
int_x_18 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_18_address0,
     ce0       => int_x_18_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_18_q0,
     clk1      => ACLK,
     address1  => int_x_18_address1,
     ce1       => int_x_18_ce1,
     we1       => int_x_18_be1,
     d1        => int_x_18_d1,
     q1        => int_x_18_q1);
-- int_x_19
int_x_19 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_19_address0,
     ce0       => int_x_19_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_19_q0,
     clk1      => ACLK,
     address1  => int_x_19_address1,
     ce1       => int_x_19_ce1,
     we1       => int_x_19_be1,
     d1        => int_x_19_d1,
     q1        => int_x_19_q1);
-- int_x_20
int_x_20 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_20_address0,
     ce0       => int_x_20_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_20_q0,
     clk1      => ACLK,
     address1  => int_x_20_address1,
     ce1       => int_x_20_ce1,
     we1       => int_x_20_be1,
     d1        => int_x_20_d1,
     q1        => int_x_20_q1);
-- int_x_21
int_x_21 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_21_address0,
     ce0       => int_x_21_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_21_q0,
     clk1      => ACLK,
     address1  => int_x_21_address1,
     ce1       => int_x_21_ce1,
     we1       => int_x_21_be1,
     d1        => int_x_21_d1,
     q1        => int_x_21_q1);
-- int_x_22
int_x_22 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_22_address0,
     ce0       => int_x_22_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_22_q0,
     clk1      => ACLK,
     address1  => int_x_22_address1,
     ce1       => int_x_22_ce1,
     we1       => int_x_22_be1,
     d1        => int_x_22_d1,
     q1        => int_x_22_q1);
-- int_x_23
int_x_23 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_23_address0,
     ce0       => int_x_23_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_23_q0,
     clk1      => ACLK,
     address1  => int_x_23_address1,
     ce1       => int_x_23_ce1,
     we1       => int_x_23_be1,
     d1        => int_x_23_d1,
     q1        => int_x_23_q1);
-- int_x_24
int_x_24 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_24_address0,
     ce0       => int_x_24_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_24_q0,
     clk1      => ACLK,
     address1  => int_x_24_address1,
     ce1       => int_x_24_ce1,
     we1       => int_x_24_be1,
     d1        => int_x_24_d1,
     q1        => int_x_24_q1);
-- int_x_25
int_x_25 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_25_address0,
     ce0       => int_x_25_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_25_q0,
     clk1      => ACLK,
     address1  => int_x_25_address1,
     ce1       => int_x_25_ce1,
     we1       => int_x_25_be1,
     d1        => int_x_25_d1,
     q1        => int_x_25_q1);
-- int_x_26
int_x_26 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_26_address0,
     ce0       => int_x_26_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_26_q0,
     clk1      => ACLK,
     address1  => int_x_26_address1,
     ce1       => int_x_26_ce1,
     we1       => int_x_26_be1,
     d1        => int_x_26_d1,
     q1        => int_x_26_q1);
-- int_x_27
int_x_27 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_27_address0,
     ce0       => int_x_27_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_27_q0,
     clk1      => ACLK,
     address1  => int_x_27_address1,
     ce1       => int_x_27_ce1,
     we1       => int_x_27_be1,
     d1        => int_x_27_d1,
     q1        => int_x_27_q1);
-- int_x_28
int_x_28 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_28_address0,
     ce0       => int_x_28_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_28_q0,
     clk1      => ACLK,
     address1  => int_x_28_address1,
     ce1       => int_x_28_ce1,
     we1       => int_x_28_be1,
     d1        => int_x_28_d1,
     q1        => int_x_28_q1);
-- int_x_29
int_x_29 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_29_address0,
     ce0       => int_x_29_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_29_q0,
     clk1      => ACLK,
     address1  => int_x_29_address1,
     ce1       => int_x_29_ce1,
     we1       => int_x_29_be1,
     d1        => int_x_29_d1,
     q1        => int_x_29_q1);
-- int_x_30
int_x_30 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_30_address0,
     ce0       => int_x_30_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_30_q0,
     clk1      => ACLK,
     address1  => int_x_30_address1,
     ce1       => int_x_30_ce1,
     we1       => int_x_30_be1,
     d1        => int_x_30_d1,
     q1        => int_x_30_q1);
-- int_x_31
int_x_31 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_31_address0,
     ce0       => int_x_31_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_31_q0,
     clk1      => ACLK,
     address1  => int_x_31_address1,
     ce1       => int_x_31_ce1,
     we1       => int_x_31_be1,
     d1        => int_x_31_d1,
     q1        => int_x_31_q1);
-- int_x_32
int_x_32 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_32_address0,
     ce0       => int_x_32_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_32_q0,
     clk1      => ACLK,
     address1  => int_x_32_address1,
     ce1       => int_x_32_ce1,
     we1       => int_x_32_be1,
     d1        => int_x_32_d1,
     q1        => int_x_32_q1);
-- int_x_33
int_x_33 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_33_address0,
     ce0       => int_x_33_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_33_q0,
     clk1      => ACLK,
     address1  => int_x_33_address1,
     ce1       => int_x_33_ce1,
     we1       => int_x_33_be1,
     d1        => int_x_33_d1,
     q1        => int_x_33_q1);
-- int_x_34
int_x_34 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_34_address0,
     ce0       => int_x_34_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_34_q0,
     clk1      => ACLK,
     address1  => int_x_34_address1,
     ce1       => int_x_34_ce1,
     we1       => int_x_34_be1,
     d1        => int_x_34_d1,
     q1        => int_x_34_q1);
-- int_x_35
int_x_35 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_35_address0,
     ce0       => int_x_35_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_35_q0,
     clk1      => ACLK,
     address1  => int_x_35_address1,
     ce1       => int_x_35_ce1,
     we1       => int_x_35_be1,
     d1        => int_x_35_d1,
     q1        => int_x_35_q1);
-- int_x_36
int_x_36 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_36_address0,
     ce0       => int_x_36_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_36_q0,
     clk1      => ACLK,
     address1  => int_x_36_address1,
     ce1       => int_x_36_ce1,
     we1       => int_x_36_be1,
     d1        => int_x_36_d1,
     q1        => int_x_36_q1);
-- int_x_37
int_x_37 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_37_address0,
     ce0       => int_x_37_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_37_q0,
     clk1      => ACLK,
     address1  => int_x_37_address1,
     ce1       => int_x_37_ce1,
     we1       => int_x_37_be1,
     d1        => int_x_37_d1,
     q1        => int_x_37_q1);
-- int_x_38
int_x_38 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_38_address0,
     ce0       => int_x_38_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_38_q0,
     clk1      => ACLK,
     address1  => int_x_38_address1,
     ce1       => int_x_38_ce1,
     we1       => int_x_38_be1,
     d1        => int_x_38_d1,
     q1        => int_x_38_q1);
-- int_x_39
int_x_39 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_39_address0,
     ce0       => int_x_39_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_39_q0,
     clk1      => ACLK,
     address1  => int_x_39_address1,
     ce1       => int_x_39_ce1,
     we1       => int_x_39_be1,
     d1        => int_x_39_d1,
     q1        => int_x_39_q1);
-- int_x_40
int_x_40 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_40_address0,
     ce0       => int_x_40_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_40_q0,
     clk1      => ACLK,
     address1  => int_x_40_address1,
     ce1       => int_x_40_ce1,
     we1       => int_x_40_be1,
     d1        => int_x_40_d1,
     q1        => int_x_40_q1);
-- int_x_41
int_x_41 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_41_address0,
     ce0       => int_x_41_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_41_q0,
     clk1      => ACLK,
     address1  => int_x_41_address1,
     ce1       => int_x_41_ce1,
     we1       => int_x_41_be1,
     d1        => int_x_41_d1,
     q1        => int_x_41_q1);
-- int_x_42
int_x_42 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_42_address0,
     ce0       => int_x_42_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_42_q0,
     clk1      => ACLK,
     address1  => int_x_42_address1,
     ce1       => int_x_42_ce1,
     we1       => int_x_42_be1,
     d1        => int_x_42_d1,
     q1        => int_x_42_q1);
-- int_x_43
int_x_43 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_43_address0,
     ce0       => int_x_43_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_43_q0,
     clk1      => ACLK,
     address1  => int_x_43_address1,
     ce1       => int_x_43_ce1,
     we1       => int_x_43_be1,
     d1        => int_x_43_d1,
     q1        => int_x_43_q1);
-- int_x_44
int_x_44 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_44_address0,
     ce0       => int_x_44_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_44_q0,
     clk1      => ACLK,
     address1  => int_x_44_address1,
     ce1       => int_x_44_ce1,
     we1       => int_x_44_be1,
     d1        => int_x_44_d1,
     q1        => int_x_44_q1);
-- int_x_45
int_x_45 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_45_address0,
     ce0       => int_x_45_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_45_q0,
     clk1      => ACLK,
     address1  => int_x_45_address1,
     ce1       => int_x_45_ce1,
     we1       => int_x_45_be1,
     d1        => int_x_45_d1,
     q1        => int_x_45_q1);
-- int_x_46
int_x_46 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_46_address0,
     ce0       => int_x_46_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_46_q0,
     clk1      => ACLK,
     address1  => int_x_46_address1,
     ce1       => int_x_46_ce1,
     we1       => int_x_46_be1,
     d1        => int_x_46_d1,
     q1        => int_x_46_q1);
-- int_x_47
int_x_47 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_47_address0,
     ce0       => int_x_47_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_47_q0,
     clk1      => ACLK,
     address1  => int_x_47_address1,
     ce1       => int_x_47_ce1,
     we1       => int_x_47_be1,
     d1        => int_x_47_d1,
     q1        => int_x_47_q1);
-- int_x_48
int_x_48 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_48_address0,
     ce0       => int_x_48_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_48_q0,
     clk1      => ACLK,
     address1  => int_x_48_address1,
     ce1       => int_x_48_ce1,
     we1       => int_x_48_be1,
     d1        => int_x_48_d1,
     q1        => int_x_48_q1);
-- int_x_49
int_x_49 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_49_address0,
     ce0       => int_x_49_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_49_q0,
     clk1      => ACLK,
     address1  => int_x_49_address1,
     ce1       => int_x_49_ce1,
     we1       => int_x_49_be1,
     d1        => int_x_49_d1,
     q1        => int_x_49_q1);
-- int_x_50
int_x_50 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_50_address0,
     ce0       => int_x_50_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_50_q0,
     clk1      => ACLK,
     address1  => int_x_50_address1,
     ce1       => int_x_50_ce1,
     we1       => int_x_50_be1,
     d1        => int_x_50_d1,
     q1        => int_x_50_q1);
-- int_x_51
int_x_51 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_51_address0,
     ce0       => int_x_51_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_51_q0,
     clk1      => ACLK,
     address1  => int_x_51_address1,
     ce1       => int_x_51_ce1,
     we1       => int_x_51_be1,
     d1        => int_x_51_d1,
     q1        => int_x_51_q1);
-- int_x_52
int_x_52 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_52_address0,
     ce0       => int_x_52_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_52_q0,
     clk1      => ACLK,
     address1  => int_x_52_address1,
     ce1       => int_x_52_ce1,
     we1       => int_x_52_be1,
     d1        => int_x_52_d1,
     q1        => int_x_52_q1);
-- int_x_53
int_x_53 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_53_address0,
     ce0       => int_x_53_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_53_q0,
     clk1      => ACLK,
     address1  => int_x_53_address1,
     ce1       => int_x_53_ce1,
     we1       => int_x_53_be1,
     d1        => int_x_53_d1,
     q1        => int_x_53_q1);
-- int_x_54
int_x_54 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_54_address0,
     ce0       => int_x_54_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_54_q0,
     clk1      => ACLK,
     address1  => int_x_54_address1,
     ce1       => int_x_54_ce1,
     we1       => int_x_54_be1,
     d1        => int_x_54_d1,
     q1        => int_x_54_q1);
-- int_x_55
int_x_55 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_55_address0,
     ce0       => int_x_55_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_55_q0,
     clk1      => ACLK,
     address1  => int_x_55_address1,
     ce1       => int_x_55_ce1,
     we1       => int_x_55_be1,
     d1        => int_x_55_d1,
     q1        => int_x_55_q1);
-- int_x_56
int_x_56 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_56_address0,
     ce0       => int_x_56_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_56_q0,
     clk1      => ACLK,
     address1  => int_x_56_address1,
     ce1       => int_x_56_ce1,
     we1       => int_x_56_be1,
     d1        => int_x_56_d1,
     q1        => int_x_56_q1);
-- int_x_57
int_x_57 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_57_address0,
     ce0       => int_x_57_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_57_q0,
     clk1      => ACLK,
     address1  => int_x_57_address1,
     ce1       => int_x_57_ce1,
     we1       => int_x_57_be1,
     d1        => int_x_57_d1,
     q1        => int_x_57_q1);
-- int_x_58
int_x_58 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_58_address0,
     ce0       => int_x_58_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_58_q0,
     clk1      => ACLK,
     address1  => int_x_58_address1,
     ce1       => int_x_58_ce1,
     we1       => int_x_58_be1,
     d1        => int_x_58_d1,
     q1        => int_x_58_q1);
-- int_x_59
int_x_59 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_59_address0,
     ce0       => int_x_59_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_59_q0,
     clk1      => ACLK,
     address1  => int_x_59_address1,
     ce1       => int_x_59_ce1,
     we1       => int_x_59_be1,
     d1        => int_x_59_d1,
     q1        => int_x_59_q1);
-- int_x_60
int_x_60 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_60_address0,
     ce0       => int_x_60_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_60_q0,
     clk1      => ACLK,
     address1  => int_x_60_address1,
     ce1       => int_x_60_ce1,
     we1       => int_x_60_be1,
     d1        => int_x_60_d1,
     q1        => int_x_60_q1);
-- int_x_61
int_x_61 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_61_address0,
     ce0       => int_x_61_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_61_q0,
     clk1      => ACLK,
     address1  => int_x_61_address1,
     ce1       => int_x_61_ce1,
     we1       => int_x_61_be1,
     d1        => int_x_61_d1,
     q1        => int_x_61_q1);
-- int_x_62
int_x_62 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_62_address0,
     ce0       => int_x_62_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_62_q0,
     clk1      => ACLK,
     address1  => int_x_62_address1,
     ce1       => int_x_62_ce1,
     we1       => int_x_62_be1,
     d1        => int_x_62_d1,
     q1        => int_x_62_q1);
-- int_x_63
int_x_63 : eucHW_control_s_axi_ram
generic map (
     MEM_STYLE => "block",
     MEM_TYPE  => "2P",
     BYTES     => 4,
     DEPTH     => 2,
     AWIDTH    => log2(2))
port map (
     clk0      => ACLK,
     address0  => int_x_63_address0,
     ce0       => int_x_63_ce0,
     we0       => (others=>'0'),
     d0        => (others=>'0'),
     q0        => int_x_63_q0,
     clk1      => ACLK,
     address1  => int_x_63_address1,
     ce1       => int_x_63_ce1,
     we1       => int_x_63_be1,
     d1        => int_x_63_d1,
     q1        => int_x_63_q1);


-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata and ar_hs = '0' else '0';
    WREADY    <=  WREADY_t;
    BRESP     <=  "00";  -- OKAY
    BVALID    <=  '1' when wstate = wrresp else '0';
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, w_hs, BREADY)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (w_hs = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 0));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) and (int_x_0_read = '0') and (int_x_1_read = '0') and (int_x_2_read = '0') and (int_x_3_read = '0') and (int_x_4_read = '0') and (int_x_5_read = '0') and (int_x_6_read = '0') and (int_x_7_read = '0') and (int_x_8_read = '0') and (int_x_9_read = '0') and (int_x_10_read = '0') and (int_x_11_read = '0') and (int_x_12_read = '0') and (int_x_13_read = '0') and (int_x_14_read = '0') and (int_x_15_read = '0') and (int_x_16_read = '0') and (int_x_17_read = '0') and (int_x_18_read = '0') and (int_x_19_read = '0') and (int_x_20_read = '0') and (int_x_21_read = '0') and (int_x_22_read = '0') and (int_x_23_read = '0') and (int_x_24_read = '0') and (int_x_25_read = '0') and (int_x_26_read = '0') and (int_x_27_read = '0') and (int_x_28_read = '0') and (int_x_29_read = '0') and (int_x_30_read = '0') and (int_x_31_read = '0') and (int_x_32_read = '0') and (int_x_33_read = '0') and (int_x_34_read = '0') and (int_x_35_read = '0') and (int_x_36_read = '0') and (int_x_37_read = '0') and (int_x_38_read = '0') and (int_x_39_read = '0') and (int_x_40_read = '0') and (int_x_41_read = '0') and (int_x_42_read = '0') and (int_x_43_read = '0') and (int_x_44_read = '0') and (int_x_45_read = '0') and (int_x_46_read = '0') and (int_x_47_read = '0') and (int_x_48_read = '0') and (int_x_49_read = '0') and (int_x_50_read = '0') and (int_x_51_read = '0') and (int_x_52_read = '0') and (int_x_53_read = '0') and (int_x_54_read = '0') and (int_x_55_read = '0') and (int_x_56_read = '0') and (int_x_57_read = '0') and (int_x_58_read = '0') and (int_x_59_read = '0') and (int_x_60_read = '0') and (int_x_61_read = '0') and (int_x_62_read = '0') and (int_x_63_read = '0') else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    rdata_data <= (others => '0');
                    case (TO_INTEGER(raddr)) is
                    when ADDR_AP_CTRL =>
                        rdata_data(7) <= int_auto_restart;
                        rdata_data(3) <= int_ap_ready;
                        rdata_data(2) <= int_ap_idle;
                        rdata_data(1) <= int_task_ap_done;
                        rdata_data(0) <= int_ap_start;
                    when ADDR_GIE =>
                        rdata_data(0) <= int_gie;
                    when ADDR_IER =>
                        rdata_data(5 downto 0) <= int_ier;
                    when ADDR_ISR =>
                        rdata_data(5 downto 0) <= int_isr;
                    when ADDR_Y_SQRT_DATA_0 =>
                        rdata_data <= RESIZE(int_y_sqrt(31 downto 0), 32);
                    when ADDR_Y_SQRT_CTRL =>
                        rdata_data(0) <= int_y_sqrt_ap_vld;
                    when others =>
                        NULL;
                    end case;
                elsif (int_x_0_read = '1') then
                    rdata_data <= int_x_0_q1;
                elsif (int_x_1_read = '1') then
                    rdata_data <= int_x_1_q1;
                elsif (int_x_2_read = '1') then
                    rdata_data <= int_x_2_q1;
                elsif (int_x_3_read = '1') then
                    rdata_data <= int_x_3_q1;
                elsif (int_x_4_read = '1') then
                    rdata_data <= int_x_4_q1;
                elsif (int_x_5_read = '1') then
                    rdata_data <= int_x_5_q1;
                elsif (int_x_6_read = '1') then
                    rdata_data <= int_x_6_q1;
                elsif (int_x_7_read = '1') then
                    rdata_data <= int_x_7_q1;
                elsif (int_x_8_read = '1') then
                    rdata_data <= int_x_8_q1;
                elsif (int_x_9_read = '1') then
                    rdata_data <= int_x_9_q1;
                elsif (int_x_10_read = '1') then
                    rdata_data <= int_x_10_q1;
                elsif (int_x_11_read = '1') then
                    rdata_data <= int_x_11_q1;
                elsif (int_x_12_read = '1') then
                    rdata_data <= int_x_12_q1;
                elsif (int_x_13_read = '1') then
                    rdata_data <= int_x_13_q1;
                elsif (int_x_14_read = '1') then
                    rdata_data <= int_x_14_q1;
                elsif (int_x_15_read = '1') then
                    rdata_data <= int_x_15_q1;
                elsif (int_x_16_read = '1') then
                    rdata_data <= int_x_16_q1;
                elsif (int_x_17_read = '1') then
                    rdata_data <= int_x_17_q1;
                elsif (int_x_18_read = '1') then
                    rdata_data <= int_x_18_q1;
                elsif (int_x_19_read = '1') then
                    rdata_data <= int_x_19_q1;
                elsif (int_x_20_read = '1') then
                    rdata_data <= int_x_20_q1;
                elsif (int_x_21_read = '1') then
                    rdata_data <= int_x_21_q1;
                elsif (int_x_22_read = '1') then
                    rdata_data <= int_x_22_q1;
                elsif (int_x_23_read = '1') then
                    rdata_data <= int_x_23_q1;
                elsif (int_x_24_read = '1') then
                    rdata_data <= int_x_24_q1;
                elsif (int_x_25_read = '1') then
                    rdata_data <= int_x_25_q1;
                elsif (int_x_26_read = '1') then
                    rdata_data <= int_x_26_q1;
                elsif (int_x_27_read = '1') then
                    rdata_data <= int_x_27_q1;
                elsif (int_x_28_read = '1') then
                    rdata_data <= int_x_28_q1;
                elsif (int_x_29_read = '1') then
                    rdata_data <= int_x_29_q1;
                elsif (int_x_30_read = '1') then
                    rdata_data <= int_x_30_q1;
                elsif (int_x_31_read = '1') then
                    rdata_data <= int_x_31_q1;
                elsif (int_x_32_read = '1') then
                    rdata_data <= int_x_32_q1;
                elsif (int_x_33_read = '1') then
                    rdata_data <= int_x_33_q1;
                elsif (int_x_34_read = '1') then
                    rdata_data <= int_x_34_q1;
                elsif (int_x_35_read = '1') then
                    rdata_data <= int_x_35_q1;
                elsif (int_x_36_read = '1') then
                    rdata_data <= int_x_36_q1;
                elsif (int_x_37_read = '1') then
                    rdata_data <= int_x_37_q1;
                elsif (int_x_38_read = '1') then
                    rdata_data <= int_x_38_q1;
                elsif (int_x_39_read = '1') then
                    rdata_data <= int_x_39_q1;
                elsif (int_x_40_read = '1') then
                    rdata_data <= int_x_40_q1;
                elsif (int_x_41_read = '1') then
                    rdata_data <= int_x_41_q1;
                elsif (int_x_42_read = '1') then
                    rdata_data <= int_x_42_q1;
                elsif (int_x_43_read = '1') then
                    rdata_data <= int_x_43_q1;
                elsif (int_x_44_read = '1') then
                    rdata_data <= int_x_44_q1;
                elsif (int_x_45_read = '1') then
                    rdata_data <= int_x_45_q1;
                elsif (int_x_46_read = '1') then
                    rdata_data <= int_x_46_q1;
                elsif (int_x_47_read = '1') then
                    rdata_data <= int_x_47_q1;
                elsif (int_x_48_read = '1') then
                    rdata_data <= int_x_48_q1;
                elsif (int_x_49_read = '1') then
                    rdata_data <= int_x_49_q1;
                elsif (int_x_50_read = '1') then
                    rdata_data <= int_x_50_q1;
                elsif (int_x_51_read = '1') then
                    rdata_data <= int_x_51_q1;
                elsif (int_x_52_read = '1') then
                    rdata_data <= int_x_52_q1;
                elsif (int_x_53_read = '1') then
                    rdata_data <= int_x_53_q1;
                elsif (int_x_54_read = '1') then
                    rdata_data <= int_x_54_q1;
                elsif (int_x_55_read = '1') then
                    rdata_data <= int_x_55_q1;
                elsif (int_x_56_read = '1') then
                    rdata_data <= int_x_56_q1;
                elsif (int_x_57_read = '1') then
                    rdata_data <= int_x_57_q1;
                elsif (int_x_58_read = '1') then
                    rdata_data <= int_x_58_q1;
                elsif (int_x_59_read = '1') then
                    rdata_data <= int_x_59_q1;
                elsif (int_x_60_read = '1') then
                    rdata_data <= int_x_60_q1;
                elsif (int_x_61_read = '1') then
                    rdata_data <= int_x_61_q1;
                elsif (int_x_62_read = '1') then
                    rdata_data <= int_x_62_q1;
                elsif (int_x_63_read = '1') then
                    rdata_data <= int_x_63_q1;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    interrupt            <= int_gie and (int_isr(0) or int_isr(1) or int_isr(5));
    ap_start             <= int_ap_start;
    task_ap_done         <= (ap_done and not auto_restart_status) or auto_restart_done;
    task_ap_ready        <= ap_ready and not int_auto_restart;
    auto_restart_done    <= auto_restart_status and (ap_idle and not int_ap_idle);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_start <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1' and WDATA(0) = '1') then
                    int_ap_start <= '1';
                elsif (ap_ready = '1') then
                    int_ap_start <= int_auto_restart; -- clear on handshake/auto restart
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_done <= ap_done;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_task_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (task_ap_done = '1') then
                    int_task_ap_done <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AP_CTRL) then
                    int_task_ap_done <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_idle <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_idle <= ap_idle;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_ready <= '0';
            elsif (ACLK_EN = '1') then
                if (task_ap_ready = '1') then
                    int_ap_ready <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AP_CTRL) then
                    int_ap_ready <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_auto_restart <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1') then
                    int_auto_restart <= WDATA(7);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                auto_restart_status <= '0';
            elsif (ACLK_EN = '1') then
                if (int_auto_restart = '1') then
                    auto_restart_status <= '1';
                elsif (ap_idle = '1') then
                    auto_restart_status <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_gie <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_GIE and WSTRB(0) = '1') then
                    int_gie <= WDATA(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ier <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_IER and WSTRB(0) = '1') then
                    int_ier <= UNSIGNED(WDATA(5 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(0) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(0) = '1' and ap_done = '1') then
                    int_isr(0) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(0) <= int_isr(0) xor WDATA(0); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(1) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(1) = '1' and ap_ready = '1') then
                    int_isr(1) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(1) <= int_isr(1) xor WDATA(1); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(5) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(5) = '1' and ap_local_deadlock(0) = '1') then
                    int_isr(5) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(5) <= int_isr(5) xor WDATA(5); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_y_sqrt <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (y_sqrt_ap_vld = '1') then
                    int_y_sqrt <= UNSIGNED(y_sqrt);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_y_sqrt_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (y_sqrt_ap_vld = '1') then
                    int_y_sqrt_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_Y_SQRT_CTRL) then
                    int_y_sqrt_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------
    -- x_0
    int_x_0_address0     <= SHIFT_RIGHT(UNSIGNED(x_0_address0), 2)(0 downto 0);
    int_x_0_ce0          <= x_0_ce0;
    x_0_q0               <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_0_q0, TO_INTEGER(int_x_0_shift0) * 8)(7 downto 0));
    int_x_0_address1     <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_0_ce1          <= '1' when ar_hs = '1' or (int_x_0_write = '1' and WVALID  = '1') else '0';
    int_x_0_we1          <= '1' when int_x_0_write = '1' and w_hs = '1' else '0';
    int_x_0_be1          <= UNSIGNED(WSTRB) when int_x_0_we1 = '1' else (others=>'0');
    int_x_0_d1           <= UNSIGNED(WDATA);
    -- x_1
    int_x_1_address0     <= SHIFT_RIGHT(UNSIGNED(x_1_address0), 2)(0 downto 0);
    int_x_1_ce0          <= x_1_ce0;
    x_1_q0               <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_1_q0, TO_INTEGER(int_x_1_shift0) * 8)(7 downto 0));
    int_x_1_address1     <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_1_ce1          <= '1' when ar_hs = '1' or (int_x_1_write = '1' and WVALID  = '1') else '0';
    int_x_1_we1          <= '1' when int_x_1_write = '1' and w_hs = '1' else '0';
    int_x_1_be1          <= UNSIGNED(WSTRB) when int_x_1_we1 = '1' else (others=>'0');
    int_x_1_d1           <= UNSIGNED(WDATA);
    -- x_2
    int_x_2_address0     <= SHIFT_RIGHT(UNSIGNED(x_2_address0), 2)(0 downto 0);
    int_x_2_ce0          <= x_2_ce0;
    x_2_q0               <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_2_q0, TO_INTEGER(int_x_2_shift0) * 8)(7 downto 0));
    int_x_2_address1     <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_2_ce1          <= '1' when ar_hs = '1' or (int_x_2_write = '1' and WVALID  = '1') else '0';
    int_x_2_we1          <= '1' when int_x_2_write = '1' and w_hs = '1' else '0';
    int_x_2_be1          <= UNSIGNED(WSTRB) when int_x_2_we1 = '1' else (others=>'0');
    int_x_2_d1           <= UNSIGNED(WDATA);
    -- x_3
    int_x_3_address0     <= SHIFT_RIGHT(UNSIGNED(x_3_address0), 2)(0 downto 0);
    int_x_3_ce0          <= x_3_ce0;
    x_3_q0               <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_3_q0, TO_INTEGER(int_x_3_shift0) * 8)(7 downto 0));
    int_x_3_address1     <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_3_ce1          <= '1' when ar_hs = '1' or (int_x_3_write = '1' and WVALID  = '1') else '0';
    int_x_3_we1          <= '1' when int_x_3_write = '1' and w_hs = '1' else '0';
    int_x_3_be1          <= UNSIGNED(WSTRB) when int_x_3_we1 = '1' else (others=>'0');
    int_x_3_d1           <= UNSIGNED(WDATA);
    -- x_4
    int_x_4_address0     <= SHIFT_RIGHT(UNSIGNED(x_4_address0), 2)(0 downto 0);
    int_x_4_ce0          <= x_4_ce0;
    x_4_q0               <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_4_q0, TO_INTEGER(int_x_4_shift0) * 8)(7 downto 0));
    int_x_4_address1     <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_4_ce1          <= '1' when ar_hs = '1' or (int_x_4_write = '1' and WVALID  = '1') else '0';
    int_x_4_we1          <= '1' when int_x_4_write = '1' and w_hs = '1' else '0';
    int_x_4_be1          <= UNSIGNED(WSTRB) when int_x_4_we1 = '1' else (others=>'0');
    int_x_4_d1           <= UNSIGNED(WDATA);
    -- x_5
    int_x_5_address0     <= SHIFT_RIGHT(UNSIGNED(x_5_address0), 2)(0 downto 0);
    int_x_5_ce0          <= x_5_ce0;
    x_5_q0               <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_5_q0, TO_INTEGER(int_x_5_shift0) * 8)(7 downto 0));
    int_x_5_address1     <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_5_ce1          <= '1' when ar_hs = '1' or (int_x_5_write = '1' and WVALID  = '1') else '0';
    int_x_5_we1          <= '1' when int_x_5_write = '1' and w_hs = '1' else '0';
    int_x_5_be1          <= UNSIGNED(WSTRB) when int_x_5_we1 = '1' else (others=>'0');
    int_x_5_d1           <= UNSIGNED(WDATA);
    -- x_6
    int_x_6_address0     <= SHIFT_RIGHT(UNSIGNED(x_6_address0), 2)(0 downto 0);
    int_x_6_ce0          <= x_6_ce0;
    x_6_q0               <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_6_q0, TO_INTEGER(int_x_6_shift0) * 8)(7 downto 0));
    int_x_6_address1     <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_6_ce1          <= '1' when ar_hs = '1' or (int_x_6_write = '1' and WVALID  = '1') else '0';
    int_x_6_we1          <= '1' when int_x_6_write = '1' and w_hs = '1' else '0';
    int_x_6_be1          <= UNSIGNED(WSTRB) when int_x_6_we1 = '1' else (others=>'0');
    int_x_6_d1           <= UNSIGNED(WDATA);
    -- x_7
    int_x_7_address0     <= SHIFT_RIGHT(UNSIGNED(x_7_address0), 2)(0 downto 0);
    int_x_7_ce0          <= x_7_ce0;
    x_7_q0               <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_7_q0, TO_INTEGER(int_x_7_shift0) * 8)(7 downto 0));
    int_x_7_address1     <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_7_ce1          <= '1' when ar_hs = '1' or (int_x_7_write = '1' and WVALID  = '1') else '0';
    int_x_7_we1          <= '1' when int_x_7_write = '1' and w_hs = '1' else '0';
    int_x_7_be1          <= UNSIGNED(WSTRB) when int_x_7_we1 = '1' else (others=>'0');
    int_x_7_d1           <= UNSIGNED(WDATA);
    -- x_8
    int_x_8_address0     <= SHIFT_RIGHT(UNSIGNED(x_8_address0), 2)(0 downto 0);
    int_x_8_ce0          <= x_8_ce0;
    x_8_q0               <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_8_q0, TO_INTEGER(int_x_8_shift0) * 8)(7 downto 0));
    int_x_8_address1     <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_8_ce1          <= '1' when ar_hs = '1' or (int_x_8_write = '1' and WVALID  = '1') else '0';
    int_x_8_we1          <= '1' when int_x_8_write = '1' and w_hs = '1' else '0';
    int_x_8_be1          <= UNSIGNED(WSTRB) when int_x_8_we1 = '1' else (others=>'0');
    int_x_8_d1           <= UNSIGNED(WDATA);
    -- x_9
    int_x_9_address0     <= SHIFT_RIGHT(UNSIGNED(x_9_address0), 2)(0 downto 0);
    int_x_9_ce0          <= x_9_ce0;
    x_9_q0               <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_9_q0, TO_INTEGER(int_x_9_shift0) * 8)(7 downto 0));
    int_x_9_address1     <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_9_ce1          <= '1' when ar_hs = '1' or (int_x_9_write = '1' and WVALID  = '1') else '0';
    int_x_9_we1          <= '1' when int_x_9_write = '1' and w_hs = '1' else '0';
    int_x_9_be1          <= UNSIGNED(WSTRB) when int_x_9_we1 = '1' else (others=>'0');
    int_x_9_d1           <= UNSIGNED(WDATA);
    -- x_10
    int_x_10_address0    <= SHIFT_RIGHT(UNSIGNED(x_10_address0), 2)(0 downto 0);
    int_x_10_ce0         <= x_10_ce0;
    x_10_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_10_q0, TO_INTEGER(int_x_10_shift0) * 8)(7 downto 0));
    int_x_10_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_10_ce1         <= '1' when ar_hs = '1' or (int_x_10_write = '1' and WVALID  = '1') else '0';
    int_x_10_we1         <= '1' when int_x_10_write = '1' and w_hs = '1' else '0';
    int_x_10_be1         <= UNSIGNED(WSTRB) when int_x_10_we1 = '1' else (others=>'0');
    int_x_10_d1          <= UNSIGNED(WDATA);
    -- x_11
    int_x_11_address0    <= SHIFT_RIGHT(UNSIGNED(x_11_address0), 2)(0 downto 0);
    int_x_11_ce0         <= x_11_ce0;
    x_11_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_11_q0, TO_INTEGER(int_x_11_shift0) * 8)(7 downto 0));
    int_x_11_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_11_ce1         <= '1' when ar_hs = '1' or (int_x_11_write = '1' and WVALID  = '1') else '0';
    int_x_11_we1         <= '1' when int_x_11_write = '1' and w_hs = '1' else '0';
    int_x_11_be1         <= UNSIGNED(WSTRB) when int_x_11_we1 = '1' else (others=>'0');
    int_x_11_d1          <= UNSIGNED(WDATA);
    -- x_12
    int_x_12_address0    <= SHIFT_RIGHT(UNSIGNED(x_12_address0), 2)(0 downto 0);
    int_x_12_ce0         <= x_12_ce0;
    x_12_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_12_q0, TO_INTEGER(int_x_12_shift0) * 8)(7 downto 0));
    int_x_12_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_12_ce1         <= '1' when ar_hs = '1' or (int_x_12_write = '1' and WVALID  = '1') else '0';
    int_x_12_we1         <= '1' when int_x_12_write = '1' and w_hs = '1' else '0';
    int_x_12_be1         <= UNSIGNED(WSTRB) when int_x_12_we1 = '1' else (others=>'0');
    int_x_12_d1          <= UNSIGNED(WDATA);
    -- x_13
    int_x_13_address0    <= SHIFT_RIGHT(UNSIGNED(x_13_address0), 2)(0 downto 0);
    int_x_13_ce0         <= x_13_ce0;
    x_13_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_13_q0, TO_INTEGER(int_x_13_shift0) * 8)(7 downto 0));
    int_x_13_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_13_ce1         <= '1' when ar_hs = '1' or (int_x_13_write = '1' and WVALID  = '1') else '0';
    int_x_13_we1         <= '1' when int_x_13_write = '1' and w_hs = '1' else '0';
    int_x_13_be1         <= UNSIGNED(WSTRB) when int_x_13_we1 = '1' else (others=>'0');
    int_x_13_d1          <= UNSIGNED(WDATA);
    -- x_14
    int_x_14_address0    <= SHIFT_RIGHT(UNSIGNED(x_14_address0), 2)(0 downto 0);
    int_x_14_ce0         <= x_14_ce0;
    x_14_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_14_q0, TO_INTEGER(int_x_14_shift0) * 8)(7 downto 0));
    int_x_14_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_14_ce1         <= '1' when ar_hs = '1' or (int_x_14_write = '1' and WVALID  = '1') else '0';
    int_x_14_we1         <= '1' when int_x_14_write = '1' and w_hs = '1' else '0';
    int_x_14_be1         <= UNSIGNED(WSTRB) when int_x_14_we1 = '1' else (others=>'0');
    int_x_14_d1          <= UNSIGNED(WDATA);
    -- x_15
    int_x_15_address0    <= SHIFT_RIGHT(UNSIGNED(x_15_address0), 2)(0 downto 0);
    int_x_15_ce0         <= x_15_ce0;
    x_15_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_15_q0, TO_INTEGER(int_x_15_shift0) * 8)(7 downto 0));
    int_x_15_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_15_ce1         <= '1' when ar_hs = '1' or (int_x_15_write = '1' and WVALID  = '1') else '0';
    int_x_15_we1         <= '1' when int_x_15_write = '1' and w_hs = '1' else '0';
    int_x_15_be1         <= UNSIGNED(WSTRB) when int_x_15_we1 = '1' else (others=>'0');
    int_x_15_d1          <= UNSIGNED(WDATA);
    -- x_16
    int_x_16_address0    <= SHIFT_RIGHT(UNSIGNED(x_16_address0), 2)(0 downto 0);
    int_x_16_ce0         <= x_16_ce0;
    x_16_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_16_q0, TO_INTEGER(int_x_16_shift0) * 8)(7 downto 0));
    int_x_16_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_16_ce1         <= '1' when ar_hs = '1' or (int_x_16_write = '1' and WVALID  = '1') else '0';
    int_x_16_we1         <= '1' when int_x_16_write = '1' and w_hs = '1' else '0';
    int_x_16_be1         <= UNSIGNED(WSTRB) when int_x_16_we1 = '1' else (others=>'0');
    int_x_16_d1          <= UNSIGNED(WDATA);
    -- x_17
    int_x_17_address0    <= SHIFT_RIGHT(UNSIGNED(x_17_address0), 2)(0 downto 0);
    int_x_17_ce0         <= x_17_ce0;
    x_17_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_17_q0, TO_INTEGER(int_x_17_shift0) * 8)(7 downto 0));
    int_x_17_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_17_ce1         <= '1' when ar_hs = '1' or (int_x_17_write = '1' and WVALID  = '1') else '0';
    int_x_17_we1         <= '1' when int_x_17_write = '1' and w_hs = '1' else '0';
    int_x_17_be1         <= UNSIGNED(WSTRB) when int_x_17_we1 = '1' else (others=>'0');
    int_x_17_d1          <= UNSIGNED(WDATA);
    -- x_18
    int_x_18_address0    <= SHIFT_RIGHT(UNSIGNED(x_18_address0), 2)(0 downto 0);
    int_x_18_ce0         <= x_18_ce0;
    x_18_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_18_q0, TO_INTEGER(int_x_18_shift0) * 8)(7 downto 0));
    int_x_18_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_18_ce1         <= '1' when ar_hs = '1' or (int_x_18_write = '1' and WVALID  = '1') else '0';
    int_x_18_we1         <= '1' when int_x_18_write = '1' and w_hs = '1' else '0';
    int_x_18_be1         <= UNSIGNED(WSTRB) when int_x_18_we1 = '1' else (others=>'0');
    int_x_18_d1          <= UNSIGNED(WDATA);
    -- x_19
    int_x_19_address0    <= SHIFT_RIGHT(UNSIGNED(x_19_address0), 2)(0 downto 0);
    int_x_19_ce0         <= x_19_ce0;
    x_19_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_19_q0, TO_INTEGER(int_x_19_shift0) * 8)(7 downto 0));
    int_x_19_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_19_ce1         <= '1' when ar_hs = '1' or (int_x_19_write = '1' and WVALID  = '1') else '0';
    int_x_19_we1         <= '1' when int_x_19_write = '1' and w_hs = '1' else '0';
    int_x_19_be1         <= UNSIGNED(WSTRB) when int_x_19_we1 = '1' else (others=>'0');
    int_x_19_d1          <= UNSIGNED(WDATA);
    -- x_20
    int_x_20_address0    <= SHIFT_RIGHT(UNSIGNED(x_20_address0), 2)(0 downto 0);
    int_x_20_ce0         <= x_20_ce0;
    x_20_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_20_q0, TO_INTEGER(int_x_20_shift0) * 8)(7 downto 0));
    int_x_20_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_20_ce1         <= '1' when ar_hs = '1' or (int_x_20_write = '1' and WVALID  = '1') else '0';
    int_x_20_we1         <= '1' when int_x_20_write = '1' and w_hs = '1' else '0';
    int_x_20_be1         <= UNSIGNED(WSTRB) when int_x_20_we1 = '1' else (others=>'0');
    int_x_20_d1          <= UNSIGNED(WDATA);
    -- x_21
    int_x_21_address0    <= SHIFT_RIGHT(UNSIGNED(x_21_address0), 2)(0 downto 0);
    int_x_21_ce0         <= x_21_ce0;
    x_21_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_21_q0, TO_INTEGER(int_x_21_shift0) * 8)(7 downto 0));
    int_x_21_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_21_ce1         <= '1' when ar_hs = '1' or (int_x_21_write = '1' and WVALID  = '1') else '0';
    int_x_21_we1         <= '1' when int_x_21_write = '1' and w_hs = '1' else '0';
    int_x_21_be1         <= UNSIGNED(WSTRB) when int_x_21_we1 = '1' else (others=>'0');
    int_x_21_d1          <= UNSIGNED(WDATA);
    -- x_22
    int_x_22_address0    <= SHIFT_RIGHT(UNSIGNED(x_22_address0), 2)(0 downto 0);
    int_x_22_ce0         <= x_22_ce0;
    x_22_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_22_q0, TO_INTEGER(int_x_22_shift0) * 8)(7 downto 0));
    int_x_22_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_22_ce1         <= '1' when ar_hs = '1' or (int_x_22_write = '1' and WVALID  = '1') else '0';
    int_x_22_we1         <= '1' when int_x_22_write = '1' and w_hs = '1' else '0';
    int_x_22_be1         <= UNSIGNED(WSTRB) when int_x_22_we1 = '1' else (others=>'0');
    int_x_22_d1          <= UNSIGNED(WDATA);
    -- x_23
    int_x_23_address0    <= SHIFT_RIGHT(UNSIGNED(x_23_address0), 2)(0 downto 0);
    int_x_23_ce0         <= x_23_ce0;
    x_23_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_23_q0, TO_INTEGER(int_x_23_shift0) * 8)(7 downto 0));
    int_x_23_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_23_ce1         <= '1' when ar_hs = '1' or (int_x_23_write = '1' and WVALID  = '1') else '0';
    int_x_23_we1         <= '1' when int_x_23_write = '1' and w_hs = '1' else '0';
    int_x_23_be1         <= UNSIGNED(WSTRB) when int_x_23_we1 = '1' else (others=>'0');
    int_x_23_d1          <= UNSIGNED(WDATA);
    -- x_24
    int_x_24_address0    <= SHIFT_RIGHT(UNSIGNED(x_24_address0), 2)(0 downto 0);
    int_x_24_ce0         <= x_24_ce0;
    x_24_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_24_q0, TO_INTEGER(int_x_24_shift0) * 8)(7 downto 0));
    int_x_24_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_24_ce1         <= '1' when ar_hs = '1' or (int_x_24_write = '1' and WVALID  = '1') else '0';
    int_x_24_we1         <= '1' when int_x_24_write = '1' and w_hs = '1' else '0';
    int_x_24_be1         <= UNSIGNED(WSTRB) when int_x_24_we1 = '1' else (others=>'0');
    int_x_24_d1          <= UNSIGNED(WDATA);
    -- x_25
    int_x_25_address0    <= SHIFT_RIGHT(UNSIGNED(x_25_address0), 2)(0 downto 0);
    int_x_25_ce0         <= x_25_ce0;
    x_25_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_25_q0, TO_INTEGER(int_x_25_shift0) * 8)(7 downto 0));
    int_x_25_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_25_ce1         <= '1' when ar_hs = '1' or (int_x_25_write = '1' and WVALID  = '1') else '0';
    int_x_25_we1         <= '1' when int_x_25_write = '1' and w_hs = '1' else '0';
    int_x_25_be1         <= UNSIGNED(WSTRB) when int_x_25_we1 = '1' else (others=>'0');
    int_x_25_d1          <= UNSIGNED(WDATA);
    -- x_26
    int_x_26_address0    <= SHIFT_RIGHT(UNSIGNED(x_26_address0), 2)(0 downto 0);
    int_x_26_ce0         <= x_26_ce0;
    x_26_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_26_q0, TO_INTEGER(int_x_26_shift0) * 8)(7 downto 0));
    int_x_26_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_26_ce1         <= '1' when ar_hs = '1' or (int_x_26_write = '1' and WVALID  = '1') else '0';
    int_x_26_we1         <= '1' when int_x_26_write = '1' and w_hs = '1' else '0';
    int_x_26_be1         <= UNSIGNED(WSTRB) when int_x_26_we1 = '1' else (others=>'0');
    int_x_26_d1          <= UNSIGNED(WDATA);
    -- x_27
    int_x_27_address0    <= SHIFT_RIGHT(UNSIGNED(x_27_address0), 2)(0 downto 0);
    int_x_27_ce0         <= x_27_ce0;
    x_27_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_27_q0, TO_INTEGER(int_x_27_shift0) * 8)(7 downto 0));
    int_x_27_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_27_ce1         <= '1' when ar_hs = '1' or (int_x_27_write = '1' and WVALID  = '1') else '0';
    int_x_27_we1         <= '1' when int_x_27_write = '1' and w_hs = '1' else '0';
    int_x_27_be1         <= UNSIGNED(WSTRB) when int_x_27_we1 = '1' else (others=>'0');
    int_x_27_d1          <= UNSIGNED(WDATA);
    -- x_28
    int_x_28_address0    <= SHIFT_RIGHT(UNSIGNED(x_28_address0), 2)(0 downto 0);
    int_x_28_ce0         <= x_28_ce0;
    x_28_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_28_q0, TO_INTEGER(int_x_28_shift0) * 8)(7 downto 0));
    int_x_28_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_28_ce1         <= '1' when ar_hs = '1' or (int_x_28_write = '1' and WVALID  = '1') else '0';
    int_x_28_we1         <= '1' when int_x_28_write = '1' and w_hs = '1' else '0';
    int_x_28_be1         <= UNSIGNED(WSTRB) when int_x_28_we1 = '1' else (others=>'0');
    int_x_28_d1          <= UNSIGNED(WDATA);
    -- x_29
    int_x_29_address0    <= SHIFT_RIGHT(UNSIGNED(x_29_address0), 2)(0 downto 0);
    int_x_29_ce0         <= x_29_ce0;
    x_29_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_29_q0, TO_INTEGER(int_x_29_shift0) * 8)(7 downto 0));
    int_x_29_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_29_ce1         <= '1' when ar_hs = '1' or (int_x_29_write = '1' and WVALID  = '1') else '0';
    int_x_29_we1         <= '1' when int_x_29_write = '1' and w_hs = '1' else '0';
    int_x_29_be1         <= UNSIGNED(WSTRB) when int_x_29_we1 = '1' else (others=>'0');
    int_x_29_d1          <= UNSIGNED(WDATA);
    -- x_30
    int_x_30_address0    <= SHIFT_RIGHT(UNSIGNED(x_30_address0), 2)(0 downto 0);
    int_x_30_ce0         <= x_30_ce0;
    x_30_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_30_q0, TO_INTEGER(int_x_30_shift0) * 8)(7 downto 0));
    int_x_30_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_30_ce1         <= '1' when ar_hs = '1' or (int_x_30_write = '1' and WVALID  = '1') else '0';
    int_x_30_we1         <= '1' when int_x_30_write = '1' and w_hs = '1' else '0';
    int_x_30_be1         <= UNSIGNED(WSTRB) when int_x_30_we1 = '1' else (others=>'0');
    int_x_30_d1          <= UNSIGNED(WDATA);
    -- x_31
    int_x_31_address0    <= SHIFT_RIGHT(UNSIGNED(x_31_address0), 2)(0 downto 0);
    int_x_31_ce0         <= x_31_ce0;
    x_31_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_31_q0, TO_INTEGER(int_x_31_shift0) * 8)(7 downto 0));
    int_x_31_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_31_ce1         <= '1' when ar_hs = '1' or (int_x_31_write = '1' and WVALID  = '1') else '0';
    int_x_31_we1         <= '1' when int_x_31_write = '1' and w_hs = '1' else '0';
    int_x_31_be1         <= UNSIGNED(WSTRB) when int_x_31_we1 = '1' else (others=>'0');
    int_x_31_d1          <= UNSIGNED(WDATA);
    -- x_32
    int_x_32_address0    <= SHIFT_RIGHT(UNSIGNED(x_32_address0), 2)(0 downto 0);
    int_x_32_ce0         <= x_32_ce0;
    x_32_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_32_q0, TO_INTEGER(int_x_32_shift0) * 8)(7 downto 0));
    int_x_32_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_32_ce1         <= '1' when ar_hs = '1' or (int_x_32_write = '1' and WVALID  = '1') else '0';
    int_x_32_we1         <= '1' when int_x_32_write = '1' and w_hs = '1' else '0';
    int_x_32_be1         <= UNSIGNED(WSTRB) when int_x_32_we1 = '1' else (others=>'0');
    int_x_32_d1          <= UNSIGNED(WDATA);
    -- x_33
    int_x_33_address0    <= SHIFT_RIGHT(UNSIGNED(x_33_address0), 2)(0 downto 0);
    int_x_33_ce0         <= x_33_ce0;
    x_33_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_33_q0, TO_INTEGER(int_x_33_shift0) * 8)(7 downto 0));
    int_x_33_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_33_ce1         <= '1' when ar_hs = '1' or (int_x_33_write = '1' and WVALID  = '1') else '0';
    int_x_33_we1         <= '1' when int_x_33_write = '1' and w_hs = '1' else '0';
    int_x_33_be1         <= UNSIGNED(WSTRB) when int_x_33_we1 = '1' else (others=>'0');
    int_x_33_d1          <= UNSIGNED(WDATA);
    -- x_34
    int_x_34_address0    <= SHIFT_RIGHT(UNSIGNED(x_34_address0), 2)(0 downto 0);
    int_x_34_ce0         <= x_34_ce0;
    x_34_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_34_q0, TO_INTEGER(int_x_34_shift0) * 8)(7 downto 0));
    int_x_34_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_34_ce1         <= '1' when ar_hs = '1' or (int_x_34_write = '1' and WVALID  = '1') else '0';
    int_x_34_we1         <= '1' when int_x_34_write = '1' and w_hs = '1' else '0';
    int_x_34_be1         <= UNSIGNED(WSTRB) when int_x_34_we1 = '1' else (others=>'0');
    int_x_34_d1          <= UNSIGNED(WDATA);
    -- x_35
    int_x_35_address0    <= SHIFT_RIGHT(UNSIGNED(x_35_address0), 2)(0 downto 0);
    int_x_35_ce0         <= x_35_ce0;
    x_35_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_35_q0, TO_INTEGER(int_x_35_shift0) * 8)(7 downto 0));
    int_x_35_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_35_ce1         <= '1' when ar_hs = '1' or (int_x_35_write = '1' and WVALID  = '1') else '0';
    int_x_35_we1         <= '1' when int_x_35_write = '1' and w_hs = '1' else '0';
    int_x_35_be1         <= UNSIGNED(WSTRB) when int_x_35_we1 = '1' else (others=>'0');
    int_x_35_d1          <= UNSIGNED(WDATA);
    -- x_36
    int_x_36_address0    <= SHIFT_RIGHT(UNSIGNED(x_36_address0), 2)(0 downto 0);
    int_x_36_ce0         <= x_36_ce0;
    x_36_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_36_q0, TO_INTEGER(int_x_36_shift0) * 8)(7 downto 0));
    int_x_36_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_36_ce1         <= '1' when ar_hs = '1' or (int_x_36_write = '1' and WVALID  = '1') else '0';
    int_x_36_we1         <= '1' when int_x_36_write = '1' and w_hs = '1' else '0';
    int_x_36_be1         <= UNSIGNED(WSTRB) when int_x_36_we1 = '1' else (others=>'0');
    int_x_36_d1          <= UNSIGNED(WDATA);
    -- x_37
    int_x_37_address0    <= SHIFT_RIGHT(UNSIGNED(x_37_address0), 2)(0 downto 0);
    int_x_37_ce0         <= x_37_ce0;
    x_37_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_37_q0, TO_INTEGER(int_x_37_shift0) * 8)(7 downto 0));
    int_x_37_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_37_ce1         <= '1' when ar_hs = '1' or (int_x_37_write = '1' and WVALID  = '1') else '0';
    int_x_37_we1         <= '1' when int_x_37_write = '1' and w_hs = '1' else '0';
    int_x_37_be1         <= UNSIGNED(WSTRB) when int_x_37_we1 = '1' else (others=>'0');
    int_x_37_d1          <= UNSIGNED(WDATA);
    -- x_38
    int_x_38_address0    <= SHIFT_RIGHT(UNSIGNED(x_38_address0), 2)(0 downto 0);
    int_x_38_ce0         <= x_38_ce0;
    x_38_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_38_q0, TO_INTEGER(int_x_38_shift0) * 8)(7 downto 0));
    int_x_38_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_38_ce1         <= '1' when ar_hs = '1' or (int_x_38_write = '1' and WVALID  = '1') else '0';
    int_x_38_we1         <= '1' when int_x_38_write = '1' and w_hs = '1' else '0';
    int_x_38_be1         <= UNSIGNED(WSTRB) when int_x_38_we1 = '1' else (others=>'0');
    int_x_38_d1          <= UNSIGNED(WDATA);
    -- x_39
    int_x_39_address0    <= SHIFT_RIGHT(UNSIGNED(x_39_address0), 2)(0 downto 0);
    int_x_39_ce0         <= x_39_ce0;
    x_39_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_39_q0, TO_INTEGER(int_x_39_shift0) * 8)(7 downto 0));
    int_x_39_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_39_ce1         <= '1' when ar_hs = '1' or (int_x_39_write = '1' and WVALID  = '1') else '0';
    int_x_39_we1         <= '1' when int_x_39_write = '1' and w_hs = '1' else '0';
    int_x_39_be1         <= UNSIGNED(WSTRB) when int_x_39_we1 = '1' else (others=>'0');
    int_x_39_d1          <= UNSIGNED(WDATA);
    -- x_40
    int_x_40_address0    <= SHIFT_RIGHT(UNSIGNED(x_40_address0), 2)(0 downto 0);
    int_x_40_ce0         <= x_40_ce0;
    x_40_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_40_q0, TO_INTEGER(int_x_40_shift0) * 8)(7 downto 0));
    int_x_40_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_40_ce1         <= '1' when ar_hs = '1' or (int_x_40_write = '1' and WVALID  = '1') else '0';
    int_x_40_we1         <= '1' when int_x_40_write = '1' and w_hs = '1' else '0';
    int_x_40_be1         <= UNSIGNED(WSTRB) when int_x_40_we1 = '1' else (others=>'0');
    int_x_40_d1          <= UNSIGNED(WDATA);
    -- x_41
    int_x_41_address0    <= SHIFT_RIGHT(UNSIGNED(x_41_address0), 2)(0 downto 0);
    int_x_41_ce0         <= x_41_ce0;
    x_41_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_41_q0, TO_INTEGER(int_x_41_shift0) * 8)(7 downto 0));
    int_x_41_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_41_ce1         <= '1' when ar_hs = '1' or (int_x_41_write = '1' and WVALID  = '1') else '0';
    int_x_41_we1         <= '1' when int_x_41_write = '1' and w_hs = '1' else '0';
    int_x_41_be1         <= UNSIGNED(WSTRB) when int_x_41_we1 = '1' else (others=>'0');
    int_x_41_d1          <= UNSIGNED(WDATA);
    -- x_42
    int_x_42_address0    <= SHIFT_RIGHT(UNSIGNED(x_42_address0), 2)(0 downto 0);
    int_x_42_ce0         <= x_42_ce0;
    x_42_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_42_q0, TO_INTEGER(int_x_42_shift0) * 8)(7 downto 0));
    int_x_42_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_42_ce1         <= '1' when ar_hs = '1' or (int_x_42_write = '1' and WVALID  = '1') else '0';
    int_x_42_we1         <= '1' when int_x_42_write = '1' and w_hs = '1' else '0';
    int_x_42_be1         <= UNSIGNED(WSTRB) when int_x_42_we1 = '1' else (others=>'0');
    int_x_42_d1          <= UNSIGNED(WDATA);
    -- x_43
    int_x_43_address0    <= SHIFT_RIGHT(UNSIGNED(x_43_address0), 2)(0 downto 0);
    int_x_43_ce0         <= x_43_ce0;
    x_43_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_43_q0, TO_INTEGER(int_x_43_shift0) * 8)(7 downto 0));
    int_x_43_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_43_ce1         <= '1' when ar_hs = '1' or (int_x_43_write = '1' and WVALID  = '1') else '0';
    int_x_43_we1         <= '1' when int_x_43_write = '1' and w_hs = '1' else '0';
    int_x_43_be1         <= UNSIGNED(WSTRB) when int_x_43_we1 = '1' else (others=>'0');
    int_x_43_d1          <= UNSIGNED(WDATA);
    -- x_44
    int_x_44_address0    <= SHIFT_RIGHT(UNSIGNED(x_44_address0), 2)(0 downto 0);
    int_x_44_ce0         <= x_44_ce0;
    x_44_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_44_q0, TO_INTEGER(int_x_44_shift0) * 8)(7 downto 0));
    int_x_44_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_44_ce1         <= '1' when ar_hs = '1' or (int_x_44_write = '1' and WVALID  = '1') else '0';
    int_x_44_we1         <= '1' when int_x_44_write = '1' and w_hs = '1' else '0';
    int_x_44_be1         <= UNSIGNED(WSTRB) when int_x_44_we1 = '1' else (others=>'0');
    int_x_44_d1          <= UNSIGNED(WDATA);
    -- x_45
    int_x_45_address0    <= SHIFT_RIGHT(UNSIGNED(x_45_address0), 2)(0 downto 0);
    int_x_45_ce0         <= x_45_ce0;
    x_45_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_45_q0, TO_INTEGER(int_x_45_shift0) * 8)(7 downto 0));
    int_x_45_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_45_ce1         <= '1' when ar_hs = '1' or (int_x_45_write = '1' and WVALID  = '1') else '0';
    int_x_45_we1         <= '1' when int_x_45_write = '1' and w_hs = '1' else '0';
    int_x_45_be1         <= UNSIGNED(WSTRB) when int_x_45_we1 = '1' else (others=>'0');
    int_x_45_d1          <= UNSIGNED(WDATA);
    -- x_46
    int_x_46_address0    <= SHIFT_RIGHT(UNSIGNED(x_46_address0), 2)(0 downto 0);
    int_x_46_ce0         <= x_46_ce0;
    x_46_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_46_q0, TO_INTEGER(int_x_46_shift0) * 8)(7 downto 0));
    int_x_46_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_46_ce1         <= '1' when ar_hs = '1' or (int_x_46_write = '1' and WVALID  = '1') else '0';
    int_x_46_we1         <= '1' when int_x_46_write = '1' and w_hs = '1' else '0';
    int_x_46_be1         <= UNSIGNED(WSTRB) when int_x_46_we1 = '1' else (others=>'0');
    int_x_46_d1          <= UNSIGNED(WDATA);
    -- x_47
    int_x_47_address0    <= SHIFT_RIGHT(UNSIGNED(x_47_address0), 2)(0 downto 0);
    int_x_47_ce0         <= x_47_ce0;
    x_47_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_47_q0, TO_INTEGER(int_x_47_shift0) * 8)(7 downto 0));
    int_x_47_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_47_ce1         <= '1' when ar_hs = '1' or (int_x_47_write = '1' and WVALID  = '1') else '0';
    int_x_47_we1         <= '1' when int_x_47_write = '1' and w_hs = '1' else '0';
    int_x_47_be1         <= UNSIGNED(WSTRB) when int_x_47_we1 = '1' else (others=>'0');
    int_x_47_d1          <= UNSIGNED(WDATA);
    -- x_48
    int_x_48_address0    <= SHIFT_RIGHT(UNSIGNED(x_48_address0), 2)(0 downto 0);
    int_x_48_ce0         <= x_48_ce0;
    x_48_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_48_q0, TO_INTEGER(int_x_48_shift0) * 8)(7 downto 0));
    int_x_48_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_48_ce1         <= '1' when ar_hs = '1' or (int_x_48_write = '1' and WVALID  = '1') else '0';
    int_x_48_we1         <= '1' when int_x_48_write = '1' and w_hs = '1' else '0';
    int_x_48_be1         <= UNSIGNED(WSTRB) when int_x_48_we1 = '1' else (others=>'0');
    int_x_48_d1          <= UNSIGNED(WDATA);
    -- x_49
    int_x_49_address0    <= SHIFT_RIGHT(UNSIGNED(x_49_address0), 2)(0 downto 0);
    int_x_49_ce0         <= x_49_ce0;
    x_49_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_49_q0, TO_INTEGER(int_x_49_shift0) * 8)(7 downto 0));
    int_x_49_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_49_ce1         <= '1' when ar_hs = '1' or (int_x_49_write = '1' and WVALID  = '1') else '0';
    int_x_49_we1         <= '1' when int_x_49_write = '1' and w_hs = '1' else '0';
    int_x_49_be1         <= UNSIGNED(WSTRB) when int_x_49_we1 = '1' else (others=>'0');
    int_x_49_d1          <= UNSIGNED(WDATA);
    -- x_50
    int_x_50_address0    <= SHIFT_RIGHT(UNSIGNED(x_50_address0), 2)(0 downto 0);
    int_x_50_ce0         <= x_50_ce0;
    x_50_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_50_q0, TO_INTEGER(int_x_50_shift0) * 8)(7 downto 0));
    int_x_50_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_50_ce1         <= '1' when ar_hs = '1' or (int_x_50_write = '1' and WVALID  = '1') else '0';
    int_x_50_we1         <= '1' when int_x_50_write = '1' and w_hs = '1' else '0';
    int_x_50_be1         <= UNSIGNED(WSTRB) when int_x_50_we1 = '1' else (others=>'0');
    int_x_50_d1          <= UNSIGNED(WDATA);
    -- x_51
    int_x_51_address0    <= SHIFT_RIGHT(UNSIGNED(x_51_address0), 2)(0 downto 0);
    int_x_51_ce0         <= x_51_ce0;
    x_51_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_51_q0, TO_INTEGER(int_x_51_shift0) * 8)(7 downto 0));
    int_x_51_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_51_ce1         <= '1' when ar_hs = '1' or (int_x_51_write = '1' and WVALID  = '1') else '0';
    int_x_51_we1         <= '1' when int_x_51_write = '1' and w_hs = '1' else '0';
    int_x_51_be1         <= UNSIGNED(WSTRB) when int_x_51_we1 = '1' else (others=>'0');
    int_x_51_d1          <= UNSIGNED(WDATA);
    -- x_52
    int_x_52_address0    <= SHIFT_RIGHT(UNSIGNED(x_52_address0), 2)(0 downto 0);
    int_x_52_ce0         <= x_52_ce0;
    x_52_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_52_q0, TO_INTEGER(int_x_52_shift0) * 8)(7 downto 0));
    int_x_52_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_52_ce1         <= '1' when ar_hs = '1' or (int_x_52_write = '1' and WVALID  = '1') else '0';
    int_x_52_we1         <= '1' when int_x_52_write = '1' and w_hs = '1' else '0';
    int_x_52_be1         <= UNSIGNED(WSTRB) when int_x_52_we1 = '1' else (others=>'0');
    int_x_52_d1          <= UNSIGNED(WDATA);
    -- x_53
    int_x_53_address0    <= SHIFT_RIGHT(UNSIGNED(x_53_address0), 2)(0 downto 0);
    int_x_53_ce0         <= x_53_ce0;
    x_53_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_53_q0, TO_INTEGER(int_x_53_shift0) * 8)(7 downto 0));
    int_x_53_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_53_ce1         <= '1' when ar_hs = '1' or (int_x_53_write = '1' and WVALID  = '1') else '0';
    int_x_53_we1         <= '1' when int_x_53_write = '1' and w_hs = '1' else '0';
    int_x_53_be1         <= UNSIGNED(WSTRB) when int_x_53_we1 = '1' else (others=>'0');
    int_x_53_d1          <= UNSIGNED(WDATA);
    -- x_54
    int_x_54_address0    <= SHIFT_RIGHT(UNSIGNED(x_54_address0), 2)(0 downto 0);
    int_x_54_ce0         <= x_54_ce0;
    x_54_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_54_q0, TO_INTEGER(int_x_54_shift0) * 8)(7 downto 0));
    int_x_54_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_54_ce1         <= '1' when ar_hs = '1' or (int_x_54_write = '1' and WVALID  = '1') else '0';
    int_x_54_we1         <= '1' when int_x_54_write = '1' and w_hs = '1' else '0';
    int_x_54_be1         <= UNSIGNED(WSTRB) when int_x_54_we1 = '1' else (others=>'0');
    int_x_54_d1          <= UNSIGNED(WDATA);
    -- x_55
    int_x_55_address0    <= SHIFT_RIGHT(UNSIGNED(x_55_address0), 2)(0 downto 0);
    int_x_55_ce0         <= x_55_ce0;
    x_55_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_55_q0, TO_INTEGER(int_x_55_shift0) * 8)(7 downto 0));
    int_x_55_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_55_ce1         <= '1' when ar_hs = '1' or (int_x_55_write = '1' and WVALID  = '1') else '0';
    int_x_55_we1         <= '1' when int_x_55_write = '1' and w_hs = '1' else '0';
    int_x_55_be1         <= UNSIGNED(WSTRB) when int_x_55_we1 = '1' else (others=>'0');
    int_x_55_d1          <= UNSIGNED(WDATA);
    -- x_56
    int_x_56_address0    <= SHIFT_RIGHT(UNSIGNED(x_56_address0), 2)(0 downto 0);
    int_x_56_ce0         <= x_56_ce0;
    x_56_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_56_q0, TO_INTEGER(int_x_56_shift0) * 8)(7 downto 0));
    int_x_56_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_56_ce1         <= '1' when ar_hs = '1' or (int_x_56_write = '1' and WVALID  = '1') else '0';
    int_x_56_we1         <= '1' when int_x_56_write = '1' and w_hs = '1' else '0';
    int_x_56_be1         <= UNSIGNED(WSTRB) when int_x_56_we1 = '1' else (others=>'0');
    int_x_56_d1          <= UNSIGNED(WDATA);
    -- x_57
    int_x_57_address0    <= SHIFT_RIGHT(UNSIGNED(x_57_address0), 2)(0 downto 0);
    int_x_57_ce0         <= x_57_ce0;
    x_57_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_57_q0, TO_INTEGER(int_x_57_shift0) * 8)(7 downto 0));
    int_x_57_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_57_ce1         <= '1' when ar_hs = '1' or (int_x_57_write = '1' and WVALID  = '1') else '0';
    int_x_57_we1         <= '1' when int_x_57_write = '1' and w_hs = '1' else '0';
    int_x_57_be1         <= UNSIGNED(WSTRB) when int_x_57_we1 = '1' else (others=>'0');
    int_x_57_d1          <= UNSIGNED(WDATA);
    -- x_58
    int_x_58_address0    <= SHIFT_RIGHT(UNSIGNED(x_58_address0), 2)(0 downto 0);
    int_x_58_ce0         <= x_58_ce0;
    x_58_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_58_q0, TO_INTEGER(int_x_58_shift0) * 8)(7 downto 0));
    int_x_58_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_58_ce1         <= '1' when ar_hs = '1' or (int_x_58_write = '1' and WVALID  = '1') else '0';
    int_x_58_we1         <= '1' when int_x_58_write = '1' and w_hs = '1' else '0';
    int_x_58_be1         <= UNSIGNED(WSTRB) when int_x_58_we1 = '1' else (others=>'0');
    int_x_58_d1          <= UNSIGNED(WDATA);
    -- x_59
    int_x_59_address0    <= SHIFT_RIGHT(UNSIGNED(x_59_address0), 2)(0 downto 0);
    int_x_59_ce0         <= x_59_ce0;
    x_59_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_59_q0, TO_INTEGER(int_x_59_shift0) * 8)(7 downto 0));
    int_x_59_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_59_ce1         <= '1' when ar_hs = '1' or (int_x_59_write = '1' and WVALID  = '1') else '0';
    int_x_59_we1         <= '1' when int_x_59_write = '1' and w_hs = '1' else '0';
    int_x_59_be1         <= UNSIGNED(WSTRB) when int_x_59_we1 = '1' else (others=>'0');
    int_x_59_d1          <= UNSIGNED(WDATA);
    -- x_60
    int_x_60_address0    <= SHIFT_RIGHT(UNSIGNED(x_60_address0), 2)(0 downto 0);
    int_x_60_ce0         <= x_60_ce0;
    x_60_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_60_q0, TO_INTEGER(int_x_60_shift0) * 8)(7 downto 0));
    int_x_60_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_60_ce1         <= '1' when ar_hs = '1' or (int_x_60_write = '1' and WVALID  = '1') else '0';
    int_x_60_we1         <= '1' when int_x_60_write = '1' and w_hs = '1' else '0';
    int_x_60_be1         <= UNSIGNED(WSTRB) when int_x_60_we1 = '1' else (others=>'0');
    int_x_60_d1          <= UNSIGNED(WDATA);
    -- x_61
    int_x_61_address0    <= SHIFT_RIGHT(UNSIGNED(x_61_address0), 2)(0 downto 0);
    int_x_61_ce0         <= x_61_ce0;
    x_61_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_61_q0, TO_INTEGER(int_x_61_shift0) * 8)(7 downto 0));
    int_x_61_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_61_ce1         <= '1' when ar_hs = '1' or (int_x_61_write = '1' and WVALID  = '1') else '0';
    int_x_61_we1         <= '1' when int_x_61_write = '1' and w_hs = '1' else '0';
    int_x_61_be1         <= UNSIGNED(WSTRB) when int_x_61_we1 = '1' else (others=>'0');
    int_x_61_d1          <= UNSIGNED(WDATA);
    -- x_62
    int_x_62_address0    <= SHIFT_RIGHT(UNSIGNED(x_62_address0), 2)(0 downto 0);
    int_x_62_ce0         <= x_62_ce0;
    x_62_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_62_q0, TO_INTEGER(int_x_62_shift0) * 8)(7 downto 0));
    int_x_62_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_62_ce1         <= '1' when ar_hs = '1' or (int_x_62_write = '1' and WVALID  = '1') else '0';
    int_x_62_we1         <= '1' when int_x_62_write = '1' and w_hs = '1' else '0';
    int_x_62_be1         <= UNSIGNED(WSTRB) when int_x_62_we1 = '1' else (others=>'0');
    int_x_62_d1          <= UNSIGNED(WDATA);
    -- x_63
    int_x_63_address0    <= SHIFT_RIGHT(UNSIGNED(x_63_address0), 2)(0 downto 0);
    int_x_63_ce0         <= x_63_ce0;
    x_63_q0              <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_x_63_q0, TO_INTEGER(int_x_63_shift0) * 8)(7 downto 0));
    int_x_63_address1    <= raddr(2 downto 2) when ar_hs = '1' else waddr(2 downto 2);
    int_x_63_ce1         <= '1' when ar_hs = '1' or (int_x_63_write = '1' and WVALID  = '1') else '0';
    int_x_63_we1         <= '1' when int_x_63_write = '1' and w_hs = '1' else '0';
    int_x_63_be1         <= UNSIGNED(WSTRB) when int_x_63_we1 = '1' else (others=>'0');
    int_x_63_d1          <= UNSIGNED(WDATA);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_0_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_0_BASE and raddr <= ADDR_X_0_HIGH) then
                    int_x_0_read <= '1';
                else
                    int_x_0_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_0_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_0_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_0_HIGH) then
                    int_x_0_write <= '1';
                elsif (w_hs = '1') then
                    int_x_0_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_0_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_0_ce0 = '1') then
                    int_x_0_shift0 <= UNSIGNED(x_0_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_1_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_1_BASE and raddr <= ADDR_X_1_HIGH) then
                    int_x_1_read <= '1';
                else
                    int_x_1_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_1_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_1_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_1_HIGH) then
                    int_x_1_write <= '1';
                elsif (w_hs = '1') then
                    int_x_1_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_1_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_1_ce0 = '1') then
                    int_x_1_shift0 <= UNSIGNED(x_1_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_2_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_2_BASE and raddr <= ADDR_X_2_HIGH) then
                    int_x_2_read <= '1';
                else
                    int_x_2_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_2_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_2_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_2_HIGH) then
                    int_x_2_write <= '1';
                elsif (w_hs = '1') then
                    int_x_2_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_2_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_2_ce0 = '1') then
                    int_x_2_shift0 <= UNSIGNED(x_2_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_3_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_3_BASE and raddr <= ADDR_X_3_HIGH) then
                    int_x_3_read <= '1';
                else
                    int_x_3_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_3_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_3_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_3_HIGH) then
                    int_x_3_write <= '1';
                elsif (w_hs = '1') then
                    int_x_3_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_3_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_3_ce0 = '1') then
                    int_x_3_shift0 <= UNSIGNED(x_3_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_4_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_4_BASE and raddr <= ADDR_X_4_HIGH) then
                    int_x_4_read <= '1';
                else
                    int_x_4_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_4_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_4_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_4_HIGH) then
                    int_x_4_write <= '1';
                elsif (w_hs = '1') then
                    int_x_4_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_4_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_4_ce0 = '1') then
                    int_x_4_shift0 <= UNSIGNED(x_4_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_5_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_5_BASE and raddr <= ADDR_X_5_HIGH) then
                    int_x_5_read <= '1';
                else
                    int_x_5_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_5_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_5_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_5_HIGH) then
                    int_x_5_write <= '1';
                elsif (w_hs = '1') then
                    int_x_5_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_5_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_5_ce0 = '1') then
                    int_x_5_shift0 <= UNSIGNED(x_5_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_6_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_6_BASE and raddr <= ADDR_X_6_HIGH) then
                    int_x_6_read <= '1';
                else
                    int_x_6_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_6_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_6_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_6_HIGH) then
                    int_x_6_write <= '1';
                elsif (w_hs = '1') then
                    int_x_6_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_6_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_6_ce0 = '1') then
                    int_x_6_shift0 <= UNSIGNED(x_6_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_7_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_7_BASE and raddr <= ADDR_X_7_HIGH) then
                    int_x_7_read <= '1';
                else
                    int_x_7_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_7_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_7_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_7_HIGH) then
                    int_x_7_write <= '1';
                elsif (w_hs = '1') then
                    int_x_7_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_7_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_7_ce0 = '1') then
                    int_x_7_shift0 <= UNSIGNED(x_7_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_8_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_8_BASE and raddr <= ADDR_X_8_HIGH) then
                    int_x_8_read <= '1';
                else
                    int_x_8_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_8_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_8_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_8_HIGH) then
                    int_x_8_write <= '1';
                elsif (w_hs = '1') then
                    int_x_8_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_8_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_8_ce0 = '1') then
                    int_x_8_shift0 <= UNSIGNED(x_8_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_9_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_9_BASE and raddr <= ADDR_X_9_HIGH) then
                    int_x_9_read <= '1';
                else
                    int_x_9_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_9_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_9_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_9_HIGH) then
                    int_x_9_write <= '1';
                elsif (w_hs = '1') then
                    int_x_9_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_9_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_9_ce0 = '1') then
                    int_x_9_shift0 <= UNSIGNED(x_9_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_10_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_10_BASE and raddr <= ADDR_X_10_HIGH) then
                    int_x_10_read <= '1';
                else
                    int_x_10_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_10_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_10_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_10_HIGH) then
                    int_x_10_write <= '1';
                elsif (w_hs = '1') then
                    int_x_10_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_10_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_10_ce0 = '1') then
                    int_x_10_shift0 <= UNSIGNED(x_10_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_11_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_11_BASE and raddr <= ADDR_X_11_HIGH) then
                    int_x_11_read <= '1';
                else
                    int_x_11_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_11_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_11_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_11_HIGH) then
                    int_x_11_write <= '1';
                elsif (w_hs = '1') then
                    int_x_11_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_11_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_11_ce0 = '1') then
                    int_x_11_shift0 <= UNSIGNED(x_11_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_12_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_12_BASE and raddr <= ADDR_X_12_HIGH) then
                    int_x_12_read <= '1';
                else
                    int_x_12_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_12_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_12_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_12_HIGH) then
                    int_x_12_write <= '1';
                elsif (w_hs = '1') then
                    int_x_12_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_12_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_12_ce0 = '1') then
                    int_x_12_shift0 <= UNSIGNED(x_12_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_13_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_13_BASE and raddr <= ADDR_X_13_HIGH) then
                    int_x_13_read <= '1';
                else
                    int_x_13_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_13_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_13_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_13_HIGH) then
                    int_x_13_write <= '1';
                elsif (w_hs = '1') then
                    int_x_13_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_13_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_13_ce0 = '1') then
                    int_x_13_shift0 <= UNSIGNED(x_13_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_14_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_14_BASE and raddr <= ADDR_X_14_HIGH) then
                    int_x_14_read <= '1';
                else
                    int_x_14_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_14_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_14_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_14_HIGH) then
                    int_x_14_write <= '1';
                elsif (w_hs = '1') then
                    int_x_14_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_14_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_14_ce0 = '1') then
                    int_x_14_shift0 <= UNSIGNED(x_14_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_15_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_15_BASE and raddr <= ADDR_X_15_HIGH) then
                    int_x_15_read <= '1';
                else
                    int_x_15_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_15_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_15_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_15_HIGH) then
                    int_x_15_write <= '1';
                elsif (w_hs = '1') then
                    int_x_15_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_15_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_15_ce0 = '1') then
                    int_x_15_shift0 <= UNSIGNED(x_15_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_16_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_16_BASE and raddr <= ADDR_X_16_HIGH) then
                    int_x_16_read <= '1';
                else
                    int_x_16_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_16_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_16_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_16_HIGH) then
                    int_x_16_write <= '1';
                elsif (w_hs = '1') then
                    int_x_16_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_16_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_16_ce0 = '1') then
                    int_x_16_shift0 <= UNSIGNED(x_16_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_17_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_17_BASE and raddr <= ADDR_X_17_HIGH) then
                    int_x_17_read <= '1';
                else
                    int_x_17_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_17_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_17_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_17_HIGH) then
                    int_x_17_write <= '1';
                elsif (w_hs = '1') then
                    int_x_17_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_17_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_17_ce0 = '1') then
                    int_x_17_shift0 <= UNSIGNED(x_17_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_18_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_18_BASE and raddr <= ADDR_X_18_HIGH) then
                    int_x_18_read <= '1';
                else
                    int_x_18_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_18_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_18_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_18_HIGH) then
                    int_x_18_write <= '1';
                elsif (w_hs = '1') then
                    int_x_18_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_18_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_18_ce0 = '1') then
                    int_x_18_shift0 <= UNSIGNED(x_18_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_19_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_19_BASE and raddr <= ADDR_X_19_HIGH) then
                    int_x_19_read <= '1';
                else
                    int_x_19_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_19_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_19_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_19_HIGH) then
                    int_x_19_write <= '1';
                elsif (w_hs = '1') then
                    int_x_19_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_19_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_19_ce0 = '1') then
                    int_x_19_shift0 <= UNSIGNED(x_19_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_20_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_20_BASE and raddr <= ADDR_X_20_HIGH) then
                    int_x_20_read <= '1';
                else
                    int_x_20_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_20_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_20_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_20_HIGH) then
                    int_x_20_write <= '1';
                elsif (w_hs = '1') then
                    int_x_20_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_20_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_20_ce0 = '1') then
                    int_x_20_shift0 <= UNSIGNED(x_20_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_21_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_21_BASE and raddr <= ADDR_X_21_HIGH) then
                    int_x_21_read <= '1';
                else
                    int_x_21_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_21_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_21_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_21_HIGH) then
                    int_x_21_write <= '1';
                elsif (w_hs = '1') then
                    int_x_21_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_21_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_21_ce0 = '1') then
                    int_x_21_shift0 <= UNSIGNED(x_21_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_22_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_22_BASE and raddr <= ADDR_X_22_HIGH) then
                    int_x_22_read <= '1';
                else
                    int_x_22_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_22_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_22_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_22_HIGH) then
                    int_x_22_write <= '1';
                elsif (w_hs = '1') then
                    int_x_22_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_22_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_22_ce0 = '1') then
                    int_x_22_shift0 <= UNSIGNED(x_22_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_23_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_23_BASE and raddr <= ADDR_X_23_HIGH) then
                    int_x_23_read <= '1';
                else
                    int_x_23_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_23_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_23_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_23_HIGH) then
                    int_x_23_write <= '1';
                elsif (w_hs = '1') then
                    int_x_23_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_23_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_23_ce0 = '1') then
                    int_x_23_shift0 <= UNSIGNED(x_23_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_24_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_24_BASE and raddr <= ADDR_X_24_HIGH) then
                    int_x_24_read <= '1';
                else
                    int_x_24_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_24_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_24_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_24_HIGH) then
                    int_x_24_write <= '1';
                elsif (w_hs = '1') then
                    int_x_24_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_24_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_24_ce0 = '1') then
                    int_x_24_shift0 <= UNSIGNED(x_24_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_25_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_25_BASE and raddr <= ADDR_X_25_HIGH) then
                    int_x_25_read <= '1';
                else
                    int_x_25_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_25_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_25_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_25_HIGH) then
                    int_x_25_write <= '1';
                elsif (w_hs = '1') then
                    int_x_25_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_25_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_25_ce0 = '1') then
                    int_x_25_shift0 <= UNSIGNED(x_25_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_26_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_26_BASE and raddr <= ADDR_X_26_HIGH) then
                    int_x_26_read <= '1';
                else
                    int_x_26_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_26_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_26_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_26_HIGH) then
                    int_x_26_write <= '1';
                elsif (w_hs = '1') then
                    int_x_26_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_26_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_26_ce0 = '1') then
                    int_x_26_shift0 <= UNSIGNED(x_26_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_27_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_27_BASE and raddr <= ADDR_X_27_HIGH) then
                    int_x_27_read <= '1';
                else
                    int_x_27_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_27_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_27_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_27_HIGH) then
                    int_x_27_write <= '1';
                elsif (w_hs = '1') then
                    int_x_27_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_27_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_27_ce0 = '1') then
                    int_x_27_shift0 <= UNSIGNED(x_27_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_28_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_28_BASE and raddr <= ADDR_X_28_HIGH) then
                    int_x_28_read <= '1';
                else
                    int_x_28_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_28_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_28_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_28_HIGH) then
                    int_x_28_write <= '1';
                elsif (w_hs = '1') then
                    int_x_28_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_28_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_28_ce0 = '1') then
                    int_x_28_shift0 <= UNSIGNED(x_28_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_29_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_29_BASE and raddr <= ADDR_X_29_HIGH) then
                    int_x_29_read <= '1';
                else
                    int_x_29_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_29_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_29_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_29_HIGH) then
                    int_x_29_write <= '1';
                elsif (w_hs = '1') then
                    int_x_29_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_29_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_29_ce0 = '1') then
                    int_x_29_shift0 <= UNSIGNED(x_29_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_30_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_30_BASE and raddr <= ADDR_X_30_HIGH) then
                    int_x_30_read <= '1';
                else
                    int_x_30_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_30_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_30_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_30_HIGH) then
                    int_x_30_write <= '1';
                elsif (w_hs = '1') then
                    int_x_30_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_30_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_30_ce0 = '1') then
                    int_x_30_shift0 <= UNSIGNED(x_30_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_31_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_31_BASE and raddr <= ADDR_X_31_HIGH) then
                    int_x_31_read <= '1';
                else
                    int_x_31_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_31_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_31_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_31_HIGH) then
                    int_x_31_write <= '1';
                elsif (w_hs = '1') then
                    int_x_31_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_31_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_31_ce0 = '1') then
                    int_x_31_shift0 <= UNSIGNED(x_31_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_32_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_32_BASE and raddr <= ADDR_X_32_HIGH) then
                    int_x_32_read <= '1';
                else
                    int_x_32_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_32_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_32_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_32_HIGH) then
                    int_x_32_write <= '1';
                elsif (w_hs = '1') then
                    int_x_32_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_32_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_32_ce0 = '1') then
                    int_x_32_shift0 <= UNSIGNED(x_32_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_33_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_33_BASE and raddr <= ADDR_X_33_HIGH) then
                    int_x_33_read <= '1';
                else
                    int_x_33_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_33_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_33_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_33_HIGH) then
                    int_x_33_write <= '1';
                elsif (w_hs = '1') then
                    int_x_33_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_33_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_33_ce0 = '1') then
                    int_x_33_shift0 <= UNSIGNED(x_33_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_34_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_34_BASE and raddr <= ADDR_X_34_HIGH) then
                    int_x_34_read <= '1';
                else
                    int_x_34_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_34_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_34_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_34_HIGH) then
                    int_x_34_write <= '1';
                elsif (w_hs = '1') then
                    int_x_34_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_34_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_34_ce0 = '1') then
                    int_x_34_shift0 <= UNSIGNED(x_34_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_35_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_35_BASE and raddr <= ADDR_X_35_HIGH) then
                    int_x_35_read <= '1';
                else
                    int_x_35_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_35_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_35_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_35_HIGH) then
                    int_x_35_write <= '1';
                elsif (w_hs = '1') then
                    int_x_35_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_35_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_35_ce0 = '1') then
                    int_x_35_shift0 <= UNSIGNED(x_35_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_36_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_36_BASE and raddr <= ADDR_X_36_HIGH) then
                    int_x_36_read <= '1';
                else
                    int_x_36_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_36_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_36_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_36_HIGH) then
                    int_x_36_write <= '1';
                elsif (w_hs = '1') then
                    int_x_36_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_36_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_36_ce0 = '1') then
                    int_x_36_shift0 <= UNSIGNED(x_36_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_37_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_37_BASE and raddr <= ADDR_X_37_HIGH) then
                    int_x_37_read <= '1';
                else
                    int_x_37_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_37_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_37_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_37_HIGH) then
                    int_x_37_write <= '1';
                elsif (w_hs = '1') then
                    int_x_37_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_37_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_37_ce0 = '1') then
                    int_x_37_shift0 <= UNSIGNED(x_37_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_38_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_38_BASE and raddr <= ADDR_X_38_HIGH) then
                    int_x_38_read <= '1';
                else
                    int_x_38_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_38_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_38_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_38_HIGH) then
                    int_x_38_write <= '1';
                elsif (w_hs = '1') then
                    int_x_38_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_38_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_38_ce0 = '1') then
                    int_x_38_shift0 <= UNSIGNED(x_38_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_39_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_39_BASE and raddr <= ADDR_X_39_HIGH) then
                    int_x_39_read <= '1';
                else
                    int_x_39_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_39_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_39_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_39_HIGH) then
                    int_x_39_write <= '1';
                elsif (w_hs = '1') then
                    int_x_39_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_39_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_39_ce0 = '1') then
                    int_x_39_shift0 <= UNSIGNED(x_39_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_40_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_40_BASE and raddr <= ADDR_X_40_HIGH) then
                    int_x_40_read <= '1';
                else
                    int_x_40_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_40_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_40_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_40_HIGH) then
                    int_x_40_write <= '1';
                elsif (w_hs = '1') then
                    int_x_40_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_40_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_40_ce0 = '1') then
                    int_x_40_shift0 <= UNSIGNED(x_40_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_41_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_41_BASE and raddr <= ADDR_X_41_HIGH) then
                    int_x_41_read <= '1';
                else
                    int_x_41_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_41_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_41_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_41_HIGH) then
                    int_x_41_write <= '1';
                elsif (w_hs = '1') then
                    int_x_41_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_41_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_41_ce0 = '1') then
                    int_x_41_shift0 <= UNSIGNED(x_41_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_42_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_42_BASE and raddr <= ADDR_X_42_HIGH) then
                    int_x_42_read <= '1';
                else
                    int_x_42_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_42_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_42_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_42_HIGH) then
                    int_x_42_write <= '1';
                elsif (w_hs = '1') then
                    int_x_42_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_42_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_42_ce0 = '1') then
                    int_x_42_shift0 <= UNSIGNED(x_42_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_43_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_43_BASE and raddr <= ADDR_X_43_HIGH) then
                    int_x_43_read <= '1';
                else
                    int_x_43_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_43_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_43_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_43_HIGH) then
                    int_x_43_write <= '1';
                elsif (w_hs = '1') then
                    int_x_43_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_43_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_43_ce0 = '1') then
                    int_x_43_shift0 <= UNSIGNED(x_43_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_44_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_44_BASE and raddr <= ADDR_X_44_HIGH) then
                    int_x_44_read <= '1';
                else
                    int_x_44_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_44_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_44_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_44_HIGH) then
                    int_x_44_write <= '1';
                elsif (w_hs = '1') then
                    int_x_44_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_44_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_44_ce0 = '1') then
                    int_x_44_shift0 <= UNSIGNED(x_44_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_45_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_45_BASE and raddr <= ADDR_X_45_HIGH) then
                    int_x_45_read <= '1';
                else
                    int_x_45_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_45_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_45_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_45_HIGH) then
                    int_x_45_write <= '1';
                elsif (w_hs = '1') then
                    int_x_45_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_45_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_45_ce0 = '1') then
                    int_x_45_shift0 <= UNSIGNED(x_45_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_46_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_46_BASE and raddr <= ADDR_X_46_HIGH) then
                    int_x_46_read <= '1';
                else
                    int_x_46_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_46_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_46_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_46_HIGH) then
                    int_x_46_write <= '1';
                elsif (w_hs = '1') then
                    int_x_46_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_46_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_46_ce0 = '1') then
                    int_x_46_shift0 <= UNSIGNED(x_46_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_47_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_47_BASE and raddr <= ADDR_X_47_HIGH) then
                    int_x_47_read <= '1';
                else
                    int_x_47_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_47_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_47_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_47_HIGH) then
                    int_x_47_write <= '1';
                elsif (w_hs = '1') then
                    int_x_47_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_47_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_47_ce0 = '1') then
                    int_x_47_shift0 <= UNSIGNED(x_47_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_48_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_48_BASE and raddr <= ADDR_X_48_HIGH) then
                    int_x_48_read <= '1';
                else
                    int_x_48_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_48_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_48_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_48_HIGH) then
                    int_x_48_write <= '1';
                elsif (w_hs = '1') then
                    int_x_48_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_48_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_48_ce0 = '1') then
                    int_x_48_shift0 <= UNSIGNED(x_48_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_49_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_49_BASE and raddr <= ADDR_X_49_HIGH) then
                    int_x_49_read <= '1';
                else
                    int_x_49_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_49_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_49_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_49_HIGH) then
                    int_x_49_write <= '1';
                elsif (w_hs = '1') then
                    int_x_49_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_49_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_49_ce0 = '1') then
                    int_x_49_shift0 <= UNSIGNED(x_49_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_50_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_50_BASE and raddr <= ADDR_X_50_HIGH) then
                    int_x_50_read <= '1';
                else
                    int_x_50_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_50_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_50_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_50_HIGH) then
                    int_x_50_write <= '1';
                elsif (w_hs = '1') then
                    int_x_50_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_50_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_50_ce0 = '1') then
                    int_x_50_shift0 <= UNSIGNED(x_50_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_51_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_51_BASE and raddr <= ADDR_X_51_HIGH) then
                    int_x_51_read <= '1';
                else
                    int_x_51_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_51_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_51_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_51_HIGH) then
                    int_x_51_write <= '1';
                elsif (w_hs = '1') then
                    int_x_51_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_51_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_51_ce0 = '1') then
                    int_x_51_shift0 <= UNSIGNED(x_51_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_52_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_52_BASE and raddr <= ADDR_X_52_HIGH) then
                    int_x_52_read <= '1';
                else
                    int_x_52_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_52_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_52_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_52_HIGH) then
                    int_x_52_write <= '1';
                elsif (w_hs = '1') then
                    int_x_52_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_52_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_52_ce0 = '1') then
                    int_x_52_shift0 <= UNSIGNED(x_52_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_53_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_53_BASE and raddr <= ADDR_X_53_HIGH) then
                    int_x_53_read <= '1';
                else
                    int_x_53_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_53_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_53_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_53_HIGH) then
                    int_x_53_write <= '1';
                elsif (w_hs = '1') then
                    int_x_53_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_53_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_53_ce0 = '1') then
                    int_x_53_shift0 <= UNSIGNED(x_53_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_54_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_54_BASE and raddr <= ADDR_X_54_HIGH) then
                    int_x_54_read <= '1';
                else
                    int_x_54_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_54_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_54_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_54_HIGH) then
                    int_x_54_write <= '1';
                elsif (w_hs = '1') then
                    int_x_54_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_54_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_54_ce0 = '1') then
                    int_x_54_shift0 <= UNSIGNED(x_54_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_55_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_55_BASE and raddr <= ADDR_X_55_HIGH) then
                    int_x_55_read <= '1';
                else
                    int_x_55_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_55_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_55_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_55_HIGH) then
                    int_x_55_write <= '1';
                elsif (w_hs = '1') then
                    int_x_55_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_55_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_55_ce0 = '1') then
                    int_x_55_shift0 <= UNSIGNED(x_55_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_56_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_56_BASE and raddr <= ADDR_X_56_HIGH) then
                    int_x_56_read <= '1';
                else
                    int_x_56_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_56_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_56_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_56_HIGH) then
                    int_x_56_write <= '1';
                elsif (w_hs = '1') then
                    int_x_56_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_56_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_56_ce0 = '1') then
                    int_x_56_shift0 <= UNSIGNED(x_56_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_57_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_57_BASE and raddr <= ADDR_X_57_HIGH) then
                    int_x_57_read <= '1';
                else
                    int_x_57_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_57_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_57_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_57_HIGH) then
                    int_x_57_write <= '1';
                elsif (w_hs = '1') then
                    int_x_57_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_57_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_57_ce0 = '1') then
                    int_x_57_shift0 <= UNSIGNED(x_57_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_58_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_58_BASE and raddr <= ADDR_X_58_HIGH) then
                    int_x_58_read <= '1';
                else
                    int_x_58_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_58_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_58_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_58_HIGH) then
                    int_x_58_write <= '1';
                elsif (w_hs = '1') then
                    int_x_58_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_58_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_58_ce0 = '1') then
                    int_x_58_shift0 <= UNSIGNED(x_58_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_59_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_59_BASE and raddr <= ADDR_X_59_HIGH) then
                    int_x_59_read <= '1';
                else
                    int_x_59_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_59_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_59_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_59_HIGH) then
                    int_x_59_write <= '1';
                elsif (w_hs = '1') then
                    int_x_59_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_59_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_59_ce0 = '1') then
                    int_x_59_shift0 <= UNSIGNED(x_59_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_60_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_60_BASE and raddr <= ADDR_X_60_HIGH) then
                    int_x_60_read <= '1';
                else
                    int_x_60_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_60_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_60_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_60_HIGH) then
                    int_x_60_write <= '1';
                elsif (w_hs = '1') then
                    int_x_60_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_60_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_60_ce0 = '1') then
                    int_x_60_shift0 <= UNSIGNED(x_60_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_61_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_61_BASE and raddr <= ADDR_X_61_HIGH) then
                    int_x_61_read <= '1';
                else
                    int_x_61_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_61_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_61_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_61_HIGH) then
                    int_x_61_write <= '1';
                elsif (w_hs = '1') then
                    int_x_61_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_61_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_61_ce0 = '1') then
                    int_x_61_shift0 <= UNSIGNED(x_61_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_62_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_62_BASE and raddr <= ADDR_X_62_HIGH) then
                    int_x_62_read <= '1';
                else
                    int_x_62_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_62_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_62_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_62_HIGH) then
                    int_x_62_write <= '1';
                elsif (w_hs = '1') then
                    int_x_62_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_62_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_62_ce0 = '1') then
                    int_x_62_shift0 <= UNSIGNED(x_62_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_63_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_X_63_BASE and raddr <= ADDR_X_63_HIGH) then
                    int_x_63_read <= '1';
                else
                    int_x_63_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_63_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_X_63_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_X_63_HIGH) then
                    int_x_63_write <= '1';
                elsif (w_hs = '1') then
                    int_x_63_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_x_63_shift0 <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (x_63_ce0 = '1') then
                    int_x_63_shift0 <= UNSIGNED(x_63_address0(1 downto 0));
                end if;
            end if;
        end if;
    end process;


end architecture behave;

library IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity eucHW_control_s_axi_ram is
    generic (
        MEM_STYLE : STRING :="auto";
        MEM_TYPE  : STRING :="S2P";
        BYTES   : INTEGER :=4;
        DEPTH   : INTEGER :=256;
        AWIDTH  : INTEGER :=8);
    port (
        clk0    : in  STD_LOGIC;
        address0: in  UNSIGNED(AWIDTH-1 downto 0);
        ce0     : in  STD_LOGIC;
        we0     : in  UNSIGNED(BYTES-1 downto 0);
        d0      : in  UNSIGNED(BYTES*8-1 downto 0);
        q0      : out UNSIGNED(BYTES*8-1 downto 0);
        clk1    : in  STD_LOGIC;
        address1: in  UNSIGNED(AWIDTH-1 downto 0);
        ce1     : in  STD_LOGIC;
        we1     : in  UNSIGNED(BYTES-1 downto 0);
        d1      : in  UNSIGNED(BYTES*8-1 downto 0);
        q1      : out UNSIGNED(BYTES*8-1 downto 0));

end entity eucHW_control_s_axi_ram;

architecture behave of eucHW_control_s_axi_ram is
    signal address0_tmp : UNSIGNED(AWIDTH-1 downto 0);
    signal address1_tmp : UNSIGNED(AWIDTH-1 downto 0);
    type RAM_T is array (0 to DEPTH - 1) of UNSIGNED(BYTES*8 - 1 downto 0);
    shared variable mem : RAM_T := (others => (others => '0'));
    attribute ram_style: string;
    attribute ram_style of mem: variable is MEM_STYLE;
    constant BYTE_WIDTH :INTEGER := 8;

    function port_type_gen( MEM_TYPE: STRING; MEM_STYLE: STRING; PORT_NAME: STRING) return STRING is
    begin
        if (MEM_TYPE = "S2P") and (PORT_NAME = "PORT0") then
            return "WO";
        elsif((MEM_TYPE = "S2P") and (PORT_NAME = "PORT1")) or ((MEM_TYPE = "2P") and (PORT_NAME = "PORT0")) then
            return "RO";
        elsif (MEM_STYLE = "hls_ultra") then
            return "RWNC";
        else
            return "RWRF";
        end if;
    end port_type_gen;
    constant PORT0 :STRING := port_type_gen(MEM_TYPE, MEM_STYLE, "PORT0");
    constant PORT1 :STRING := port_type_gen(MEM_TYPE, MEM_STYLE, "PORT1");

    function or_reduce( V: UNSIGNED) return std_logic is
    variable result: std_logic;
    begin
        for i in V'range loop
            if i = V'left then
                result := V(i);
            else
                result := result OR V(i);
            end if;
            exit when result = '1';
        end loop;
        return result;
    end or_reduce;

begin

    process (address0)
    begin
    address0_tmp <= address0;
    --synthesis translate_off
        if (address0 > DEPTH-1) then
            address0_tmp <= (others => '0');
        else
            address0_tmp <= address0;
        end if;
    --synthesis translate_on
    end process;

    process (address1)
    begin
    address1_tmp <= address1;
    --synthesis translate_off
        if (address1 > DEPTH-1) then
            address1_tmp <= (others => '0');
        else
            address1_tmp <= address1;
        end if;
    --synthesis translate_on
    end process;

    --read port 0
    read_p0_rf : if (PORT0 = "RO" or PORT0 = "RWRF") generate
        process (clk0) begin
            if (clk0'event and clk0 = '1') then
                if (ce0 = '1') then
                    q0 <= mem(to_integer(address0_tmp));
                end if;
            end if;
        end process;
    end generate read_p0_rf;

    read_p0_nc : if (PORT0 = "RWNC") generate
        process (clk0) begin
            if (clk0'event and clk0 = '1') then
                if (ce0 = '1') then
                    if (we0 = (we0'range => '0')) then
                        q0 <= mem(to_integer(address0_tmp));
                    end if;
                end if;
            end if;
        end process;
    end generate read_p0_nc;

    --read port 1
    read_p1_rf : if (PORT1 = "RO" or PORT1 = "RWRF") generate
        process (clk1) begin
            if (clk1'event and clk1 = '1') then
                if (ce1 = '1') then
                    q1 <= mem(to_integer(address1_tmp));
                end if;
            end if;
        end process;
    end generate read_p1_rf;

    read_p1_nc : if (PORT1 = "RWNC") generate
        process (clk1) begin
            if (clk1'event and clk1 = '1') then
                if (ce1 = '1') then
                    if (we1 = (we1'range => '0')) then
                        q1 <= mem(to_integer(address1_tmp));
                    end if;
                end if;
            end if;
        end process;
    end generate read_p1_nc;

    --write port 0
    write_p0 : if (PORT0 /= "RO") generate
        process (clk0)
        begin
            if (clk0'event and clk0 = '1') then
                if (ce0 = '1') then
                for i in 0 to BYTES - 1 loop
                    if (we0(i) = '1') then
                        mem(to_integer(address0_tmp))((i+1)*BYTE_WIDTH-1 downto i*BYTE_WIDTH) := d0((i+1)*BYTE_WIDTH-1 downto i*BYTE_WIDTH);
                    end if;
                end loop;
                end if;
            end if;
        end process;
    end generate write_p0;

    --write port 1
    write_p1 : if (PORT1 /= "RO") generate
        process (clk1)
        begin
            if (clk1'event and clk1 = '1') then
                if (ce1 = '1') then
                for i in 0 to BYTES - 1 loop
                    if (we1(i) = '1') then
                        mem(to_integer(address1_tmp))((i+1)*BYTE_WIDTH-1 downto i*BYTE_WIDTH) := d1((i+1)*BYTE_WIDTH-1 downto i*BYTE_WIDTH);
                    end if;
                end loop;
                end if;
            end if;
        end process;
    end generate write_p1;

end architecture behave;


