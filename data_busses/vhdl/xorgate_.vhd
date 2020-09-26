-------------------------------------------------------------------------------
--                                                                      
--                        data busses VHDL Class Example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         xorgate
--
-- FILENAME:       xorgate_.vhd
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
-- DESCRIPTION:    This is the entity declaration of the xorgate submodule
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

entity xorgate is
  port (a_i :   in std_logic;          -- first data bit
        b_i :   in std_logic;          -- second data bit
        xor_o : out std_logic);         -- resault of the data bits
end xorgate;
