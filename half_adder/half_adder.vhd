  -- Entity Name : half_adder
  -- Entity Description: Entity has 2 inputs: a,b and 
  -- 2 outputs carry_out and sum
  -- Architecture Name : dataflow
  -- Description : Implements the functionality of the half adder
  -- Laboratory : #1
  -- Section : 03
  -- Date Performed : 6 Feb 2020
  -- Version/Rev : 1.0a
  -- Authored by : Jason Tan and Zach Doctor

library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
	 port(
		 a : in STD_LOGIC;
		 b : in STD_LOGIC;
		 carry_out : out STD_LOGIC;
		 sum : out STD_LOGIC
	     );
end half_adder;

--}} End of automatically maintained section

architecture dataflow of half_adder is
begin

	 sum <= a xor b;
	carry_out <= a and b;

end dataflow;
