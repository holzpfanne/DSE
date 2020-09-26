-------------------------------------------------------------------------------
--                                                                      
--                        Fulladder VHDL Class Example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         fulladder
--
-- FILENAME:       fulladder_struc.vhd
-- 
-- ARCHITECTURE:   rtl
-- 
-- ENGINEER:       Roland Höller
--
-- DATE:           30. June 2000
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the architecture struc of the fulladder VHDL
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
-- CHANGES:        Version 2.0 - RH - 30 June 2000
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

architecture struc of data_bus is

  component or_and_gate
    port (a_i :    in  std_logic_vector(31 downto 0);
          b_i :    in  std_logic_vector(31 downto 0);
          d_o :  out std_logic_vector(31 downto 0));
  end component;

  component xorgate
    port (a_i :    in  std_logic;
          b_i :    in  std_logic;
          xor_o :   out std_logic);
  end component;
begin

  -- map ports
  xor_gate : xorgate
  port map              
    (a_i   => c_i,
     b_i   => d_i,
     xor_o => e_o);

  or_and : or_and_gate
  port map
    (a_i   => a_i,
     b_i   => b_i,
     d_o   => d_o); 
   
end struc;
