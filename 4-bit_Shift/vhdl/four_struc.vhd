-------------------------------------------------------------------------------
--                                                                      
--                        JK and D Flip flop
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

architecture struc of four is

  signal q_s : std_logic_vector(3 downto 0);
begin
  shift : process(reset, clk)
  begin
    if reset = '1' then
      q_s <= "0000";
    elsif CLK'event and CLK = '1' then
      if en_i = '1' and sh_i = '0' then
        q_s <= d_i;
      elsif en_i = '1' and sh_i = '1' then
        q_s(3) <= q_s(2);
        q_s(2) <= q_s(1);
        q_s(1) <= q_s(0);
        q_s(0) <= '0';
      end if;
    end if;

  end process shift;
   q_o <= q_s;
end struc;
