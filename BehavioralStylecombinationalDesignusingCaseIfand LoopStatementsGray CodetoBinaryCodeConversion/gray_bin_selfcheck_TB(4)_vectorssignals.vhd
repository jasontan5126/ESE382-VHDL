--
-- Entity Name : gray_bin_selfcheck_tb (modified)
-- Entity Description: Entity has a signal g which is a 4 element std_logic_vector which assures as an input, and a
-- signal b which is a 4 element std_logic_vector which assures as an output.
-- Architecture Name : conditional_dc
-- Description : A modified self checking testbench 
-- since the design entity's inputs (g) and outputs (b) are described as vectors
--
-- Laboratory : #4	
-- Design Task 3
-- Section : 03
-- Date Performed : 27 Feb 2020
-- Version/Rev : 1.0a
-- Authored by : Jason Tan and Zach Doctor
--IMPORTANT: Only applies for the "gray_bin_casewith_vectorinputsandoutputs.vhd", "gray_bin_if.vhd", and the "gray_bin_loop.vhd" files

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.all;

entity gray_bin_selfcheck_tb is
end gray_bin_selfcheck_tb;

architecture tb_architecture of gray_bin_selfcheck_tb is


signal g : STD_LOGIC_VECTOR(3 downto 0); -- data input
signal b : STD_LOGIC_VECTOR(3 downto 0); -- data input
	-- Stimulus signals
	--signal g3, g2, g1, g0 : std_logic;
	-- Observed signals
	--signal b3, b2, b1, b0 : std_logic;

	constant period: time := 20ns;

begin

	-- Unit Under Test port map
	UUT : entity gray_bin
		port map (g(3) => g(3),g(2) => g(2), g(1) => g(1),g(0) => g(0),  b(3) => b(3), 
		b(2) => b(2),  b(1) => b(1),  b(0) => b(0)
		);

	stimulus: process
	begin
		for i in 0 to 15 loop	 -- generate all integer values of i from 0 to 15
			-- convert i to a vector of std_logic elements and assign to g3, g2, g1, g0
			(g(3),g(2), g(1), g(0)) <= to_unsigned(i, 4);
			wait for period;	-- wait for outputs to settle
			-- verify outputs
			assert ((b(3) = g(3)) and (b(2) = (g(3) xor g(2))) and
			(b(1) = ((g(3) xor g(2)) xor g(1))) and (b(0) = (((g(3) xor g(2)) xor g(1)) xor g(0))))
			report "Error for input " & to_string((g(3), g(2), g(1), g(0))) & "."
				severity error;
		end loop;
		wait;	-- infinite wait, no more stimulus vectors to generate
	end process;

end tb_architecture;


																		   
