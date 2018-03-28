----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:33:47 05/22/2015 
-- Design Name: 
-- Module Name:    simple_reg - Behavioral 
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

entity simple_reg is
    Port ( d : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           q : out STD_LOGIC);
end simple_reg;

architecture Behavioral of simple_reg is
begin

process(clock)

begin

if(rising_edge(clock)) then

 q  <= d;
 

  end if;

end process;


end Behavioral;

