 -- Entity Name : counter
 -- Entity Description: Entity has inputs en, rst_bar, clk
 -- Output is count which is a vector
 -- Architecture Name : int_count
 -- Description : On each edge of a clock the counter is incremented each time if enable
 -- is active and rst_bar is not active. If rst_bar is asserted the value of the counter is reset to zero. 
 -- If rst_bar is not asserted and enable is not enabled the count would stay the same on a clock edge. 
 -- Laboratory : #7
 -- Design Task 3
 -- Section : 03
 -- Date Performed : 5 Apr 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor

library IEEE;
use IEEE.std_logic_1164.all;  
use ieee.numeric_std.all;

entity counter is
	 port(
		 en : in STD_LOGIC;
		 rst_bar : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 count : out std_logic_vector (2 downto 0)
	     );
end counter;


architecture int_count of counter is
signal counter_inc : integer range 0 to 6;
begin

process(en, clk, rst_bar)  
begin		
	    
		if (clk'event and clk='1') and en = '1' then	
			counter_inc <= counter_inc + 1;
	
	end if;		
	
	if counter_inc = 6 then 
		counter_inc <= 0;
	end if;
	
	if (clk'event and clk = '1') 		then					  
		if(rst_bar = '0') then
			counter_inc <= 0;
    end if;			   
  end if;
  
end process;		   
count <= std_logic_vector(to_unsigned(counter_inc,3));
end int_count;

------------------------------------------------------------------	 

 -- Entity Name : pattern_gen
 -- Entity Description: Entity has input vector pat_num
 -- Output is led_array which is a vector
 -- Architecture Name : table_lookup
 -- Description : The pattern gen takes an input and then outputs one of those 7 values(1000001,0100010,0010100 etc.) using table lookup. 
 -- When counter is not enabled, the output led_array stays the same as when it was when counter was last incremented
 -- Laboratory : #7
 -- Design Task 3
 -- Section : 03
 -- Date Performed : 5 Apr 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan

library IEEE;
use IEEE.std_logic_1164.all;	
use ieee.numeric_std.all;

entity pattern_gen is
	 port(
		 pat_num : in std_logic_vector (2 downto 0);
		 led_array : out STD_LOGIC_vector (6 downto 0)
	     );
end pattern_gen;



architecture table_lookup of pattern_gen is	
begin
    process(pat_num)
	type table_type is array (0 to 6) of std_logic_vector(6 downto 0);
	constant led_values: table_type := ( 
		"1000001",
        "0100010",
        "0010100",
        "0001000",
        "0010100",
        "0100010",
        "1000001" );	
begin

        led_array <= led_values(to_integer(unsigned (pat_num)));	 
   end process;
end table_lookup;

---------------------------------------------------------------------------------- 

 -- Entity Name : mesmerize
 -- Entity Description: Entity has inputs en, rst_bar, clk
 -- Output is led_array which is a vector
 -- Architecture Name : structural
 -- Description : Mesmerize is a top level entity with two block entity: counter and pattern_gen. It implement using
 -- using structural design approach where en, rst_bar, and clk are the inputs to counter and counter is connected to the 
 -- input pat_num of pattern_gen which then outputs on led_array
 -- Laboratory : #7
 -- Design Task 3
 -- Section : 03
 -- Date Performed : 5 Apr 2020
 -- Version/Rev : 1.0a
 -- Authored by : Jason Tan and Zach Doctor
 
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.all;

entity mesmerize is
	port (
	rst_bar : in std_logic;
	clk : in std_logic;	 
	led_array : out std_logic_vector (6 downto 0)
		);
end mesmerize;



architecture structural of mesmerize is
signal pat_num : std_logic_vector (2 downto 0);	 
begin		  		
	u0: entity counter port map (en => '1', rst_bar => rst_bar, clk => clk, count => pat_num); 
	u1: entity pattern_gen port map (pat_num => pat_num,  led_array => led_array);	   
end structural;

