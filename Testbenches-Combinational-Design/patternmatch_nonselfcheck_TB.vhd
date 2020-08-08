 -- Entity Name : patternmatch_nonselfcheck_tb
 -- Entity Description: Entity has two signal input vectors: data and pattern
 -- and one scalar output: match.
 -- Architecture Name : tb_architecture
 -- Description : Implements the waveform according to pattern_match.vhd
 --	as a non-self checking testbench for pattern match system
 -- Laboratory : #6
 -- Design Task 3
 -- Section : 03
 -- Date Performed : 12 Mar 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.all;

entity patternmatch_nonselfcheck_tb is
end patternmatch_nonselfcheck_tb;

architecture tb_architecture of patternmatch_nonselfcheck_tb is

	-- Stimulus signals
	signal data : std_logic_vector(7 downto 0);
	-- Observed signals
	signal pattern : std_logic_vector(3 downto 0);
	signal match: std_logic;

	constant period: time := 20ns;

begin

	-- Unit Under Test port map
	UUT : entity pattern_match
		port map (data => data, pattern => pattern, match => match 
		);

	stimulus: process
	begin
		for i in 0 to 4097 loop	 -- generate all integer values of i from 0 to 4097 as possible input combinations
			(data(7), data(6),data(5),data(4),data(3),data(2),data(1),data(0), 
			pattern(3),pattern(2),pattern(1),pattern(0)) <= to_unsigned(i, 12);	
			
			wait for period;	-- wait for outputs to settle
		end loop;
		wait;	-- infinite wait, no more stimulus vectors to generate
	end process;

end tb_architecture;


																		   
