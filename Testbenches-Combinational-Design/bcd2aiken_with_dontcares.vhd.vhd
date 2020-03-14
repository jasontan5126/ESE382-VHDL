-------------------------------------------------------------------------------
--
-- Title       : bcd2aiken
-- Design      : lab6
-- Author      : jasontan5126@yahoo.com
-- Company     : HP Inc.
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\bcd2aiken\lab6\src\bcd2aiken.vhd
-- Generated   : Fri Mar  6 18:49:04 2020
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
--{entity {bcd2aiken} architecture {bcd2aiken}}

library IEEE;
use IEEE.std_logic_1164.all;

entity bcd2aiken is
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
end bcd2aiken;

--}} End of automatically maintained section

architecture bcd2aiken of bcd2aiken is
begin

	with std_logic_vector'(d,c,b,a) select
(v,w,x,y) <= std_logic_vector'("0000") when "0000",
"0001" when "0001",
"0010" when "0010",
"0011" when "0011",
"0100" when "0100",
"1011" when "0101",
"1100" when "0110",
"1101" when "0111",
"1110" when "1000",
"1111" when "1001",
"----" when others;

end bcd2aiken;

