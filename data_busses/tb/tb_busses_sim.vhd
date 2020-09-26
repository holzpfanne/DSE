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
-- ENGINEER:       Jonathan König
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

architecture sim of tb_busses is

  component data_bus
  port (a_i :   in std_logic_vector(31 downto 0);      -- first data bus
        b_i :   in std_logic_vector(31 downto 0);      -- second data bus
        c_i :   in std_logic;      
        d_i :   in std_logic;
        d_o :  out std_logic_vector(31 downto 0);     -- vector output
        e_o :  out std_logic);    -- xor sum output
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal a_i : std_logic_vector(31 downto 0);
  signal b_i : std_logic_vector(31 downto 0);
  signal c_i : std_logic;
  signal d_i : std_logic;
  signal d_o : std_logic_vector(31 downto 0);
  signal e_o : std_logic;
  
begin

  -- Instantiate the data_bus design for testing
  i_data_bus : data_bus
  port map              
    (a_i   => a_i,
     b_i   => b_i,
     c_i   => c_i,
     d_i   => d_i,
     d_o   => d_o,
     e_o   => e_o);

  p_test : process
    begin
      -- ZERO
      a_i <= "00000000000000000000000000000000";
      b_i <= "00000000000000000000000000000000";
      c_i <= '0';
      d_i <= '0';
      wait for 200 ns;
      -- ONE
      a_i <= "10000000000000000000000000000001";
      b_i <= "10000000000000000000000000000000";
      c_i <= '1';
      d_i <= '0';
      wait for 200 ns;
      -- TWO
      a_i <= "10000000000000000000000000000001";
      b_i <= "00000000000000000000000000000001";
      c_i <= '0';
      d_i <= '1';
      wait for 200 ns;
      -- THREE
      a_i <= "11111111111111111111111111111111";
      b_i <= "00000000000000000000000000000000";
      c_i <= '1';
      d_i <= '1';
      wait for 200 ns;
    end process;

end sim;

