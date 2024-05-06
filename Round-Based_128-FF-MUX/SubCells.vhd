------------------------------------------------------------------------
-- Engineer:	Dalmasso Loic
-- Create Date:	22/12/2017
-- Module Name:	SubCells - Behavioral
-- Description:
--		SBOX of GIFT encryption
--		Input data - SubCells_in : nibble of plaintext on 4bits
--		Output data - SubCells_out : substituted data on 4bits
------------------------------------------------------------------------

-- 2 LUTs

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SubCells is

PORT( SubCells_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	  SubCells_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);

-- No optimization		
attribute dont_touch : string;
attribute dont_touch of SubCells : entity is "true";

END SubCells;

ARCHITECTURE Behavioral of SubCells is

------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------
begin

with SubCells_in select

	SubCells_out <= X"1" when X"0",
					X"A" when X"1",
					X"4" when X"2",
					X"C" when X"3",
					X"6" when X"4",
					X"F" when X"5",
					X"3" when X"6",
					X"9" when X"7",
					X"2" when X"8",
					X"D" when X"9",
					X"B" when X"A",
					X"7" when X"B",
					X"5" when X"C",
					X"0" when X"D",
					X"8" when X"E",
					X"E" when X"F",

					(OTHERS =>'X') when OTHERS;

end Behavioral;