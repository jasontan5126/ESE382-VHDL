-- Entity Name : SPI_test_system_II_nonselfcheck_tb
 -- Architecture tb_architecture
 -- Description : nonselfchecking testbench which verfies the inputs with
--the outputs
 -- Laboratory : #9
 -- Design Task 3
 -- Section : 03
 -- Date Performed : 6 May 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor

 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;
 library work;
 use work.all;


 entity SPI_test_system_II_nonselfcheck_tb is
 end SPI_test_system_II_nonselfcheck_tb;

 architecture tb_architecture of SPI_test_system_II_nonselfcheck_tb is

 -- Stimulus signals
 signal rst_bar : std_logic; -- system reset
 signal clk : std_logic; -- system clock
 signal send : std_logic; -- enable data transmission
 signal cpol : STD_LOGIC; -- clock phase
 signal cpha : STD_LOGIC; -- clock polarity	
 signal dord : std_logic; --transmission data order 0 => msb first
 signal miso : std_logic; --master in slave out
 constant data_in : STD_LOGIC_VECTOR(7 downto 0) := x"ca"; --parallel input data
 -- Observed signals
 signal data_out : std_logic_vector(7 downto 0);  --parallel output data
 signal mosi : STD_LOGIC; -- serial output data
 signal sck : STD_LOGIC; -- synchronous shift clock
 signal ss_bar : STD_LOGIC; -- slave select		
 
 constant period : time := 40 ns;
 signal loopback : std_logic;
 
 begin

 -- Unit Under Test port map
 UUT : entity SPI_test_system_II
 port map (rst_bar => rst_bar, clk => clk, send => send, dord => dord,
 cpha => cpha, cpol => cpol, miso => miso, data_in => data_in, data_out => data_out, sck =>
sck, ss_bar => ss_bar, mosi => mosi
);		  

loopback <= mosi;	 --mosi is linked to miso
miso <= loopback;

clock : process
 begin
 clk <= '0';
 loop
 wait for period/2; --clock loop process
 clk <= not clk;
 end loop; 
 wait;
 end process;

 reset: process 
 begin
	 rst_bar <= '0';							--reset process loop
	 for i in 1 to 2 loop
		 wait until clk = '1';
	 end loop;
	 rst_bar <= '1';
	 wait;
 end process;
 
 pushbutton: process
 begin 
	  send <= '0'; 
	  cpha <= '0'; --cpha set to 0
      cpol <= '0'; --cpol set to 0	
      dord <= '0'; --dord set to 0
  for i in 0 to 7 loop
	(dord, cpol, cpha) <= to_unsigned(i, 3);
	wait for 25 * period;
	send <= '1';				  --check all possible combinations
	wait for 30 * period;
	send <= '0';
	wait for 25 * period;
  end loop;	
  wait;
 end process;
	
 end tb_architecture;

