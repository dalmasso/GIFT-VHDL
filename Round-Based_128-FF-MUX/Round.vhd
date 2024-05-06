------------------------------------------------------------------------
-- Engineer:	Dalmasso Loic
-- Create Date:	25/12/2017
-- Module Name:	Round - Behavioral
-- Description:
--		Implement one round of GIFT encryption algorithm
--		Input data - Plaintext : 128 bits of plaintext
-- 		Input data - RoundKey  : 64 bits of round key
-- 		Input data - RoundConst : 6 bits of round constant
--      Output data - Ciphertext : 128 bits of ciphertext
------------------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Round is

PORT( Plaintext  : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
	  RoundKey	 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
	  RoundConst : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	  Ciphertext : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
	);

-- No optimization  
attribute dont_touch : string;
attribute dont_touch of Round : entity is "true";

END Round;

ARCHITECTURE Behavioral of Round is

------------------------------------------------------------------------
-- Component Declarations
------------------------------------------------------------------------
COMPONENT SubCells is

PORT( SubCells_in  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	  SubCells_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);

END COMPONENT;


COMPONENT PermBits is

PORT( PermBits_in : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
	  PermBits_out: OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
	);

END COMPONENT;


COMPONENT AddRoundKey is

PORT( PermB 		: IN STD_LOGIC_VECTOR(127 DOWNTO 0);
	  RoundKey 		: IN STD_LOGIC_VECTOR(63 DOWNTO 0);
	  RoundConstant : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	  NewCipher		: OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
	);

END COMPONENT;


------------------------------------------------------------------------
-- Signal Declarations
------------------------------------------------------------------------
signal SubCells_output 		: STD_LOGIC_VECTOR(127 DOWNTO 0) := (others => '0');		-- SBOX result
signal PermBits_output 		: STD_LOGIC_VECTOR(127 DOWNTO 0) := (others => '0');		-- PermBits result

-- No optimization  
attribute dont_touch of SubCells_output : signal is "true";
attribute dont_touch of PermBits_output : signal is "true";

------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------
begin


--------------------------
-- 32 SBOXes generation --
--------------------------
SBOXS: for i in 31 downto 0 generate
	SBOX : SubCells port map (Plaintext((4*i)+3 downto (4*i)), SubCells_output((4*i)+3 downto (4*i)));
end generate;


--------------
-- PermBits --
--------------
PERMB : PermBits port map (SubCells_output, PermBits_output);


-----------------
-- AddRoundKey --
-----------------
ADDRK : AddRoundKey port map (PermBits_output, RoundKey, RoundConst, Ciphertext);

end Behavioral;