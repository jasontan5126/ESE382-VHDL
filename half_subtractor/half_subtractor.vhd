 -- Entity Name : half_sub
 -- Entity Description: has two inputs: a and b and two outputs: diff and borrow
 -- Architecture Name : dataflow
 -- Description : implements the function of a half_subtractor
 --
 -- Laboratory : #1 and 2
 -- Section : 03
 -- Date Performed : 6 and 13 Feb 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor

library IEEE;
use IEEE.std_logic_1164.all;

entity half_sub is
	 port(
		 a : in STD_LOGIC;
		 b : in STD_LOGIC;
		 borrow : out STD_LOGIC;
		 diff : out STD_LOGIC
	     );
end half_sub;

--}} End of automatically maintained section

architecture dataflow of half_sub is
begin

	borrow <= not a and b;	
	diff <= a xor b;	

end dataflow;
