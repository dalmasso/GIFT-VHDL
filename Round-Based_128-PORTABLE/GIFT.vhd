------------------------------------------------------------------------
-- Engineer:  Dalmasso Loic
-- Create Date: 25/12/2017
-- Module Name: GIFT - Behavioral
-- Description:
--      Implement one round of GIFT encryption algorithm
--      Input data - Clk : clock of GIFT
--      Input data - Reset : reset of GIFT
--      Input data - Plaintext : 128 bits of plaintext
--      Input data - Cipherkey : 128 bits of cipherkey
--      Output data - Ciphertext : 128 bits of ciphertext
--      Output data - EndOfGIFT : signal to identify end of GIFT algorithm
------------------------------------------------------------------------



LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY GIFT is

PORT( Clk        : IN STD_LOGIC;
      Reset      : IN STD_LOGIC;
      Plaintext  : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      CipherKey  : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      Ciphertext : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      EndOfGIFT  : OUT STD_LOGIC
    );

-- No optimization  
attribute dont_touch : string;
attribute dont_touch of GIFT : entity is "true";

END GIFT;

ARCHITECTURE Behavioral of GIFT is

------------------------------------------------------------------------
-- Component Declarations
------------------------------------------------------------------------
COMPONENT Round is

PORT( Plaintext  : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      RoundKey   : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      RoundConst : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      Ciphertext : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
  );

END COMPONENT;


COMPONENT KeySchedule is

PORT( KeyState    : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      NewKey      : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      RoundKey    : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
    );

END COMPONENT;


COMPONENT RoundConstant is

PORT( RoundConst_in  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      RoundConst_out : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
  );

END COMPONENT;


COMPONENT Data_Key_RC_Store is

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

END COMPONENT;

------------------------------------------------------------------------
-- Signal Declarations
------------------------------------------------------------------------
signal Keystate : STD_LOGIC_VECTOR(127 DOWNTO 0) := (others => '0');
signal NewKey   : STD_LOGIC_VECTOR(127 DOWNTO 0) := (others => '0');
signal RoundKey : STD_LOGIC_VECTOR(63 DOWNTO 0)  := (others => '0');

signal RCstate  : STD_LOGIC_VECTOR(5 DOWNTO 0)  := (others => '0');
signal NewRC    : STD_LOGIC_VECTOR(5 DOWNTO 0)  := (others => '0');

signal NewPlain : STD_LOGIC_VECTOR(127 DOWNTO 0) := (others => '0');
signal NewCipher: STD_LOGIC_VECTOR(127 DOWNTO 0) := (others => '0');
signal LastRound: STD_LOGIC := '0';

-- No optimization  
attribute dont_touch of Keystate : signal is "true";
attribute dont_touch of NewKey   : signal is "true";
attribute dont_touch of RoundKey : signal is "true";
attribute dont_touch of RCstate  : signal is "true";
attribute dont_touch of NewRC    : signal is "true";
attribute dont_touch of NewPlain : signal is "true";
attribute dont_touch of NewCipher: signal is "true";
attribute dont_touch of LastRound: signal is "true";

------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------
begin

-----------------
-- KeySchedule --
-----------------
KEYSCH : KeySchedule port map (NewKey, Keystate, RoundKey);

-------------------
-- RoundConstant --
-------------------
ROUNDC : RoundConstant port map (NewRC, RCstate);

-----------
-- Round --
-----------
ROUNDS : Round port map (NewPlain, RoundKey, RCstate, NewCipher);

-------------
-- Storage --
-------------
STORE : Data_Key_RC_Store port map (Clk, Reset, LastRound, CipherKey, Keystate, Plaintext, NewCipher, RCstate, NewKey, NewPlain, NewRC);

-------------------------
-- Final round trigger --
-------------------------
LastRound <= '1' when RCstate = "011010" else '0'; -- 0x1A (40th round)

---------------------------
-- Send final ciphertext --
---------------------------
Ciphertext <= NewCipher;
EndOfGIFT <= LastRound;

end Behavioral;