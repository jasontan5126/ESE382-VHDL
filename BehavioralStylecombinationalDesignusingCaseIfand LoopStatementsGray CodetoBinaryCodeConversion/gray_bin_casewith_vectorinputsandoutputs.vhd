--
-- Entity Name : gray_bin
-- Entity Description: Entity has an input g which is a 4 element std_logic_vector, and a
-- single output b which is a 4 element std_logic_vector.
-- Architecture Name : gray_bin_case_vect
-- Description : Uses the case statement approach
-- with don't cares to implement a 4 bit gray code to binary decoders with vector inputs and outputs 
--
-- Laboratory : #5	
-- Design Task 2
-- Section : 03
-- Date Performed : 5 Mar 2020
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

architecture gray_bin_case_vect of gray_bin is
begin

	gray_bin_case: -- label for process
	process (g) is  
	begin -- begin process
		
		case std_logic_vector'(g) is
			
			when "0000" =>
				b <= "0000";
				
			when "0001" =>
			    b <= "0001";
				
			when "0011" =>
				b <= "0010";
				
			when "0010" =>
				b <= "0011";
				
			when "0110" =>
				b <= "0100";
				
			when "0111" =>
				b <= "0101";
				
			when "0101" =>
				b <= "0110";
				
			when "0100" =>
				b <= "0111";
				
			when "1100" =>
				b <= "1000";
				
			when "1101" =>
				b <= "1001";	
				
			when "1111" =>
				b <= "1010";
				
			when "1110" =>
				b <= "1011";
				
			-- all others are don't cares ('-')
			when others =>
				b <= "----";
		end case;
	end process gray_bin_case;

end gray_bin_case_vect;
