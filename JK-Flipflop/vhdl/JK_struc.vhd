-------------------------------------------------------------------------------
--                                                                      
--                        JK Flip flop
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

architecture struc of JK is
  signal q_out : std_logic;
begin

  p_JK: process(CLK, R)
  begin
    if R = '1' then
      q_out <= '0';
    elsif CLK'event and CLK = '1' then
      if J = '0' and K = '1' then
        q_out <= '0';
      elsif J = '1' and K = '0' then
        q_out <= '1';
      elsif J = '1' and K = '1' then
        q_out <= not(q_out);
      end if;
    end if;
  end process p_JK;

  Q <= q_out;
end struc;
