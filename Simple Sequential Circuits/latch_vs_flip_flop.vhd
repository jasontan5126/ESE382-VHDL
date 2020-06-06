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


----------------------------------------------------------------------------------------------------------------------------
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
		if rising_edge(clk) then		  -- if clk has a positive edge
			qff <= d;					  -- then qff takes the data from d input
		end if;
	end process;
end d_flip_flop_dataflow;	

------------------------------------------------------------------------------	   

 -- Entity Name : latch_vs_flip_flop
 -- Entity Description: Entity has inputs d, clk
 -- Output is qff and ql
 -- Architecture Name : latch_vs_flip_flop_struct
 -- Description : Use the structural implementation approach to compare between the data
 -- outputs of the d flip flop and the d latch with the same d and clk inputs
 -- Laboratory : #7
 -- Design Task 1
 -- Section : 03
 -- Date Performed : 5 Apr 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor
	
library IEEE;
use IEEE.std_logic_1164.all;  
library work;
use work.all;

entity latch_vs_flip_flop is
	 port(
		 d : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 q1 : out STD_LOGIC;
		 qff : out STD_LOGIC
	     );
end latch_vs_flip_flop;


architecture latch_vs_flip_flop_struct of latch_vs_flip_flop is
begin

	u1: entity d_latch port map(d => d, le_bar => clk, q1 => q1); -- d latch
	u2: entity d_flip_flop port map (d => d, clk => clk, qff => qff); -- d flip flop

end latch_vs_flip_flop_struct;
