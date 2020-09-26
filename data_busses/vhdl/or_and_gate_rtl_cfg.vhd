-------------------------------------------------------------------------------
--                                                                      
--                        Fulladder VHDL Class Example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         orgate
--
-- FILENAME:       orgate_rtl_cfg.vhd
-- 
-- ARCHITECTURE:   rtl
-- 
-- ENGINEER:       Roland Höller
--
-- DATE:           30. June 2000
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the configuration for the entity oragate and the
--                 architecture rtl.
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
-- CHANGES:        Version 2.0 - RH - 30 June 2000
--
-------------------------------------------------------------------------------

configuration or_and_gate_rtl_cfg of or_and_gate is
  for rtl        -- architecture rtl is used for entity or_and_gate
  end for;
end or_and_gate_rtl_cfg;
