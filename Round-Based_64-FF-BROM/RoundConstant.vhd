------------------------------------------------------------------------
-- Engineer:	Dalmasso Loic
-- Create Date:	26/12/2017
-- Module Name:	RoundConstant - Behavioral
-- Description:
--	  	Generate round constant of GIFT encryption
--      Input data - RoundConst_in : 6bits of RoundConstant
--      Output data - RoundConst_out : 6bits of RoundConstant updated
------------------------------------------------------------------------

-- 1 LUT

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RoundConstant is

PORT( RoundConst_in  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	  RoundConst_out : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	);

-- No optimization  
attribute dont_touch : string;
attribute dont_touch of RoundConstant : entity is "true";

END RoundConstant;

ARCHITECTURE Behavioral of RoundConstant is

------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------
begin

RoundConst_out <= RoundConst_in(4 downto 0) & (RoundConst_in(5) XNOR RoundConst_in(4));   

end Behavioral;