library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity data_bath_top_level is
    Port ( x_sel, y_sel, x_ld, y_ld, d_ld, clk,rst: in  STD_LOGIC;
           x_neq_y, x_lt_y : out  STD_LOGIC;
           x,y: in std_logic_vector (7 downto 0);
           d : out std_logic_vector (7 downto 0));
end data_bath_top_level;

architecture rtl of data_bath_top_level is

    component d_ff is
        Port ( clk,load,rst: in  STD_LOGIC;
           d : in  STD_LOGIC_vector (7 downto 0);
           q : out  STD_LOGIC_vector (7 downto 0));
    end component;


    component comparator is
        port (
            A,B: in std_logic_vector(7 downto 0); 
            A_equal_B: out std_logic);
        end component;


    component comparator_com is
        port (
                A,B: in std_logic_vector(7 downto 0); 
                A_greater_B: out std_logic);
    end component;


    component subtractor is
        Port ( 
               A : in  STD_LOGIC_VECTOR (7 downto 0);
               B : in  STD_LOGIC_VECTOR (7 downto 0);
               S : out  STD_LOGIC_VECTOR (7 downto 0));
    end component;


signal y_feedback, x_feedback , x_load , y_load , d_load , x_new ,y_new  : std_logic_vector (7 downto 0);

begin
   
    x_y: subtractor port map(x_new,y_new,x_feedback);
    y_x: subtractor port map(y_new,x_new,y_feedback);


    --mux to choose which x enter the reg
    process (x_feedback,x,x_sel)
    begin
        if(x_sel = '1') then
            x_load <= x_feedback;
        else
            x_load <= x;
        end if;

    end process;


    --mux to choose which Y enter thr reg
    process (y_feedback,y,y_sel)
    begin
        if(y_sel = '1') then
            y_load <= y_feedback;
        else
            y_load <= y;
        end if;

    end process;

    x_ff: d_ff port map(clk,x_ld,rst,x_load,x_new);
    y_ff: d_ff port map(clk,y_ld,rst,y_load,y_new);
    data_ff: d_ff port map(clk,d_ld,rst,x_new,d);

    u1: comparator port map(x_new,y_new,x_neq_y);
    u2: comparator_com port map(x_new,y_new,x_lt_y);

end rtl;


