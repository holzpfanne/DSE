
library IEEE;
use IEEE.std_logic_1164.all;

package project_defines is

    constant o_add       : std_logic_vector(3 downto 0) := "0000"; -- OP1 + OP2
    constant o_sub       : std_logic_vector(3 downto 0) := "0001"; -- OP1 - OP2
    constant o_multiply  : std_logic_vector(3 downto 0) := "0010"; -- OP1 * OP2
    constant o_divide    : std_logic_vector(3 downto 0) := "0011"; -- Integer fraction of OP1 / OP2
    constant o_remainder : std_logic_vector(3 downto 0) := "0100"; -- Remainder of OP1 / OP2
    constant o_sqr       : std_logic_vector(3 downto 0) := "0101"; -- OP2 will be ignored
    constant o_sqrt      : std_logic_vector(3 downto 0) := "0110"; -- Square Root Integer fraction of √OP1 (value of OP2 will be ignored) 
    constant o_log       : std_logic_vector(3 downto 0) := "0111"; -- Binary Logarithm Integer fraction of log2 OP1 (value of OP2 will be ignored) 
    constant o_not       : std_logic_vector(3 downto 0) := "1000"; -- Logical NOT Performs bit-wise NOT of OP1 (value of OP2 will be ignored) 
    constant o_and       : std_logic_vector(3 downto 0) := "1001"; -- Logical AND Performs bit-wise AND of OP1 with OP2 
    constant o_or        : std_logic_vector(3 downto 0) := "1010"; -- Logical OR Performs bit-wise OR of OP1 with OP2 
    constant o_xor       : std_logic_vector(3 downto 0) := "1011"; -- Logical Ex-OR Performs bit-wise “Exclusive-OR” of OP1 with OP2 
    constant o_rol       : std_logic_vector(3 downto 0) := "1100"; -- Rotate Left OP1  will  be  shifted  left  by  one  bit  position  and  the  most  significant bit  of  OP1  becomes  the  least  significant  bit  (value  of  OP2  will  be ignored) 
    constant o_ror       : std_logic_vector(3 downto 0) := "1101"; -- Rotate Right 
    -- '111X' -- reserved for future use

end package project_defines;

package body project_defines is

end package body project_defines;