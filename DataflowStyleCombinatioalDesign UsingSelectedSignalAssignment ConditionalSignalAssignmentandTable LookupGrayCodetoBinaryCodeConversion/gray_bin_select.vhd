 --
 -- Entity Name : gray_bin
 -- Entity Description: Entity has inputs g3, g2, g1, and g0
 -- and outputs b3, b2, b1, and b0
 -- Architecture Name : selected
 -- Description : Implements the 4 bit gray code to binary code using the
 -- selected signal assignment approach
 --
 -- Laboratory : #4
 -- Design Task 1
 -- Section : 03
 -- Date Performed : 27 Feb 2020
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

architecture selected of gray_bin is
signal temp : std_logic_vector(3 downto 0);
begin
	 (b3, b2, b1, b0) <= temp;
	with std_logic_vector' (g3, g2, g1, g0) select
	temp <= "0000" when "0000",
	"0001" when "0001",
	"0010" when "0011",
	"0011" when "0010",
	"0100" when "0110",
	"0101" when "0111",
	"0110" when "0101",
	"0111" when "0100",
	"1000" when "1100", 
	"1001" when "1101",
	"1010" when "1111",
	"1011" when "1110",
	"1100" when "1010",
	"1101" when "1011",
	"1110" when "1001",
	"1111" when others;
	 
end selected;
