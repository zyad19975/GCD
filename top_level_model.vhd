library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_level is
    Port ( clk,go,rst: in  STD_LOGIC;
           x,y : in  STD_LOGIC_vector (7 downto 0);
           d : out  STD_LOGIC_vector (7 downto 0));
end Top_level;

architecture rtl of Top_level is


    component Tlc is
        port (
          x_sel, y_sel, x_ld, y_ld, d_ld: out  STD_LOGIC;
          x_neq_y, x_lt_y, clk,go,rst: in  STD_LOGIC  ) ;
    end component ;
      
    component data_bath_top_level is
        Port ( x_sel, y_sel, x_ld, y_ld, d_ld, clk,rst: in  STD_LOGIC;
               x_neq_y, x_lt_y : out  STD_LOGIC;
               x,y: in std_logic_vector (7 downto 0);
               d : out std_logic_vector (7 downto 0));
    end component;


    signal x_selection , y_selection, x_load , y_load , d_load , x_not_y, x_less_y :std_logic;
begin


    u1: tlc port map (x_selection,y_selection,x_load,y_load,d_load,x_not_y,x_less_y,clk,go,rst);

    u2: data_bath_top_level port map(x_selection,y_selection,x_load,y_load,d_load,clk,rst,x_not_y,x_less_y,x,y,d);


end rtl;

