--
-- Entity Name : gray_bin
-- Entity Description: Entity has an input g which is a 4 element std_logic_vector, and a
-- single output b which is a 4 element std_logic_vector.
-- Architecture Name : gray2binary_loop
-- Description : Uses the loop statement approach
-- with don't cares to implement a 4 bit gray code to binary decoders
--
-- Laboratory : #5	
-- Design Task 4
-- Section : 03
-- Date Performed : 5 Mar 2020
-- Version/Rev : 1.0a
-- Authored by : Jason Tan and Zach Doctor 

library IEEE;
use IEEE.std_logic_1164.all;

entity gray_bin is	
	port (
	g : in std_logic_vector(3 downto 0); 
	b : out std_logic_vector(3 downto 0) 
	);
end gray_bin;

--}} End of automatically maintained section

architecture gray2binary_loop of gray_bin is
begin
process (g)	
variable bv : std_logic_vector(3 downto 0);
begin								  
 bv(3) := g(3);
for index in 2 downto 0 loop	
bv(index) := bv(index +1) xor g(index);  

end loop;

if (g = "1010") then
bv := "----";
elsif (g = "1011") then
bv := "----";
 
elsif (g = "1001") then
bv := "----";	  

elsif (g = "1000") then
bv := "----";

end if;

b <= bv;
end process;


end gray2binary_loop;
