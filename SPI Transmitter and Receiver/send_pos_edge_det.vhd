 -- Entity Name : send_pos_edge_det
 -- Architecture: lab9task3structural
 -- Description :  used to detect the positive edge of the send and to generate a narrow pulse that will be used by the
 -- spi_tx_shifter to determine when it should start to send the byte of input data to the output.
 -- Laboratory : #9
 -- Design Task 3
 -- Section : 03
 -- Date Performed : 9 May 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor	  
	
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
