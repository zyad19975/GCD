library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity Tlc is
  port (
    x_sel, y_sel, x_ld, y_ld, d_ld: out  STD_LOGIC;
    x_neq_y, x_lt_y, clk,go,rst : in  STD_LOGIC  ) ;
end Tlc ;

architecture rtl of tlc is
    type state_type is (s0, s1, s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12);
    signal c_s , n_s : state_type;
    begin

        process(rst,clk)
        begin
            if rst ='1' then
                c_s <= s0;
            elsif rising_edge(clk) then
                c_s <= n_s;
            end if;
        end process;


        process (c_s,x_neq_y, x_lt_y,go)
        begin
            case(c_s) is
            
                when s0 =>  x_sel<= '0';
                            y_sel<= '0';
                            x_ld <= '0';
                            y_ld <= '0';
                            d_ld <= '0'; 
                            n_s <= s1;
                
                
                when s1 =>  x_sel<= '0';
                            y_sel<= '0';
                            x_ld <= '0';
                            y_ld <= '0';
                            d_ld <= '0'; 
                            if go = '0'then
                            n_s <= s2;
                            else
                                n_s <= s3;
                            end if;
                
                
                when s2 =>  x_sel<= '0';
                            y_sel<= '0';
                            x_ld <= '0';
                            y_ld <= '0';
                            d_ld <= '0'; 
                            n_s <= s1;
                
                            
                when s3 =>  x_sel<= '0';
                            y_sel<= '0';
                            x_ld <= '1';
                            y_ld <= '0';
                            d_ld <= '0'; 
                            n_s <= s4;
                
                            
                when s4 =>  x_sel<= '0';
                            y_sel<= '0';
                            x_ld <= '0';
                            y_ld <= '1';
                            d_ld <= '0'; 
                            n_s <= s5;
                
                            
                when s5 =>  x_sel<= '0';
                            y_sel<= '0';
                            x_ld <= '0';
                            y_ld <= '0';
                            d_ld <= '0'; 
                            if x_neq_y = '1' then
                                n_s <= s6;
                            else
                                 n_s <= s11; 
                            end if ;
                            
                
                            
                when s6 =>  x_sel<= '0';
                            y_sel<= '0';
                            x_ld <= '0';
                            y_ld <= '0';
                            d_ld <= '0'; 
                            if x_lt_y = '1' then
                                n_s <= s7;
                            else
                                n_s <= s8;
                            end if ;
                
                            
                when s7 =>  x_sel<= '0';
                            y_sel<= '1';
                            x_ld <= '0';
                            y_ld <= '1';
                            d_ld <= '0'; 
                            n_s <= s9;
                
                            
                when s8 =>  x_sel<= '1';
                            y_sel<= '0';
                            x_ld <= '1';
                            y_ld <= '0';
                            d_ld <= '0'; 
                            n_s <= s9;
                
                            
                when s9 =>  x_sel<= '0';
                            y_sel<= '0';
                            x_ld <= '0';
                            y_ld <= '0';
                            d_ld <= '0'; 
                            n_s <= s10;
                
                            
                when s10 =>  x_sel<= '0';
                            y_sel<= '0';
                            x_ld <= '0';
                            y_ld <= '0';
                            d_ld <= '0'; 
                            n_s <= s5;
                            
                when s11 =>  x_sel<= '0';
                            y_sel<= '0';
                            x_ld <= '0';
                            y_ld <= '0';
                            d_ld <= '1'; 
                            n_s <= s12;
                
                when s12 =>  x_sel<= '0';
                            y_sel<= '0';
                            x_ld <= '0';
                            y_ld <= '0';
                            d_ld <= '0'; 
                            n_s <= s0;
                when others =>x_sel<= '0';
                            y_sel<= '0';
                            x_ld <= '0';
                            y_ld <= '0';
                            d_ld <= '0'; 
                            n_s <= s0;
            
            end case ;
        end process;

end rtl;
