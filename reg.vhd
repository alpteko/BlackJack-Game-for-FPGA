----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:16:10 05/22/2015 
-- Design Name: 
-- Module Name:    reg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity reg is
    Port ( d : in  STD_LOGIC_vector(3 downto 0);
           clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           q : out STD_LOGIC_vector(3 downto 0)
			  );
end reg;

architecture Behavioral of reg is

begin


process(clock)

begin 

if rising_edge(clock)
then
  if(reset = '1') then
  
  q <= "0000";
  
  else
   
	if(enable = '0' ) then
	
	q <= d;
	
end if;

 end if;
  
end if;

end process;


end Behavioral;

