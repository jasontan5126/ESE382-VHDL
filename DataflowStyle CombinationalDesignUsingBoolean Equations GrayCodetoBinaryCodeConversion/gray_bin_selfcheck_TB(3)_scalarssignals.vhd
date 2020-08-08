 -- Entity Name : gray_bin_selfcheck_tb
 -- Entity Description: Entity has 8 scalar signals: g3, g2, g1, g0,b3,b2,b1,b0
 -- Architecture Name : tb_architecture
 -- Description : Applies each possible input combinations (gray code) and check if its
 -- corresponding outputs (binary codes) conversion is correct

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.all;


entity gray_bin_selfcheck_tb is
end gray_bin_selfcheck_tb;

architecture tb_architecture of gray_bin_selfcheck_tb is

	-- Stimulus signals
	signal g3, g2, g1, g0 : std_logic;
	-- Observed signals
	signal b3, b2, b1, b0 : std_logic;

	constant period: time := 20ns;

begin

	-- Unit Under Test port map
	UUT : entity gray_bin
		port map (g3 => g3, g2 => g2, g1 => g1, g0 => g0,
			b3 => b3, b2 => b2, b1 => b1, b0 => b0
		);

	stimulus: process
	begin
		for i in 0 to 15 loop	 -- generate all integer values of i from 0 to 15
			-- convert i to a vector of std_logic elements and assign to g3, g2, g1, g0
			(g3, g2, g1, g0) <= to_unsigned(i, 4);
			wait for period;	-- wait for outputs to settle
			-- verify outputs
			assert ((b3 = g3) and (b2 = (g3 xor g2)) and
			(b1 = ((g3 xor g2) xor g1)) and (b0 = (((g3 xor g2) xor g1) xor g0)))
			report "Error for input " & to_string((g3, g2, g1, g0)) & "."
				severity error;
		end loop;
		wait;	-- infinite wait, no more stimulus vectors to generate
	end process;

end tb_architecture;


																		   
