-------------------------------------------------------------------------------
--                                                                      
--                        D Flip flop
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

architecture struc of D is

begin
  p_D:process(CLK, R)
  begin
    if R = '1' then
      Q <= '0';
    elsif(CLK = '1') then
      Q <= D_i;
    end if;
  end process p_D;
    
end struc;
