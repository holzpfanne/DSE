-------------------------------------------------------------------------------
--                                                                      
--                        JK and D Flip flop
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

architecture struc of JKD is

  component D
  port (CLK :   in std_logic;
        D_i :   in std_logic;
        R :   in std_logic;
        Q :  out std_logic);
  end component;

  component JK
  port (CLK :   in std_logic;
        J :   in std_logic;
        K :   in std_logic;
        Q :  out std_logic);
  end component;
begin
  i_D : D
  port map
    (CLK => CLK,
     D_i => D_i,
     R => R,
     Q => Q_D);

  i_JK : JK
  port map
    (CLK => CLK,
     J => J,
     k => K,
     Q => Q_JK);
  
    
  
   
end struc;
