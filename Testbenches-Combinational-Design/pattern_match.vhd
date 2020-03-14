 -- Entity Name : pattern_match
 -- Entity Description: Entity has two input vectors: data and pattern
 -- and one scalar output: match
 -- Architecture Name : loop_arch
 -- Description :  Output match is asserted, if and only if, the 4-bit bit pattern 
 --                in pattern appears one or more times in data. The 4-bit pattern 
 --                can appear anywhere in the input data.
 --                Laboratory : #6
 --                Design Task 3
 --                Section : 03
 --                Date Performed : 12 Mar 2020
 --                Version/Rev : 1.0a
 --                Authored by : Jason Tan and Zach Doctor	

library IEEE;
use IEEE.std_logic_1164.all;

entity pattern_match is
	 port(
		 data : in STD_LOGIC_VECTOR(7 downto 0);		--input data to check
		 pattern : in STD_LOGIC_VECTOR(3 downto 0);		--pattern to find in data
		 match : out STD_LOGIC							--asserted if the pattern
	     );												--is found
end pattern_match;

--}} End of automatically maintained section

architecture loop_arch of pattern_match is
begin
process(data, pattern) 
begin
	match <= '0';										-- Default output value
	for i in 7 downto 3 loop							-- There are 5 slices of data to check
		if data(i downto (i-3)) = pattern then 			-- check slice
			match <= '1';								-- if equal assert match and exit
			exit;
		end if;
	end loop;
end process;

end loop_arch;

