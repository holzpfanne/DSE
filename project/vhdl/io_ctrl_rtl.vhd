-------------------------------------------------------------------------------
--                                                                      
--                        calucator project
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

architecture rtl of io_ctrl is

    -- button FIFO's
    type button_array is array (0 to 3, 0 to N-1) of std_logic;
    signal buttons : button_array;

    -- switch FIFO's
    type switch_array is array (0 to 15, 0 to N-1) of std_logic;
    signal switchs : switch_array;

    signal digit_select : unsigned(1 downto 0);

    signal counter : unsigned(14 downto 0);
    signal post_clk_digits : std_logic;
    signal post_clk_debounds : std_logic;
    
begin
    -- scal clock down 
    clock_scaler:process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            counter <= (others => '0');
        elsif clk_i'event and clk_i = '1' then
            counter <= counter + 1;
            if counter = 0 then
                post_clk_digits <= '1';
            else 
                post_clk_digits <= '0';
            end if;

            if counter(3) = '0' then
                post_clk_debounds <= '1';
            else
                post_clk_debounds <= '0';
            end if;
        end if;

    end process clock_scaler;
    
    -- write leds out
    led:process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            led_o <= "0000000000000000";
        elsif clk_i'event and clk_i = '1' then
            led_o <= led_i;
        end if;


    end process led;

    -- with every clock the state of the button's is pushed in a FIFO
    -- if the FIFO contains only 0's or 1's the status pbsync_o is updated
    button_debouncing:process(post_clk_debounds, reset_i)
        variable button_low : std_logic;
        variable button_high : std_logic;
    begin
        if reset_i = '1' then
            pbsync_o <= "0000";
            buttons <= ((others=>(others=>'0')));
        elsif post_clk_debounds'event and post_clk_debounds = '1' then
            -- shift button state in beginning of reg
            shift_buttons : for i in 0 to 3 loop
                shift : for j in 0 to N-2 loop
                    buttons(i, j+1) <= buttons(i, j);
                end loop;
                buttons(i, 0) <= pb_i(i);
            end loop;

            -- check if FIFO's are only 0's or 1's
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

    -- with every clock the state of the swiches is pushed in a FIFO
    -- if the FIFO contains only 0's or 1's the status swsync_o is updated
    switch_debouncing:process(post_clk_debounds, reset_i)
        variable switch_low : std_logic;
        variable switch_high : std_logic;
    begin
        if reset_i = '1' then
            swsync_o <= "0000000000000000";
            switchs <= ((others=>(others=>'0')));
        elsif post_clk_debounds'event and post_clk_debounds = '1' then
            -- shift switch state in beginning of reg
            shift_switches : for i in 0 to 15 loop
                shift : for j in 0 to N-2 loop
                    switchs(i, j+1) <= switchs(i, j);
                end loop;
                switchs(i, 0) <= sw_i(i);
            end loop;

            -- check if FIFO's are only 0's or 1's
            for i in 0 to 15 loop
                switch_low := '0';
                switch_high := '1';
                for j in 0 to N-1 loop
                    switch_low  := switch_low or switchs(i,j);
                    switch_high := switch_high and switchs(i,j);
                end loop;
                if switch_low = '0' then 
                    swsync_o(i) <= '0';
                elsif switch_high = '1' then
                    swsync_o(i) <= '1';
                end if;
            end loop;
        end if;
    end process switch_debouncing;

    -- write every digit after the other
    digits_write:process(post_clk_digits, reset_i)
    begin
        if reset_i = '1' then
            digit_select <= "00";
            ss_sel_o <= not "0000";
            ss_o <= "00000000";
        elsif post_clk_digits'event and post_clk_digits = '1' then
                -- write digit to selects section
            if digit_select = 1 then
                ss_sel_o <= not "0010";
                ss_o <= not dig1_i;
            elsif digit_select = 2 then
                ss_sel_o <= not "0100";
                ss_o <= not dig2_i;
            elsif digit_select = 3 then
                ss_sel_o <= not "1000";
                ss_o <= not dig3_i;
            else 
                ss_sel_o <= not "0001";
                ss_o <= not dig0_i;
            end if;

            -- increment digit_select if 3 + 1 -> 0 : intendet
            digit_select <= digit_select + 1;
            
        end if;
    end process digits_write;
   
end rtl;