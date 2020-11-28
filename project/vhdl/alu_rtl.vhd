-------------------------------------------------------------------------------
--                                                                      
--                        ocalucator project, ALU
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
-- op1_i   :  in std_logic_vector(11 downto 0);    -- OPT1_i
-- op2_i   :  in std_logic_vector(11 downto 0);    -- OPT2_i
-- opttype_i:  in std_logic_vector(3 downto 0);     -- opt
-- start_i  :  in std_logic;
-- 
-- finished_o : out std_logic;
-- result_o   : out std_logic_vector(15 downto 0);
-- sign_o     : out std_logic;
-- overflow_o : out std_logic;
-- error_o    : out std_logic;


architecture rtl of alu is

begin

    p_calc: process(clk_i, reset_i)
    begin
        
        sign_o <= '0';
        overflow_o <= '0';
        error_o <= '0';
        if reset_i = '1' then
            finished_o <= '0';

        elsif clk_i'event and clk_i = '1' then 
            if start_i = '1' then
                case opttype_i is
                    when o_add => f_add(op1_i, op2_i, result_o, overflow_o);
                    when o_sqrt => f_sqrt(op1_i, op2_i, result_o, overflow_o);
                    when o_not => f_not(op1_i, op2_i, result_o, overflow_o);
                    when o_xor => f_xor(op1_i, op2_i, result_o, overflow_o);
                    when others => error_o <= '1';
                end case;
            end if;
        end if;

    end process p_calc;
  

end rtl;