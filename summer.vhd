library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 

entity summer is
    Port ( input1 : in  STD_LOGIC_vector(3 downto 0);
	        switch : in std_logic; 
           input2 : in  STD_LOGIC_vector(3 downto 0);
           input3 : in  STD_LOGIC_vector(3 downto 0);
           clock : in  STD_LOGIC;
           output : out  STD_LOGIC_vector( 4 downto 0)
			  );
end summer;

architecture Behavioral of summer is

signal temp : std_logic_vector(4 downto 0) ;
begin

process(clock)

variable in1 ,in2,in3 : std_logic_vector(3 downto 0);

begin


if rising_edge(clock) then
    
   if( input1 > "1010") then
	in1 := "1010" ;
	else 
	in1 := input1 ;
	end if;
	
	   if( input2 > "1010") then
	in2 := "1010" ;
	else 
	in2 := input2 ;
	end if;
	
	   if( input3 > "1010") then
	in3 := "1010" ;
	else 
	in3 := input3 ;
	end if;


  temp <=  ('0' & in1) +   ('0' & in2) + ('0' & in3 );
  
  if(switch = '1') then
  if input1 = "0001" or  input2 = "0001" or input3 = "0001"
  
  then
  
  temp <= temp + "01010";
  
end if;
end if;


end if;

end process;


 output <= temp(4 downto 0);





end Behavioral;

