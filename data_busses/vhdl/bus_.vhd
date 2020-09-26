-------------------------------------------------------------------------------
--                                                                      
--                        Fulladder VHDL Class Example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         fulladder
--
-- FILENAME:       fulladder_.vhd
-- 
-- ARCHITECTURE:   struc
-- 
-- ENGINEER:       Roland Höller
--
-- DATE:           30. June 2000
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the entity declaration of the fulladder
--                 VHDL class example.
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

entity data_bus is
  port (a_i :   in std_logic_vector(31 downto 0);      -- first data bus
        b_i :   in std_logic_vector(31 downto 0);      -- second data bus
        d_o :   out std_logic_vector(31 downto 0);      -- data bus out

        c_i :  in std_logic;     -- first xor
        d_i :  in std_logic;    -- second xor
        e_o : out std_logic);
end data_bus;

