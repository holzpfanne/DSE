-------------------------------------------------------------------------------
--                                                                      
--                        calucator project
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity calc is
  generic (N : natural := 32); -- length of button & switch reg to unbounce, min length 3

  port (clk_i   :  in std_logic;      -- clock
        reset_i :  in std_logic;      -- async reset

        ss_o    : out std_logic_vector(7 downto 0);
        ss_sel_o: out std_logic_vector(3 downto 0);    -- Display

        led_o   : out std_logic_vector(15 downto 0);   -- LED's

        pb_i    :  in std_logic_vector(3 downto 0);    -- buttons
        sw_i    :  in std_logic_vector(15 downto 0);    -- switches

        -- intern
        swsync_o: out std_logic_vector(15 downto 0);
        pbsync_o: out std_logic_vector(3 downto 0);

        dig0_i  :  in std_logic_vector(7 downto 0);
        dig1_i  :  in std_logic_vector(7 downto 0);
        dig2_i  :  in std_logic_vector(7 downto 0);
        dig3_i  :  in std_logic_vector(7 downto 0);
        
        led_i   :  in std_logic_vector(15 downto 0)
        );
end calc;

