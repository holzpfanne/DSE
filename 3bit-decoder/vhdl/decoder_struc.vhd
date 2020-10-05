-------------------------------------------------------------------------------
--                                                                      
--                        data busses VHDL Class Example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         bus
--
-- FILENAME:       bus_struc.vhd
-- 
-- ARCHITECTURE:   rtl
-- 
-- ENGINEER:       Jonathan K�nig
--
-- DATE:           30. June 2000
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the architecture struc of the data busses VHDL
--                 class example.
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

architecture struc of decoder is

begin

  data_o <= "00000001" when data_i = "000" else
            "00000010" when data_i = "001" else
            "00000100" when data_i = "010" else
            "00001000" when data_i = "011" else
            "00010000" when data_i = "100" else
            "00100000" when data_i = "101" else
            "01000000" when data_i = "110";
    
  
   
end struc;
