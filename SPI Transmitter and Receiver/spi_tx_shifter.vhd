 -- Entity Name : spi_tx_shifter
 -- Entity Description: Entity has inputs rst_bar, clk, send_en, cpha, cpol and data_in
 --outputs are txd,sck and ss_bar 
 -- Architecture Name : spi_tx_shifter_fsm
 -- Description : implement the spi transfer shifter where all the bits from data_in are transferred to 
 -- txd which is the serial output data	using the fsm approach. Consideration are taken in terms of the 
 -- inputs such as cpha, cpol, etc which will affect the result of the outputs. This same design also
 -- added the dord input: to send LSB or MSB first and the spi_rxen output to enable shifting for slave receiver
 -- Laboratory : #9
 -- Design Task 1
 -- Section : 03
 -- Date Performed : 1 May 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor
 -- NOTE: This was also used when implementing for lab 8

library IEEE;
use IEEE.std_logic_1164.all; 
use ieee.numeric_std.all; 	 

entity spi_tx_shifter is
	 port(
		 rst_bar : in STD_LOGIC;			-- system reset
		 clk : in STD_LOGIC;				-- system clock
		 send_en : in STD_LOGIC;			-- enable data transmission
		 cpha : in STD_LOGIC;				-- clock phase
		 cpol : in STD_LOGIC;				-- clock polarity  	 
		 dord : in std_logic;               -- data order
		 data_in : in STD_LOGIC_VECTOR(7 downto 0);  -- data to send
		 txd : out STD_LOGIC;				-- serial output data
		 sck : out STD_LOGIC;				-- synchronous shift clock
		 ss_bar : out STD_LOGIC;			    -- slave select	 
		 spi_rxen : out std_logic           -- enable receiver to shift data
	     );
end spi_tx_shifter;

--}} End of automatically maintained section

architecture spi_tx_shifter_fsm of spi_tx_shifter is
    type state is (idle, ph1, ph2, delay, delay2);
	signal present_state, next_state : state;   	 --signals for present state and next state
	signal data_in_temp : std_logic_vector ( 7 downto 0) := "00000000";	   --data input backup which will shift the bits left one place
	signal index : integer := 7;			--the MSB starting index counting from 7 to 0 if DORD is 0
	signal dataLen : integer := 0;			--the finishing index which is 0 which is actually the LSB if DORD is 0 
	signal LSBindex: integer := 0;          --the starting index for the LSB if DORD is 1
	signal dataLen2: integer := 7;			--the finishing index for the LSB if DORD is 1
	
	
begin		  	  
	
	state_reg: process (clk, rst_bar)	 

	begin		 
		
		if rst_bar = '0' then 			   -- if rst_bar is inserted, stay at idle
			present_state <= idle;	 
		elsif rising_edge(clk) then		   -- if there is a rising edge of clock go to next_state which will be present state
			present_state <= next_state;
		end if;
	end process;   

---------------------------------------------------

--outputs combinational design
outputs: process (present_state, cpol, cpha, dord) 
	begin	
	 data_in_temp <= data_in ;	
		
		case present_state is
			when idle =>   
				sck <= cpol;
				txd <= '1';	  --serial output data is initially 0	 
			if cpol = '0' then
				sck <= '0';     --cpol which will affect the sck initial value of waveform	  
		end if;
		 	if cpol = '1' then
			sck <= '1';
		end if;	  	
			spi_rxen <= '0';

			ss_bar <= '1';	  --ss_bar is still 1 since data is not ready to be transmitted at idle state  
		
		when delay2 =>
			ss_bar <= '0';
			spi_rxen <= '1';
		
		
		when delay =>
			ss_bar <= '0';
			sck <= cpol; 
			spi_rxen <= '0';
					
		when ph1 =>  
		
		if dord = '1' then	
				txd <= data_in(LSBindex); --dord is 0 so shift left starting from LSB	  LSBindex = 0
		else if dord = '0' then
				txd <= data_in(index);	  --dord is 1 so shift right starting from MSB	  index = 7
	  end if;	
end if;
		
		
			ss_bar <= '0';				--data is ready to be sampled which ss_bar is 0	  

if dord = '0' or dord = '1' then
	if (cpha = '1' and cpol = '0') or (cpha = '1' and cpol = '1') then
		   sck <= '1';				--sck is still 0 since data has not yet been shifted   
		   spi_rxen <= '0';
	else if (cpha = '0' and cpol = '0') or (cpha = '0' and cpol = '1') then
			sck <= '0';  	   
			spi_rxen <= '0';
		end if;	  
	end if;	  
end if;
		   
						
			  
		when ph2 =>
			ss_bar <= '0';  		   --ss_bar is still 0
			sck <= not cpol;		   --sck is complemented of cpol since data has already been shifted 
			 spi_rxen <= cpol; 
			 if rising_edge(clk) then
		 if dord =  '1' then	
			data_in_temp <= data_in_temp(6 downto 0) & '0';   -- shift the data_in with 0s left if dord is 0		
		 else if rising_edge(clk) and dord = '0' then
			 data_in_temp <= '0' & data_in_temp(7 downto 1);   -- shift right for data_in and fill the empty spaces with 0s if dord is 1  	 
		end if;
	end if;
end if;		
	
		 if (cpha = '0' and cpol = '1') or (cpha = '0' and cpol = '0') then
		   	sck <= '1';
		 	  spi_rxen <= '1';
	   else	if (cpha = '1' and cpol = '0') or (cpha = '1' and cpol = '1') then
		   sck <= '0';	  
		   spi_rxen <= '1';
	   end if;		  
end if;
	   
	  
			
		if dord = '0' then
			if index > 0 then		   --if index is greater than 0, decrement the index by 1 to send next MSB bit to serial output
				  index <= index - 1;	
			else
				index <= 7;			   --otherwise if index is 0, then reset to initial index
		end if;			 
	end if;
		
		if dord = '1' then
			if LSBindex < 7 then		   --if index is greater than 0, decrement the index by 1 to send next MSB bit to serial output
				  LSBindex <= LSBindex + 1;	
			else
				LSBindex <= 0;			   --otherwise if index is 0, then reset to initial index
		end if;	  
	end if;	  
	
		
	   end case; 
	end process;

---------------------------------------------------
   nxt_state: process (present_state, send_en, cpha)
   begin
	 case present_state is
		when idle => 						--first state to check whether the send_en is enable
		if send_en = '1' then				-- if send_en is 1 then go to ph1 to output parallel data to serial data
			next_state <= delay2;  
		else 		   
			next_state <= idle;    
	end if;		
	
	when delay2=>
	next_state <= ph1;
				   
  
  when ph1 => 
	  next_state <= ph2;		    --go to ph2 as next state 
	
 when ph2 => 	  	   
    	if (index = dataLen) or (LSBindex = dataLen2) then				--if current index is equal to finishing index 
	 									                        --meaning the process is finished for shifting bits for data_in
	     next_state <= delay;

  	  else 
	     next_state <= ph1;	   		--else go to ph1 to keep transferring each bit
		                                            
        end if;	   
 when delay => 	
     next_state <= idle; 

end case; 
end process;
end spi_tx_shifter_fsm;
