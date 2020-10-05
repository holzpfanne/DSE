-------------------------------------------------------------------------------
--                                                                      
--                        busses VHDL Class Example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         tb_busses
--
-- FILENAME:       tb_busses_sim_cfg.vhd
-- 
-- ARCHITECTURE:   sim
-- 
-- ENGINEER:       Jonathan K�nig
--
-- DATE:           Septmber 2020
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the configuration for the busses testbench
--                 of the busses VHDL class example.
--
--
-------------------------------------------------------------------------------
--
-- REFERENCES:     (none)
--
-------------------------------------------------------------------------------
--                                                                      
-- PACKAGES:       std_logic_1164 (IEEE library)
--
-------------------------------------------------------------------------------
--                                                                      
-- CHANGES:        -
--
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

configuration tb_decoder_sim_cfg of tb_decoder is
  for sim
    for i_decoder : decoder
      use configuration work.decoder_struc_cfg;
    end for;
  end for;
end tb_decoder_sim_cfg;
