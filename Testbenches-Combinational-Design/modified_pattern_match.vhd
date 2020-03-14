 -- Entity Name : pattern_match_cnt
 -- Entity Description: Entity has two signal input vectors: data and
 -- pattern and one scalar output: count_match
 -- Architecture Name : loop_arch
 -- Description : Checks if the pattern input and data input match
 -- so match can be asserted to 1 while match_count count the number of
 -- matches given the pattern input in correspondance to data input
 -- Laboratory : #6
 -- Design Task 4
 -- Section : 03
 -- Date Performed : 12 Mar 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity pattern_match_cnt is
	 port(
		 data : in STD_LOGIC_VECTOR(7 downto 0);		--input data to check
		 pattern : in STD_LOGIC_VECTOR(3 downto 0);		--pattern to find in data
		 match : out STD_LOGIC;							--assert if the pattern is found
		 match_count : out std_logic_vector(2 downto 0)	--maximum number of matches
	     );
end pattern_match_cnt;

--}} End of automatically maintained section

architecture loop_arch of pattern_match_cnt is
--	signal match_inc : integer range 0 to 4097;		    
begin	  		
process(data, pattern) 					  
	variable match_inc : integer range 0 to 4097;    --variable declared
begin
	match <= '0';							         --default output value
	match_inc := 0;									 --initialize match_inc to 0
	for i in 7 downto 3 loop						 --There are 5 slices of data to check
		if data(i downto (i-3)) = pattern then 		 --check slice
			match <= '1';  							 --if equal assert match and exit
			match_inc := match_inc + 1; 			-- to increment the number of match_inc each time match '1' is asserted to 1
		end if;
	end loop;
	match_count <= std_logic_vector(to_unsigned(match_inc,3));	 --to point match_inc variable to match_count output
end process;
end loop_arch;

