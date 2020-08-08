  -- Entity Name : bcd2aiken_dontcares
  -- Entity Description: Entity has 4 inputs: d,c,b,a and 
  -- 4 outputs v,w,x,y
  -- Architecture Name : cpos_sop
  -- Description : implements the truth table from bcd to
  -- aiken code converter with unused inputs implemented with no don't cares
  -- using the with and select approach
  -- Laboratory : #6
  -- Design Task 1
  -- Section : 03
  -- Date Performed : 12 Mar 2020
  -- Version/Rev : 1.0a
  -- Authored by : Jason Tan and Zach Doctor

library IEEE;
use IEEE.std_logic_1164.all;

entity bcd2aiken_dontcares is
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
end bcd2aiken_dontcares;

--}} End of automatically maintained section

architecture select_arch of bcd2aiken_dontcares is
begin

	with std_logic_vector'(d,c,b,a) select
(v,w,x,y) <= std_logic_vector'("0000") when "0000",
"0001" when "0001",
"0010" when "0010",
"0011" when "0011",
"0100" when "0100",
"1011" when "0101",
"1100" when "0110",
"1101" when "0111",
"1110" when "1000",
"1111" when "1001",
"----" when others;

end select_arch;

