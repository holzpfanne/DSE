-------------------------------------------------------------------------------
--                                                                      
--                        data busses VHDL Class Example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         tb_busses
--
-- FILENAME:       tb_busses_sim.vhd
-- 
-- ARCHITECTURE:   sim
-- 
-- ENGINEER:       Jonathan K�nig
--
-- DATE:           September 2020
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the architecture of the data busses testbench
--                 for the data busses VHDL class example.
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

architecture sim of tb_decoder is

  component decoder
  port (data_i :   in std_logic_vector(2 downto 0);      -- first data bus
        data_o :   out std_logic_vector(7 downto 0));    -- xor sum output
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal data_i : std_logic_vector(2 downto 0);
  signal data_o : std_logic_vector(7 downto 0);
  
begin

  -- Instantiate the decoder design for testing
  i_decoder : decoder
  port map              
    (data_i  => data_i,
     data_o  => data_o);

  p_test : process
    begin
      -- ZERO
      data_i <= "000";
      wait for 200 ns;
      -- ONE
      data_i <= "001";
      wait for 200 ns;
      -- TWO
      data_i <= "010";
      wait for 200 ns;
      -- THREE
      data_i <= "011";
      wait for 200 ns;
    end process;

end sim;

