-------------------------------------------------------------------------------
--
-- Title       : bcd2aiken1
-- Design      : lab6
-- Author      : jasontan5126@yahoo.com
-- Company     : HP Inc.
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\bcd2aiken\lab6\src\bcd2aiken1.vhd
-- Generated   : Sat Mar  7 01:13:14 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {bcd2aiken1} architecture {bcd2aiken1}}

library IEEE;
use IEEE.std_logic_1164.all;

entity bcd2aiken1 is
	 port(
		 d : in STD_LOGIC;
		 c : in STD_LOGIC;
		 b : in STD_LOGIC;
		 a : in STD_LOGIC;
		 v : out STD_LOGIC;
		 w : out STD_LOGIC;
		 x : out STD_LOGIC;
		 y : out STD_LOGIC
	     );
end bcd2aiken1;

--}} End of automatically maintained section

architecture cpos_csop of bcd2aiken1 is
begin

	v <= (not d and c and not b and a) or (not d and c and b and not a) 
	or (not d and c and b and a) or (d and not c and not b and not a) or (d and not c and not b and a);
	
	w <= ( not d and c and not b and not a) or ( not d and c and b and not a)
	or (not d and c and b and a) or ( d and not c and not b and not a) or (d and not c and not b and a);
	
	x <= ( d or c or b or a) and (d or c or b or not a) and (d or not c or b or a)
	and (d or not c or not b or a) and ( d or not c or not b or not a);
	
	y <= ( d or c or b or a) and ( d or c or not b or a) and ( d or not c or b or a) and 
	(d or not c or not b or a) and (not d or c or b or a);

end cpos_csop;
