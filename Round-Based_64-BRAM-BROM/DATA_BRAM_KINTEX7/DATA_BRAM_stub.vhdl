-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.3_sdx (win64) Build 1721784 Tue Nov 29 22:12:44 MST 2016
-- Date        : Mon Apr 23 14:15:40 2018
-- Host        : DESKTOP-FUB2K9G running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/jlaurent/Desktop/GIFT-BRAM-2/GIFT-BRAM-2.srcs/sources_1/ip/DATA_BRAM/DATA_BRAM_stub.vhdl
-- Design      : DATA_BRAM
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k70tfbg484-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DATA_BRAM is
  Port ( 
    clka : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 0 to 0 );
    dina : in STD_LOGIC_VECTOR ( 63 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 63 downto 0 );
    clkb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    dinb : in STD_LOGIC_VECTOR ( 63 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );

end DATA_BRAM;

architecture stub of DATA_BRAM is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,wea[0:0],addra[0:0],dina[63:0],douta[63:0],clkb,web[0:0],addrb[0:0],dinb[63:0],doutb[63:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_3_4,Vivado 2016.3_sdx";
begin
end;
