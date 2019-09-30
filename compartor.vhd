library IEEE;
use IEEE.std_logic_1164.all;


entity comparator is
port (
    A,B: in std_logic_vector(7 downto 0); 
    A_equal_B: out std_logic
 );
end comparator;

architecture rtl of comparator is
begin

   process (A,B)
   begin
        if (a /= b) then
            A_equal_B <= '1';
        else
            A_equal_B <= '0';
        end if;
    end process;
    
end rtl;