--
-- Entity Name : gray_bin
-- Entity Description: Entity has four input g3, g2, g1, and g0 and a
-- four output b3, b2, b1, and b0 .
-- Architecture Name : gray_binary_case
-- Description : Uses the case statement approach
-- with don't cares to implement a 4 bit gray code to binary decoder
--
-- Laboratory : #5	
-- Design Task 1
-- Section : 03
-- Date Performed : 5 Mar 2020
-- Version/Rev : 1.0a
-- Authored by : Jason Tan and Zach Doctor 

library IEEE;
use IEEE.std_logic_1164.all;

entity gray_bin is
	 port(
		 g3 : in STD_LOGIC;
		 g2 : in STD_LOGIC;
		 g1 : in STD_LOGIC;
		 g0 : in STD_LOGIC;
		 b3 : out STD_LOGIC;
		 b2 : out STD_LOGIC;
		 b1 : out STD_LOGIC;
		 b0 : out STD_LOGIC
	     );
end gray_bin;

--}} End of automatically maintained section

architecture gray_bin_case of gray_bin is
begin
	gray_bin_case: -- label for process
	process (g3, g2, g1, g0) is  
	begin -- begin process
		
		case std_logic_vector'(g3, g2, g1, g0) is
			
			when "0000" | "0001" =>
				b3 <= '0';
				b2 <= '0';
				b1 <= '0';
				b0 <= '0';
				
			
				
			when "0011" =>
				b3 <= '0';
				b2 <= '0';
				b1 <= '1';
				b0 <= '0';
				
			when "0010" =>
				b3 <= '0';
				b2 <= '0';
				b1 <= '1';
				b0 <= '1';
				
			when "0110" =>
				b3 <= '0';
				b2 <= '1';
				b1 <= '0';
				b0 <= '0';
				
			when "0111" =>
				b3 <= '0';
				b2 <= '1';
				b1 <= '0';
				b0 <= '1';
				
			when "0101" =>
				b3 <= '0';
				b2 <= '1';
				b1 <= '1';
				b0 <= '0';
				
			when "0100" =>
				b3 <= '0';
				b2 <= '1';
				b1 <= '1';
				b0 <= '1';
				
			when "1100" =>
				b3 <= '1';
				b2 <= '0';
				b1 <= '0';
				b0 <= '0';
				
			when "1101" =>
				b3 <= '1';
				b2 <= '0';
				b1 <= '0';
				b0 <= '1';	
				
			when "1111" =>
				b3 <= '1';
				b2 <= '0';
				b1 <= '1';
				b0 <= '0';
				
			when "1110" =>
				b3 <= '1';
				b2 <= '0';
				b1 <= '1';
				b0 <= '1';
				
			-- all others are don't cares ('-')
			when others =>
				b3 <= '-';
				b2 <= '-';
				b1 <= '-';
				b0 <= '-';
		end case;
	end process gray_bin_case;

end gray_bin_case;
