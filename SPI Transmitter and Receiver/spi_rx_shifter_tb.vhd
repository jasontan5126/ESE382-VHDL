-- Entity Name : spi_rx_shifter_nonselfcheck_tb
 -- Architecture Name : spi_tx_shifter_nonselfcheck_tb
 -- Description : nonselfchecking testbench which verfies the inputs with
--the outputs
 -- Laboratory : #9
 -- Design Task 2
 -- Section : 03
 -- Date Performed : 4 May 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor

 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;
 library work;
 use work.all;


 entity spi_rx_shifter_nonselfcheck_tb is
 end spi_rx_shifter_nonselfcheck_tb;

 architecture tb_architecture of spi_rx_shifter_nonselfcheck_tb is

 -- Stimulus signals
 signal rst_bar : std_logic; -- system reset   
 signal clk : std_logic; -- system clock	   
 signal dord : std_logic; 	-- data order bit				  
 signal rxd : std_logic;  	 -- data received from slave
 signal spi_rxen :std_logic;           -- enable receiver to shift data	
 -- Observed signals											   
 signal data_out : std_logic_vector (7 downto 0); -- received data
 constant period : time := 40 ns;
 
 
 begin

 -- Unit Under Test port map
 UUT : entity spi_rx_shifter
 port map (rst_bar => rst_bar, clk => clk, dord => dord,
 rxd => rxd, spi_rxen => spi_rxen, data_out => data_out
 );		 
 
 
 dord <= '0', '1' after 9* period;	-- reset  
 
 
 
 reset: process 
 begin
	 rst_bar <= '0';
	 for i in 1 to 2 loop			--reset process
		 wait until clk = '1';
	 end loop;
	 rst_bar <= '1';
	 wait;
 end process;

 clock : process
 begin
 clk <= '0';
 loop
 wait for period/2;             --clock process
 clk <= not clk;
 end loop; 
 wait;
 end process; 
 
  
   rxdprocess: process
   begin                       
rxd<='0';
      wait for 100 ns;      				--rxd process
rxd<='1';
      wait for 100 ns;      
rxd<='0';
wait for 200 ns;
rxd<= '0';
wait for 100 ns;      
rxd<='1';
wait;
   end process;
 
 
 shiftprocess: process
 begin 							  --spi_rxen enable process
	 spi_rxen <= '0';
	 wait for 140 ns;
     spi_rxen <= '1';
	 wait for 750 ns;
	 spi_rxen <= '0';
  wait;
 end process;
	
 end tb_architecture;

