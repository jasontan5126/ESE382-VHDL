-------------------------------------------------------------------------------
--
-- Title       : lab6task2
-- Design      : lab6task2
-- Author      : jasontan5126@yahoo.com
-- Company     : HP Inc.
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\lab6task2_1\lab6task2\src\lab6task2.vhd
-- Generated   : Sat Mar  7 09:33:42 2020
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
--{entity {lab6task2} architecture {lab6task2}}

library IEEE;
use IEEE.std_logic_1164.all;

entity demux is
	 port(
		 s1 : in STD_LOGIC;
		 s0 : in STD_LOGIC;
		 datain : in STD_LOGIC_VECTOR(3 downto 0);
		 route0 : out STD_LOGIC_VECTOR(3 downto 0);
		 route1 : out STD_LOGIC_VECTOR(3 downto 0);
		 route2 : out STD_LOGIC_VECTOR(3 downto 0);
		 route3 : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end demux;

--}} End of automatically maintained section

architecture selectsa of demux is
begin
   
	route0 <= datain when (s1, s0) = "00" else "ZZZZ";
	route1 <= datain when (s1, s0) = "01" else "ZZZZ";
	route2 <= datain when (s1, s0) = "10" else "ZZZZ";
	route3 <= datain when (s1, s0) = "11" else "ZZZZ";
end selectsa;
