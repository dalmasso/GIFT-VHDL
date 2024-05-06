------------------------------------------------------------------------
-- Engineer:	Dalmasso Loic
-- Create Date:	22/12/2017
-- Module Name:	AddRoundKey - Behavioral
-- Description:
--		AddRoundKey of GIFT encryption
--		Input data - PermB : CipherText on 128 bits, after Permutation bits
--		Input data - RoundKey : Round key on 64 bits
--		Input data - RoundConstant : Round constant on 6 bits
--		Output data - NewCipher : New CipherText on 128 bits
------------------------------------------------------------------------

-- 39 LUT

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY AddRoundKey is

PORT( PermB 		: IN STD_LOGIC_VECTOR(127 DOWNTO 0);
	  RoundKey 		: IN STD_LOGIC_VECTOR(63 DOWNTO 0);
	  RoundConstant : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	  NewCipher		: OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
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


NewCipher <= 	( PermB(127) XOR '1' )  &
				( PermB(126) XOR RoundKey(63) ) &
				( PermB(125) XOR RoundKey(31) ) &
				PermB(124) &

				PermB(123) &
				( PermB(122) XOR RoundKey(62) ) &
				( PermB(121) XOR RoundKey(30) ) &
				PermB(120) &

				PermB(119) &
				( PermB(118) XOR RoundKey(61) ) &
				( PermB(117) XOR RoundKey(29) ) &
				PermB(116) &

				PermB(115) &
				( PermB(114) XOR RoundKey(60) ) &
				( PermB(113) XOR RoundKey(28) ) &
				PermB(112) &

				PermB(111) &
				( PermB(110) XOR RoundKey(59) ) &
				( PermB(109) XOR RoundKey(27) ) &
				PermB(108) &

				PermB(107) &
				( PermB(106) XOR RoundKey(58) ) &
				( PermB(105) XOR RoundKey(26) ) &
				PermB(104) &

				PermB(103) &
				( PermB(102) XOR RoundKey(57) ) &
				( PermB(101) XOR RoundKey(25) ) &
				PermB(100) &

				PermB(99) &
				( PermB(98) XOR RoundKey(56) ) &
				( PermB(97) XOR RoundKey(24) ) &
				PermB(96) &

				PermB(95) &
				( PermB(94) XOR RoundKey(55) ) &
				( PermB(93) XOR RoundKey(23) ) &
				PermB(92) &

				PermB(91) &
				( PermB(90) XOR RoundKey(54) ) &
				( PermB(89) XOR RoundKey(22) ) &
				PermB(88) &

				PermB(87) &
				( PermB(86) XOR RoundKey(53) ) &
				( PermB(85) XOR RoundKey(21) ) &
				PermB(84) &

				PermB(83) &
				( PermB(82) XOR RoundKey(52) ) &
				( PermB(81) XOR RoundKey(20) ) &
				PermB(80) &

				PermB(79) &
				( PermB(78) XOR RoundKey(51) ) &
				( PermB(77) XOR RoundKey(19) ) &
				PermB(76) &

				PermB(75) &
				( PermB(74) XOR RoundKey(50) ) &
				( PermB(73) XOR RoundKey(18) ) &
				PermB(72) &

				PermB(71) &
				( PermB(70) XOR RoundKey(49) ) &
				( PermB(69) XOR RoundKey(17) ) &
				PermB(68) &

				PermB(67) &
				( PermB(66) XOR RoundKey(48) ) &
				( PermB(65) XOR RoundKey(16) ) &
				PermB(64) &

				PermB(63) &
				( PermB(62) XOR RoundKey(47) ) &
				( PermB(61) XOR RoundKey(15) ) &
				PermB(60) &

				PermB(59) &
				( PermB(58) XOR RoundKey(46) ) &
				( PermB(57) XOR RoundKey(14) ) &
				PermB(56) &

				PermB(55) &
				( PermB(54) XOR RoundKey(45) ) &
				( PermB(53) XOR RoundKey(13) ) &
				PermB(52) &

				PermB(51) &
				( PermB(50) XOR RoundKey(44) ) &
				( PermB(49) XOR RoundKey(12) ) &
				PermB(48) &

				PermB(47) &
				( PermB(46) XOR RoundKey(43) ) &
				( PermB(45) XOR RoundKey(11) ) &
				PermB(44) &

				PermB(43) &
				( PermB(42) XOR RoundKey(42) ) &
				( PermB(41) XOR RoundKey(10) ) &
				PermB(40) &

				PermB(39) &
				( PermB(38) XOR RoundKey(41) ) &
				( PermB(37) XOR RoundKey(9) ) &
				PermB(36) &

				PermB(35) &
				( PermB(34) XOR RoundKey(40) ) &
				( PermB(33) XOR RoundKey(8) ) &
				PermB(32) &

				PermB(31) &
				( PermB(30) XOR RoundKey(39) ) &
				( PermB(29) XOR RoundKey(7) ) &
				PermB(28) &

				PermB(27) &
				( PermB(26) XOR RoundKey(38) ) &
				( PermB(25) XOR RoundKey(6) ) &
				PermB(24) &

				( PermB(23) XOR RoundConstant(5) ) &
				( PermB(22) XOR RoundKey(37) ) &
				( PermB(21) XOR RoundKey(5) ) &
				PermB(20) &

				( PermB(19) XOR RoundConstant(4) ) &
				( PermB(18) XOR RoundKey(36) ) &
				( PermB(17) XOR RoundKey(4) ) &
				PermB(16) &

				( PermB(15) XOR RoundConstant(3) ) &
				( PermB(14) XOR RoundKey(35) ) &
				( PermB(13) XOR RoundKey(3) ) &
				PermB(12) &

				( PermB(11) XOR RoundConstant(2) ) &
				( PermB(10) XOR RoundKey(34) ) &
				( PermB(9) XOR RoundKey(2) ) &
				PermB(8) &

				( PermB(7) XOR RoundConstant(1) ) &
				( PermB(6) XOR RoundKey(33) ) &
				( PermB(5) XOR RoundKey(1) ) &
				PermB(4) &

				( PermB(3) XOR RoundConstant(0) ) &
				( PermB(2) XOR RoundKey(32) ) &
				( PermB(1) XOR RoundKey(0) ) &
				PermB(0);

end Behavioral;