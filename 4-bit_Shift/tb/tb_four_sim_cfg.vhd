-------------------------------------------------------------------------------
--                                                                      
--                        JK and D Flip flop
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

configuration tb_four_sim_cfg of tb_four is
  for sim
    for i_four : four
      use configuration work.four_struc_cfg;
    end for;
  end for;
end tb_four_sim_cfg;
