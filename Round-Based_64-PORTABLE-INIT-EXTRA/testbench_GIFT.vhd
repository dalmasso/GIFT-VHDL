----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.12.2017 17:53:20
-- Design Name: 
-- Module Name: testbench_GIFT - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbench_GIFT is
--  Port ( );
end testbench_GIFT;

architecture Behavioral of testbench_GIFT is

COMPONENT GIFT is

PORT( Clk           : IN STD_LOGIC;
	  Reset		    : IN STD_LOGIC;
      Plaintext     : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
	  CipherKey	    : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
	  Ciphertext    : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
	  EndOfGIFT     : OUT STD_LOGIC
	);

END COMPONENT;

signal clk, reset 	: STD_LOGIC := '0';
signal myplain 		: STD_LOGIC_VECTOR(63 DOWNTO 0) := (others => '0');
signal mykey 		: STD_LOGIC_VECTOR(127 DOWNTO 0):= (others => '0');
signal cipher 	    : STD_LOGIC_VECTOR(63 DOWNTO 0) := (others => '0');
signal endofGift 	: STD_LOGIC := '0';

begin

uut : GIFT port map (clk, reset, myplain, mykey, cipher, endofGift);

clk <= not clk after 5 ns;
reset <= '0', '1' after 203 ns;
myplain <= X"0123456789ABCDEF";
mykey <= X"00112233445566778899AABBCCDDEEFF";

end Behavioral;