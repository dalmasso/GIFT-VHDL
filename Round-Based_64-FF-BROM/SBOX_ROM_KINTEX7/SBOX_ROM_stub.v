// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.3_sdx (win64) Build 1721784 Tue Nov 29 22:12:44 MST 2016
// Date        : Wed May 16 09:53:12 2018
// Host        : DESKTOP-FUB2K9G running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/Crypto/GIFT/GIFT_VHDL/Round-Based_64-FF-BROM/SBOX_ROM_KINTEX7/SBOX_ROM_stub.v
// Design      : SBOX_ROM
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k70tfbg484-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_4,Vivado 2016.3_sdx" *)
module SBOX_ROM(clka, addra, douta, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[3:0],douta[3:0],clkb,addrb[3:0],doutb[3:0]" */;
  input clka;
  input [3:0]addra;
  output [3:0]douta;
  input clkb;
  input [3:0]addrb;
  output [3:0]doutb;
endmodule
