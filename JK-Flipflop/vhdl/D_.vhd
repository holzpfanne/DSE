-------------------------------------------------------------------------------
--                                                                      
--                        D Flip flop
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity D is
  port (CLK :   in std_logic;
        D_i :   in std_logic;
        R :   in std_logic;
        Q :  out std_logic);
end D;

