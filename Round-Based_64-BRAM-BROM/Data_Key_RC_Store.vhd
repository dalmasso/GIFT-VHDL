------------------------------------------------------------------------
-- Engineer:    Dalmasso Loic
-- Create Date: 09/03/2018
-- Module Name: Data_Key_RC_Store - Behavioral
-- Description:
--      Save all data / key / round counter
--      Input data - Clk : clock
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

-- 3 LUT
-- 1 FF

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
-- Component Declarations
------------------------------------------------------------------------
COMPONENT KEY_BRAM IS
  PORT (  clka : IN STD_LOGIC;
          wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
          addra : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
          dina : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
          clkb : IN STD_LOGIC;
          web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
          addrb : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
          dinb : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
          doutb : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
        );
END COMPONENT;


COMPONENT DATA_BRAM IS
  PORT (  clka : IN STD_LOGIC;
          wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
          addra : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
          dina : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
          clkb : IN STD_LOGIC;
          web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
          addrb : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
          dinb : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
          doutb : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
        );
END COMPONENT;


COMPONENT RC_BRAM IS
  PORT (  clka : IN STD_LOGIC;
          wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
          addra : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
          dina : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
          clkb : IN STD_LOGIC;
          web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
          addrb : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
          dinb : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          doutb : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
        );
END COMPONENT;

------------------------------------------------------------------------
-- Signal Declarations
------------------------------------------------------------------------
signal Init  : STD_LOGIC := '0';
signal wea   : STD_LOGIC_VECTOR(0 DOWNTO 0)   := (others => '0');
signal web   : STD_LOGIC_VECTOR(0 DOWNTO 0)   := (others => '0');

signal Key_NotUsed  : STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
signal Data_NotUsed : STD_LOGIC_VECTOR(63 downto 0)  := (others => '0');
signal RC_NotUsed   : STD_LOGIC_VECTOR(5 downto 0)   := (others => '0');

-- No optimization
attribute dont_touch of Init  : signal is "true";
attribute dont_touch of wea   : signal is "true";
attribute dont_touch of web   : signal is "true";
------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------
begin

-----------------------
-- Select loop input --
-----------------------
process(Clk)
begin
    if falling_edge(Clk) then
        Init <= Reset;
    end if;
end process;

--------------------------
-- Write enable control --
--------------------------
wea(0) <= Reset and not Init;
web(0) <= Reset and Init;

-------------------------
-- 128-bit Key storage --
-------------------------
K_MEM : KEY_BRAM port map(Clk, wea, "0", CipherKey, Key_NotUsed,
                          Clk, web, web, Key_in, Key_out);


------------------------
-- 64-bit Data storage --
-------------------------
D_MEM : DATA_BRAM port map(Clk, wea, "0", Plaintext, Data_NotUsed,
                           Clk, web, web, Data_in, Data_out);


-------------------------------------------
-- 6-bit RoundCounter storage ("000000") --
-------------------------------------------
RC_MEM : RC_BRAM port map(Clk, wea, "0", "000000", RC_NotUsed,
                          Clk, web, web, RC_in, RC_out);

end Behavioral;