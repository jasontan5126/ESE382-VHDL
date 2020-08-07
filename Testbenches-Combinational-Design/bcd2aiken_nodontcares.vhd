  -- Entity Name : bcd2aiken
  -- Entity Description: Entity has 4 inputs: d,c,b,a and 
  -- 4 outputs v,w,x,y
  -- Architecture Name : cpos_sop
  -- Description : implements the truth table from bcd to
  -- aiken code converter with unused inputs implemented with no don't cares
  -- using the canonical products of sums for bcd and sums of products for sop
  -- Laboratory : #6
  -- Design Task 1
  -- Section : 03
  -- Date Performed : 12 Mar 2020
  -- Version/Rev : 1.0a
  -- Authored by : Jason Tan and Zach Doctor

library IEEE;
use IEEE.std_logic_1164.all;

entity bcd2aiken_nodontcares is
	 port(
		 d : in STD_LOGIC;
		 c : in STD_LOGIC;
		 b : in STD_LOGIC;
		 a : in STD_LOGIC;
		 v : out STD_LOGIC;
		 w : out STD_LOGIC;
		 x : out STD_LOGIC;
		 y : out STD_LOGIC
	     );
end bcd2aiken_nodontcares;

--}} End of automatically maintained section

architecture cpos_csop of bcd2aiken_nodontcares is
begin

	v <= (not d and c and not b and a) or (not d and c and b and not a) 
	or (not d and c and b and a) or (d and not c and not b and not a) or (d and not c and not b and a);
	
	w <= ( not d and c and not b and not a) or ( not d and c and b and not a)
	or (not d and c and b and a) or ( d and not c and not b and not a) or (d and not c and not b and a);
	
	x <= ( d or c or b or a) and (d or c or b or not a) and (d or not c or b or a)
	and (d or not c or not b or a) and ( d or not c or not b or not a);
	
	y <= ( d or c or b or a) and ( d or c or not b or a) and ( d or not c or b or a) and 
	(d or not c or not b or a) and (not d or c or b or a);

end cpos_csop;
