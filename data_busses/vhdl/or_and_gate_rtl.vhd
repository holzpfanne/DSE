-------------------------------------------------------------------------------
--                                                                      
--                        data busses VHDL Class Example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         or_and_gate
--
-- FILENAME:       or_and_gate_rtl.vhd
-- 
-- ARCHITECTURE:   rtl
-- 
-- ENGINEER:       Jonathan König
--
-- DATE:           September 2020
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the architecture rtl of the or_and_gate submodule
--                 of the data busses VHDL class example.
--
--
-------------------------------------------------------------------------------
--
-- REFERENCES:     (none)
--
-------------------------------------------------------------------------------
--                                                                      
-- PACKAGES:       std_logic_1164 (IEEE library)
--
-------------------------------------------------------------------------------
--                                                                      
-- CHANGES:        -
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

architecture rtl of or_and_gate is
  signal re_or   : std_logic_vector(31 downto 0);
  signal re_and  : std_logic_vector(31 downto 0);

  signal re_or_mask   : std_logic_vector(31 downto 0);
  signal re_and_mask  : std_logic_vector(31 downto 0);

  signal mask_or : std_logic_vector(31 downto 0);
  signal mask_and: std_logic_vector(31 downto 0);
begin
  --d_o <= a_i and b_i;

  mask_or <= "00000000000000001111111111111111";
  mask_and <= "11111111111111110000000000000000";
  
  re_or <= a_i or b_i;
  re_and <= a_i and b_i;
  
  re_or_mask <= re_or and mask_or;
  re_and_mask <= re_and and mask_and;

  d_o <= re_or_mask or re_and_mask;

end rtl;
