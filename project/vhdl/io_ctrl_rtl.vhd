-------------------------------------------------------------------------------
--                                                                      
--                        calucator project
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

-- clk_i   :  in std_logic;      -- clock
-- reset_i :  in std_logic;      -- async reset
-- 
-- ss_o    : out std_logic_vector(7 downto 0);
-- ss_sel_o: out std_logic_vector(3 downto 0);    -- Display
-- 
-- led_o   : out std_logic_vector(15 downto 0);   -- LED's
-- 
-- pb_i    :  in std_logic_vector(3 downto 0);    -- buttons
-- sw_i    :  in std_logic_vector(15 downto 0);    -- switches
-- 
--         -- intern
-- swsync_o: out std_logic_vector(15 downto 0);
-- pbsync_o: out std_logic_vector(3 downto 0);
-- 
-- dig0_i  :  in std_logic_vector(7 downto 0);
-- dig1_i  :  in std_logic_vector(7 downto 0);
-- dig2_i  :  in std_logic_vector(7 downto 0);
-- dig3_i  :  in std_logic_vector(7 downto 0);
--         
-- led_i   :  in std_logic_vector(15 downto 0)

architecture rtl of calc is

    signal button0_state_vector  : std_logic_vector(N-1 downto 0);
    signal button1_state_vector  : std_logic_vector(N-1 downto 0);
    signal button2_state_vector  : std_logic_vector(N-1 downto 0);
    signal button3_state_vector  : std_logic_vector(N-1 downto 0);

    signal switch0_state_vector  : std_logic_vector(N-1 downto 0);
    signal switch1_state_vector  : std_logic_vector(N-1 downto 0);
    signal switch2_state_vector  : std_logic_vector(N-1 downto 0);
    signal switch3_state_vector  : std_logic_vector(N-1 downto 0);
    signal switch4_state_vector  : std_logic_vector(N-1 downto 0);
    signal switch5_state_vector  : std_logic_vector(N-1 downto 0);
    signal switch6_state_vector  : std_logic_vector(N-1 downto 0);
    signal switch7_state_vector  : std_logic_vector(N-1 downto 0);
    signal switch8_state_vector  : std_logic_vector(N-1 downto 0);
    signal switch9_state_vector  : std_logic_vector(N-1 downto 0);
    signal switch10_state_vector : std_logic_vector(N-1 downto 0);
    signal switch11_state_vector : std_logic_vector(N-1 downto 0);
    signal switch12_state_vector : std_logic_vector(N-1 downto 0);
    signal switch13_state_vector : std_logic_vector(N-1 downto 0);
    signal switch14_state_vector : std_logic_vector(N-1 downto 0);
    signal switch15_state_vector : std_logic_vector(N-1 downto 0);
    
begin

    led:process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            led_o <= "0000000000000000";
        elsif clk_i'event and clk_i = '1' then
            led_o <= led_i;
        end if;


    end process led;

    button_debouncing:process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            pbsync_o <= "0000";
        elsif clk_i'event and clk_i = '1' then

        end if;
    end process button_debouncing;

    switch_debouncing:process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            swsync_o <= "0000000000000000";
        elsif clk_i'event and clk_i = '1' then

        end if;
    end process switch_debouncing;
   
end rtl;