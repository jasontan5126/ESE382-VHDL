--
-- Entity Name : gray_bin
-- Entity Description: Entity has four inputs (g3,g2,g1, and g0), and
-- four output (b3, b2, b1, and b0).
-- Architecture Name : cpos
-- Description : Applies the canonical product of sums approach
-- to convert from gray code to binary code
-- 
--
-- Laboratory : #3
-- Section : 01
-- Date Performed : 20 Feb 2020
-- Version/Rev : 1.0a
-- Authored by : Jason Tan and Zach Doctor 

library IEEE;
use IEEE.std_logic_1164.all;

entity gray_bin_1 is
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
end gray_bin_1;

--}} End of automatically maintained section

architecture cpos of gray_bin_1 is
begin

	b3 <= (g3 or g2 or g1 or g0)  --0000
	and (g3 or g2 or g1 or not g0) 		--0001
	and (g3 or g2 or not g1 or not g0)		  --0011
	and (g3 or g2 or not g1 or g0)					--0010
	and (g3 or not g2 or not g1 or g0)  --0110
	and (g3 or not g2 or not g1 or not g0)  --0111
	and (g3 or not g2 or g1 or not g0)  --0101
	and (g3 or not g2 or g1 or g0);      --0100
	
	b2 <= (g3 or g2 or g1 or g0)  --0000
	and (g3 or g2 or g1 or not g0) 		--0001
	and (g3 or g2 or not g1 or not g0)		  --0011
	and (g3 or g2 or not g1 or g0)					--0010
	and (not g3 or not g2 or g1 or g0)  --1100
	and (not g3 or not g2 or g1 or not g0)  --1101
	and (not g3 or not g2 or not g1 or not g0) --1111
	and (not g3 or not g2 or not g1 or g0);  --1110 
	
	b1 <= (g3 or g2 or g1 or g0)  --0000
	and (g3 or g2 or g1 or not g0) 		--0001
	and(g3 or not g2 or not g1 or g0)  --0110
	and (g3 or not g2 or not g1 or not g0) 		--0111	
	and (not g3 or not g2 or g1 or g0)  --1100
	and (not g3 or not g2 or g1 or not g0) 		--1101	
	and(not g3 or g2 or not g1 or g0)  --1010
	and (not g3 or g2 or not g1 or not g0); 		--1011	
	
	b0 <= (g3 or g2 or g1 or g0)  --0000
	and (g3 or g2 or not g1 or not g0) 		--0011
	and(g3 or not g2 or not g1 or g0)  --0110
	and (g3 or not g2 or g1 or not g0) 		--0101
	and(not g3 or not g2 or g1 or g0)  --1100
	and (not g3 or not g2 or not g1 or not g0) 		--1111 
	and(not g3 or g2 or not g1 or g0)  --1010
	and (not g3 or g2 or g1 or not g0); 		--1001 
	
end cpos;
