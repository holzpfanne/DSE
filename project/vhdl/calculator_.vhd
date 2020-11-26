-------------------------------------------------------------------------------
--                                                                      
--                        calucator project
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity calculator is
  port (clk_i   :  in std_logic;      -- clock
        reset_i :  in std_logic;      -- async reset

        ss_o    : out std_logic_vector(7 downto 0);
        ss_sel_o: out std_logic_vector(3 downto 0);    -- Display

        led_o   : out std_logic_vector(15 downto 0);   -- LED's

        pb_i    :  in std_logic_vector(3 downto 0);    -- buttons
        sw_i    :  in std_logic_vector(15 downto 0));  -- switches
end calculator;

