library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test is
end test;

architecture t_b of test is
    component Top_level is
        Port ( clk,go,rst: in  STD_LOGIC;
               x,y : in  STD_LOGIC_vector (7 downto 0);
               d : out  STD_LOGIC_vector (7 downto 0));
    end component;

    signal go,rst : std_logic;
    signal x,y,d : std_logic_vector (7  downto 0);
    signal clk : std_logic := '0';
begin

dut: top_level port map(clk,go,rst,x,y,d);
rst <= '1','0' after 70 ps;

go <= '0','1' after 220 ps , '0' after 420 ps;
clk <= not(clk) after 100 ps;
x <= x"12";
y <= x"0C";

end t_b;