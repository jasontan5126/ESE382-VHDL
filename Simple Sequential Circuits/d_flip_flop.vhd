 -- Entity Name : d_flip_flop
 -- Entity Description: Entity has inputs d, and clk
 -- Output is qff
 -- Architecture Name : d_flip_flop_dataflow
 -- Description : Impelements the d flip flop where if clk is set/ rising edge, then qff takes 
 -- in the data from d input. Otherwise, qff doesn't take the data input
 -- Laboratory : #7
 -- Design Task 1
 -- Section : 03
 -- Date Performed : 5 Apr 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor
library IEEE;
use IEEE.std_logic_1164.all;

entity d_flip_flop is
	 port(
		 d : in STD_LOGIC;				    -- data input
		 clk : in STD_LOGIC;				-- clock input
		 qff : out STD_LOGIC				-- flip_flop output
	     );
end d_flip_flop;

--}} End of automatically maintained section

architecture d_flip_flop_dataflow of d_flip_flop is
begin

	process (clk)
	begin
		if rising_edge(clk) then	  --if the clock has a positive edge trigger
			qff <= d;				  -- then qff takes the data from the d input
		end if;
	end process;
end d_flip_flop_dataflow;
