--
-- Entity Name : gray_bin
-- Entity Description: Entity has input g which is a 4 element std_logic_vector, and a
-- single output b which is a 4 element std_logic_vector.
-- Architecture Name : table_lookup_dc
-- Description : Use the table lookup approach with don't cares
-- to generate a gray code to binary conversion
-- Design Task 4
-- Laboratory : #4
-- Section : 03
-- Date Performed : 26 Feb 2020
-- Version/Rev : 1.0a
-- Authored by : Jason Tan and Zach Doctor 

library IEEE;
use IEEE.std_logic_1164.all; 
use ieee.numeric_std.all;

entity gray_bin is		
	port (
	g : in std_logic_vector(3 downto 0); -- data input
	b : out std_logic_vector(3 downto 0) -- output
	);
	
end gray_bin;

--}} End of automatically maintained section

architecture table_lookup_dc of gray_bin is	
type my_table is array (0 to 15) of std_logic_vector(3 downto 0);
constant gray_to_binary : my_table := (	  
"0000",  
"0001",		   
"0011",				 
"0010",					   
"0111",   
"0110",							 
"0100",	 
"0101",		   
"----",  
"----",		   
"----",				 
"----",					   
"1000",	   
"1001",			 
"1011",				   
"1010");						 

begin

 b <= gray_to_binary(to_integer(unsigned (g)));	 

end table_lookup_dc;
