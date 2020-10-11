-------------------------------------------------------------------------------
--                                                                      
--                        JK Flip flop
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity JK is
  port (CLK :   in std_logic;
        J :   in std_logic;
        K :   in std_logic;
        Q :  out std_logic);
end JK;

