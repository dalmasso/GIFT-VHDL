// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.3_sdx (win64) Build 1721784 Tue Nov 29 22:12:44 MST 2016
// Date        : Mon Apr 23 14:16:17 2018
// Host        : DESKTOP-FUB2K9G running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/jlaurent/Desktop/GIFT-BRAM-2/GIFT-BRAM-2.srcs/sources_1/ip/RC_BRAM/RC_BRAM_stub.v
// Design      : RC_BRAM
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k70tfbg484-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_4,Vivado 2016.3_sdx" *)
module RC_BRAM(clka, wea, addra, dina, douta, clkb, web, addrb, dinb, 
  doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[0:0],dina[5:0],douta[5:0],clkb,web[0:0],addrb[0:0],dinb[5:0],doutb[5:0]" */;
  input clka;
  input [0:0]wea;
  input [0:0]addra;
  input [5:0]dina;
  output [5:0]douta;
  input clkb;
  input [0:0]web;
  input [0:0]addrb;
  input [5:0]dinb;
  output [5:0]doutb;
endmodule