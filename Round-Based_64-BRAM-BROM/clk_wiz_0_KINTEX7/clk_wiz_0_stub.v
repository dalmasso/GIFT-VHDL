// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.3_sdx (win64) Build 1721784 Tue Nov 29 22:12:44 MST 2016
// Date        : Tue Apr 24 08:37:25 2018
// Host        : DESKTOP-FUB2K9G running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/jlaurent/Desktop/GIFT-BRAM/GIFT-BRAM-2.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k70tfbg484-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(Clk_BRAM, Clk_SBOX, resetn, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="Clk_BRAM,Clk_SBOX,resetn,clk_in1" */;
  output Clk_BRAM;
  output Clk_SBOX;
  input resetn;
  input clk_in1;
endmodule
