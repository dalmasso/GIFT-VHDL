------------------------------------------------------------------------
-- Engineer:    Dalmasso Loic
-- Create Date: 09/03/2018
-- Module Name: Data_Key_RC_Store - Behavioral
-- Description:
--      Save all data / key / round counter
--      Input data - Clk : clock for KeySchedule
--      Input data - Reset : reset block
--      Input data - LastRound : Trigger for the last round
--      Input data - Cipherkey : 128bits of Cipherkey
--      Input data - Key_in : 128bits of Keystate
--      Input data - Plaintext : 128bits of Plaintext
--      Input data - Data_in : 128bits of Intermediate plaintext
--      Input data - RC_in : 6bit round counter state
--      Output data - Key_out : 128bits of Keystate
--      Output data - Data_out : 128bits of Intermediate plaintext
--      Output data - RC_out : 6bit round counter state
------------------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;

ENTITY Data_Key_RC_Store is

PORT( Clk      : IN STD_LOGIC;
      Reset    : IN STD_LOGIC;
      LastRound: IN STD_LOGIC;

      CipherKey: IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      Key_in   : IN STD_LOGIC_VECTOR(127 DOWNTO 0);

      Plaintext: IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      Data_in  : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
  
      RC_in    : IN STD_LOGIC_VECTOR(5 downto 0);

      Key_out  : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      Data_out : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      RC_out   : OUT STD_LOGIC_VECTOR(5 downto 0)    
    );

-- No optimization 
attribute dont_touch : string;
attribute dont_touch of Data_Key_RC_Store : entity is "true";

END Data_Key_RC_Store;


ARCHITECTURE Behavioral of Data_Key_RC_Store is

------------------------------------------------------------------------
-- Signal Declarations
------------------------------------------------------------------------
signal MyKey : STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
signal MyPTI : STD_LOGIC_VECTOR(127 downto 0)  := (others => '0');
signal MyRC  : STD_LOGIC_VECTOR(5 downto 0)   := (others => '0'); 

-- No optimization 
attribute dont_touch of MyKey : signal is "true";
attribute dont_touch of MyPTI : signal is "true";
attribute dont_touch of MyRC  : signal is "true";

------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------
begin


-------------------------
-- 128-bit Key storage --
-------------------------
KEYSTORE: for i in 127 downto 0 generate
  MUXKEY: MUXF7 port map (MyKey(i), CipherKey(i), Key_in(i), Reset);
end generate;

process(Clk)
begin

  if rising_edge(Clk) then
    if LastRound = '0' then
      Key_out <= MyKey;

    end if;
  end if;
end process;

-------------------------
-- 128-bit Data storage --
-------------------------
DATASTORE: for i in 127 downto 0 generate
  MUXDAT: MUXF7 port map (MyPTI(i), Plaintext(i), Data_in(i), Reset);
end generate;

process(Clk)
begin

  if rising_edge(Clk) then
    if LastRound = '0' then
      Data_out <= MyPTI;

    end if;
  end if;
end process;


-------------------------------------------
-- 6-bit RoundCounter storage ("000000") --
-------------------------------------------
MUXRC5: MUXF7 port map (MyRC(5), '0', RC_in(5), Reset);
MUXRC4: MUXF7 port map (MyRC(4), '0', RC_in(4), Reset);
MUXRC3: MUXF7 port map (MyRC(3), '0', RC_in(3), Reset);
MUXRC2: MUXF7 port map (MyRC(2), '0', RC_in(2), Reset);
MUXRC1: MUXF7 port map (MyRC(1), '0', RC_in(1), Reset);
MUXRC0: MUXF7 port map (MyRC(0), '0', RC_in(0), Reset);

process(Clk)
begin

  if rising_edge(Clk) then
    if Reset = '0' or LastRound = '0' then
      RC_out <= MyRC;

      end if;
  end if;
end process;

end Behavioral;