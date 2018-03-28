library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity card_counter1 is

    Port ( clock : in  STD_LOGIC;
           card : out  STD_LOGIC_vector(3 downto 0))
			  ;
end card_counter1;

architecture Behavioral of card_counter1 is

begin

process(clock)

variable temp : std_logic_vector( 3 downto 0) := "0001";
begin 

if rising_edge(clock) then

if(temp = "1110") then

temp := "0001";

else 

temp := temp + "0001";

end if;

 end if;
 
  card <= temp;
  
 
 
 end process;
 
 

 
end Behavioral;

