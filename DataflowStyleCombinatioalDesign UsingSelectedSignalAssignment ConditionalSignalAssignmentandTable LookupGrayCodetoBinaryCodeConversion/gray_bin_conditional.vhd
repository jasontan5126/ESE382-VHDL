--
-- Entity Name : gray_bin
-- Entity Description: Entity has an input g which is a 4 element std_logic_vector, and a
-- single output b which is a 4 element std_logic_vector.
-- Architecture Name : conditional_dc
-- Description : Uses the conditional signal assignment approach
-- with don't cares to implement a 4 bit gray code to binary decoders
--
-- Laboratory : #4	
-- Design Task 3
-- Section : 03
-- Date Performed : 27 Feb 2020
-- Version/Rev : 1.0a
-- Authored by : Jason Tan and Zach Doctor 



library IEEE;
use IEEE.std_logic_1164.all;


entity gray_bin is		  
	
	port (
	g : in std_logic_vector(3 downto 0); -- data input
	b : out std_logic_vector(3 downto 0) -- output
	);
	
end gray_bin;

--}} End of automatically maintained section

architecture conditional_dc of gray_bin is
begin

	b <= "0000" when (g = "0000") else
	"0001" when (g = "0001") else
	"0010" when (g = "0011") else
	"0011" when (g = "0010") else
	"0100" when (g = "0110") else
	"0101" when (g = "0111") else
	"0110" when (g = "0101") else
	"0111" when (g = "0100") else
	"1000" when (g = "1100") else
	"1001" when (g = "1101") else
	"1010" when (g = "1111") else
	"1011" when (g = "1110") else
	"----"; 

end conditional_dc;
