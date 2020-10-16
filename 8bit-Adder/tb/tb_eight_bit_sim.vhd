-------------------------------------------------------------------------------
--                                                                      
--                        8-bit Adder
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

architecture sim of tb_eight_bit is

  component eight_bit
  port (data0_i :   in std_logic_vector(7 downto 0);
        data1_i :   in std_logic_vector(7 downto 0);
        sum_o   :  out std_logic_vector(7 downto 0);
        cy_o    :  out std_logic);
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal data0_i :   std_logic_vector(7 downto 0);
  signal data1_i :   std_logic_vector(7 downto 0);
  signal sum_o   :   std_logic_vector(7 downto 0);
  signal cy_o    :   std_logic;
  
begin

  -- Instantiate the decoder design for testing
  i_eight_bit: eight_bit
  port map              
    (data0_i  => data0_i,
     data1_i  => data1_i,
     sum_o    => sum_o,
     cy_o     => cy_o);

  p_test : process
    begin
      -- 1+1
      data0_i <= "00000001";
      data1_i <= "00000001";
      wait for 200 ns;

      -- 181 + 74
      data0_i <= "10110101";
      data1_i <= "01001010";
      wait for 200 ns;

      -- 255 + 1
      data0_i <= "11111111";
      data1_i <= "00000001";
      wait for 200 ns;

      -- 255 + 255
      data0_i <= "11111111";
      data1_i <= "11111111";
      wait for 200 ns;
      
    end process;

end sim;

