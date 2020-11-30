-------------------------------------------------------------------------------
--                                                                      
--                        ocalucator project, calc_ctrl
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

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
    signal state_now : t_state;
begin
    
    process(clk_i, reset_i)
    begin
        if reset_i = '1' then
            state_now <= RESET_S;
            
        elsif clk_i'event and clk_i = '1' then

        end if;
    end process;
end rtl;
