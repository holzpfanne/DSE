-------------------------------------------------------------------------------
--                                                                      
--                        JK and D Flip flop
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

architecture sim of tb_JKD is

  component JKD
  port (CLK :   in std_logic;
        D_i :   in std_logic;
        R   :   in std_logic;
        Q_D :  out std_logic;
        J   :   in std_logic;
        K   :   in std_logic;
        Q_JK:  out std_logic);
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal CLK :  std_logic;
  signal D_i :  std_logic;
  signal R   :  std_logic;
  signal Q_D :  std_logic;
  signal J   :  std_logic;
  signal K   :  std_logic;
  signal Q_JK:  std_logic;
  
begin

  -- Instantiate the decoder design for testing
  i_JKD: JKD
  port map              
    (CLK  => CLK,
     D_i  => D_i,
     R    => R,
     Q_D  => Q_D,
     J    => J,
     K    => K,
     Q_JK => Q_JK);

  p_test : process
    begin
      -- SET 1
      D_i <= '1';
      R <= '0';
      J <= '1';
      K <= '0';
      wait for 100 ns;
      CLK <= '1';
      wait for 100 ns;
      CLK <= '0';
      
      -- SET 0
      D_i <= '0';
      R <= '0';
      J <= '0';
      K <= '1';
      wait for 100 ns;
      CLK <= '1';
      wait for 100 ns;
      CLK <= '0';

      -- RESET / Toogle
      D_i <= '1';
      R <= '1';
      J <= '1';
      K <= '1';
      wait for 100 ns;
      CLK <= '1';
      wait for 100 ns;
      CLK <= '0';
    end process;

end sim;

