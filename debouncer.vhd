----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:32:43 05/22/2015 
-- Design Name: 
-- Module Name:    debouncer - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debouncer is
    Port ( input : in  STD_LOGIC;
	        clock : in std_logic;
           output : out  STD_LOGIC);
end debouncer;

architecture Behavioral of debouncer is

component simple_reg
    Port ( d : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;
component my_and 
    Port ( in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           in3 : in  STD_LOGIC;
           in4 : in  STD_LOGIC;
           output : out  STD_LOGIC);
end component;

for all :  simple_reg use entity work.simple_reg(behavioral);
for a1 :  my_and use entity work.my_and(behavioral);
signal im1,im2,im3,im4 : std_logic ;
signal clock1: std_logic;
begin

       
u1 : simple_reg port map ( input ,clock , im1 );

u2 : simple_reg port map ( im1 ,clock , im2 );

u3 :  simple_reg port map ( im2, clock ,im3);

u4  : simple_reg port map ( im3 ,clock ,im4);

a1 : my_and port map(im1,im2,im3,im4,output);



end Behavioral;

