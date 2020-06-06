-- Entity Name : spi_tx_shifter_nonselfcheck_tb
 -- Architecture Name : spi_tx_shifter_nonselfcheck_tb
 -- Description : nonselfchecking testbench which verfies the inputs with
--the outputs
 -- Laboratory : #9
 -- Design Task 1
 -- Section : 03
 -- Date Performed : 5 May 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor

 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;
 library work;
 use work.all;


 entity spi_tx_shifter_nonselfcheck_tb is
 end spi_tx_shifter_nonselfcheck_tb;

 architecture tb_architecture of spi_tx_shifter_nonselfcheck_tb is

 -- Stimulus signals
 signal rst_bar : std_logic; -- system reset
 signal clk : std_logic; -- system clock
 signal send_en : std_logic; -- enable data transmission
 signal cpha : STD_LOGIC; -- clock phase
 signal cpol : STD_LOGIC; -- clock polarity	
 signal dord : std_logic;
 constant data_in : STD_LOGIC_VECTOR(7 downto 0) := x"ca"; -- data to send
 -- Observed signals
 signal txd : STD_LOGIC; -- serial output data
 signal sck : STD_LOGIC; -- synchronous shift clock
 signal ss_bar : STD_LOGIC; -- slave select		
 signal spi_rxen :std_logic;           -- enable receiver to shift data	
 constant period : time := 40 ns;
 
 
 begin

 -- Unit Under Test port map
 UUT : entity spi_tx_shifter
 port map (rst_bar => rst_bar, clk => clk, send_en => send_en, dord => dord,
 cpha => cpha, cpol => cpol, data_in => data_in, txd => txd, sck =>
sck, ss_bar => ss_bar, spi_rxen => spi_rxen
);			  
  cpha <= '1'; --cpha set to 0
      cpol <= '1'; --cpol set to 0	
      dord <= '1'; --dord set to 0

 reset: process 
 begin
	 rst_bar <= '0';
	 for i in 1 to 2 loop
		 wait until clk = '1';
	 end loop;
	 rst_bar <= '1';
	 wait;
 end process;

 send: process
 begin
 send_en <= '0'; --process to set sen_en for 45 ns
 wait for 80 ns;
 send_en <= '1';
 wait for 60 ns;
 send_en <= '0'; 
 wait;
 end process;

 clock : process
 begin
 clk <= '0';
 loop
 wait for period/2; --clock to loop for 30 ns
 clk <= not clk;
 end loop; 
 wait;
 end process; 
 

	
 end tb_architecture;

