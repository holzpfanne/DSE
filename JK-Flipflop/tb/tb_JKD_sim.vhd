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
        R_D  :  in std_logic;
        Q_D :  out std_logic;
        J   :   in std_logic;
        K   :   in std_logic;
        R_JK :  in std_logic;
        Q_JK:  out std_logic);
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal CLK :  std_logic;
  signal D_i :  std_logic;
  signal R_D :  std_logic;
  signal Q_D :  std_logic;
  signal J   :  std_logic;
  signal K   :  std_logic;
  signal Q_JK:  std_logic;
  signal R_JK : std_logic;
  
begin

  -- Instantiate the decoder design for testing
  i_JKD: JKD
  port map              
    (CLK  => CLK,
     D_i  => D_i,
     R_D  => R_D,
     Q_D  => Q_D,
     J    => J,
     K    => K,
     R_JK => R_JK,
     Q_JK => Q_JK);

  P_clock : process
    begin
      CLK <= '1';
      wait for 20 ns;
      CLK <= '0';
      wait for 20 ns;
    end process;

  p_reset : process
    begin
      R_D <= '1';
      R_JK <= '1';
      wait for 100 ns;
      R_D <= '0';
      R_JK <= '0';
      wait for 600 ns;
    end process;

  p_test : process
    begin
      -- SET 1
      D_i <= '1';
      J <= '1';
      K <= '0';
      wait for 200 ns;
      
      -- SET 0
      D_i <= '0';
      J <= '0';
      K <= '1';
      wait for 200 ns;

      -- Toogle
      D_i <= '1';
      J <= '1';
      K <= '1';
      wait for 200 ns;
    end process;

end sim;

