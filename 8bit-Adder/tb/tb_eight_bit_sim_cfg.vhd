-------------------------------------------------------------------------------
--                                                                      
--                        8-bit Adder
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

configuration tb_eight_bit_sim_cfg of tb_eight_bit is
  for sim
    for i_eight_bit : eight_bit 
      use configuration work.eight_bit_struc_cfg;
    end for;
  end for;
end tb_eight_bit_sim_cfg;
