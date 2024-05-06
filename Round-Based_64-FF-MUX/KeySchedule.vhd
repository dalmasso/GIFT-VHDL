------------------------------------------------------------------------
-- Engineer:    Dalmasso Loic
-- Create Date: 06/12/2017
-- Module Name: KeySchedule - Behavioral
-- Description:
--      Create new round key
--      Input data - Keystate : 128bits of Cipherkey
--      Output data - NewKey : 128bits of Keystate
--      Output data - RoundKey : 32bits of Roundkey
------------------------------------------------------------------------

-- 0 LUT

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY KeySchedule is

PORT( KeyState    : IN STD_LOGIC_VECTOR(127 DOWNTO 0);

      NewKey      : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      RoundKey    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );

-- No optimization  
attribute dont_touch : string;
attribute dont_touch of KeySchedule : entity is "true";

END KeySchedule;

ARCHITECTURE Behavioral of KeySchedule is

------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------
begin

-- New CipherKey
NewKey <= KeyState(17 downto 16) & KeyState(31 downto 18) &
          KeyState(11 downto 0)  & KeyState(15 downto 12) &
          KeyState(127 downto 32);

-- Extraction of RoundKey BEFORE update                        
RoundKey <= KeyState(31 downto 0);

end Behavioral;