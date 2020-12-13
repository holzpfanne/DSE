library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

-- declration of operations
package operations is
    procedure f_add (signal op1 : in std_logic_vector(11 downto 0);
                     signal op2 : in std_logic_vector(11 downto 0);
                     signal result : out std_logic_vector(15 downto 0);
                     signal overflow : out std_logic);

    procedure f_sqrt (signal op1 : in std_logic_vector(11 downto 0);
                      signal op2 : in std_logic_vector(11 downto 0);
                      signal result : out std_logic_vector(15 downto 0);
                      signal overflow : out std_logic);

    procedure f_not (signal op1 : in std_logic_vector(11 downto 0);
                     signal op2 : in std_logic_vector(11 downto 0);
                     signal result : out std_logic_vector(15 downto 0);
                     signal overflow : out std_logic);

    procedure f_xor (signal op1 : in std_logic_vector(11 downto 0);
                     signal op2 : in std_logic_vector(11 downto 0);
                     signal result : out std_logic_vector(15 downto 0);
                     signal overflow : out std_logic);
    

end package operations;

-- definitions of operations
package body operations is

    procedure f_add (signal op1 : in std_logic_vector(11 downto 0);
                     signal op2 : in std_logic_vector(11 downto 0);
                     signal result : out std_logic_vector(15 downto 0);
                     signal overflow : out std_logic) is
  
    variable sum : unsigned(12 downto 0);
    begin 
        -- make sum and get overflow
        sum := unsigned(op1) + conv_unsigned(unsigned(op2),13);
        overflow <= std_logic(sum(12));
        result <= std_logic_vector(conv_unsigned(sum(11 downto 0),16)); 
    end procedure;

    procedure f_sqrt (signal op1 : in std_logic_vector(11 downto 0);
                      signal op2 : in std_logic_vector(11 downto 0);
                      signal result : out std_logic_vector(15 downto 0);
                      signal overflow : out std_logic) is
  
    variable subtractor : unsigned(15 downto 0) := "0000000000000001";
    variable square : unsigned(15 downto 0) := "0000000000000000";
    variable root : unsigned(15 downto 0) := "0000000000000000";
    begin 
        -- count how ofter 1+(2*N) can be subtracted from op1 
        square := conv_unsigned(unsigned(op1),16);
        l_root : for i in 0 to 63 loop
            if subtractor > square then
                exit l_root;
            end if;
            root := root + 1;
            square := square - subtractor;
            subtractor := subtractor + 2;
        end loop;
        result <= std_logic_vector(root);
    end procedure;

    procedure f_not (signal op1 : in std_logic_vector(11 downto 0);
                     signal op2 : in std_logic_vector(11 downto 0);
                     signal result : out std_logic_vector(15 downto 0);
                     signal overflow : out std_logic) is
  
    begin 
        result(11 downto 0) <= not op1;
    end procedure;

    procedure f_xor (signal op1 : in std_logic_vector(11 downto 0);
                     signal op2 : in std_logic_vector(11 downto 0);
                     signal result : out std_logic_vector(15 downto 0);
                     signal overflow : out std_logic) is
  
    begin 
        result(11 downto 0) <= op1 xor op2;
    end procedure;

end package body operations;