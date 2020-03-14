--
-- Entity Name : gray_bin
-- Entity Description: Entity has four inputs (g3,g2,g1, and g0), and
-- four output (b3, b2, b1, and b0).
-- Architecture Name : dataflow
-- Description : Applies the canonical sum of products approach
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

architecture csop of gray_bin is
begin
										-- gray code inputs
	b3 <= (g3 and g2 and not g1 and not g0)	   --1100
	or (g3 and g2 and not g1 and g0)			--1101
	or (g3 and g2 and g1 and g0)				--1111
	or (g3 and g2 and g1 and not g0)			 --1110
	or (g3 and not g2 and g1 and not g0)		--1010
	or (g3 and not g2 and g1 and g0)			--1011
	or (g3 and not g2 and not g1 and g0)		--1001
	or (g3 and not g2 and not g1 and not g0);	--1000
	
	b2 <= (not g3 and g2 and g1 and not g0)	 --0110
	or (not g3 and g2 and g1 and g0)		 --0111
	or (not g3 and g2 and not g1 and g0)	 --0101
	or (not g3 and g2 and not g1 and not g0) --0100
	or (g3 and not g2 and g1 and not g0)   	 --1010
	or (g3 and not g2 and g1 and g0)		 --1011
	or (g3 and not g2 and not g1 and g0)	 --1001
	or (g3 and not g2 and not g1 and not g0); --1000
	
	b1 <= (not g3 and not g2 and g1 and g0)	 --0011
	or (not g3 and not g2 and g1 and not g0) --0010
	or (not g3 and g2 and not g1 and g0)	 --0101
	or (not g3 and g2 and not g1 and not g0) --0100
	or (g3 and g2 and g1 and g0)			 --1111
	or (g3 and g2 and g1 and not g0)		 --1110
	or (g3 and not g2 and not g1 and g0)	 --1001
	or (g3 and not g2 and not g1 and not g0);--1000
	
	b0 <= (not g3 and not g2 and not g1 and g0)		 --0001
	or (not g3 and not g2 and g1 and not g0)		 --0010
	or (not g3 and g2 and g1 and g0)				 --0111
	or ( not g3 and g2 and not g1 and not g0)		 --0100
	or (g3 and g2 and not g1 and g0)				 --1101
	or (g3 and g2 and g1 and not g0)			   --1110
	or (g3 and not g2 and g1 and g0)		        --1011
	or (g3 and not g2 and not g1 and not g0);	   --1000
end csop;
