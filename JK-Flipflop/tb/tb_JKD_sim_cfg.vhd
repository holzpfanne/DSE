-------------------------------------------------------------------------------
--                                                                      
--                        JK and D Flip flop
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

configuration tb_JKD_sim_cfg of tb_JKD is
  for sim
    for i_JKD : JKD 
      use configuration work.JKD_struc_cfg;
    end for;
  end for;
end tb_JKD_sim_cfg;
