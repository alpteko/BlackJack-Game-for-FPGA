----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:58:48 05/22/2015 
-- Design Name: 
-- Module Name:    comp - Behavioral 
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

entity comp is
    Port ( input : in  STD_LOGIC_VECTOR( 4 DOWNTO 0);
           output : out  STD_LOGIC_vector(3 downto 0)
			  );
end comp;

architecture Behavioral of comp is

signal temp : std_logic_vector( 3 downto 0);
begin


with  input select  output<=
	"1111" WHEN "10101",
	"1111" when "10100",
	"1111"   when "10011",
    "1111"	when "10010",
	 "1100"     when others ;


end Behavioral;

