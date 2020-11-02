-------------------------------------------------------------------------------
--                                                                      
--                        JK and D Flip flop
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

architecture sim of tb_four is

  component four
  port (d_i  :   in std_logic_vector(3 downto 0);
        en_i :   in std_logic;
        sh_i :   in std_logic;
        q_o  :  out std_logic_vector(3 downto 0);
        clk  :   in std_logic;
        reset :  in std_logic);
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal d_i  :   std_logic_vector(3 downto 0);
  signal en_i :   std_logic;
  signal sh_i :   std_logic;
  signal q_o  :   std_logic_vector(3 downto 0);
  signal clk  :   std_logic;
  signal reset :  std_logic;
  
begin

  -- Instantiate the decoder design for testing
  i_four : four
  port map              
    (d_i    => d_i,
     en_i   => en_i,
     sh_i   => sh_i,
     q_o    => q_o,
     clk    => clk,
     reset  => reset);

  P_clock : process
    begin
      clk <= '1';
      wait for 20 ns;
      clk <= '0';
      wait for 20 ns;
    end process;

  p_reset : process
    begin
      reset <= '1';
      wait for 100 ns;
      reset <= '0';
      wait for 300 ns;
    end process;

  p_test : process
    begin
      -- SET d_o
      en_i <= '1';
      sh_i <= '0';
      d_i <= "0101";
      wait for 200 ns;

      -- SET 1
      en_i <= '1';
      sh_i <= '1';
      d_i <= "0101";
      wait for 200 ns;

    end process;

end sim;

