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

    type button_array is array (0 to 3, 0 to N-1) of std_logic;
    signal buttons  : button_array;

    type switch_array is array (0 to 15, 0 to N-1) of std_logic;
    signal switchs : switch_array;
    
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
        variable button_low : std_logic;
        variable button_high : std_logic;
    begin
        if reset_i = '1' then
            pbsync_o <= "UUUU";
        elsif clk_i'event and clk_i = '1' then
            -- shift button state in beginning of reg
            shift_buttons : for i in 0 to 3 loop
                shift : for j in 0 to N-2 loop
                    buttons(i, j+1) <= buttons(i, j);
                end loop;
                buttons(i, 0) <= pb_i(i);
            end loop;

            for i in 0 to 3 loop
                button_low := '0';
                button_high := '1';
                for j in 0 to N-1 loop
                    button_low  := button_low or buttons(i,j);
                    button_high := button_low and buttons(i,j);
                end loop;
                if button_low = '0' then 
                    pbsync_o(i) <= '0';
                elsif button_high = '1' then
                    pbsync_o(i) <= '1';
                end if;
            end loop;
            
        end if;
    end process button_debouncing;

    switch_debouncing:process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            swsync_o <= "UUUUUUUUUUUUUUUU";
        elsif clk_i'event and clk_i = '1' then
            -- shift switch state in beginning of reg
            shift_switches : for i in 0 to 3 loop
                shift : for j in 0 to N-2 loop
                    switchs(i, j+1) <= switchs(i, j);
                end loop;
                switchs(i, 0) <= pb_i(i);
            end loop;
        end if;
    end process switch_debouncing;
   
end rtl;