// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Fri Feb 24 16:12:28 2023
// Host        : DESKTOP-0BM3N1I running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               {C:/Users/Hp/Desktop/Desktop/Education/Certification/Electronics Design/Verilog for an FPGA Engineer with
//               Xilinx Vivado Design Suite/gated_d_ff/gated_d_ff.sim/sim_1/synth/func/xsim/top_func_synth.v}
// Design      : top
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s15csga225-1Q
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module d_ff
   (q_OBUF,
    in_IBUF,
    a_IBUF,
    clk_en_IBUF);
  output q_OBUF;
  input in_IBUF;
  input a_IBUF;
  input clk_en_IBUF;

  wire a_IBUF;
  wire clk_en_IBUF;
  wire in_IBUF;
  wire q_OBUF;
  wire t1;

  LUT2 #(
    .INIT(4'h8)) 
    q_i_1
       (.I0(a_IBUF),
        .I1(clk_en_IBUF),
        .O(t1));
  FDRE #(
    .INIT(1'b0)) 
    q_reg
       (.C(t1),
        .CE(1'b1),
        .D(in_IBUF),
        .Q(q_OBUF),
        .R(1'b0));
endmodule

(* NotValidForBitStream *)
module top
   (clk_en,
    a,
    in,
    q);
  input clk_en;
  input a;
  input in;
  output q;

  wire a;
  wire a_IBUF;
  wire clk_en;
  wire clk_en_IBUF;
  wire in;
  wire in_IBUF;
  wire q;
  wire q_OBUF;

  IBUF #(
    .CCIO_EN("TRUE")) 
    a_IBUF_inst
       (.I(a),
        .O(a_IBUF));
  IBUF #(
    .CCIO_EN("TRUE")) 
    clk_en_IBUF_inst
       (.I(clk_en),
        .O(clk_en_IBUF));
  d_ff d1
       (.a_IBUF(a_IBUF),
        .clk_en_IBUF(clk_en_IBUF),
        .in_IBUF(in_IBUF),
        .q_OBUF(q_OBUF));
  IBUF #(
    .CCIO_EN("TRUE")) 
    in_IBUF_inst
       (.I(in),
        .O(in_IBUF));
  OBUF q_OBUF_inst
       (.I(q_OBUF),
        .O(q));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
