------------------------------------------------------------------------
-- Engineer:    Dalmasso Loic
-- Create Date: 09/03/2018
-- Module Name: Data_Key_RC_Store - Behavioral
-- Description:
--      Save all data / key / round counter
--      Input data - Clk : clock for KeySchedule
--      Input data - Reset : reset block
--      Input data - Cipherkey : 128bits of Cipherkey
--      Input data - Key_in : 128bits of Keystate
--      Input data - Plaintext : 64bits of Plaintext
--      Input data - Data_in : 64bits of Intermediate plaintext
--      Input data - RC_in : 6bit round counter state
--      Output data - Key_out : 128bits of Keystate
--      Output data - Data_out : 64bits of Intermediate plaintext
--      Output data - RC_out : 6bit round counter state
------------------------------------------------------------------------

-- 98 LUT
-- 199 FF

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Data_Key_RC_Store is

PORT( Clk      : IN STD_LOGIC;
      Reset    : IN STD_LOGIC;

      CipherKey: IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      Key_in   : IN STD_LOGIC_VECTOR(127 DOWNTO 0);

      Plaintext: IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      Data_in  : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
  
      RC_in    : IN STD_LOGIC_VECTOR(5 downto 0);

      Key_out  : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      Data_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
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
signal Init  : STD_LOGIC := '0'; 

-- No optimization 
attribute dont_touch of Init  : signal is "true";

------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------
begin

--------------------------
-- Initialization state --
--------------------------
process(Clk)
begin

  if rising_edge(Clk) then
    Init <= Reset;    
  end if;
  
end process;


-------------------------
-- 128-bit Key storage --
-------------------------
process(Clk)
begin

  if rising_edge(Clk) then

    if Reset = '0' then
      Key_out <= (others=>'0');
        
    elsif Init = '0' then
      Key_out <= CipherKey;

    else
      Key_out <= Key_in;
    end if;
    
  end if;
end process;


-------------------------
-- 64-bit Data storage --
-------------------------
process(Clk)
begin

  if rising_edge(Clk) then

    if Reset = '0' then
      Data_out <= (others=>'0');
        
    elsif Init = '0' then
      Data_out <= Plaintext;

    else
      Data_out <= Data_in;
    end if;
    
  end if;
end process;


-------------------------------------------
-- 6-bit RoundCounter storage ("000000") --
-------------------------------------------
process(Clk)
begin

  if rising_edge(Clk) then

    if Reset = '0' then
      RC_out <= (others=>'0');

    elsif Init = '0' then
      RC_out <= (others=>'0');

    else
      RC_out <= RC_in;
    end if;

  end if;
end process;

end Behavioral;