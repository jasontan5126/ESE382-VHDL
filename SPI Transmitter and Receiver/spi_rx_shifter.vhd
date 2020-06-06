  -- Entity Name : spi_rx_shifter
 -- Entity Description: Entity has inputs rxd, rst_bar, clk, spi_rxen, dord
 --output is data_out
 -- Architecture Name : spi_rx_shifter_fsm
 -- Description : implements the spi receive shifter to transfer data from serial input to parallel output
 -- Laboratory : #9
 -- Design Task 2
 -- Section : 03
 -- Date Performed : 4 May 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor

library IEEE;
 use IEEE.std_logic_1164.all;

 entity spi_rx_shifter is
 port(
 rxd : in STD_LOGIC; -- data received from slave
 rst_bar : in STD_LOGIC; -- asynchronous reset
 clk : in STD_LOGIC; -- system clock
 spi_rxen : in STD_LOGIC; -- signal to enable shift
 dord : in STD_LOGIC; -- data order bit
 data_out : out STD_LOGIC_VECTOR(7 downto 0) -- received data
 );
 end spi_rx_shifter;


 architecture lab9task2fsm of spi_rx_shifter is
 type state is (idle, s_left, s_right);
 signal present_state, next_state: state;

 begin
 state_reg: process (clk) 
 begin
 if rising_edge(clk) then
 if rst_bar = '0' then
 present_state <= idle;
 else
 present_state <= next_state; 
 end if;
 end if;
 end process;

 outputs: process(present_state, rst_bar, dord, spi_rxen)
 begin
case present_state is 
 when idle =>
 if rst_bar = '0' then
 data_out <= "00000000";   
 end if;
 when s_left =>

 if dord = '0' and spi_rxen = '1' then 
 data_out(0) <= rxd; --and shift left
 data_out(7 downto 1) <= data_out(6 downto 0);
 end if;


 when s_right =>
 if dord = '1' and spi_rxen = '1' then 
 data_out(7) <= rxd;
 data_out(6 downto 0) <= data_out(7 downto 1);
 end if;
 end case;
 end process;

 nxt_state: process (present_state, clk, dord, spi_rxen)
 begin
 case present_state is
 when idle =>
if spi_rxen = '1' then 
 if rising_edge(clk) then
 if dord = '0' then
 next_state <= s_left;
 else if spi_rxen = '1' then
 if rising_edge(clk) then  
	 if dord = '1' then
 next_state <= s_right;
 else
 next_state <= idle; --else stay atidle state

 end if;
 end if;
 end if;
 end if;
 end if;	   
 end if;

 when s_left =>
 if spi_rxen = '1' and dord = '0' and rising_edge(clk) then
-- if spi_rxen is 1 and dord is 0 and rising edge clk
 next_state <= s_left;
-- stay at s_left state
 else if spi_rxen = '1' and dord = '1' and rising_edge(clk) then --else if spi_rxen is 1, dord = 1, and rising edge clk
 next_state <= s_right;

 else
 next_state <= idle;

 end if;
 end if;

 when s_right =>

 if spi_rxen = '1' and dord = '1' and rising_edge(clk) then

 next_state <= s_right;

 else if spi_rxen = '1' and dord = '0' and rising_edge(clk)
then 
 next_state <= s_left;
 else
 next_state <= idle;
 end if;
 end if;

 end case;
 end process;






 end lab9task2fsm;
