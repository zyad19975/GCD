library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_ff is
    Port ( clk,load,rst: in  STD_LOGIC;
           d : in  STD_LOGIC_vector (7 downto 0);
           q : out  STD_LOGIC_vector (7 downto 0));
end d_ff;

architecture rtl of d_ff is

begin
    process (rst,clk)
    begin
   if (rst = '1') then
    q   <= "00000000";  
elsif rising_edge(clk) then
            if load = '1' then
                q <= d;
            end if ;
        end if;

    end process;
end rtl;

