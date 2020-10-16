-------------------------------------------------------------------------------
--                                                                      
--                        8-bit Adder
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity eight_bit is
  port (data0_i :   in std_logic_vector(7 downto 0);
        data1_i :   in std_logic_vector(7 downto 0);
        sum_o   :  out std_logic_vector(7 downto 0);
        cy_o    :  out std_logic);
end eight_bit;

