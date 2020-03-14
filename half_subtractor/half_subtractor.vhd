-------------------------------------------------------------------------------
--
-- Title       : half_subtractor
-- Design      : half_subtractor
-- Author      : Jason Tan
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\half_subtractor\half_subtractor\src\half_subtractor.vhd
-- Generated   : Thu Feb  6 08:34:11 2020
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
--{entity {half_subtractor} architecture {half_subtractor}}

library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
	 port(
		 a : in STD_LOGIC;
		 b : in STD_LOGIC;
		 carry_out : out STD_LOGIC;
		 sum : out STD_LOGIC
	     );
end half_adder;

--}} End of automatically maintained section

architecture dataflow of half_adder is
begin

	 sum <= a xor b;
	carry_out <= a and b;

end dataflow;
