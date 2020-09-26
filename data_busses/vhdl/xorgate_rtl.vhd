-------------------------------------------------------------------------------
--                                                                      
--                        Fulladder VHDL Class Example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         xorgate
--
-- FILENAME:       xorgate_rtl.vhd
-- 
-- ARCHITECTURE:   rtl
-- 
-- ENGINEER:       Jonathan König
--
-- DATE:           30. June 2000
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the architecture rtl of the xorgate submodule
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
-- CHANGES:        Version 2.0 - RH - 30 June 2000
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

architecture rtl of xorgate is
begin
  xor_o <= a_i xor b_i;       -- xor of the data bits
end rtl;
