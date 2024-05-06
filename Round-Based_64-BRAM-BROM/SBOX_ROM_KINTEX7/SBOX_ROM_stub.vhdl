-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.3_sdx (win64) Build 1721784 Tue Nov 29 22:12:44 MST 2016
-- Date        : Wed May 16 09:53:12 2018
-- Host        : DESKTOP-FUB2K9G running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top SBOX_ROM -prefix
--               SBOX_ROM_ SBOX_ROM_stub.vhdl
-- Design      : SBOX_ROM
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k70tfbg484-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SBOX_ROM is
  Port ( 
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 3 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 3 downto 0 );
    clkb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end SBOX_ROM;

architecture stub of SBOX_ROM is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,addra[3:0],douta[3:0],clkb,addrb[3:0],doutb[3:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_3_4,Vivado 2016.3_sdx";
begin
end;
