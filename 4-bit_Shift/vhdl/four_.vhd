-------------------------------------------------------------------------------
--                                                                      
--                        JK and D Flip flop
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity four is
  port (d_i  :   in std_logic_vector(3 downto 0);
        en_i :   in std_logic;
        sh_i :   in std_logic;
        q_o  :  out std_logic_vector(3 downto 0);
        clk  :   in std_logic;
        reset :  in std_logic);
end four;

