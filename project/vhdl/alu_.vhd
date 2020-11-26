-------------------------------------------------------------------------------
--                                                                      
--                        ocalucator project, ALU
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity alu is
  port (clk_i   :  in std_logic;      -- clock
        reste_i :  in std_logic;      -- async reset
    
        op1_i   :  in std_logic_vector(11 downto 0);    -- OPT1_i
        op2_i   :  in std_logic_vector(11 downto 0);    -- OPT2_i
        opttype_i:  in std_logic_vector(3 downto 0);     -- opt
        start_i  :  in std_logic;

        finished_o : out std_logic;
        result_o  : out std_logic_vector(15 downto 0);
        sign_o     : out std_logic;
        overflow_o : out std_logic;
        error_o    : out std_logic
        );

end alu;

