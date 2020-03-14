--
-- Entity Name : gray_bin
-- Entity Description: Entity has an input g which is a 4 element std_logic_vector, and a
-- single output b which is a 4 element std_logic_vector.
-- Architecture Name : gray_bin_if_vect
-- Description : Uses the if statement approach
-- with don't cares to implement a 4 bit gray code to binary decoders with vector inputs and outputs 
--
-- Laboratory : #5	
-- Design Task 3
-- Section : 03
-- Date Performed : 5 Mar 2020
-- Version/Rev : 1.0a
-- Authored by : Jason Tan and Zach Doctor 

library ieee;
use ieee.std_logic_1164.all;

-- declare entity
entity gray_bin is
	port ( -- signal declarations
	-- inputs
	g : in std_logic_vector(3 downto 0);
	-- outputs
	b : out std_logic_vector(3 downto 0) 
	);
end gray_bin;


architecture gray_bin_if_vect of gray_bin is
begin
	gray2binary_if: -- process label
	process (g) is -- sensitive to therm array
	begin -- begin process
		
		if g = "0000" then
			b <= "0000";
		
		elsif g = "0001" then
			b <= "0001";
	
		elsif g = "0011" then
			b <= "0010";
		
		elsif g = "0010" then
			b <= "0011";
		
		elsif g = "0110" then
			b <= "0100";
		
		elsif g = "0111" then
			b <= "0101";
		
		elsif g = "0101" then
			b <= "0110";
		
		elsif g = "0100" then
			b <= "0111";
		elsif g = "1100" then
			b <= "1000";
		elsif g = "1101" then
			b <= "1001";
		elsif g = "1111" then
			b <= "1010";
		elsif g = "1110" then
			b <= "1011";
		else -- else, don't care
			b <= "----";
		end if; -- end if
	end process gray2binary_if; -- end process
end gray_bin_if_vect; -- end architecture
