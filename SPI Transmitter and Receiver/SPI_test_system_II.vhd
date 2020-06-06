-- Entity Name : SPI_test_system_II
 -- Architecture: lab9task3structural
 -- Description :  top-level structure simply combines the two previous entities and the positive edge detector
--from Laboratory 8. 
 -- Laboratory : #9
 -- Design Task 3
 -- Section : 03
 -- Date Performed : 9 May 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor

library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.all;

entity SPI_test_system_II is
	 port(
		 rst_bar : in STD_LOGIC;			   -- asynchronous system reset
		 clk : in STD_LOGIC;				   -- system clock
		 send : in STD_LOGIC;				   -- positive pulse to start transmission
		 cpol : in STD_LOGIC;				   -- clock polarity setting
		 cpha : in STD_LOGIC;				   -- clock phase setting
		 dord : in STD_LOGIC;				    -- transmission data order 0 => msb first
		 miso : in STD_LOGIC;				   -- master in slave out	
		 data_in : in STD_LOGIC_VECTOR(7 downto 0);		-- parallel input data
		 data_out : out STD_LOGIC_VECTOR(7 downto 0);   -- parallel output data
		 mosi : out STD_LOGIC;				   		   -- master out slave in SPI serial data
		 sck : out STD_LOGIC;						    -- SPI shift clock to slave
		 ss_bar : out STD_LOGIC						 -- slave select signal
	     );
end SPI_test_system_II;


architecture lab9task3structural of SPI_test_system_II is
signal send1 : std_logic;	--send1 signal to link with the input send_en for spi_tx_shifter 
signal spi_rxen_signal :std_logic; 
begin							   --port mapping all the entities
	u0: entity send_pos_edge_det port map (rst_bar => rst_bar, clk => clk, send => send, send_en => send1); 
	u1: entity spi_tx_shifter port map (dord => dord, send_en => send1, rst_bar => rst_bar, clk => clk, cpha => cpha, cpol => cpol, data_in => data_in,txd => mosi, sck => sck, ss_bar => ss_bar, spi_rxen => spi_rxen_signal);
	u2: entity spi_rx_shifter port map (rxd => miso, rst_bar => rst_bar, clk => clk, spi_rxen => spi_rxen_signal, dord => dord, data_out => data_out);

end lab9task3structural;
