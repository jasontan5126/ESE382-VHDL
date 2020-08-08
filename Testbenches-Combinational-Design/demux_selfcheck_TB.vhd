 -- Entity Name : demux_selfcheck_tb
 -- Entity Description: Entity has 6 signals where one is scalar and the rest are vectors: s, datain,
 -- route0, route1, route2, and route3
 -- Architecture Name : tb_architecture
 -- Description : Applies each possible input combinations and check if its corresponding
 --	outputs is correct
 -- Laboratory : #6
 -- Design Task 2
 -- Section : 03
 -- Date Performed : 12 Mar 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.all;

entity demux_selfcheck_tb is
end demux_selfcheck_tb;

architecture tb_architecture of demux_selfcheck_tb is

	-- Stimulus signals
--	signal s1, s0 : std_logic; 
signal s : std_logic_vector(1 downto 0); 
signal datain : std_logic_vector(3 downto 0); 
signal route0 : std_logic_vector(3 downto 0);
signal route1 : std_logic_vector(3 downto 0); 
signal route2 : std_logic_vector(3 downto 0);
signal route3 : std_logic_vector(3 downto 0);
	-- Observed signals
	
	constant period: time := 20ns;

begin

	-- Unit Under Test port map
	UUT : entity demux
		port map (s1 => s(1), s0 => s(0), datain => datain, route3 => route3,
			route2 => route2, route1 => route1, route0 => route0);
		
tb : process  

constant period: time := 20 ns;
begin -- Apply every possible input combination
s <= "00";                    --apply when the select input combination is 00 where it selects datain input will appear in route0
datain <= "0011";		 	 -- "0011" will be the tested datain input that will selected by s input into 
							 --where specific output the input data will appear in
wait for period;			 --wait a period
assert (datain = route0)	 --check if datain output is in route 0 when (s1, s0) are "00"
report " test failed for input combination 00 " & " actual outputs = " & to_string(route0) & " expected outputs = " & 
	to_string(datain)	--print this message if this output verification is not correct
	severity error;

s <= "01";       --apply when the select input combination is 01 where it selects that datain input will appear in route1 

wait for period;		   --wait a period 
assert (datain = route1)   --check if datain output is in route 1 when (s1, s0) is "01"
report " test failed for input combination 01 " & " actual outputs = " & to_string(route1) & " expected outputs "  & 
	to_string(datain)	   --print this message if this output verification is not correct
	severity error;		
	
s <= "10"; --apply when the select input combination is 10 where it selects that datain input will appear in route2 

wait for period;		   --wait a period
assert (datain = route2)   --check if datain output is in route 2 when (s1, s0) is "10"
report " test failed for input combination 10 " & " actual outputs = " & to_string(route2) & " expected outputs " & 
	to_string(datain)	   --print this message if this output verification is not correct
	severity error;

s <= "11"; --apply when the select input combination is 11 where it selects that datain input will appear in route3
wait for period;			 --wait a period
assert (datain = route3)	 -- check if datain output is in route 3 when (s1, s0) is "11"
report " test failed for input combination 11 " & " actual outputs = " & to_string(route3) & " expected outputs " & 
	to_string(datain)		 -- print this message if this output verification is not correct
	severity error;
wait; -- indefinitely suspend process
end process;
end;
			
			
			
			
			
			
			
			
			
	

																		   
