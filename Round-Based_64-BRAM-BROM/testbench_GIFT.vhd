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

PORT( Clk_BRAM   : IN STD_LOGIC;
      Clk_SBOX   : IN STD_LOGIC;
      Reset      : IN STD_LOGIC;
      Plaintext  : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      CipherKey  : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      Ciphertext : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      EndOfGIFT  : OUT STD_LOGIC
    );

END COMPONENT;


COMPONENT clk_wiz_0 is
PORT ( Clk_BRAM : OUT STD_ULOGIC;
       Clk_SBOX : OUT STD_ULOGIC;
       resetn   : IN STD_ULOGIC;
       clk_in1  : IN STD_ULOGIC
      );
END COMPONENT;



signal Clk_100, crypto_clk, Clk_BRAM,Clk_SBOX , reset       : STD_LOGIC := '0';
signal myplain          : STD_LOGIC_VECTOR(63 DOWNTO 0) := (others => '0');
signal mykey            : STD_LOGIC_VECTOR(127 DOWNTO 0):= (others => '0');
signal cipher         : STD_LOGIC_VECTOR(63 DOWNTO 0) := (others => '0');
signal endofGift  : STD_LOGIC := '0';

begin

uuclk : clk_wiz_0 port map(Clk_BRAM, Clk_SBOX, '1', Clk_100);
uut : GIFT port map (Clk_BRAM,Clk_SBOX, reset, myplain, mykey, cipher, endofGift);

Clk_100 <= not Clk_100 after 5 ns;
reset <= '0', '1' after 353 ns;
myplain <= X"0123456789ABCDEF";
mykey <= X"00112233445566778899AABBCCDDEEFF";

end Behavioral;