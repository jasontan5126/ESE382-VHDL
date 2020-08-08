 -- Entity Name : spi_rx_shifter_nonselfcheck_tb
 -- Architecture Name : spi_tx_shifter_nonselfcheck_tb
 -- Description : nonselfchecking testbench which verfies the 
 -- functionality of the send_pos_edge_det
 -- Laboratory : #8
 -- Design Task 1
 -- Section : 03
 -- Date Performed : 4 May 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;		  
library work;
use work.all;


entity send_pos_edge_det_nonselfcheck_tb is
end send_pos_edge_det_nonselfcheck_tb;

architecture tb_architecture of send_pos_edge_det_nonselfcheck_tb is

		-- Stimulus signals
	signal rst_bar : std_logic;
	-- Observed signals
	signal clk : std_logic;
	signal send: std_logic;	  
	signal send_en : std_logic;

begin

	-- Unit Under Test port map
	UUT : entity send_pos_edge_det
		port map (rst_bar => rst_bar, clk => clk, send => send, send_en => send_en 
		);
  rst_bar <= '0', '1' after 20 ns;			  --rst_bar to transition to 1 when 130 ns
		
	clock : process
          begin
            clk <= '0'; 
       wait for 20 ns ;		 --clock to loop for 40 ns
	   loop
	   clk <= not clk;	 
	   wait for 20 ns ;	  
	 end loop;
  end process; 
		
sen : process
	begin 
		 send <='0'; 
		wait for 100 ns;
		 loop 
			  send<= not send; 
			 wait for 100 ns;
			end loop;
	
	end process;	
	

end tb_architecture;

