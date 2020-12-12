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

architecture sim of tb_calculator is

  component calculator
  port (clk_i   :  in std_logic;      -- clock
        reset_i :  in std_logic;      -- async reset

        ss_o    : out std_logic_vector(7 downto 0);
        ss_sel_o: out std_logic_vector(3 downto 0);    -- Display

        led_o   : out std_logic_vector(15 downto 0);   -- LED's

        pb_i    :  in std_logic_vector(3 downto 0);    -- buttons
        sw_i    :  in std_logic_vector(15 downto 0));  -- switches
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal clk_i   : std_logic;      -- clock
  signal reset_i : std_logic;      -- async reset
  signal ss_o    : std_logic_vector(7 downto 0);
  signal ss_sel_o: std_logic_vector(3 downto 0);    -- Display
  signal led_o   : std_logic_vector(15 downto 0);   -- LED's
  signal pb_i    : std_logic_vector(3 downto 0);    -- buttons
  signal sw_i    : std_logic_vector(15 downto 0);  -- switches
  
begin

  -- Instantiate the data_bus design for testing
  i_calculator : calculator
  port map              
    (clk_i    => clk_i,
     reset_i  => reset_i,
     ss_o     => ss_o,
     ss_sel_o => ss_sel_o,
     led_o    => led_o,
     pb_i     => pb_i,
     sw_i     => sw_i);

  p_clock : process
    begin
      -- ZERO
      clk_i <= '0';
      wait for 1 ns;
      -- ONE
      clk_i <= '1';
      wait for 1 ns;
    end process;

  p_reset : process
    begin
      reset_i <= '1';
      wait for 5 ms;
      reset_i <= '0';
      wait for 395 ms;
    end process;

  p_test : process
    begin
      wait for 5 ms;
      wait for 1 ms;
      pb_i <= "0001";
      wait for 1 ms;
      sw_i <= "0000000000000001";
      wait for 1 ms;
      pb_i <= "0010";
      wait for 1 ms;
      sw_i <= "0000000000000001";
      pb_i <= "0100";
      wait for 1 ms;
      sw_i <= "0000000000000000";
      wait for 1 ms;
      pb_i <= "1000";
      wait for 290 ms;


    end process;


end sim;

