 -- Entity Name : d_latch
 -- Entity Description: Entity has inputs d, and le_bar
 -- Output is ql
 -- Architecture Name : d_latch_arch
 -- Description : Impelements the d latch in the case where if latch enable (active low) input is 0,
 -- then data input should be outputted to q1 output
 -- Laboratory : #7
 -- Design Task 1
 -- Section : 03
 -- Date Performed : 5 Apr 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor

library IEEE;
use IEEE.std_logic_1164.all;

entity d_latch is
	 port(
		 d : in STD_LOGIC;		   -- d input
		 le_bar : in STD_LOGIC;	   -- latch enable input (active low)
		 q1 : out STD_LOGIC		    -- latch output
	     );
end d_latch;

--}} End of automatically maintained section

architecture d_latch_arch of d_latch is
begin
    process (d, le_bar)
	begin
		if le_bar = '0' then	    -- if latch enable (active low) input is 0,
			 q1 <= d;               -- then data input should be outputted to q1 output
		end if;
	end process;

end d_latch_arch;
