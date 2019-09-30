library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;


entity comparator_com is
port (
    A,B: in std_logic_vector(7 downto 0); 
    A_greater_B: out std_logic
 );
end comparator_com;

architecture rtl of comparator_com is

    

begin
 

    process(A,B)
    begin
        if (unsigned(A) > unsigned(B)) then
            A_greater_B <= '0';
        else
            A_greater_B <= '1';        
        end if ;
    
    end process;
    
end rtl;