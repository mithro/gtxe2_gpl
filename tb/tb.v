/*******************************************************************************
 * Module: tb
 * Date: 2015-07-06  
 * Author: Alexey     
 * Description: testbench module = gtx_channel as a DUT + test payload module
 *
 * Copyright (c) 2015 Elphel, Inc.
 * tb.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * tb.v file is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ps/1ps
//`include "GTXE2_CHANNEL.v"
//`include "test.v"
module tb();
wire            reset;
wire            TXP;
wire            TXN;
wire    [63:0]  TXDATA;
wire            TXUSRCLK;
wire            TXUSRCLK2;
wire    [7:0]   TX8B10BBYPASS;
wire            TX8B10BEN;
wire    [7:0]   TXCHARDISPMODE;
wire    [7:0]   TXCHARDISPVAL;
wire    [7:0]   TXCHARISK;
wire    [1:0]   TXBUFSTATUS;
wire            TXPOLARITY;
wire    [2:0]   TXRATE;
wire    [2:0]   RXRATE;
wire            TXRATEDONE;
wire            TXCOMINIT;
wire            TXCOMWAKE;
wire            TXCOMFINISH;
wire            TXELECIDLE;
wire            RXP;
wire            RXN;
wire            RXUSRCLK;
wire            RXUSRCLK2;
wire    [63:0]  RXDATA;
wire    [1:0]   RXELECIDLEMODE;
wire            RXELECIDLE;
wire            RXCOMINITDET;
wire            RXCOMWAKEDET;
wire            RXPOLARITY;
wire            RXBYTEISALIGNED;
wire            RXBYTEREALIGN;
wire            RXCOMMADET;
wire            RXCOMMADETEN;
wire            RXPCOMMAALIGNEN;
wire            RXMCOMMAALIGNEN;
wire            RX8B10BEN;
wire    [7:0]   RXCHARISCOMMA;
wire    [7:0]   RXCHARISK;
wire    [7:0]   RXDISPERR;
wire    [7:0]   RXNOTINTABLE;
wire    [2:0]   CPLLREFCLKSEL;
wire            GTREFCLK0;
wire            GTREFCLK1;
wire            GTNORTHREFCLK0;
wire            GTNORTHREFCLK1;
wire            GTSOUTHREFCLK0;
wire            GTSOUTHREFCLK1;
wire            GTGREFCLK;
wire    [1:0]   RXSYSCLKSEL;
wire    [1:0]   TXSYSCLKSEL;
wire    [2:0]   TXOUTCLKSEL;
wire    [2:0]   RXOUTCLKSEL;
wire            TXDLYBYPASS;
wire            GTREFCLKMONITOR;
wire            CPLLLOCKDETCLK;
wire            CPLLLOCKEN;
wire            CPLLPD;
wire            CPLLRESET;
wire            CPLLFBCLKLOST;
wire            CPLLLOCK;
wire            CPLLREFCLKLOST;
wire            TXOUTCLKPMA;
wire            TXOUTCLKPCS;
wire            TXOUTCLK;
wire            TXOUTCLKFABRIC;
wire            tx_serial_clk;
wire            RXOUTCLKPMA;
wire            RXOUTCLKPCS;
wire            RXOUTCLK;
wire            RXOUTCLKFABRIC;
wire            rx_serial_clk;
wire    [2:0]   QPLLREFCLKSEL;
wire            QPLLOUTCLK;
wire            QPLLOUTREFCLK;
wire            QPLLLOCKDETCLK;
wire            QPLLLOCKEN;
wire            QPLLPD;
wire            QPLLRESET;
wire            QPLLFBCLKLOST;
wire            QPLLLOCK;
wire            QPLLREFCLKLOST;
wire            TXUSERRDY;
wire            RXUSERRDY;
wire            RXDFELFHOLD;
wire            RXDFEAGCHOLD;
wire            RXRESETDONE;
wire            TXRESETDONE;

test test(
    .reset              (reset),
    .TXP                (TXP),
    .TXN                (TXN),
    .TXDATA             (TXDATA),
    .TXUSRCLK           (TXUSRCLK),
    .TXUSRCLK2          (TXUSRCLK2),
    .TX8B10BBYPASS      (TX8B10BBYPASS),
    .TX8B10BEN          (TX8B10BEN),
    .TXCHARDISPMODE     (TXCHARDISPMODE),
    .TXCHARDISPVAL      (TXCHARDISPVAL),
    .TXCHARISK          (TXCHARISK),
    .TXBUFSTATUS        (TXBUFSTATUS),
    .TXPOLARITY         (TXPOLARITY),
    .TXRATE             (TXRATE),
    .RXRATE             (RXRATE),
    .TXRATEDONE         (TXRATEDONE),
    .TXCOMINIT          (TXCOMINIT),
    .TXCOMWAKE          (TXCOMWAKE),
    .TXCOMFINISH        (TXCOMFINISH),
    .TXELECIDLE         (TXELECIDLE),
    .RXP                (RXP),
    .RXN                (RXN),
    .RXUSRCLK           (RXUSRCLK),
    .RXUSRCLK2          (RXUSRCLK2),
    .RXDATA             (RXDATA),
    .RXELECIDLEMODE     (RXELECIDLEMODE),
    .RXELECIDLE         (RXELECIDLE),
    .RXCOMINITDET       (RXCOMINITDET),
    .RXCOMWAKEDET       (RXCOMWAKEDET),
    .RXPOLARITY         (RXPOLARITY),
    .RXBYTEISALIGNED    (RXBYTEISALIGNED),
    .RXBYTEREALIGN      (RXBYTEREALIGN),
    .RXCOMMADET         (RXCOMMADET),
    .RXCOMMADETEN       (RXCOMMADETEN),
    .RXPCOMMAALIGNEN    (RXPCOMMAALIGNEN),
    .RXMCOMMAALIGNEN    (RXMCOMMAALIGNEN),
    .RX8B10BEN          (RX8B10BEN),
    .RXCHARISCOMMA      (RXCHARISCOMMA),
    .RXCHARISK          (RXCHARISK),
    .RXDISPERR          (RXDISPERR),
    .RXNOTINTABLE       (RXNOTINTABLE),
    .RXUSERRDY          (RXUSERRDY),
    .TXUSERRDY          (TXUSERRDY),
    .CPLLREFCLKSEL      (CPLLREFCLKSEL),
    .GTREFCLK0          (GTREFCLK0),
    .GTREFCLK1          (GTREFCLK1),
    .GTNORTHREFCLK0     (GTNORTHREFCLK0),
    .GTNORTHREFCLK1     (GTNORTHREFCLK1),
    .GTSOUTHREFCLK0     (GTSOUTHREFCLK0),
    .GTSOUTHREFCLK1     (GTSOUTHREFCLK1),
    .GTGREFCLK          (GTGREFCLK),
    .RXSYSCLKSEL        (RXSYSCLKSEL),
    .TXSYSCLKSEL        (TXSYSCLKSEL),
    .TXOUTCLKSEL        (TXOUTCLKSEL),
    .RXOUTCLKSEL        (RXOUTCLKSEL),
    .TXDLYBYPASS        (TXDLYBYPASS),
    .GTREFCLKMONITOR    (GTREFCLKMONITOR),
    .CPLLLOCKDETCLK     (CPLLLOCKDETCLK ),
    .CPLLLOCKEN         (CPLLLOCKEN),
    .CPLLPD             (CPLLPD),
    .CPLLRESET          (CPLLRESET),
    .CPLLFBCLKLOST      (CPLLFBCLKLOST),
    .CPLLLOCK           (CPLLLOCK),
    .CPLLREFCLKLOST     (CPLLREFCLKLOST),
    .TXOUTCLKPMA        (TXOUTCLKPMA),
    .TXOUTCLKPCS        (TXOUTCLKPCS),
    .TXOUTCLK           (TXOUTCLK),
    .TXOUTCLKFABRIC     (TXOUTCLKFABRIC),
    .tx_serial_clk      (tx_serial_clk),
    .RXOUTCLKPMA        (RXOUTCLKPMA),
    .RXOUTCLKPCS        (RXOUTCLKPCS),
    .RXOUTCLK           (RXOUTCLK),
    .RXOUTCLKFABRIC     (RXOUTCLKFABRIC),
    .rx_serial_clk      (rx_serial_clk),
    .QPLLREFCLKSEL      (QPLLREFCLKSEL),
    .QPLLOUTCLK         (QPLLOUTCLK),
    .QPLLOUTREFCLK      (QPLLOUTREFCLK),
    .QPLLLOCKDETCLK     (QPLLLOCKDETCLK ),
    .QPLLLOCKEN         (QPLLLOCKEN),
    .QPLLPD             (QPLLPD),
    .QPLLRESET          (QPLLRESET),
    .QPLLFBCLKLOST      (QPLLFBCLKLOST),
    .QPLLLOCK           (QPLLLOCK),
    .QPLLREFCLKLOST     (QPLLREFCLKLOST),
    .RXDFELFHOLD        (RXDFELFHOLD),
    .RXDFEAGCHOLD       (RXDFEAGCHOLD),
    .TXRESETDONE        (TXRESETDONE),
    .RXRESETDONE        (RXRESETDONE)
);

GTXE2_CHANNEL #
(
    .SIM_RECEIVER_DETECT_PASS   ("TRUE"),
    .SIM_TX_EIDLE_DRIVE_LEVEL   ("X"),
    .SIM_RESET_SPEEDUP          ("FALSE"),
    .SIM_CPLLREFCLK_SEL         (3'b001),
    .SIM_VERSION                ("4.0"),
    .ALIGN_COMMA_DOUBLE                     ("FALSE"),
    .ALIGN_COMMA_ENABLE                     (10'b1111111111),
    .ALIGN_COMMA_WORD                       (1),
    .ALIGN_MCOMMA_DET                       ("TRUE"),
    .ALIGN_MCOMMA_VALUE                     (10'b1010000011),
    .ALIGN_PCOMMA_DET                       ("TRUE"),
    .ALIGN_PCOMMA_VALUE                     (10'b0101111100),
    .SHOW_REALIGN_COMMA                     ("TRUE"),
    .RXSLIDE_AUTO_WAIT                      (7),
    .RXSLIDE_MODE                           ("OFF"),
    .RX_SIG_VALID_DLY                       (10),
    .RX_DISPERR_SEQ_MATCH                   ("TRUE"),
    .DEC_MCOMMA_DETECT                      ("TRUE"),
    .DEC_PCOMMA_DETECT                      ("TRUE"),
    .DEC_VALID_COMMA_ONLY                   ("FALSE"),
    .CBCC_DATA_SOURCE_SEL                   ("DECODED"),
    .CLK_COR_SEQ_2_USE                      ("FALSE"),
    .CLK_COR_KEEP_IDLE                      ("FALSE"),
    .CLK_COR_MAX_LAT                        (9),
    .CLK_COR_MIN_LAT                        (7),
    .CLK_COR_PRECEDENCE                     ("TRUE"),
    .CLK_COR_REPEAT_WAIT                    (0),
    .CLK_COR_SEQ_LEN                        (1),
    .CLK_COR_SEQ_1_ENABLE                   (4'b1111),
    .CLK_COR_SEQ_1_1                        (10'b0100000000),
    .CLK_COR_SEQ_1_2                        (10'b0000000000),
    .CLK_COR_SEQ_1_3                        (10'b0000000000),
    .CLK_COR_SEQ_1_4                        (10'b0000000000),
    .CLK_CORRECT_USE                        ("FALSE"),
    .CLK_COR_SEQ_2_ENABLE                   (4'b1111),
    .CLK_COR_SEQ_2_1                        (10'b0100000000),
    .CLK_COR_SEQ_2_2                        (10'b0000000000),
    .CLK_COR_SEQ_2_3                        (10'b0000000000),
    .CLK_COR_SEQ_2_4                        (10'b0000000000),
    .CHAN_BOND_KEEP_ALIGN                   ("FALSE"),
    .CHAN_BOND_MAX_SKEW                     (1),
    .CHAN_BOND_SEQ_LEN                      (1),
    .CHAN_BOND_SEQ_1_1                      (10'b0000000000),
    .CHAN_BOND_SEQ_1_2                      (10'b0000000000),
    .CHAN_BOND_SEQ_1_3                      (10'b0000000000),
    .CHAN_BOND_SEQ_1_4                      (10'b0000000000),
    .CHAN_BOND_SEQ_1_ENABLE                 (4'b1111),
    .CHAN_BOND_SEQ_2_1                      (10'b0000000000),
    .CHAN_BOND_SEQ_2_2                      (10'b0000000000),
    .CHAN_BOND_SEQ_2_3                      (10'b0000000000),
    .CHAN_BOND_SEQ_2_4                      (10'b0000000000),
    .CHAN_BOND_SEQ_2_ENABLE                 (4'b1111),
    .CHAN_BOND_SEQ_2_USE                    ("FALSE"),
    .FTS_DESKEW_SEQ_ENABLE                  (4'b1111),
    .FTS_LANE_DESKEW_CFG                    (4'b1111),
    .FTS_LANE_DESKEW_EN                     ("FALSE"),
    .ES_CONTROL                             (6'b000000),
    .ES_ERRDET_EN                           ("FALSE"),
    .ES_EYE_SCAN_EN                         ("TRUE"),
    .ES_HORZ_OFFSET                         (12'h000),
    .ES_PMA_CFG                             (10'b0000000000),
    .ES_PRESCALE                            (5'b00000),
    .ES_QUALIFIER                           (80'h00000000000000000000),
    .ES_QUAL_MASK                           (80'h00000000000000000000),
    .ES_SDATA_MASK                          (80'h00000000000000000000),
    .ES_VERT_OFFSET                         (9'b000000000),
    .RX_DATA_WIDTH                          (20),
    .OUTREFCLK_SEL_INV                      (2'b11),
    .PMA_RSV                                (32'h00018480),
    .PMA_RSV2                               (16'h2050),
    .PMA_RSV3                               (2'b00),
    .PMA_RSV4                               (32'h00000000),
    .RX_BIAS_CFG                            (12'b000000000100),
    .DMONITOR_CFG                           (24'h000A00),
    .RX_CM_SEL                              (2'b11),
    .RX_CM_TRIM                             (3'b010),
    .RX_DEBUG_CFG                           (12'b000000000000),
    .RX_OS_CFG                              (13'b0000010000000),
    .TERM_RCAL_CFG                          (5'b10000),
    .TERM_RCAL_OVRD                         (1'b0),
    .TST_RSV                                (32'h00000000),
    .RX_CLK25_DIV                           (6),
    .TX_CLK25_DIV                           (6),
    .UCODEER_CLR                            (1'b0),
    .PCS_PCIE_EN                            ("FALSE"),
    .PCS_RSVD_ATTR                          (48'h0100),
    .RXBUF_ADDR_MODE                        ("FAST"),
    .RXBUF_EIDLE_HI_CNT                     (4'b1000),
    .RXBUF_EIDLE_LO_CNT                     (4'b0000),
    .RXBUF_EN                               ("TRUE"),
    .RX_BUFFER_CFG                          (6'b000000),
    .RXBUF_RESET_ON_CB_CHANGE               ("TRUE"),
    .RXBUF_RESET_ON_COMMAALIGN              ("FALSE"),
    .RXBUF_RESET_ON_EIDLE                   ("FALSE"),
    .RXBUF_RESET_ON_RATE_CHANGE             ("TRUE"),
    .RXBUFRESET_TIME                        (5'b00001),
    .RXBUF_THRESH_OVFLW                     (61),
    .RXBUF_THRESH_OVRD                      ("FALSE"),
    .RXBUF_THRESH_UNDFLW                    (4),
    .RXDLY_CFG                              (16'h001F),
    .RXDLY_LCFG                             (9'h030),
    .RXDLY_TAP_CFG                          (16'h0000),
    .RXPH_CFG                               (24'h000000),
    .RXPHDLY_CFG                            (24'h084020),
    .RXPH_MONITOR_SEL                       (5'b00000),
    .RX_XCLK_SEL                            ("RXREC"),
    .RX_DDI_SEL                             (6'b000000),
    .RX_DEFER_RESET_BUF_EN                  ("TRUE"),
    .RXCDR_CFG                              (72'h03000023ff10200020),
    .RXCDR_FR_RESET_ON_EIDLE                (1'b0),
    .RXCDR_HOLD_DURING_EIDLE                (1'b0),
    .RXCDR_PH_RESET_ON_EIDLE                (1'b0),
    .RXCDR_LOCK_CFG                         (6'b010101),
    .RXCDRFREQRESET_TIME                    (5'b00001),
    .RXCDRPHRESET_TIME                      (5'b00001),
    .RXISCANRESET_TIME                      (5'b00001),
    .RXPCSRESET_TIME                        (5'b00001),
    .RXPMARESET_TIME                        (5'b00011),
    .RXOOB_CFG                              (7'b0000110),
    .RXGEARBOX_EN                           ("FALSE"),
    .GEARBOX_MODE                           (3'b000),
    .RXPRBS_ERR_LOOPBACK                    (1'b0),
    .PD_TRANS_TIME_FROM_P2                  (12'h03c),
    .PD_TRANS_TIME_NONE_P2                  (8'h3c),
    .PD_TRANS_TIME_TO_P2                    (8'h64),
    .SAS_MAX_COM                            (64),
    .SAS_MIN_COM                            (36),
    .SATA_BURST_SEQ_LEN                     (4'b0111),
    .SATA_BURST_VAL                         (3'b110),
    .SATA_EIDLE_VAL                         (3'b110),
    .SATA_MAX_BURST                         (8),
    .SATA_MAX_INIT                          (21),
    .SATA_MAX_WAKE                          (7),
    .SATA_MIN_BURST                         (4),
    .SATA_MIN_INIT                          (12),
    .SATA_MIN_WAKE                          (4),
    .TRANS_TIME_RATE                        (8'h0E),
    .TXBUF_EN                               ("TRUE"),
    .TXBUF_RESET_ON_RATE_CHANGE             ("TRUE"),
    .TXDLY_CFG                              (16'h001F),
    .TXDLY_LCFG                             (9'h030),
    .TXDLY_TAP_CFG                          (16'h0000),
    .TXPH_CFG                               (16'h0780),
    .TXPHDLY_CFG                            (24'h084020),
    .TXPH_MONITOR_SEL                       (5'b00000),
    .TX_XCLK_SEL                            ("TXOUT"),
    .TX_DATA_WIDTH                          (20),
    .TX_DEEMPH0                             (5'b00000),
    .TX_DEEMPH1                             (5'b00000),
    .TX_EIDLE_ASSERT_DELAY                  (3'b110),
    .TX_EIDLE_DEASSERT_DELAY                (3'b100),
    .TX_LOOPBACK_DRIVE_HIZ                  ("FALSE"),
    .TX_MAINCURSOR_SEL                      (1'b0),
    .TX_DRIVE_MODE                          ("DIRECT"),
    .TX_MARGIN_FULL_0                       (7'b1001110),
    .TX_MARGIN_FULL_1                       (7'b1001001),
    .TX_MARGIN_FULL_2                       (7'b1000101),
    .TX_MARGIN_FULL_3                       (7'b1000010),
    .TX_MARGIN_FULL_4                       (7'b1000000),
    .TX_MARGIN_LOW_0                        (7'b1000110),
    .TX_MARGIN_LOW_1                        (7'b1000100),
    .TX_MARGIN_LOW_2                        (7'b1000010),
    .TX_MARGIN_LOW_3                        (7'b1000000),
    .TX_MARGIN_LOW_4                        (7'b1000000),
    .TXGEARBOX_EN                           ("FALSE"),
    .TXPCSRESET_TIME                        (5'b00001),
    .TXPMARESET_TIME                        (5'b00001),
    .TX_RXDETECT_CFG                        (14'h1832),
    .TX_RXDETECT_REF                        (3'b100),
    .CPLL_CFG                               (24'hBC07DC),
    .CPLL_FBDIV                             (4),
    .CPLL_FBDIV_45                          (5),
    .CPLL_INIT_CFG                          (24'h00001E),
    .CPLL_LOCK_CFG                          (16'h01E8),
    .CPLL_REFCLK_DIV                        (1),
    .RXOUT_DIV                              (2),
    .TXOUT_DIV                              (2),
    .SATA_CPLL_CFG                          ("VCO_3000MHZ"),
    .RXDFELPMRESET_TIME                     (7'b0001111),
    .RXLPM_HF_CFG                           (14'b00000011110000),
    .RXLPM_LF_CFG                           (14'b00000011110000),
    .RX_DFE_GAIN_CFG                        (23'h020FEA),
    .RX_DFE_H2_CFG                          (12'b000000000000),
    .RX_DFE_H3_CFG                          (12'b000001000000),
    .RX_DFE_H4_CFG                          (11'b00011110000),
    .RX_DFE_H5_CFG                          (11'b00011100000),
    .RX_DFE_KL_CFG                          (13'b0000011111110),
    .RX_DFE_LPM_CFG                         (16'h0954),
    .RX_DFE_LPM_HOLD_DURING_EIDLE           (1'b0),
    .RX_DFE_UT_CFG                          (17'b10001111000000000),
    .RX_DFE_VP_CFG                          (17'b00011111100000011),
    .RX_CLKMUX_PD                           (1'b1),
    .TX_CLKMUX_PD                           (1'b1),
    .RX_INT_DATAWIDTH                       (0),
    .TX_INT_DATAWIDTH                       (0),
    .TX_QPI_STATUS_EN                       (1'b0),
    .RX_DFE_KL_CFG2                         (32'h301148AC),
    .RX_DFE_XYD_CFG                         (13'b0000000000000),
    .TX_PREDRIVER_MODE                      (1'b0)
) 
dut 
(
    .CPLLFBCLKLOST                  (CPLLFBCLKLOST),
    .CPLLLOCK                       (CPLLLOCK),
    .CPLLLOCKDETCLK                 (CPLLLOCKDETCLK),
    .CPLLLOCKEN                     (1'b1),
    .CPLLPD                         (CPLLPD),
    .CPLLREFCLKLOST                 (CPLLREFCLKLOST),
    .CPLLREFCLKSEL                  (CPLLREFCLKSEL),
    .CPLLRESET                      (CPLLRESET),
    .GTRSVD                         (1'b0),
    .PCSRSVDIN                      (1'b0),
    .PCSRSVDIN2                     (1'b0),
    .PMARSVDIN                      (1'b0),
    .PMARSVDIN2                     (1'b0),
    .TSTIN                          (1'b1),
    .TSTOUT                         (),
    .CLKRSVD                        (4'b0000),
    .GTGREFCLK                      (1'b0),
    .GTNORTHREFCLK0                 (1'b0),
    .GTNORTHREFCLK1                 (1'b0),
    .GTREFCLK0                      (GTREFCLK0),
    .GTREFCLK1                      (1'b0),
    .GTSOUTHREFCLK0                 (1'b0),
    .GTSOUTHREFCLK1                 (1'b0),
    .DRPADDR                        (9'b0),
    .DRPCLK                         (CPLLLOCKDETCKL),
    .DRPDI                          (16'b0),
    .DRPDO                          (),
    .DRPEN                          (1'b0),
    .DRPRDY                         (),
    .DRPWE                          (1'b0),
    .GTREFCLKMONITOR                (),
    .QPLLCLK                        (GTREFCLK0),
    .QPLLREFCLK                     (GTREFCLK0),
    .RXSYSCLKSEL                    (2'b00),
    .TXSYSCLKSEL                    (2'b00),
    .DMONITOROUT                    (),
    .TX8B10BEN                      (1'b1),
    .LOOPBACK                       (3'd0),
    .PHYSTATUS                      (),
    .RXRATE                         (3'd0),
    .RXVALID                        (),
    .RXPD                           (2'b00),
    .TXPD                           (2'b00),
    .SETERRSTATUS                   (1'b0),
    .EYESCANRESET                   (reset),
    .RXUSERRDY                      (RXUSERRDY),
    .EYESCANDATAERROR               (EYESCANDATAERROR),
    .EYESCANMODE                    (1'b0),
    .EYESCANTRIGGER                 (1'b0),
    .RXCDRFREQRESET                 (1'b0),
    .RXCDRHOLD                      (1'b0),
    .RXCDRLOCK                      (),
    .RXCDROVRDEN                    (1'b0),
    .RXCDRRESET                     (1'b0),
    .RXCDRRESETRSV                  (1'b0),
    .RXCLKCORCNT                    (),
    .RX8B10BEN                      (1'b1),
    .RXUSRCLK                       (RXUSRCLK),
    .RXUSRCLK2                      (RXUSRCLK2),
    .RXDATA                         (RXDATA),
    .RXPRBSERR                      (),
    .RXPRBSSEL                      (3'd0),
    .RXPRBSCNTRESET                 (1'b0),
    .RXDFEXYDEN                     (1'b1),
    .RXDFEXYDHOLD                   (1'b0),
    .RXDFEXYDOVRDEN                 (1'b0),
    .RXDISPERR                      (RXDISPERR),
    .RXNOTINTABLE                   (RXNOTINTABLE),
    .GTXRXP                         (RXP),
    .GTXRXN                         (RXN),
    .RXBUFRESET                     (1'b0),
    .RXBUFSTATUS                    (),
    .RXDDIEN                        (1'b0),
    .RXDLYBYPASS                    (1'b1),
    .RXDLYEN                        (1'b0),
    .RXDLYOVRDEN                    (1'b0),
    .RXDLYSRESET                    (1'b0),
    .RXDLYSRESETDONE                (),
    .RXPHALIGN                      (1'b0),
    .RXPHALIGNDONE                  (),
    .RXPHALIGNEN                    (1'b0),
    .RXPHDLYPD                      (1'b0),
    .RXPHDLYRESET                   (1'b0),
    .RXPHMONITOR                    (),
    .RXPHOVRDEN                     (1'b0),
    .RXPHSLIPMONITOR                (),
    .RXSTATUS                       (),
    .RXBYTEISALIGNED                (RXBYTEISALIGNED),
    .RXBYTEREALIGN                  (),
    .RXCOMMADET                     (),
    .RXCOMMADETEN                   (1'b1),
    .RXMCOMMAALIGNEN                (1'b1),
    .RXPCOMMAALIGNEN                (1'b1),
    .RXCHANBONDSEQ                  (),
    .RXCHBONDEN                     (1'b0),
    .RXCHBONDLEVEL                  (3'd0),
    .RXCHBONDMASTER                 (1'b0),
    .RXCHBONDO                      (),
    .RXCHBONDSLAVE                  (1'b0),
    .RXCHANISALIGNED                (),
    .RXCHANREALIGN                  (),
    .RXLPMHFHOLD                    (1'b0),
    .RXLPMHFOVRDEN                  (1'b0),
    .RXLPMLFHOLD                    (1'b0),
    .RXDFEAGCHOLD                   (RXDFEAGCHOLD),
    .RXDFEAGCOVRDEN                 (1'b0),
    .RXDFECM1EN                     (1'b0),
    .RXDFELFHOLD                    (RXDFELFHOLD),
    .RXDFELFOVRDEN                  (1'b1),
    .RXDFELPMRESET                  (reset),
    .RXDFETAP2HOLD                  (1'b0),
    .RXDFETAP2OVRDEN                (1'b0),
    .RXDFETAP3HOLD                  (1'b0),
    .RXDFETAP3OVRDEN                (1'b0),
    .RXDFETAP4HOLD                  (1'b0),
    .RXDFETAP4OVRDEN                (1'b0),
    .RXDFETAP5HOLD                  (1'b0),
    .RXDFETAP5OVRDEN                (1'b0),
    .RXDFEUTHOLD                    (1'b0),
    .RXDFEUTOVRDEN                  (1'b0),
    .RXDFEVPHOLD                    (1'b0),
    .RXDFEVPOVRDEN                  (1'b0),
//    .RXDFEVSEN                      (1'b0),
    .RXLPMLFKLOVRDEN                (1'b0),
    .RXMONITOROUT                   (),
    .RXMONITORSEL                   (),
    .RXOSHOLD                       (1'b0),
    .RXOSOVRDEN                     (1'b0),
    .RXRATEDONE                     (),
    .RXOUTCLK                       (RXOUTCLK),
    .RXOUTCLKFABRIC                 (),
    .RXOUTCLKPCS                    (),
    .RXOUTCLKSEL                    (3'b010),
    .RXDATAVALID                    (),
    .RXHEADER                       (),
    .RXHEADERVALID                  (),
    .RXSTARTOFSEQ                   (),
    .RXGEARBOXSLIP                  (1'b0),
    .GTRXRESET                      (reset),
    .RXOOBRESET                     (1'b0),
    .RXPCSRESET                     (1'b0),
    .RXPMARESET                     (reset),
    .RXLPMEN                        (1'b0),
    .RXCOMSASDET                    (),
    .RXCOMWAKEDET                   (RXCOMWAKEDET),
    .RXCOMINITDET                   (RXCOMINITDET),
    .RXELECIDLE                     (RXELECIDLE),
    .RXELECIDLEMODE                 (2'b00),
    .RXPOLARITY                     (1'b0),
    .RXSLIDE                        (1'b0),
    .RXCHARISCOMMA                  (),
    .RXCHARISK                      (RXCHARISK),
    .RXCHBONDI                      (5'b00000),
    .RXRESETDONE                    (RXRESETDONE),
    .RXQPIEN                        (1'b0),
    .RXQPISENN                      (),
    .RXQPISENP                      (),
    .TXPHDLYTSTCLK                  (1'b0),
    .TXPOSTCURSOR                   (5'b00000),
    .TXPOSTCURSORINV                (1'b0),
    .TXPRECURSOR                    (5'd0),
    .TXPRECURSORINV                 (1'b0),
    .TXQPIBIASEN                    (1'b0),
    .TXQPISTRONGPDOWN               (1'b0),
    .TXQPIWEAKPUP                   (1'b0),
    .CFGRESET                       (1'b0),
    .GTTXRESET                      (reset),
    .PCSRSVDOUT                     (),
    .TXUSERRDY                      (TXUSERRDY),
    .GTRESETSEL                     (1'b0),
    .RESETOVRD                      (1'b0),
    .TXCHARDISPMODE                 (8'd0),
    .TXCHARDISPVAL                  (8'd0),
    .TXUSRCLK                       (TXUSRCLK),
    .TXUSRCLK2                      (TXUSRCLK2),
    .TXELECIDLE                     (TXELECIDLE),
    .TXMARGIN                       (3'd0),
    .TXRATE                         (3'd0),
    .TXSWING                        (1'b0),
    .TXPRBSFORCEERR                 (1'b0),
    .TXDLYBYPASS                    (1'b1),
    .TXDLYEN                        (1'b0),
    .TXDLYHOLD                      (1'b0),
    .TXDLYOVRDEN                    (1'b0),
    .TXDLYSRESET                    (1'b0),
    .TXDLYSRESETDONE                (),
    .TXDLYUPDOWN                    (1'b0),
    .TXPHALIGN                      (1'b0),
    .TXPHALIGNDONE                  (),
    .TXPHALIGNEN                    (1'b0),
    .TXPHDLYPD                      (1'b0),
    .TXPHDLYRESET                   (1'b0),
    .TXPHINIT                       (1'b0),
    .TXPHINITDONE                   (),
    .TXPHOVRDEN                     (1'b0),
    .TXBUFSTATUS                    (),
    .TXBUFDIFFCTRL                  (3'b100),
    .TXDEEMPH                       (1'b0),
    .TXDIFFCTRL                     (4'b1000),
    .TXDIFFPD                       (1'b0),
    .TXINHIBIT                      (1'b0),
    .TXMAINCURSOR                   (7'b0000000),
    .TXPISOPD                       (1'b0),
    .TXDATA                         (TXDATA),
    .GTXTXN                         (TXN),
    .GTXTXP                         (TXP),
    .TXOUTCLK                       (TXOUTCLK),
    .TXOUTCLKFABRIC                 (TXOUTCLKFABRIC),
    .TXOUTCLKPCS                    (TXOUTCLKPCS),
    .TXOUTCLKSEL                    (3'b010),
    .TXRATEDONE                     (),
    .TXCHARISK                      (TXCHARISK),
    .TXGEARBOXREADY                 (),
    .TXHEADER                       (3'd0),
    .TXSEQUENCE                     (7'd0),
    .TXSTARTSEQ                     (1'b0),
    .TXPCSRESET                     (1'b0),
    .TXPMARESET                     (1'b0),
    .TXRESETDONE                    (TXRESETDONE),
    .TXCOMFINISH                    (TXCOMFINISH),
    .TXCOMINIT                      (TXCOMINIT),
    .TXCOMSAS                       (1'b0),
    .TXCOMWAKE                      (TXCOMWAKE),
    .TXPDELECIDLEMODE               (1'b0),
    .TXPOLARITY                     (1'b0),
    .TXDETECTRX                     (1'b0),
    .TX8B10BBYPASS                  (8'd0),
    .TXPRBSSEL                      (3'd0),
    .TXQPISENN                      (),
    .TXQPISENP                      ()
);
endmodule
