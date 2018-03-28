library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux is
    Port ( input : in  STD_LOGIC_vector(3 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_vector(3 downto 0))
			  ;
end mux;

architecture Behavioral of mux is

begin

with  sel select  output <=
	input when '1',
	"0000" when others ;
	

end Behavioral;

