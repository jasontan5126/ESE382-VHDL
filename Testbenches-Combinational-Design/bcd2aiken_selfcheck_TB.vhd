library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd2aiken_selfcheck_tb is
end bcd2aiken_selfcheck_tb;

architecture tb_architecture of bcd2aiken_selfcheck_tb is

signal inputs : std_logic_vector(3 downto 0); -- vector for inputs
signal outputs : std_logic_vector(3 downto 0); -- vector for outputs

--Declare record type
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

--type bi2aiken_truth table vector
type truth_table is array (natural range <>) of test_vector;

constant bi2aiken_table : truth_table := (
-- d,c,b,a, v,w,x,y	table lookup
('0', '0', '0', '0', '0', '0', '0', '0'),
('0', '0', '0', '1', '0', '0', '0', '1'),
('0', '0', '1', '0', '0', '0', '1', '0'),
('0', '0', '1', '1', '0', '0', '1', '1'),
('0', '1', '0', '0', '0', '1', '0', '0'),
('0', '1', '0', '1', '1', '0', '1', '1'),
('0', '1', '1', '0', '1', '1', '0', '0'),
('0', '1', '1', '1', '1', '1', '0', '1'),
('1', '0', '0', '0', '1', '1', '1', '0'),
('1', '0', '0', '1', '1', '1', '1', '1'),
('1', '0', '1', '0', '-', '-', '-', '-'),
('1', '0', '1', '1', '-', '-', '-', '-'),
('1', '1', '0', '0', '-', '-', '-', '-'),
('1', '1', '0', '1', '-', '-', '-', '-'),
('1', '1', '1', '0', '-', '-', '-', '-'),
('1', '1', '1', '1', '-', '-', '-', '-')
);

constant period: time := 20ns;	 
constant dont_care: boolean := true;	
begin							

	-- Unit Under Test port map
	UUT : entity bcd2aiken
		port map (d => inputs(3), c => inputs(2), b => inputs(1), a => inputs(0),
			v => outputs(3), w => outputs(2), x => outputs(1), y => outputs(0)
		);				  

	stimulus: process
	begin
		for i in bi2aiken_table' range loop -- loop to try out all of the combinations	 
	 	
			-- set inputs from the table lookup in the self-checking testbench
			inputs(3) <= bi2aiken_table(i).d;
			inputs(2) <= bi2aiken_table(i).c;
			inputs(1) <= bi2aiken_table(i).b;
			inputs(0) <= bi2aiken_table(i).a;
			
			wait for 20 ns;
		--	if(dont_care) then    
			if(outputs = "----") then	  --if outputs is don't care, print don't cares for those specific inputs not used
			assert (outputs = "----")
				report " test failed for input combination = " & to_string(inputs) & " actual outputs = " & to_string(outputs) & " expected outputs = " 
					&  std_logic'image(bi2aiken_table(i).v) & std_logic'image(bi2aiken_table(i).w) & 
					   std_logic'image(bi2aiken_table(i).x) & std_logic'image(bi2aiken_table(i).y)
					   --print message if verification output is not correct
					   severity error;	
	    else if (dont_care = false) then  
		--	exit;		
			
			wait for period; -- wait to suspend program and set values
			--check if don't care or don't care inputs
			--if don't care inputs is true																					   
				
			-- assert statement checks output values and verifies output according to table lookup from self-checking testbench 
			assert ( (bi2aiken_table(i).v = outputs(3)) and (bi2aiken_table(i).w = outputs(2)) and 
			(bi2aiken_table(i).x = outputs(1))and (bi2aiken_table(i).y = outputs(0)) )
			report "input = " & to_string(inputs) & " expected output = " & 
			std_logic'image(bi2aiken_table(i).v) & 
			std_logic'image(bi2aiken_table(i).w) & 
			std_logic'image(bi2aiken_table(i).x) & std_logic'image(bi2aiken_table(i).y) & " actual output = " & to_string(outputs) 
			--print message if verification of outputs with corresponding inputs is incorrect
				
			severity error; -- simulation is not stopped  
			end if;	 
	end if;	
			end loop;
		wait;	-- infinite wait, no more stimulus vectors to generate
	end process;
end tb_architecture;


																		   