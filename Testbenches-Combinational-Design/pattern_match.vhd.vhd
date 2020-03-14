-------------------------------------------------------------------------------
--
-- Title       : pattern_match
-- Design      : patternmatch
-- Author      : jasontan5126@yahoo.com
-- Company     : HP Inc.
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\lab6task3_1\patternmatch\src\pattern_match.vhd
-- Generated   : Sun Mar  8 14:22:17 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {pattern_match} architecture {pattern_match}}

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

