-------------------------------------------------------------------------------
--                                                                      
--                        JK and D Flip flop
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity JKD is
  port (CLK :   in std_logic;
        D_i :   in std_logic;
        R_D :   in std_logic;
        Q_D :  out std_logic;
        R_JK :  in std_logic;
        J   :   in std_logic;
        K   :   in std_logic;
        Q_JK:  out std_logic);
end JKD;

