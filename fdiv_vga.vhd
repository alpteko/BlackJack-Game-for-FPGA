library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 

entity fdiv_vga is
    Port ( board_clk : in  STD_LOGIC;
           slow : out  STD_LOGIC
			  );
end fdiv_vga;

architecture Behavioral of fdiv_vga is


begin

process(board_clk)

variable counter : integer := 0;
variable temp :std_logic := '0';

begin 

if(rising_edge(board_clk)) then

if(counter = 1) then
 temp := not temp;
counter := 0;
else 
counter  := counter + 1;
end if;

end if;
slow <= temp;
end process;



end Behavioral;

