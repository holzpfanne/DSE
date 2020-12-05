-------------------------------------------------------------------------------
--                                                                      
--                        ocalucator project, calc_ctrl
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

library work;
use work.project_defines.all;
use work.operations.all;

-- clk_i   :  in std_logic;      -- clock
-- reset_i :  in std_logic;      -- async reset
--     
-- -- alu
-- op1_o   :  out std_logic_vector(11 downto 0);    -- OPT1_i
-- op2_o   :  out std_logic_vector(11 downto 0);    -- OPT2_i
-- opttype_o:  out std_logic_vector(3 downto 0);     -- opt
-- start_o  :  out std_logic;
-- 
-- finished_i : in std_logic;
-- result_i  : in std_logic_vector(15 downto 0);
-- sign_i     : in std_logic;
-- overflow_i : in std_logic;
-- error_i    : in std_logic;
-- 
-- -- io_ctrl
-- swsync_i:  in std_logic_vector(15 downto 0);
-- pbsync_i:  in std_logic_vector(3 downto 0);
-- 
-- dig0_o  : out std_logic_vector(7 downto 0);
-- dig1_o  : out std_logic_vector(7 downto 0);
-- dig2_o  : out std_logic_vector(7 downto 0);
-- dig3_o  : out std_logic_vector(7 downto 0);
--         
-- led_o   : out std_logic_vector(15 downto 0)

architecture rtl of calc_ctrl is
    type t_state is (RESET_S, SET_S, CALCULATE_S, RESULT_S);
    type sub_state is (SET_OP1_S, SET_OP2_S, SET_OPT_S);
    signal state_now : t_state;
    signal sub_state_now : sub_state;
begin
    
    process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            state_now <= RESET_S;
            sub_state_now <= SET_OPT_S;
            dig0_o <= (others=>'0');
            dig1_o <= (others=>'0');
            dig2_o <= (others=>'0');
            dig3_o <= (others=>'0');
            led_o  <= (others=>'0');

            op1_o  <= (others=>'0');
            op2_o  <= (others=>'0');
            opttype_o <= (others=>'0');
            start_o <= '0';

        elsif clk_i'event and clk_i = '1' then
            if state_now = CALCULATE_S then
                if finished_i = '1' then
                    start_o <= '0';
                    state_now <= RESULT_S;
                else 
                    start_o <= '1';
                    dig3_o <= digits(12); -- C
                    dig2_o <= digits(10); -- A
                    dig1_o <= "00111000"; -- L
                    dig0_o <= digits(12); -- C
                end if;

            elsif state_now = RESULT_S then
                if pbsync_i(2 downto 0) /= "000" then
                    state_now <= SET_S;
                else
                    dig3_o <= digits(0);
                    dig0_o <= digits(conv_integer(unsigned(result_i(3 downto 0))));
                    dig1_o <= digits(conv_integer(unsigned(result_i(7 downto 4))));
                    dig2_o <= digits(conv_integer(unsigned(result_i(11 downto 8))));
                end if;

            elsif state_now = SET_S then
                if (BTND and pbsync_i) = BTND then
                    state_now <= CALCULATE_S;
                else
                    -- sat sub state    
                    if (BTNR and pbsync_i) = BTNR then
                        sub_state_now <= SET_OP2_S;
                    elsif (BTNC and pbsync_i) = BTNC then
                        sub_state_now <= SET_OPT_S;
                    elsif (BTNL and pbsync_i) = BTNL then
                        sub_state_now <= SET_OP1_S;
                    else 
                        sub_state_now <= sub_state_now;
                    end if;
                
                    -- set values
                    if sub_state_now = SET_OP1_S then
                        dig3_o <= digits(1) or "10000000";
                        op1_o <= swsync_i(11 downto 0);
                        dig0_o <= digits(conv_integer(unsigned(swsync_i(3 downto 0))));
                        dig1_o <= digits(conv_integer(unsigned(swsync_i(7 downto 4))));
                        dig2_o <= digits(conv_integer(unsigned(swsync_i(11 downto 8))));

                    elsif sub_state_now = SET_OP2_S then
                        dig3_o <= digits(2) or "10000000";
                        op2_o <= swsync_i(11 downto 0);
                        dig0_o <= digits(conv_integer(unsigned(swsync_i(3 downto 0))));
                        dig1_o <= digits(conv_integer(unsigned(swsync_i(7 downto 4))));
                        dig2_o <= digits(conv_integer(unsigned(swsync_i(11 downto 8))));

                    else -- sub_state_now = SET_OPT_S
                        dig3_o <= "01011100" or "10000000"; -- o.
                        opttype_o <= swsync_i(3 downto 0);
                        -- set opt digits
                        case swsync_i(3 downto 0) is
                            when o_add => 
                                dig2_o <= digits(10);
                                dig1_o <= digits(13);
                                dig0_o <= digits(13);
                            when o_sqrt => 
                                dig2_o <= digits(5);
                                dig1_o <= "01010000"; -- r
                                dig0_o <= "01011100"; -- o
                            when o_not => 
                                dig2_o <= "01010100"; -- n
                                dig1_o <= "01011100"; -- o
                                dig0_o <= "00000000"; -- 
                            when o_xor => 
                                dig2_o <= digits(14);
                                dig1_o <= "01011100"; -- o
                                dig0_o <= "01010000"; -- r
                            when others => 
                                dig2_o <= "00000000";
                                dig1_o <= "00000000";
                                dig0_o <= "00000000";
                        end case;

                    end if;
                end if;

                
            
            else -- sub_state_now = RESET_S
                sub_state_now <= SET_OPT_S;
                dig0_o <= (others=>'0');
                dig1_o <= (others=>'0');
                dig2_o <= (others=>'0');
                dig3_o <= (others=>'0');
                led_o  <= (others=>'0');

                op1_o  <= (others=>'0');
                op2_o  <= (others=>'0');
                opttype_o <= (others=>'0');
                start_o <= '0';
            end if;
        end if;
    end process;
end rtl;
