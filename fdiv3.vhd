library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 

entity fdiv3 is
    Port ( board_clk : in  STD_LOGIC;
           slow : out  STD_LOGIC
			  );
end fdiv3;

architecture Behavioral of fdiv3 is

signal temp : std_logic :='0';

begin

process(board_clk)

variable counter : integer := 0;

begin 

if(rising_edge(board_clk)) then

if(counter = 5000000) then
 temp <= not temp;
counter := 0;
else 
counter  := counter + 1;
end if;

end if;

end process;

slow <= temp;

end Behavioral;

