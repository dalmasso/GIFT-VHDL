------------------------------------------------------------------------
-- Engineer:	Dalmasso Loic
-- Create Date:	22/12/2017
-- Module Name:	AddRoundKey - Behavioral
-- Description:
--		AddRoundKey of GIFT encryption
--		Input data - PermB : CipherText on 64 bits, after Permutation bits
--		Input data - RoundKey : Round key on 32 bits
--		Input data - RoundConstant : Round constant on 6 bits
--		Output data - NewCipher : New CipherText on 64 bits
------------------------------------------------------------------------

-- 39 LUT

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY AddRoundKey is

PORT( PermB 		: IN STD_LOGIC_VECTOR(63 DOWNTO 0);
	  RoundKey 		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	  RoundConstant : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	  NewCipher		: OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);

-- No optimization  
attribute dont_touch : string;
attribute dont_touch of AddRoundKey : entity is "true";

END AddRoundKey;

ARCHITECTURE Behavioral of AddRoundKey is

------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------
begin

	   		 	-- XOR with '1' and MSB Permb bit
NewCipher <= 	( PermB(63) XOR '1' )  &

				-- PermB XOR RoundKey (RK31 ... RK16) on only bits 1 & (RK15 ... RK0) on only 0 of each 4bits nibbles
				PermB(62) 		    & ( PermB(61) XOR RoundKey(31) ) & ( PermB(60) XOR RoundKey(15) ) &
				PermB(59 downto 58) & ( PermB(57) XOR RoundKey(30) ) & ( PermB(56) XOR RoundKey(14) ) &
				PermB(55 downto 54) & ( PermB(53) XOR RoundKey(29) ) & ( PermB(52) XOR RoundKey(13) ) &
				PermB(51 downto 50) & ( PermB(49) XOR RoundKey(28) ) & ( PermB(48) XOR RoundKey(12) ) &
				PermB(47 downto 46) & ( PermB(45) XOR RoundKey(27) ) & ( PermB(44) XOR RoundKey(11) ) &
				PermB(43 downto 42) & ( PermB(41) XOR RoundKey(26) ) & ( PermB(40) XOR RoundKey(10) ) &
				PermB(39 downto 38) & ( PermB(37) XOR RoundKey(25) ) & ( PermB(36) XOR RoundKey(9)  ) &
				PermB(35 downto 34) & ( PermB(33) XOR RoundKey(24) ) & ( PermB(32) XOR RoundKey(8)  ) &
				PermB(31 downto 30) & ( PermB(29) XOR RoundKey(23) ) & ( PermB(28) XOR RoundKey(7)  ) &
				PermB(27 downto 26) & ( PermB(25) XOR RoundKey(22) ) & ( PermB(24) XOR RoundKey(6)  ) &
			   
				-- XOR with RoundConstant and MSB on 6 first 4bits nibbles
				( PermB(23) XOR RoundConstant(5) )  &	   
				PermB(22) & ( PermB(21) XOR RoundKey(21) ) & ( PermB(20) XOR RoundKey(5)  ) &
				   
				( PermB(19) XOR RoundConstant(4) )  &	   
				PermB(18) & ( PermB(17) XOR RoundKey(20) ) & ( PermB(16) XOR RoundKey(4)  ) &
				   
				( PermB(15) XOR RoundConstant(3) )  &
				PermB(14) & ( PermB(13) XOR RoundKey(19) ) & ( PermB(12) XOR RoundKey(3)  ) &
				   
				( PermB(11) XOR RoundConstant(2) )  &
				PermB(10) & ( PermB(9)  XOR RoundKey(18) ) & ( PermB(8)  XOR RoundKey(2)  ) &

				( PermB(7) XOR RoundConstant(1)  )  &
				PermB(6)  & ( PermB(5)  XOR RoundKey(17) ) & ( PermB(4)  XOR RoundKey(1)  ) &

				( PermB(3) XOR RoundConstant(0)  )  &
				PermB(2)  & ( PermB(1)  XOR RoundKey(16) ) & ( PermB(0)  XOR RoundKey(0)  );


end Behavioral;