 -- Entity Name : dff_en
 -- Entity Description: Entity has inputs d, clk, en, rst_bar
 -- Output is q
 -- Architecture Name : dff_en_arch
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

entity dff_en is
	 port(
		 d : in STD_LOGIC;				  -- data input
		 clk : in STD_LOGIC;			  -- clock input 
		 en : in STD_LOGIC;				  -- enable input
		 rst_bar : in STD_LOGIC;		  -- asynchronous reset
		 q : out STD_LOGIC				  -- output
	     );
end dff_en;

--}} End of automatically maintained section

architecture dff_en_arch of dff_en is
begin

	dFF_en:process(clk, en)	  
	begin
		if rising_edge(clk) and en = '1' then	
			-- if there was a rising edge in clk and clk = 1 and en = 1,
			-- set input to output
			q <= d;
		
	end if;	
	if rst_bar = '0'		then		
		-- if reset bar is 0 which will invert to 1,
	    -- then the output data of the flip flop is cleared
		-- In other words, q would be 0 
			q <= '0';
    end if;
			
     end process;

end dff_en_arch;
