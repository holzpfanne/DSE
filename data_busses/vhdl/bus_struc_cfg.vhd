-------------------------------------------------------------------------------
--                                                                      
--                        Fulladder VHDL Class Example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         data_bus
--
-- FILENAME:       data_bus_struc_cfg.vhd
-- 
-- ARCHITECTURE:   struc
-- 
-- ENGINEER:       Jonathan König
--
-- DATE:           September 2020
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the configuration for the entity data_bus and the
--                 architecture struc.
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

configuration bus_struc_cfg of data_bus is
  for struc        -- architecture struc is used for entity data_bus
  end for;
end bus_struc_cfg;
