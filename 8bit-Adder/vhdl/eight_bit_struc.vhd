-------------------------------------------------------------------------------
--                                                                      
--                        8-bit Adder
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

architecture struc of eight_bit is
    signal sum : unsigned(8 downto 0);
begin
  sum <= unsigned(data0_i) + conv_unsigned(unsigned(data1_i),9);
  cy_o <= std_logic(sum(8));
  sum_o <= std_logic_vector(sum(7 downto 0));
end struc;
