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

-- if start_i rises the specifed operation will be performed
-- if the operation is finished or fail finished_o will be set to 1

-- operations them self are defined in ../packages/operations_.vhd

architecture rtl of alu is

begin
    p_execute : process(start_i, reset_i)
    begin
        if reset_i = '1' then
            result_o <= (others => '0');
            sign_o <= '0';
            overflow_o <= '0';
            error_o <= '0';
            finished_o <= '0';
        elsif start_i'event and start_i = '1' then
            sign_o <= '0';
            overflow_o <= '0';
            error_o <= '0';
            result_o <= (others => '0');
            finished_o <= '0';
            case opttype_i is
                when o_add => f_add(op1_i, op2_i, result_o, overflow_o);
                when o_sqrt => f_sqrt(op1_i, op2_i, result_o, overflow_o);
                when o_not => f_not(op1_i, op2_i, result_o, overflow_o);
                when o_xor => f_xor(op1_i, op2_i, result_o, overflow_o);
                when others => error_o <= '1';
            end case;
            finished_o <= '1';
        end if;
    end process p_execute;
  

end rtl;