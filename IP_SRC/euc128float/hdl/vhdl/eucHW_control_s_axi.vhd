-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity eucHW_control_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 11;
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
    x_0_address0          :in   STD_LOGIC_VECTOR(2 downto 0);
    x_0_ce0               :in   STD_LOGIC;
    x_0_q0                :out  STD_LOGIC_VECTOR(31 downto 0);
    x_1_address0          :in   STD_LOGIC_VECTOR(2 downto 0);
    x_1_ce0               :in   STD_LOGIC;
    x_1_q0                :out  STD_LOGIC_VECTOR(31 downto 0);
    x_2_address0          :in   STD_LOGIC_VECTOR(2 downto 0);
    x_2_ce0               :in   STD_LOGIC;
    x_2_q0                :out  STD_LOGIC_VECTOR(31 downto 0);
    x_3_address0          :in   STD_LOGIC_VECTOR(2 downto 0);
    x_3_ce0               :in   STD_LOGIC;
    x_3_q0                :out  STD_LOGIC_VECTOR(31 downto 0);
    x_4_address0          :in   STD_LOGIC_VECTOR(2 downto 0);
    x_4_ce0               :in   STD_LOGIC;
    x_4_q0                :out  STD_LOGIC_VECTOR(31 downto 0);
    x_5_address0          :in   STD_LOGIC_VECTOR(2 downto 0);
    x_5_ce0               :in   STD_LOGIC;
    x_5_q0                :out  STD_LOGIC_VECTOR(31 downto 0);
    x_6_address0          :in   STD_LOGIC_VECTOR(2 downto 0);
    x_6_ce0               :in   STD_LOGIC;
    x_6_q0                :out  STD_LOGIC_VECTOR(31 downto 0);
    x_7_address0          :in   STD_LOGIC_VECTOR(2 downto 0);
    x_7_ce0               :in   STD_LOGIC;
    x_7_q0                :out  STD_LOGIC_VECTOR(31 downto 0);
    x_8_address0          :in   STD_LOGIC_VECTOR(2 downto 0);
    x_8_ce0               :in   STD_LOGIC;
    x_8_q0                :out  STD_LOGIC_VECTOR(31 downto 0);
    x_9_address0          :in   STD_LOGIC_VECTOR(2 downto 0);
    x_9_ce0               :in   STD_LOGIC;
    x_9_q0                :out  STD_LOGIC_VECTOR(31 downto 0);
    x_10_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_10_ce0              :in   STD_LOGIC;
    x_10_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_11_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_11_ce0              :in   STD_LOGIC;
    x_11_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_12_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_12_ce0              :in   STD_LOGIC;
    x_12_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_13_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_13_ce0              :in   STD_LOGIC;
    x_13_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_14_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_14_ce0              :in   STD_LOGIC;
    x_14_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_15_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_15_ce0              :in   STD_LOGIC;
    x_15_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_16_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_16_ce0              :in   STD_LOGIC;
    x_16_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_17_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_17_ce0              :in   STD_LOGIC;
    x_17_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_18_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_18_ce0              :in   STD_LOGIC;
    x_18_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_19_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_19_ce0              :in   STD_LOGIC;
    x_19_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_20_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_20_ce0              :in   STD_LOGIC;
    x_20_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_21_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_21_ce0              :in   STD_LOGIC;
    x_21_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_22_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_22_ce0              :in   STD_LOGIC;
    x_22_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_23_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_23_ce0              :in   STD_LOGIC;
    x_23_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_24_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_24_ce0              :in   STD_LOGIC;
    x_24_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_25_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_25_ce0              :in   STD_LOGIC;
    x_25_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_26_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_26_ce0              :in   STD_LOGIC;
    x_26_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_27_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_27_ce0              :in   STD_LOGIC;
    x_27_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_28_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_28_ce0              :in   STD_LOGIC;
    x_28_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_29_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_29_ce0              :in   STD_LOGIC;
    x_29_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_30_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_30_ce0              :in   STD_LOGIC;
    x_30_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    x_31_address0         :in   STD_LOGIC_VECTOR(2 downto 0);
    x_31_ce0              :in   STD_LOGIC;
    x_31_q0               :out  STD_LOGIC_VECTOR(31 downto 0);
    ap_start              :out  STD_LOGIC;
    ap_done               :in   STD_LOGIC;
    ap_ready              :in   STD_LOGIC;
    ap_idle               :in   STD_LOGIC
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
--         bit 0  - enable ap_done interrupt (Read/Write)
--         bit 1  - enable ap_ready interrupt (Read/Write)
--         others - reserved
-- 0x00c : IP Interrupt Status Register (Read/TOW)
--         bit 0  - ap_done (COR/TOW)
--         bit 1  - ap_ready (COR/TOW)
--         others - reserved
-- 0x010 : Data signal of y_sqrt
--         bit 31~0 - y_sqrt[31:0] (Read)
-- 0x014 : Control signal of y_sqrt
--         bit 0  - y_sqrt_ap_vld (Read/COR)
--         others - reserved
-- 0x020 ~
-- 0x03f : Memory 'x_0' (8 * 32b)
--         Word n : bit [31:0] - x_0[n]
-- 0x040 ~
-- 0x05f : Memory 'x_1' (8 * 32b)
--         Word n : bit [31:0] - x_1[n]
-- 0x060 ~
-- 0x07f : Memory 'x_2' (8 * 32b)
--         Word n : bit [31:0] - x_2[n]
-- 0x080 ~
-- 0x09f : Memory 'x_3' (8 * 32b)
--         Word n : bit [31:0] - x_3[n]
-- 0x0a0 ~
-- 0x0bf : Memory 'x_4' (8 * 32b)
--         Word n : bit [31:0] - x_4[n]
-- 0x0c0 ~
-- 0x0df : Memory 'x_5' (8 * 32b)
--         Word n : bit [31:0] - x_5[n]
-- 0x0e0 ~
-- 0x0ff : Memory 'x_6' (8 * 32b)
--         Word n : bit [31:0] - x_6[n]
-- 0x100 ~
-- 0x11f : Memory 'x_7' (8 * 32b)
--         Word n : bit [31:0] - x_7[n]
-- 0x120 ~
-- 0x13f : Memory 'x_8' (8 * 32b)
--         Word n : bit [31:0] - x_8[n]
-- 0x140 ~
-- 0x15f : Memory 'x_9' (8 * 32b)
--         Word n : bit [31:0] - x_9[n]
-- 0x160 ~
-- 0x17f : Memory 'x_10' (8 * 32b)
--         Word n : bit [31:0] - x_10[n]
-- 0x180 ~
-- 0x19f : Memory 'x_11' (8 * 32b)
--         Word n : bit [31:0] - x_11[n]
-- 0x1a0 ~
-- 0x1bf : Memory 'x_12' (8 * 32b)
--         Word n : bit [31:0] - x_12[n]
-- 0x1c0 ~
-- 0x1df : Memory 'x_13' (8 * 32b)
--         Word n : bit [31:0] - x_13[n]
-- 0x1e0 ~
-- 0x1ff : Memory 'x_14' (8 * 32b)
--         Word n : bit [31:0] - x_14[n]
-- 0x200 ~
-- 0x21f : Memory 'x_15' (8 * 32b)
--         Word n : bit [31:0] - x_15[n]
-- 0x220 ~
-- 0x23f : Memory 'x_16' (8 * 32b)
--         Word n : bit [31:0] - x_16[n]
-- 0x240 ~
-- 0x25f : Memory 'x_17' (8 * 32b)
--         Word n : bit [31:0] - x_17[n]
-- 0x260 ~
-- 0x27f : Memory 'x_18' (8 * 32b)
--         Word n : bit [31:0] - x_18[n]
-- 0x280 ~
-- 0x29f : Memory 'x_19' (8 * 32b)
--         Word n : bit [31:0] - x_19[n]
-- 0x2a0 ~
-- 0x2bf : Memory 'x_20' (8 * 32b)
--         Word n : bit [31:0] - x_20[n]
-- 0x2c0 ~
-- 0x2df : Memory 'x_21' (8 * 32b)
--         Word n : bit [31:0] - x_21[n]
-- 0x2e0 ~
-- 0x2ff : Memory 'x_22' (8 * 32b)
--         Word n : bit [31:0] - x_22[n]
-- 0x300 ~
-- 0x31f : Memory 'x_23' (8 * 32b)
--         Word n : bit [31:0] - x_23[n]
-- 0x320 ~
-- 0x33f : Memory 'x_24' (8 * 32b)
--         Word n : bit [31:0] - x_24[n]
-- 0x340 ~
-- 0x35f : Memory 'x_25' (8 * 32b)
--         Word n : bit [31:0] - x_25[n]
-- 0x360 ~
-- 0x37f : Memory 'x_26' (8 * 32b)
--         Word n : bit [31:0] - x_26[n]
-- 0x380 ~
-- 0x39f : Memory 'x_27' (8 * 32b)
--         Word n : bit [31:0] - x_27[n]
-- 0x3a0 ~
-- 0x3bf : Memory 'x_28' (8 * 32b)
--         Word n : bit [31:0] - x_28[n]
-- 0x3c0 ~
-- 0x3df : Memory 'x_29' (8 * 32b)
--         Word n : bit [31:0] - x_29[n]
-- 0x3e0 ~
-- 0x3ff : Memory 'x_30' (8 * 32b)
--         Word n : bit [31:0] - x_30[n]
-- 0x400 ~
-- 0x41f : Memory 'x_31' (8 * 32b)
--         Word n : bit [31:0] - x_31[n]
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
    constant ADDR_X_0_HIGH      : INTEGER := 16#03f#;
    constant ADDR_X_1_BASE      : INTEGER := 16#040#;
    constant ADDR_X_1_HIGH      : INTEGER := 16#05f#;
    constant ADDR_X_2_BASE      : INTEGER := 16#060#;
    constant ADDR_X_2_HIGH      : INTEGER := 16#07f#;
    constant ADDR_X_3_BASE      : INTEGER := 16#080#;
    constant ADDR_X_3_HIGH      : INTEGER := 16#09f#;
    constant ADDR_X_4_BASE      : INTEGER := 16#0a0#;
    constant ADDR_X_4_HIGH      : INTEGER := 16#0bf#;
    constant ADDR_X_5_BASE      : INTEGER := 16#0c0#;
    constant ADDR_X_5_HIGH      : INTEGER := 16#0df#;
    constant ADDR_X_6_BASE      : INTEGER := 16#0e0#;
    constant ADDR_X_6_HIGH      : INTEGER := 16#0ff#;
    constant ADDR_X_7_BASE      : INTEGER := 16#100#;
    constant ADDR_X_7_HIGH      : INTEGER := 16#11f#;
    constant ADDR_X_8_BASE      : INTEGER := 16#120#;
    constant ADDR_X_8_HIGH      : INTEGER := 16#13f#;
    constant ADDR_X_9_BASE      : INTEGER := 16#140#;
    constant ADDR_X_9_HIGH      : INTEGER := 16#15f#;
    constant ADDR_X_10_BASE     : INTEGER := 16#160#;
    constant ADDR_X_10_HIGH     : INTEGER := 16#17f#;
    constant ADDR_X_11_BASE     : INTEGER := 16#180#;
    constant ADDR_X_11_HIGH     : INTEGER := 16#19f#;
    constant ADDR_X_12_BASE     : INTEGER := 16#1a0#;
    constant ADDR_X_12_HIGH     : INTEGER := 16#1bf#;
    constant ADDR_X_13_BASE     : INTEGER := 16#1c0#;
    constant ADDR_X_13_HIGH     : INTEGER := 16#1df#;
    constant ADDR_X_14_BASE     : INTEGER := 16#1e0#;
    constant ADDR_X_14_HIGH     : INTEGER := 16#1ff#;
    constant ADDR_X_15_BASE     : INTEGER := 16#200#;
    constant ADDR_X_15_HIGH     : INTEGER := 16#21f#;
    constant ADDR_X_16_BASE     : INTEGER := 16#220#;
    constant ADDR_X_16_HIGH     : INTEGER := 16#23f#;
    constant ADDR_X_17_BASE     : INTEGER := 16#240#;
    constant ADDR_X_17_HIGH     : INTEGER := 16#25f#;
    constant ADDR_X_18_BASE     : INTEGER := 16#260#;
    constant ADDR_X_18_HIGH     : INTEGER := 16#27f#;
    constant ADDR_X_19_BASE     : INTEGER := 16#280#;
    constant ADDR_X_19_HIGH     : INTEGER := 16#29f#;
    constant ADDR_X_20_BASE     : INTEGER := 16#2a0#;
    constant ADDR_X_20_HIGH     : INTEGER := 16#2bf#;
    constant ADDR_X_21_BASE     : INTEGER := 16#2c0#;
    constant ADDR_X_21_HIGH     : INTEGER := 16#2df#;
    constant ADDR_X_22_BASE     : INTEGER := 16#2e0#;
    constant ADDR_X_22_HIGH     : INTEGER := 16#2ff#;
    constant ADDR_X_23_BASE     : INTEGER := 16#300#;
    constant ADDR_X_23_HIGH     : INTEGER := 16#31f#;
    constant ADDR_X_24_BASE     : INTEGER := 16#320#;
    constant ADDR_X_24_HIGH     : INTEGER := 16#33f#;
    constant ADDR_X_25_BASE     : INTEGER := 16#340#;
    constant ADDR_X_25_HIGH     : INTEGER := 16#35f#;
    constant ADDR_X_26_BASE     : INTEGER := 16#360#;
    constant ADDR_X_26_HIGH     : INTEGER := 16#37f#;
    constant ADDR_X_27_BASE     : INTEGER := 16#380#;
    constant ADDR_X_27_HIGH     : INTEGER := 16#39f#;
    constant ADDR_X_28_BASE     : INTEGER := 16#3a0#;
    constant ADDR_X_28_HIGH     : INTEGER := 16#3bf#;
    constant ADDR_X_29_BASE     : INTEGER := 16#3c0#;
    constant ADDR_X_29_HIGH     : INTEGER := 16#3df#;
    constant ADDR_X_30_BASE     : INTEGER := 16#3e0#;
    constant ADDR_X_30_HIGH     : INTEGER := 16#3ff#;
    constant ADDR_X_31_BASE     : INTEGER := 16#400#;
    constant ADDR_X_31_HIGH     : INTEGER := 16#41f#;
    constant ADDR_BITS         : INTEGER := 11;

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
    signal int_ier             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_isr             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_y_sqrt_ap_vld   : STD_LOGIC;
    signal int_y_sqrt          : UNSIGNED(31 downto 0) := (others => '0');
    -- memory signals
    signal int_x_0_address0    : UNSIGNED(2 downto 0);
    signal int_x_0_ce0         : STD_LOGIC;
    signal int_x_0_q0          : UNSIGNED(31 downto 0);
    signal int_x_0_address1    : UNSIGNED(2 downto 0);
    signal int_x_0_ce1         : STD_LOGIC;
    signal int_x_0_we1         : STD_LOGIC;
    signal int_x_0_be1         : UNSIGNED(3 downto 0);
    signal int_x_0_d1          : UNSIGNED(31 downto 0);
    signal int_x_0_q1          : UNSIGNED(31 downto 0);
    signal int_x_0_read        : STD_LOGIC;
    signal int_x_0_write       : STD_LOGIC;
    signal int_x_1_address0    : UNSIGNED(2 downto 0);
    signal int_x_1_ce0         : STD_LOGIC;
    signal int_x_1_q0          : UNSIGNED(31 downto 0);
    signal int_x_1_address1    : UNSIGNED(2 downto 0);
    signal int_x_1_ce1         : STD_LOGIC;
    signal int_x_1_we1         : STD_LOGIC;
    signal int_x_1_be1         : UNSIGNED(3 downto 0);
    signal int_x_1_d1          : UNSIGNED(31 downto 0);
    signal int_x_1_q1          : UNSIGNED(31 downto 0);
    signal int_x_1_read        : STD_LOGIC;
    signal int_x_1_write       : STD_LOGIC;
    signal int_x_2_address0    : UNSIGNED(2 downto 0);
    signal int_x_2_ce0         : STD_LOGIC;
    signal int_x_2_q0          : UNSIGNED(31 downto 0);
    signal int_x_2_address1    : UNSIGNED(2 downto 0);
    signal int_x_2_ce1         : STD_LOGIC;
    signal int_x_2_we1         : STD_LOGIC;
    signal int_x_2_be1         : UNSIGNED(3 downto 0);
    signal int_x_2_d1          : UNSIGNED(31 downto 0);
    signal int_x_2_q1          : UNSIGNED(31 downto 0);
    signal int_x_2_read        : STD_LOGIC;
    signal int_x_2_write       : STD_LOGIC;
    signal int_x_3_address0    : UNSIGNED(2 downto 0);
    signal int_x_3_ce0         : STD_LOGIC;
    signal int_x_3_q0          : UNSIGNED(31 downto 0);
    signal int_x_3_address1    : UNSIGNED(2 downto 0);
    signal int_x_3_ce1         : STD_LOGIC;
    signal int_x_3_we1         : STD_LOGIC;
    signal int_x_3_be1         : UNSIGNED(3 downto 0);
    signal int_x_3_d1          : UNSIGNED(31 downto 0);
    signal int_x_3_q1          : UNSIGNED(31 downto 0);
    signal int_x_3_read        : STD_LOGIC;
    signal int_x_3_write       : STD_LOGIC;
    signal int_x_4_address0    : UNSIGNED(2 downto 0);
    signal int_x_4_ce0         : STD_LOGIC;
    signal int_x_4_q0          : UNSIGNED(31 downto 0);
    signal int_x_4_address1    : UNSIGNED(2 downto 0);
    signal int_x_4_ce1         : STD_LOGIC;
    signal int_x_4_we1         : STD_LOGIC;
    signal int_x_4_be1         : UNSIGNED(3 downto 0);
    signal int_x_4_d1          : UNSIGNED(31 downto 0);
    signal int_x_4_q1          : UNSIGNED(31 downto 0);
    signal int_x_4_read        : STD_LOGIC;
    signal int_x_4_write       : STD_LOGIC;
    signal int_x_5_address0    : UNSIGNED(2 downto 0);
    signal int_x_5_ce0         : STD_LOGIC;
    signal int_x_5_q0          : UNSIGNED(31 downto 0);
    signal int_x_5_address1    : UNSIGNED(2 downto 0);
    signal int_x_5_ce1         : STD_LOGIC;
    signal int_x_5_we1         : STD_LOGIC;
    signal int_x_5_be1         : UNSIGNED(3 downto 0);
    signal int_x_5_d1          : UNSIGNED(31 downto 0);
    signal int_x_5_q1          : UNSIGNED(31 downto 0);
    signal int_x_5_read        : STD_LOGIC;
    signal int_x_5_write       : STD_LOGIC;
    signal int_x_6_address0    : UNSIGNED(2 downto 0);
    signal int_x_6_ce0         : STD_LOGIC;
    signal int_x_6_q0          : UNSIGNED(31 downto 0);
    signal int_x_6_address1    : UNSIGNED(2 downto 0);
    signal int_x_6_ce1         : STD_LOGIC;
    signal int_x_6_we1         : STD_LOGIC;
    signal int_x_6_be1         : UNSIGNED(3 downto 0);
    signal int_x_6_d1          : UNSIGNED(31 downto 0);
    signal int_x_6_q1          : UNSIGNED(31 downto 0);
    signal int_x_6_read        : STD_LOGIC;
    signal int_x_6_write       : STD_LOGIC;
    signal int_x_7_address0    : UNSIGNED(2 downto 0);
    signal int_x_7_ce0         : STD_LOGIC;
    signal int_x_7_q0          : UNSIGNED(31 downto 0);
    signal int_x_7_address1    : UNSIGNED(2 downto 0);
    signal int_x_7_ce1         : STD_LOGIC;
    signal int_x_7_we1         : STD_LOGIC;
    signal int_x_7_be1         : UNSIGNED(3 downto 0);
    signal int_x_7_d1          : UNSIGNED(31 downto 0);
    signal int_x_7_q1          : UNSIGNED(31 downto 0);
    signal int_x_7_read        : STD_LOGIC;
    signal int_x_7_write       : STD_LOGIC;
    signal int_x_8_address0    : UNSIGNED(2 downto 0);
    signal int_x_8_ce0         : STD_LOGIC;
    signal int_x_8_q0          : UNSIGNED(31 downto 0);
    signal int_x_8_address1    : UNSIGNED(2 downto 0);
    signal int_x_8_ce1         : STD_LOGIC;
    signal int_x_8_we1         : STD_LOGIC;
    signal int_x_8_be1         : UNSIGNED(3 downto 0);
    signal int_x_8_d1          : UNSIGNED(31 downto 0);
    signal int_x_8_q1          : UNSIGNED(31 downto 0);
    signal int_x_8_read        : STD_LOGIC;
    signal int_x_8_write       : STD_LOGIC;
    signal int_x_9_address0    : UNSIGNED(2 downto 0);
    signal int_x_9_ce0         : STD_LOGIC;
    signal int_x_9_q0          : UNSIGNED(31 downto 0);
    signal int_x_9_address1    : UNSIGNED(2 downto 0);
    signal int_x_9_ce1         : STD_LOGIC;
    signal int_x_9_we1         : STD_LOGIC;
    signal int_x_9_be1         : UNSIGNED(3 downto 0);
    signal int_x_9_d1          : UNSIGNED(31 downto 0);
    signal int_x_9_q1          : UNSIGNED(31 downto 0);
    signal int_x_9_read        : STD_LOGIC;
    signal int_x_9_write       : STD_LOGIC;
    signal int_x_10_address0   : UNSIGNED(2 downto 0);
    signal int_x_10_ce0        : STD_LOGIC;
    signal int_x_10_q0         : UNSIGNED(31 downto 0);
    signal int_x_10_address1   : UNSIGNED(2 downto 0);
    signal int_x_10_ce1        : STD_LOGIC;
    signal int_x_10_we1        : STD_LOGIC;
    signal int_x_10_be1        : UNSIGNED(3 downto 0);
    signal int_x_10_d1         : UNSIGNED(31 downto 0);
    signal int_x_10_q1         : UNSIGNED(31 downto 0);
    signal int_x_10_read       : STD_LOGIC;
    signal int_x_10_write      : STD_LOGIC;
    signal int_x_11_address0   : UNSIGNED(2 downto 0);
    signal int_x_11_ce0        : STD_LOGIC;
    signal int_x_11_q0         : UNSIGNED(31 downto 0);
    signal int_x_11_address1   : UNSIGNED(2 downto 0);
    signal int_x_11_ce1        : STD_LOGIC;
    signal int_x_11_we1        : STD_LOGIC;
    signal int_x_11_be1        : UNSIGNED(3 downto 0);
    signal int_x_11_d1         : UNSIGNED(31 downto 0);
    signal int_x_11_q1         : UNSIGNED(31 downto 0);
    signal int_x_11_read       : STD_LOGIC;
    signal int_x_11_write      : STD_LOGIC;
    signal int_x_12_address0   : UNSIGNED(2 downto 0);
    signal int_x_12_ce0        : STD_LOGIC;
    signal int_x_12_q0         : UNSIGNED(31 downto 0);
    signal int_x_12_address1   : UNSIGNED(2 downto 0);
    signal int_x_12_ce1        : STD_LOGIC;
    signal int_x_12_we1        : STD_LOGIC;
    signal int_x_12_be1        : UNSIGNED(3 downto 0);
    signal int_x_12_d1         : UNSIGNED(31 downto 0);
    signal int_x_12_q1         : UNSIGNED(31 downto 0);
    signal int_x_12_read       : STD_LOGIC;
    signal int_x_12_write      : STD_LOGIC;
    signal int_x_13_address0   : UNSIGNED(2 downto 0);
    signal int_x_13_ce0        : STD_LOGIC;
    signal int_x_13_q0         : UNSIGNED(31 downto 0);
    signal int_x_13_address1   : UNSIGNED(2 downto 0);
    signal int_x_13_ce1        : STD_LOGIC;
    signal int_x_13_we1        : STD_LOGIC;
    signal int_x_13_be1        : UNSIGNED(3 downto 0);
    signal int_x_13_d1         : UNSIGNED(31 downto 0);
    signal int_x_13_q1         : UNSIGNED(31 downto 0);
    signal int_x_13_read       : STD_LOGIC;
    signal int_x_13_write      : STD_LOGIC;
    signal int_x_14_address0   : UNSIGNED(2 downto 0);
    signal int_x_14_ce0        : STD_LOGIC;
    signal int_x_14_q0         : UNSIGNED(31 downto 0);
    signal int_x_14_address1   : UNSIGNED(2 downto 0);
    signal int_x_14_ce1        : STD_LOGIC;
    signal int_x_14_we1        : STD_LOGIC;
    signal int_x_14_be1        : UNSIGNED(3 downto 0);
    signal int_x_14_d1         : UNSIGNED(31 downto 0);
    signal int_x_14_q1         : UNSIGNED(31 downto 0);
    signal int_x_14_read       : STD_LOGIC;
    signal int_x_14_write      : STD_LOGIC;
    signal int_x_15_address0   : UNSIGNED(2 downto 0);
    signal int_x_15_ce0        : STD_LOGIC;
    signal int_x_15_q0         : UNSIGNED(31 downto 0);
    signal int_x_15_address1   : UNSIGNED(2 downto 0);
    signal int_x_15_ce1        : STD_LOGIC;
    signal int_x_15_we1        : STD_LOGIC;
    signal int_x_15_be1        : UNSIGNED(3 downto 0);
    signal int_x_15_d1         : UNSIGNED(31 downto 0);
    signal int_x_15_q1         : UNSIGNED(31 downto 0);
    signal int_x_15_read       : STD_LOGIC;
    signal int_x_15_write      : STD_LOGIC;
    signal int_x_16_address0   : UNSIGNED(2 downto 0);
    signal int_x_16_ce0        : STD_LOGIC;
    signal int_x_16_q0         : UNSIGNED(31 downto 0);
    signal int_x_16_address1   : UNSIGNED(2 downto 0);
    signal int_x_16_ce1        : STD_LOGIC;
    signal int_x_16_we1        : STD_LOGIC;
    signal int_x_16_be1        : UNSIGNED(3 downto 0);
    signal int_x_16_d1         : UNSIGNED(31 downto 0);
    signal int_x_16_q1         : UNSIGNED(31 downto 0);
    signal int_x_16_read       : STD_LOGIC;
    signal int_x_16_write      : STD_LOGIC;
    signal int_x_17_address0   : UNSIGNED(2 downto 0);
    signal int_x_17_ce0        : STD_LOGIC;
    signal int_x_17_q0         : UNSIGNED(31 downto 0);
    signal int_x_17_address1   : UNSIGNED(2 downto 0);
    signal int_x_17_ce1        : STD_LOGIC;
    signal int_x_17_we1        : STD_LOGIC;
    signal int_x_17_be1        : UNSIGNED(3 downto 0);
    signal int_x_17_d1         : UNSIGNED(31 downto 0);
    signal int_x_17_q1         : UNSIGNED(31 downto 0);
    signal int_x_17_read       : STD_LOGIC;
    signal int_x_17_write      : STD_LOGIC;
    signal int_x_18_address0   : UNSIGNED(2 downto 0);
    signal int_x_18_ce0        : STD_LOGIC;
    signal int_x_18_q0         : UNSIGNED(31 downto 0);
    signal int_x_18_address1   : UNSIGNED(2 downto 0);
    signal int_x_18_ce1        : STD_LOGIC;
    signal int_x_18_we1        : STD_LOGIC;
    signal int_x_18_be1        : UNSIGNED(3 downto 0);
    signal int_x_18_d1         : UNSIGNED(31 downto 0);
    signal int_x_18_q1         : UNSIGNED(31 downto 0);
    signal int_x_18_read       : STD_LOGIC;
    signal int_x_18_write      : STD_LOGIC;
    signal int_x_19_address0   : UNSIGNED(2 downto 0);
    signal int_x_19_ce0        : STD_LOGIC;
    signal int_x_19_q0         : UNSIGNED(31 downto 0);
    signal int_x_19_address1   : UNSIGNED(2 downto 0);
    signal int_x_19_ce1        : STD_LOGIC;
    signal int_x_19_we1        : STD_LOGIC;
    signal int_x_19_be1        : UNSIGNED(3 downto 0);
    signal int_x_19_d1         : UNSIGNED(31 downto 0);
    signal int_x_19_q1         : UNSIGNED(31 downto 0);
    signal int_x_19_read       : STD_LOGIC;
    signal int_x_19_write      : STD_LOGIC;
    signal int_x_20_address0   : UNSIGNED(2 downto 0);
    signal int_x_20_ce0        : STD_LOGIC;
    signal int_x_20_q0         : UNSIGNED(31 downto 0);
    signal int_x_20_address1   : UNSIGNED(2 downto 0);
    signal int_x_20_ce1        : STD_LOGIC;
    signal int_x_20_we1        : STD_LOGIC;
    signal int_x_20_be1        : UNSIGNED(3 downto 0);
    signal int_x_20_d1         : UNSIGNED(31 downto 0);
    signal int_x_20_q1         : UNSIGNED(31 downto 0);
    signal int_x_20_read       : STD_LOGIC;
    signal int_x_20_write      : STD_LOGIC;
    signal int_x_21_address0   : UNSIGNED(2 downto 0);
    signal int_x_21_ce0        : STD_LOGIC;
    signal int_x_21_q0         : UNSIGNED(31 downto 0);
    signal int_x_21_address1   : UNSIGNED(2 downto 0);
    signal int_x_21_ce1        : STD_LOGIC;
    signal int_x_21_we1        : STD_LOGIC;
    signal int_x_21_be1        : UNSIGNED(3 downto 0);
    signal int_x_21_d1         : UNSIGNED(31 downto 0);
    signal int_x_21_q1         : UNSIGNED(31 downto 0);
    signal int_x_21_read       : STD_LOGIC;
    signal int_x_21_write      : STD_LOGIC;
    signal int_x_22_address0   : UNSIGNED(2 downto 0);
    signal int_x_22_ce0        : STD_LOGIC;
    signal int_x_22_q0         : UNSIGNED(31 downto 0);
    signal int_x_22_address1   : UNSIGNED(2 downto 0);
    signal int_x_22_ce1        : STD_LOGIC;
    signal int_x_22_we1        : STD_LOGIC;
    signal int_x_22_be1        : UNSIGNED(3 downto 0);
    signal int_x_22_d1         : UNSIGNED(31 downto 0);
    signal int_x_22_q1         : UNSIGNED(31 downto 0);
    signal int_x_22_read       : STD_LOGIC;
    signal int_x_22_write      : STD_LOGIC;
    signal int_x_23_address0   : UNSIGNED(2 downto 0);
    signal int_x_23_ce0        : STD_LOGIC;
    signal int_x_23_q0         : UNSIGNED(31 downto 0);
    signal int_x_23_address1   : UNSIGNED(2 downto 0);
    signal int_x_23_ce1        : STD_LOGIC;
    signal int_x_23_we1        : STD_LOGIC;
    signal int_x_23_be1        : UNSIGNED(3 downto 0);
    signal int_x_23_d1         : UNSIGNED(31 downto 0);
    signal int_x_23_q1         : UNSIGNED(31 downto 0);
    signal int_x_23_read       : STD_LOGIC;
    signal int_x_23_write      : STD_LOGIC;
    signal int_x_24_address0   : UNSIGNED(2 downto 0);
    signal int_x_24_ce0        : STD_LOGIC;
    signal int_x_24_q0         : UNSIGNED(31 downto 0);
    signal int_x_24_address1   : UNSIGNED(2 downto 0);
    signal int_x_24_ce1        : STD_LOGIC;
    signal int_x_24_we1        : STD_LOGIC;
    signal int_x_24_be1        : UNSIGNED(3 downto 0);
    signal int_x_24_d1         : UNSIGNED(31 downto 0);
    signal int_x_24_q1         : UNSIGNED(31 downto 0);
    signal int_x_24_read       : STD_LOGIC;
    signal int_x_24_write      : STD_LOGIC;
    signal int_x_25_address0   : UNSIGNED(2 downto 0);
    signal int_x_25_ce0        : STD_LOGIC;
    signal int_x_25_q0         : UNSIGNED(31 downto 0);
    signal int_x_25_address1   : UNSIGNED(2 downto 0);
    signal int_x_25_ce1        : STD_LOGIC;
    signal int_x_25_we1        : STD_LOGIC;
    signal int_x_25_be1        : UNSIGNED(3 downto 0);
    signal int_x_25_d1         : UNSIGNED(31 downto 0);
    signal int_x_25_q1         : UNSIGNED(31 downto 0);
    signal int_x_25_read       : STD_LOGIC;
    signal int_x_25_write      : STD_LOGIC;
    signal int_x_26_address0   : UNSIGNED(2 downto 0);
    signal int_x_26_ce0        : STD_LOGIC;
    signal int_x_26_q0         : UNSIGNED(31 downto 0);
    signal int_x_26_address1   : UNSIGNED(2 downto 0);
    signal int_x_26_ce1        : STD_LOGIC;
    signal int_x_26_we1        : STD_LOGIC;
    signal int_x_26_be1        : UNSIGNED(3 downto 0);
    signal int_x_26_d1         : UNSIGNED(31 downto 0);
    signal int_x_26_q1         : UNSIGNED(31 downto 0);
    signal int_x_26_read       : STD_LOGIC;
    signal int_x_26_write      : STD_LOGIC;
    signal int_x_27_address0   : UNSIGNED(2 downto 0);
    signal int_x_27_ce0        : STD_LOGIC;
    signal int_x_27_q0         : UNSIGNED(31 downto 0);
    signal int_x_27_address1   : UNSIGNED(2 downto 0);
    signal int_x_27_ce1        : STD_LOGIC;
    signal int_x_27_we1        : STD_LOGIC;
    signal int_x_27_be1        : UNSIGNED(3 downto 0);
    signal int_x_27_d1         : UNSIGNED(31 downto 0);
    signal int_x_27_q1         : UNSIGNED(31 downto 0);
    signal int_x_27_read       : STD_LOGIC;
    signal int_x_27_write      : STD_LOGIC;
    signal int_x_28_address0   : UNSIGNED(2 downto 0);
    signal int_x_28_ce0        : STD_LOGIC;
    signal int_x_28_q0         : UNSIGNED(31 downto 0);
    signal int_x_28_address1   : UNSIGNED(2 downto 0);
    signal int_x_28_ce1        : STD_LOGIC;
    signal int_x_28_we1        : STD_LOGIC;
    signal int_x_28_be1        : UNSIGNED(3 downto 0);
    signal int_x_28_d1         : UNSIGNED(31 downto 0);
    signal int_x_28_q1         : UNSIGNED(31 downto 0);
    signal int_x_28_read       : STD_LOGIC;
    signal int_x_28_write      : STD_LOGIC;
    signal int_x_29_address0   : UNSIGNED(2 downto 0);
    signal int_x_29_ce0        : STD_LOGIC;
    signal int_x_29_q0         : UNSIGNED(31 downto 0);
    signal int_x_29_address1   : UNSIGNED(2 downto 0);
    signal int_x_29_ce1        : STD_LOGIC;
    signal int_x_29_we1        : STD_LOGIC;
    signal int_x_29_be1        : UNSIGNED(3 downto 0);
    signal int_x_29_d1         : UNSIGNED(31 downto 0);
    signal int_x_29_q1         : UNSIGNED(31 downto 0);
    signal int_x_29_read       : STD_LOGIC;
    signal int_x_29_write      : STD_LOGIC;
    signal int_x_30_address0   : UNSIGNED(2 downto 0);
    signal int_x_30_ce0        : STD_LOGIC;
    signal int_x_30_q0         : UNSIGNED(31 downto 0);
    signal int_x_30_address1   : UNSIGNED(2 downto 0);
    signal int_x_30_ce1        : STD_LOGIC;
    signal int_x_30_we1        : STD_LOGIC;
    signal int_x_30_be1        : UNSIGNED(3 downto 0);
    signal int_x_30_d1         : UNSIGNED(31 downto 0);
    signal int_x_30_q1         : UNSIGNED(31 downto 0);
    signal int_x_30_read       : STD_LOGIC;
    signal int_x_30_write      : STD_LOGIC;
    signal int_x_31_address0   : UNSIGNED(2 downto 0);
    signal int_x_31_ce0        : STD_LOGIC;
    signal int_x_31_q0         : UNSIGNED(31 downto 0);
    signal int_x_31_address1   : UNSIGNED(2 downto 0);
    signal int_x_31_ce1        : STD_LOGIC;
    signal int_x_31_we1        : STD_LOGIC;
    signal int_x_31_be1        : UNSIGNED(3 downto 0);
    signal int_x_31_d1         : UNSIGNED(31 downto 0);
    signal int_x_31_q1         : UNSIGNED(31 downto 0);
    signal int_x_31_read       : STD_LOGIC;
    signal int_x_31_write      : STD_LOGIC;

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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
     DEPTH     => 8,
     AWIDTH    => log2(8))
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
    RVALID_t  <= '1' when (rstate = rddata) and (int_x_0_read = '0') and (int_x_1_read = '0') and (int_x_2_read = '0') and (int_x_3_read = '0') and (int_x_4_read = '0') and (int_x_5_read = '0') and (int_x_6_read = '0') and (int_x_7_read = '0') and (int_x_8_read = '0') and (int_x_9_read = '0') and (int_x_10_read = '0') and (int_x_11_read = '0') and (int_x_12_read = '0') and (int_x_13_read = '0') and (int_x_14_read = '0') and (int_x_15_read = '0') and (int_x_16_read = '0') and (int_x_17_read = '0') and (int_x_18_read = '0') and (int_x_19_read = '0') and (int_x_20_read = '0') and (int_x_21_read = '0') and (int_x_22_read = '0') and (int_x_23_read = '0') and (int_x_24_read = '0') and (int_x_25_read = '0') and (int_x_26_read = '0') and (int_x_27_read = '0') and (int_x_28_read = '0') and (int_x_29_read = '0') and (int_x_30_read = '0') and (int_x_31_read = '0') else '0';
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
                        rdata_data(1 downto 0) <= int_ier;
                    when ADDR_ISR =>
                        rdata_data(1 downto 0) <= int_isr;
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
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    interrupt            <= int_gie and (int_isr(0) or int_isr(1));
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
                int_ier <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_IER and WSTRB(0) = '1') then
                    int_ier <= UNSIGNED(WDATA(1 downto 0));
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
    int_x_0_address0     <= UNSIGNED(x_0_address0);
    int_x_0_ce0          <= x_0_ce0;
    x_0_q0               <= STD_LOGIC_VECTOR(RESIZE(int_x_0_q0, 32));
    int_x_0_address1     <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_0_ce1          <= '1' when ar_hs = '1' or (int_x_0_write = '1' and WVALID  = '1') else '0';
    int_x_0_we1          <= '1' when int_x_0_write = '1' and w_hs = '1' else '0';
    int_x_0_be1          <= UNSIGNED(WSTRB) when int_x_0_we1 = '1' else (others=>'0');
    int_x_0_d1           <= UNSIGNED(WDATA);
    -- x_1
    int_x_1_address0     <= UNSIGNED(x_1_address0);
    int_x_1_ce0          <= x_1_ce0;
    x_1_q0               <= STD_LOGIC_VECTOR(RESIZE(int_x_1_q0, 32));
    int_x_1_address1     <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_1_ce1          <= '1' when ar_hs = '1' or (int_x_1_write = '1' and WVALID  = '1') else '0';
    int_x_1_we1          <= '1' when int_x_1_write = '1' and w_hs = '1' else '0';
    int_x_1_be1          <= UNSIGNED(WSTRB) when int_x_1_we1 = '1' else (others=>'0');
    int_x_1_d1           <= UNSIGNED(WDATA);
    -- x_2
    int_x_2_address0     <= UNSIGNED(x_2_address0);
    int_x_2_ce0          <= x_2_ce0;
    x_2_q0               <= STD_LOGIC_VECTOR(RESIZE(int_x_2_q0, 32));
    int_x_2_address1     <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_2_ce1          <= '1' when ar_hs = '1' or (int_x_2_write = '1' and WVALID  = '1') else '0';
    int_x_2_we1          <= '1' when int_x_2_write = '1' and w_hs = '1' else '0';
    int_x_2_be1          <= UNSIGNED(WSTRB) when int_x_2_we1 = '1' else (others=>'0');
    int_x_2_d1           <= UNSIGNED(WDATA);
    -- x_3
    int_x_3_address0     <= UNSIGNED(x_3_address0);
    int_x_3_ce0          <= x_3_ce0;
    x_3_q0               <= STD_LOGIC_VECTOR(RESIZE(int_x_3_q0, 32));
    int_x_3_address1     <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_3_ce1          <= '1' when ar_hs = '1' or (int_x_3_write = '1' and WVALID  = '1') else '0';
    int_x_3_we1          <= '1' when int_x_3_write = '1' and w_hs = '1' else '0';
    int_x_3_be1          <= UNSIGNED(WSTRB) when int_x_3_we1 = '1' else (others=>'0');
    int_x_3_d1           <= UNSIGNED(WDATA);
    -- x_4
    int_x_4_address0     <= UNSIGNED(x_4_address0);
    int_x_4_ce0          <= x_4_ce0;
    x_4_q0               <= STD_LOGIC_VECTOR(RESIZE(int_x_4_q0, 32));
    int_x_4_address1     <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_4_ce1          <= '1' when ar_hs = '1' or (int_x_4_write = '1' and WVALID  = '1') else '0';
    int_x_4_we1          <= '1' when int_x_4_write = '1' and w_hs = '1' else '0';
    int_x_4_be1          <= UNSIGNED(WSTRB) when int_x_4_we1 = '1' else (others=>'0');
    int_x_4_d1           <= UNSIGNED(WDATA);
    -- x_5
    int_x_5_address0     <= UNSIGNED(x_5_address0);
    int_x_5_ce0          <= x_5_ce0;
    x_5_q0               <= STD_LOGIC_VECTOR(RESIZE(int_x_5_q0, 32));
    int_x_5_address1     <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_5_ce1          <= '1' when ar_hs = '1' or (int_x_5_write = '1' and WVALID  = '1') else '0';
    int_x_5_we1          <= '1' when int_x_5_write = '1' and w_hs = '1' else '0';
    int_x_5_be1          <= UNSIGNED(WSTRB) when int_x_5_we1 = '1' else (others=>'0');
    int_x_5_d1           <= UNSIGNED(WDATA);
    -- x_6
    int_x_6_address0     <= UNSIGNED(x_6_address0);
    int_x_6_ce0          <= x_6_ce0;
    x_6_q0               <= STD_LOGIC_VECTOR(RESIZE(int_x_6_q0, 32));
    int_x_6_address1     <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_6_ce1          <= '1' when ar_hs = '1' or (int_x_6_write = '1' and WVALID  = '1') else '0';
    int_x_6_we1          <= '1' when int_x_6_write = '1' and w_hs = '1' else '0';
    int_x_6_be1          <= UNSIGNED(WSTRB) when int_x_6_we1 = '1' else (others=>'0');
    int_x_6_d1           <= UNSIGNED(WDATA);
    -- x_7
    int_x_7_address0     <= UNSIGNED(x_7_address0);
    int_x_7_ce0          <= x_7_ce0;
    x_7_q0               <= STD_LOGIC_VECTOR(RESIZE(int_x_7_q0, 32));
    int_x_7_address1     <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_7_ce1          <= '1' when ar_hs = '1' or (int_x_7_write = '1' and WVALID  = '1') else '0';
    int_x_7_we1          <= '1' when int_x_7_write = '1' and w_hs = '1' else '0';
    int_x_7_be1          <= UNSIGNED(WSTRB) when int_x_7_we1 = '1' else (others=>'0');
    int_x_7_d1           <= UNSIGNED(WDATA);
    -- x_8
    int_x_8_address0     <= UNSIGNED(x_8_address0);
    int_x_8_ce0          <= x_8_ce0;
    x_8_q0               <= STD_LOGIC_VECTOR(RESIZE(int_x_8_q0, 32));
    int_x_8_address1     <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_8_ce1          <= '1' when ar_hs = '1' or (int_x_8_write = '1' and WVALID  = '1') else '0';
    int_x_8_we1          <= '1' when int_x_8_write = '1' and w_hs = '1' else '0';
    int_x_8_be1          <= UNSIGNED(WSTRB) when int_x_8_we1 = '1' else (others=>'0');
    int_x_8_d1           <= UNSIGNED(WDATA);
    -- x_9
    int_x_9_address0     <= UNSIGNED(x_9_address0);
    int_x_9_ce0          <= x_9_ce0;
    x_9_q0               <= STD_LOGIC_VECTOR(RESIZE(int_x_9_q0, 32));
    int_x_9_address1     <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_9_ce1          <= '1' when ar_hs = '1' or (int_x_9_write = '1' and WVALID  = '1') else '0';
    int_x_9_we1          <= '1' when int_x_9_write = '1' and w_hs = '1' else '0';
    int_x_9_be1          <= UNSIGNED(WSTRB) when int_x_9_we1 = '1' else (others=>'0');
    int_x_9_d1           <= UNSIGNED(WDATA);
    -- x_10
    int_x_10_address0    <= UNSIGNED(x_10_address0);
    int_x_10_ce0         <= x_10_ce0;
    x_10_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_10_q0, 32));
    int_x_10_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_10_ce1         <= '1' when ar_hs = '1' or (int_x_10_write = '1' and WVALID  = '1') else '0';
    int_x_10_we1         <= '1' when int_x_10_write = '1' and w_hs = '1' else '0';
    int_x_10_be1         <= UNSIGNED(WSTRB) when int_x_10_we1 = '1' else (others=>'0');
    int_x_10_d1          <= UNSIGNED(WDATA);
    -- x_11
    int_x_11_address0    <= UNSIGNED(x_11_address0);
    int_x_11_ce0         <= x_11_ce0;
    x_11_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_11_q0, 32));
    int_x_11_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_11_ce1         <= '1' when ar_hs = '1' or (int_x_11_write = '1' and WVALID  = '1') else '0';
    int_x_11_we1         <= '1' when int_x_11_write = '1' and w_hs = '1' else '0';
    int_x_11_be1         <= UNSIGNED(WSTRB) when int_x_11_we1 = '1' else (others=>'0');
    int_x_11_d1          <= UNSIGNED(WDATA);
    -- x_12
    int_x_12_address0    <= UNSIGNED(x_12_address0);
    int_x_12_ce0         <= x_12_ce0;
    x_12_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_12_q0, 32));
    int_x_12_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_12_ce1         <= '1' when ar_hs = '1' or (int_x_12_write = '1' and WVALID  = '1') else '0';
    int_x_12_we1         <= '1' when int_x_12_write = '1' and w_hs = '1' else '0';
    int_x_12_be1         <= UNSIGNED(WSTRB) when int_x_12_we1 = '1' else (others=>'0');
    int_x_12_d1          <= UNSIGNED(WDATA);
    -- x_13
    int_x_13_address0    <= UNSIGNED(x_13_address0);
    int_x_13_ce0         <= x_13_ce0;
    x_13_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_13_q0, 32));
    int_x_13_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_13_ce1         <= '1' when ar_hs = '1' or (int_x_13_write = '1' and WVALID  = '1') else '0';
    int_x_13_we1         <= '1' when int_x_13_write = '1' and w_hs = '1' else '0';
    int_x_13_be1         <= UNSIGNED(WSTRB) when int_x_13_we1 = '1' else (others=>'0');
    int_x_13_d1          <= UNSIGNED(WDATA);
    -- x_14
    int_x_14_address0    <= UNSIGNED(x_14_address0);
    int_x_14_ce0         <= x_14_ce0;
    x_14_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_14_q0, 32));
    int_x_14_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_14_ce1         <= '1' when ar_hs = '1' or (int_x_14_write = '1' and WVALID  = '1') else '0';
    int_x_14_we1         <= '1' when int_x_14_write = '1' and w_hs = '1' else '0';
    int_x_14_be1         <= UNSIGNED(WSTRB) when int_x_14_we1 = '1' else (others=>'0');
    int_x_14_d1          <= UNSIGNED(WDATA);
    -- x_15
    int_x_15_address0    <= UNSIGNED(x_15_address0);
    int_x_15_ce0         <= x_15_ce0;
    x_15_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_15_q0, 32));
    int_x_15_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_15_ce1         <= '1' when ar_hs = '1' or (int_x_15_write = '1' and WVALID  = '1') else '0';
    int_x_15_we1         <= '1' when int_x_15_write = '1' and w_hs = '1' else '0';
    int_x_15_be1         <= UNSIGNED(WSTRB) when int_x_15_we1 = '1' else (others=>'0');
    int_x_15_d1          <= UNSIGNED(WDATA);
    -- x_16
    int_x_16_address0    <= UNSIGNED(x_16_address0);
    int_x_16_ce0         <= x_16_ce0;
    x_16_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_16_q0, 32));
    int_x_16_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_16_ce1         <= '1' when ar_hs = '1' or (int_x_16_write = '1' and WVALID  = '1') else '0';
    int_x_16_we1         <= '1' when int_x_16_write = '1' and w_hs = '1' else '0';
    int_x_16_be1         <= UNSIGNED(WSTRB) when int_x_16_we1 = '1' else (others=>'0');
    int_x_16_d1          <= UNSIGNED(WDATA);
    -- x_17
    int_x_17_address0    <= UNSIGNED(x_17_address0);
    int_x_17_ce0         <= x_17_ce0;
    x_17_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_17_q0, 32));
    int_x_17_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_17_ce1         <= '1' when ar_hs = '1' or (int_x_17_write = '1' and WVALID  = '1') else '0';
    int_x_17_we1         <= '1' when int_x_17_write = '1' and w_hs = '1' else '0';
    int_x_17_be1         <= UNSIGNED(WSTRB) when int_x_17_we1 = '1' else (others=>'0');
    int_x_17_d1          <= UNSIGNED(WDATA);
    -- x_18
    int_x_18_address0    <= UNSIGNED(x_18_address0);
    int_x_18_ce0         <= x_18_ce0;
    x_18_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_18_q0, 32));
    int_x_18_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_18_ce1         <= '1' when ar_hs = '1' or (int_x_18_write = '1' and WVALID  = '1') else '0';
    int_x_18_we1         <= '1' when int_x_18_write = '1' and w_hs = '1' else '0';
    int_x_18_be1         <= UNSIGNED(WSTRB) when int_x_18_we1 = '1' else (others=>'0');
    int_x_18_d1          <= UNSIGNED(WDATA);
    -- x_19
    int_x_19_address0    <= UNSIGNED(x_19_address0);
    int_x_19_ce0         <= x_19_ce0;
    x_19_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_19_q0, 32));
    int_x_19_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_19_ce1         <= '1' when ar_hs = '1' or (int_x_19_write = '1' and WVALID  = '1') else '0';
    int_x_19_we1         <= '1' when int_x_19_write = '1' and w_hs = '1' else '0';
    int_x_19_be1         <= UNSIGNED(WSTRB) when int_x_19_we1 = '1' else (others=>'0');
    int_x_19_d1          <= UNSIGNED(WDATA);
    -- x_20
    int_x_20_address0    <= UNSIGNED(x_20_address0);
    int_x_20_ce0         <= x_20_ce0;
    x_20_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_20_q0, 32));
    int_x_20_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_20_ce1         <= '1' when ar_hs = '1' or (int_x_20_write = '1' and WVALID  = '1') else '0';
    int_x_20_we1         <= '1' when int_x_20_write = '1' and w_hs = '1' else '0';
    int_x_20_be1         <= UNSIGNED(WSTRB) when int_x_20_we1 = '1' else (others=>'0');
    int_x_20_d1          <= UNSIGNED(WDATA);
    -- x_21
    int_x_21_address0    <= UNSIGNED(x_21_address0);
    int_x_21_ce0         <= x_21_ce0;
    x_21_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_21_q0, 32));
    int_x_21_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_21_ce1         <= '1' when ar_hs = '1' or (int_x_21_write = '1' and WVALID  = '1') else '0';
    int_x_21_we1         <= '1' when int_x_21_write = '1' and w_hs = '1' else '0';
    int_x_21_be1         <= UNSIGNED(WSTRB) when int_x_21_we1 = '1' else (others=>'0');
    int_x_21_d1          <= UNSIGNED(WDATA);
    -- x_22
    int_x_22_address0    <= UNSIGNED(x_22_address0);
    int_x_22_ce0         <= x_22_ce0;
    x_22_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_22_q0, 32));
    int_x_22_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_22_ce1         <= '1' when ar_hs = '1' or (int_x_22_write = '1' and WVALID  = '1') else '0';
    int_x_22_we1         <= '1' when int_x_22_write = '1' and w_hs = '1' else '0';
    int_x_22_be1         <= UNSIGNED(WSTRB) when int_x_22_we1 = '1' else (others=>'0');
    int_x_22_d1          <= UNSIGNED(WDATA);
    -- x_23
    int_x_23_address0    <= UNSIGNED(x_23_address0);
    int_x_23_ce0         <= x_23_ce0;
    x_23_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_23_q0, 32));
    int_x_23_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_23_ce1         <= '1' when ar_hs = '1' or (int_x_23_write = '1' and WVALID  = '1') else '0';
    int_x_23_we1         <= '1' when int_x_23_write = '1' and w_hs = '1' else '0';
    int_x_23_be1         <= UNSIGNED(WSTRB) when int_x_23_we1 = '1' else (others=>'0');
    int_x_23_d1          <= UNSIGNED(WDATA);
    -- x_24
    int_x_24_address0    <= UNSIGNED(x_24_address0);
    int_x_24_ce0         <= x_24_ce0;
    x_24_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_24_q0, 32));
    int_x_24_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_24_ce1         <= '1' when ar_hs = '1' or (int_x_24_write = '1' and WVALID  = '1') else '0';
    int_x_24_we1         <= '1' when int_x_24_write = '1' and w_hs = '1' else '0';
    int_x_24_be1         <= UNSIGNED(WSTRB) when int_x_24_we1 = '1' else (others=>'0');
    int_x_24_d1          <= UNSIGNED(WDATA);
    -- x_25
    int_x_25_address0    <= UNSIGNED(x_25_address0);
    int_x_25_ce0         <= x_25_ce0;
    x_25_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_25_q0, 32));
    int_x_25_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_25_ce1         <= '1' when ar_hs = '1' or (int_x_25_write = '1' and WVALID  = '1') else '0';
    int_x_25_we1         <= '1' when int_x_25_write = '1' and w_hs = '1' else '0';
    int_x_25_be1         <= UNSIGNED(WSTRB) when int_x_25_we1 = '1' else (others=>'0');
    int_x_25_d1          <= UNSIGNED(WDATA);
    -- x_26
    int_x_26_address0    <= UNSIGNED(x_26_address0);
    int_x_26_ce0         <= x_26_ce0;
    x_26_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_26_q0, 32));
    int_x_26_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_26_ce1         <= '1' when ar_hs = '1' or (int_x_26_write = '1' and WVALID  = '1') else '0';
    int_x_26_we1         <= '1' when int_x_26_write = '1' and w_hs = '1' else '0';
    int_x_26_be1         <= UNSIGNED(WSTRB) when int_x_26_we1 = '1' else (others=>'0');
    int_x_26_d1          <= UNSIGNED(WDATA);
    -- x_27
    int_x_27_address0    <= UNSIGNED(x_27_address0);
    int_x_27_ce0         <= x_27_ce0;
    x_27_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_27_q0, 32));
    int_x_27_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_27_ce1         <= '1' when ar_hs = '1' or (int_x_27_write = '1' and WVALID  = '1') else '0';
    int_x_27_we1         <= '1' when int_x_27_write = '1' and w_hs = '1' else '0';
    int_x_27_be1         <= UNSIGNED(WSTRB) when int_x_27_we1 = '1' else (others=>'0');
    int_x_27_d1          <= UNSIGNED(WDATA);
    -- x_28
    int_x_28_address0    <= UNSIGNED(x_28_address0);
    int_x_28_ce0         <= x_28_ce0;
    x_28_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_28_q0, 32));
    int_x_28_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_28_ce1         <= '1' when ar_hs = '1' or (int_x_28_write = '1' and WVALID  = '1') else '0';
    int_x_28_we1         <= '1' when int_x_28_write = '1' and w_hs = '1' else '0';
    int_x_28_be1         <= UNSIGNED(WSTRB) when int_x_28_we1 = '1' else (others=>'0');
    int_x_28_d1          <= UNSIGNED(WDATA);
    -- x_29
    int_x_29_address0    <= UNSIGNED(x_29_address0);
    int_x_29_ce0         <= x_29_ce0;
    x_29_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_29_q0, 32));
    int_x_29_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_29_ce1         <= '1' when ar_hs = '1' or (int_x_29_write = '1' and WVALID  = '1') else '0';
    int_x_29_we1         <= '1' when int_x_29_write = '1' and w_hs = '1' else '0';
    int_x_29_be1         <= UNSIGNED(WSTRB) when int_x_29_we1 = '1' else (others=>'0');
    int_x_29_d1          <= UNSIGNED(WDATA);
    -- x_30
    int_x_30_address0    <= UNSIGNED(x_30_address0);
    int_x_30_ce0         <= x_30_ce0;
    x_30_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_30_q0, 32));
    int_x_30_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_30_ce1         <= '1' when ar_hs = '1' or (int_x_30_write = '1' and WVALID  = '1') else '0';
    int_x_30_we1         <= '1' when int_x_30_write = '1' and w_hs = '1' else '0';
    int_x_30_be1         <= UNSIGNED(WSTRB) when int_x_30_we1 = '1' else (others=>'0');
    int_x_30_d1          <= UNSIGNED(WDATA);
    -- x_31
    int_x_31_address0    <= UNSIGNED(x_31_address0);
    int_x_31_ce0         <= x_31_ce0;
    x_31_q0              <= STD_LOGIC_VECTOR(RESIZE(int_x_31_q0, 32));
    int_x_31_address1    <= raddr(4 downto 2) when ar_hs = '1' else waddr(4 downto 2);
    int_x_31_ce1         <= '1' when ar_hs = '1' or (int_x_31_write = '1' and WVALID  = '1') else '0';
    int_x_31_we1         <= '1' when int_x_31_write = '1' and w_hs = '1' else '0';
    int_x_31_be1         <= UNSIGNED(WSTRB) when int_x_31_we1 = '1' else (others=>'0');
    int_x_31_d1          <= UNSIGNED(WDATA);

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


