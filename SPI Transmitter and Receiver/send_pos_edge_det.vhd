-------------------------------------------------------------------------------
--
-- Title       : lab8task1
-- Design      : lab8
-- Author      : jasontan5126@yahoo.com
-- Company     : HP Inc.
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\lab8\lab8\src\lab8task1.vhd
-- Generated   : Sat Apr 11 16:45:25 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {lab8task1} architecture {lab8task1}}		  
	
library ieee;
use ieee.std_logic_1164.all;

entity send_pos_edge_det is
	port(
rst_bar : in std_logic;				   -- asynchronous system reset
clk : in std_logic;					   -- system clock
send : in std_logic;				   -- debounced send input
send_en : out std_logic				   -- narrow send en. output pulse
);
end send_pos_edge_det;


--}} End of automatically maintained section

architecture implementation of send_pos_edge_det is
	  type state is (state_a, state_b, state_c);
         signal present_state, next_state : state;
          begin
         state_reg: process (clk, rst_bar)
                 begin
                 if rst_bar = '0' then
	                present_state <= state_a;
                 elsif rising_edge(clk) then
                    present_state <= next_state;
              end if;
           end process;
     outputs: process (present_state)
        begin
    case present_state is
        when state_c => send_en <= '1';
        when others => send_en <= '0';
    end case;
 end process;
   nxt_state: process (present_state, send)
       begin
         case present_state is
               when state_a =>
                   if send = '0' then
   next_state <= state_b;
          else
   next_state <= state_a;
          end if;
   when state_b =>
          if send = '1' then
   next_state <= state_c;
          else
   next_state <= state_b;
          end if;
   when others =>
          if send = '0' then
   next_state <= state_b;
          else
   next_state <= state_a;
            end if;
       end case;
    end process;
	 

end implementation;
