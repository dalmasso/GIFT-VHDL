------------------------------------------------------------------------
-- Engineer:	Dalmasso Loic
-- Create Date:	22/12/2017
-- Module Name:	PermBits - Behavioral
-- Description:
--	  	Generate permutation bit of GIFT encryption
--    	Input data - PermBits_in : 64bit data
--	  	Output data - PermBits_out : 64bit data after permutation
------------------------------------------------------------------------

-- 0 LUT

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY PermBits is

PORT( PermBits_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
	  PermBits_out: OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);

-- No optimization	
attribute dont_touch : string;
attribute dont_touch of PermBits : entity is "true";

END PermBits;

ARCHITECTURE Behavioral of PermBits is

------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------
begin

PermBits_out	<= PermBits_in(51) &	-- 63
				   PermBits_in(62) &	-- 62
				   PermBits_in(57) &	-- 61
				   PermBits_in(52) &	-- 60
				   PermBits_in(35) &	-- 59
				   PermBits_in(46) &	-- 58
				   PermBits_in(41) &	-- 57
				   PermBits_in(36) &	-- 56
				   PermBits_in(19) &	-- 55
				   PermBits_in(30) &	-- 54
				   PermBits_in(25) &	-- 53
				   PermBits_in(20) &	-- 52
				   PermBits_in(3)  &	-- 51
				   PermBits_in(14) &	-- 50
				   PermBits_in(9)  &	-- 49
				   PermBits_in(4)  &	-- 48

				   PermBits_in(55) &	-- 47
				   PermBits_in(50) &	-- 46
				   PermBits_in(61) &	-- 45
				   PermBits_in(56) &	-- 44
				   PermBits_in(39) &	-- 43
				   PermBits_in(34) &	-- 42
				   PermBits_in(45) &	-- 41
				   PermBits_in(40) &	-- 40
				   PermBits_in(23) &	-- 39
				   PermBits_in(18) &	-- 38
				   PermBits_in(29) &	-- 37
				   PermBits_in(24) &	-- 36
				   PermBits_in(7)  &	-- 35
				   PermBits_in(2)  &	-- 34
				   PermBits_in(13) &	-- 33
				   PermBits_in(8)  &	-- 32

				   PermBits_in(59) &	-- 31
				   PermBits_in(54) &	-- 30
				   PermBits_in(49) &	-- 29
				   PermBits_in(60) &	-- 28
				   PermBits_in(43) &	-- 27
				   PermBits_in(38) &	-- 26
				   PermBits_in(33) &	-- 25
				   PermBits_in(44) &	-- 24
				   PermBits_in(27) &	-- 23
				   PermBits_in(22) &	-- 22
				   PermBits_in(17) &	-- 21
				   PermBits_in(28) &	-- 20
				   PermBits_in(11) &	-- 19
				   PermBits_in(6)  &	-- 18
				   PermBits_in(1)  &	-- 17
				   PermBits_in(12) &	-- 16

				   PermBits_in(63) &	-- 15
				   PermBits_in(58) &	-- 14
				   PermBits_in(53) &	-- 13
				   PermBits_in(48) &	-- 12
				   PermBits_in(47) &	-- 11
				   PermBits_in(42) &	-- 10
				   PermBits_in(37) &	-- 9
				   PermBits_in(32) &	-- 8
				   PermBits_in(31) &	-- 7
				   PermBits_in(26) &	-- 6
				   PermBits_in(21) &	-- 5
				   PermBits_in(16) &	-- 4
				   PermBits_in(15) &	-- 3
				   PermBits_in(10) &	-- 2
				   PermBits_in(5)  &	-- 1
				   PermBits_in(0);		-- 0

end Behavioral;