 -- Entity Name : demux
 -- Entity Description: Entity has two scalar inputs: s1 and s0, one vector input: datain,
 --                     and four vector outputs: route0, route1, route2 and route3
 -- Architecture Name : selectsa
 -- Description :       The value of s1,s0 selects on which one of the four outputs the input data
 --                		appears. For example, if s1,s0 is 1,0 the input data appears on route2. The 
 --                		three 4-bit data outputs that are not selected at any given time, must be placed 
 --                		in their high impedance states (threestated).
 --                		Laboratory : #6
 --                		Design Task 2
 --                		Section : 03
 --                		Date Performed : 12 Mar 2020
 --                		Version/Rev : 1.0a
 --                		Authored by : Jason Tan and Zach Doctor

library IEEE;
use IEEE.std_logic_1164.all;

entity demux is
	 port(
		 s1 : in STD_LOGIC;
		 s0 : in STD_LOGIC;
		 datain : in STD_LOGIC_VECTOR(3 downto 0);
		 route0 : out STD_LOGIC_VECTOR(3 downto 0);
		 route1 : out STD_LOGIC_VECTOR(3 downto 0);
		 route2 : out STD_LOGIC_VECTOR(3 downto 0);
		 route3 : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end demux;

--}} End of automatically maintained section

architecture selectsa of demux is
begin
   
	route0 <= datain when (s1, s0) = "00" else "ZZZZ";
	route1 <= datain when (s1, s0) = "01" else "ZZZZ";
	route2 <= datain when (s1, s0) = "10" else "ZZZZ";
	route3 <= datain when (s1, s0) = "11" else "ZZZZ";
end selectsa;
