------------------------------------------------------------------------
-- Engineer:	Dalmasso Loic
-- Create Date:	22/12/2017
-- Module Name:	PermBits - Behavioral
-- Description:
--	  	Generate permutation bit of GIFT encryption
--    	Input data - PermBits_in : 128bits data
--	  	Output data - PermBits_out : 128bits data after permutation
------------------------------------------------------------------------

-- 0 LUT

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY PermBits is

PORT( PermBits_in : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
	  PermBits_out: OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
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

PermBits_out	<= PermBits_in(115) &	-- 127
				   PermBits_in(126) &	-- 126
				   PermBits_in(121) &	-- 125
				   PermBits_in(116) &	-- 124
				   PermBits_in(99)  &	-- 123
				   PermBits_in(110) &	-- 122
				   PermBits_in(105) &	-- 121
				   PermBits_in(100) &	-- 120
				   PermBits_in(83)  &	-- 119
				   PermBits_in(94)  &	-- 118
				   PermBits_in(89)  &	-- 117
				   PermBits_in(84)  &	-- 116
				   PermBits_in(67)  &	-- 115
				   PermBits_in(78)  &	-- 114
				   PermBits_in(73)  &	-- 113
				   PermBits_in(68)  &	-- 112

				   PermBits_in(51) &	-- 111
				   PermBits_in(62) &	-- 110
				   PermBits_in(57) &	-- 109
				   PermBits_in(52) &	-- 108
				   PermBits_in(35) &	-- 107
				   PermBits_in(46) &	-- 106
				   PermBits_in(41) &	-- 105
				   PermBits_in(36) &	-- 104
				   PermBits_in(19) &	-- 103
				   PermBits_in(30) &	-- 102
				   PermBits_in(25) &	-- 101
				   PermBits_in(20) &	-- 100
				   PermBits_in(3)  &	-- 99
				   PermBits_in(14) &	-- 98
				   PermBits_in(9)  &	-- 97
				   PermBits_in(4)  &	-- 96

				   PermBits_in(119) &	-- 95
				   PermBits_in(114) &	-- 94
				   PermBits_in(125) &	-- 93
				   PermBits_in(120) &	-- 92
				   PermBits_in(103) &	-- 91
				   PermBits_in(98)  &	-- 90
				   PermBits_in(109) &	-- 89
				   PermBits_in(104) &	-- 88
				   PermBits_in(87)  &	-- 87
				   PermBits_in(82)  &	-- 86
				   PermBits_in(93)  &	-- 85
				   PermBits_in(88)  &	-- 84
				   PermBits_in(71)  &	-- 83
				   PermBits_in(66)  &	-- 82
				   PermBits_in(77)  &	-- 81
				   PermBits_in(72)  &	-- 80

				   PermBits_in(55) &	-- 79
				   PermBits_in(50) &	-- 78
				   PermBits_in(61) &	-- 77
				   PermBits_in(56) &	-- 76
				   PermBits_in(39) &	-- 75
				   PermBits_in(34) &	-- 74
				   PermBits_in(45) &	-- 73
				   PermBits_in(40) &	-- 72
				   PermBits_in(23) &	-- 71
				   PermBits_in(18) &	-- 70
				   PermBits_in(29) &	-- 69
				   PermBits_in(24) &	-- 68
				   PermBits_in(7)  &	-- 67
				   PermBits_in(2)  &	-- 66
				   PermBits_in(13) &	-- 65
				   PermBits_in(8)  &	-- 64

				   PermBits_in(123) &	-- 63
				   PermBits_in(118) &	-- 62
				   PermBits_in(113) &	-- 61
				   PermBits_in(124) &	-- 60
				   PermBits_in(107) &	-- 59
				   PermBits_in(102) &	-- 58
				   PermBits_in(97)  &	-- 57
				   PermBits_in(108) &	-- 56
				   PermBits_in(91)  &	-- 55
				   PermBits_in(86)  &	-- 54
				   PermBits_in(81)  &	-- 53
				   PermBits_in(92)  &	-- 52
				   PermBits_in(75)  &	-- 51
				   PermBits_in(70)  &	-- 50
				   PermBits_in(65)  &	-- 49
				   PermBits_in(76)  &	-- 48

				   PermBits_in(59)  &	-- 47
				   PermBits_in(54)  &	-- 46
				   PermBits_in(49)  &	-- 45
				   PermBits_in(60)  &	-- 44
				   PermBits_in(43)  &	-- 43
				   PermBits_in(38)  &	-- 42
				   PermBits_in(33)  &	-- 41
				   PermBits_in(44)  &	-- 40
				   PermBits_in(27)  &	-- 39
				   PermBits_in(22)  &	-- 38
				   PermBits_in(17)  &	-- 37
				   PermBits_in(28)  &	-- 36
				   PermBits_in(11)  &	-- 35
				   PermBits_in(6)   &	-- 34
				   PermBits_in(1) 	&	-- 33
				   PermBits_in(12)  &	-- 32

				   PermBits_in(127) &	-- 31
				   PermBits_in(122) &	-- 30
				   PermBits_in(117) &	-- 29
				   PermBits_in(112) &	-- 28
				   PermBits_in(111) &	-- 27
				   PermBits_in(106) &	-- 26
				   PermBits_in(101) &	-- 25
				   PermBits_in(96) &	-- 24
				   PermBits_in(95) &	-- 23
				   PermBits_in(90) &	-- 22
				   PermBits_in(85) &	-- 21
				   PermBits_in(80) &	-- 20
				   PermBits_in(79) &	-- 19
				   PermBits_in(74) &	-- 18
				   PermBits_in(69) &	-- 17
				   PermBits_in(64) &	-- 16

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