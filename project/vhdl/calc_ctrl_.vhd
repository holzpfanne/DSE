-------------------------------------------------------------------------------
--                                                                      
--                        ocalucator project, calc_ctrl
--  
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity calc_ctrl is
  port (clk_i   :  in std_logic;      -- clock
        reset_i :  in std_logic;      -- async reset
    
        -- alu
        op1_o   :  out std_logic_vector(11 downto 0);    -- OPT1_i
        op2_o   :  out std_logic_vector(11 downto 0);    -- OPT2_i
        opttype_o:  out std_logic_vector(3 downto 0);     -- opt
        start_o  :  out std_logic;

        finished_i : in std_logic;
        result_i  : in std_logic_vector(15 downto 0);
        sign_i     : in std_logic;
        overflow_i : in std_logic;
        error_i    : in std_logic;

        -- io_ctrl
        swsync_i:  in std_logic_vector(15 downto 0);
        pbsync_i:  in std_logic_vector(3 downto 0);

        dig0_o  : out std_logic_vector(7 downto 0);
        dig1_o  : out std_logic_vector(7 downto 0);
        dig2_o  : out std_logic_vector(7 downto 0);
        dig3_o  : out std_logic_vector(7 downto 0);
        
        led_o   : out std_logic_vector(15 downto 0)
        );
end calc_ctrl;
