 -- Entity Name : bcd2aiken_nodontcares_selfcheck_tb
 -- Entity Description: Entity has 2 signals vectors which are named
 --inputs and outputs
 -- Architecture Name : tb_architecture
 -- Description : Applies each possible input combinations and check if
 --               its corresponding outputs is correct 
 --               according to the table lookup from this testbench
 --               when converting from bcd to aiken code		  
 -- IMPORTANT NOTE: Dependent on the bcd2aiken_nodontcares.vhd file to run the simulation
 -- Laboratory : #6
 -- Design Task 1
 -- Section : 03
 -- Date Performed : 12 Mar 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor	

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	  
library work;
use work.all;

entity bcd2aiken_nodontcares_selfcheck_tb is
end bcd2aiken_nodontcares_selfcheck_tb;

architecture tb_architecture of bcd2aiken_nodontcares_selfcheck_tb is

signal bcd_code : std_logic_vector(3 downto 0); -- vector for inputs
signal aiken_code : std_logic_vector(3 downto 0); -- vector for outputs

--list of std_logic inputs/outputs for the bi2aiken truth table
type test_vector is record
	d : std_logic;  
	c : std_logic;
	b : std_logic;
	a : std_logic;
	v : std_logic;
	w : std_logic;
	x : std_logic;
	y : std_logic;
end record;

--specifies the truth table as an array with a range from test_vector
type truth_table is array (natural range <>) of test_vector;
--full bi2aiken_table with no don't cares
constant bi2aiken_table : truth_table := (
-- d,c,b,a, v,w,x,y
('0', '0', '0', '0', '0', '0', '0', '0'),
('0', '0', '0', '1', '0', '0', '0', '1'),
('0', '0', '1', '0', '0', '0', '1', '0'),
('0', '0', '1', '1', '0', '0', '1', '1'),
('0', '1', '0', '0', '0', '1', '0', '0'),
('0', '1', '0', '1', '1', '0', '1', '1'),
('0', '1', '1', '0', '1', '1', '0', '0'),
('0', '1', '1', '1', '1', '1', '0', '1'),
('1', '0', '0', '0', '1', '1', '1', '0'),
('1', '0', '0', '1', '1', '1', '1', '1')
);

constant period: time := 20ns;	 
constant dont_care: boolean := false;	 -- dont_care is equal to false
begin							

	-- Unit Under Test port map
	UUT : entity bcd2aiken1
		port map (d => bcd_code(3), c => bcd_code(2), b => bcd_code(1), a => bcd_code(0),
			v => aiken_code(3), w => aiken_code(2), x => aiken_code(1), y => aiken_code(0)
		);				  

	stimulus: process
	begin
		for i in bi2aiken_table' range loop -- loop to try out all of the combinations

--if don't care is false, then exit, otherwise if true, then don't cares is checked if equal to the outputs vector
if(dont_care) then  	
	exit;
else if (dont_care = true) then  
assert (aiken_code = "----")
report "test failed for input combination = " & to_string(bcd_code) & " actual outputs = " & to_string(aiken_code) & " expected outputs = " 
	&  std_logic'image(bi2aiken_table(i).v) & std_logic'image(bi2aiken_table(i).w) & 
	   std_logic'image(bi2aiken_table(i).x) & std_logic'image(bi2aiken_table(i).y)
	severity error;			
	end if;	  
end if;

			-- set bcd code inputs
			bcd_code(3) <= bi2aiken_table(i).d;
			bcd_code(2) <= bi2aiken_table(i).c;
			bcd_code(1) <= bi2aiken_table(i).b;
			bcd_code(0) <= bi2aiken_table(i).a;
			
			wait for period; -- wait to suspend program and set values
			

			-- assert statement checks output values and verifies output 
			assert ((bi2aiken_table(i).v = aiken_code(3)) and (bi2aiken_table(i).w = aiken_code(2)) and (bi2aiken_table(i).x = aiken_code(1))
			and (bi2aiken_table(i).y = aiken_code(0)))
			
			-- report statement outputs the input, expected output 
			-- and actual output of when the verification output fails according to the table lookup.
		report "input = " & to_string(bcd_code) & 
		" expected output = " & std_logic'image(bi2aiken_table(i).v) & std_logic'image(bi2aiken_table(i).w) & 
		std_logic'image(bi2aiken_table(i).x) & std_logic'image(bi2aiken_table(i).y) & " actual output = " & to_string(aiken_code) 
		severity error; -- simulation is not stopped	
		
		end loop;
		wait;	-- infinite wait, no more stimulus vectors to generate
	end process;

end tb_architecture;


																		   