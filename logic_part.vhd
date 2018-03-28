----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:42:49 05/22/2015 
-- Design Name: 
-- Module Name:    logic_part - Behavioral 
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

entity logic_part is
    Port ( card1 : in  STD_LOGIC;
	        switch : in std_logic;
           card2 : in  STD_LOGIC;
           card3 : in  STD_LOGIC;
           result : in  STD_LOGIC;
           board_clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           image1 : out  STD_LOGIC_vector( 3 downto 0);
           image2 : out  STD_LOGIC_vector( 3 downto 0);
           image3 : out  STD_LOGIC_vector( 3 downto 0);
           resimage : out  STD_LOGIC_vector( 3 downto 0));
end logic_part;



architecture Behavioral of logic_part is

component debouncer 
    Port ( input : in  STD_LOGIC;
	        clock : in std_logic;
           output : out  STD_LOGIC);
end component;

component fdiv1 
    Port ( board_clk : in  STD_LOGIC;
           slow : out  STD_LOGIC
			  );
end component;

component fdiv2 
    Port ( board_clk : in  STD_LOGIC;
           slow : out  STD_LOGIC
			  );
end component;

component fdiv3 
    Port ( board_clk : in  STD_LOGIC;
           slow : out  STD_LOGIC
			  );
end component;

component reg
    Port ( d : in  STD_LOGIC_vector(3 downto 0);
           clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           q : out STD_LOGIC_vector(3 downto 0)
			  );
end component;

component summer 
    Port ( input1 : in  STD_LOGIC_vector(3 downto 0);
	        switch : in std_logic;
           input2 : in  STD_LOGIC_vector(3 downto 0);
           input3 : in  STD_LOGIC_vector(3 downto 0);
           clock : in  STD_LOGIC;
           output : out  STD_LOGIC_vector( 4 downto 0)
			  );
end component;

component trigger 
    Port ( pulse : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  clock : in std_logic;
           sig : out  STD_LOGIC);
			  
end component;


component comp
    Port ( input : in  STD_LOGIC_VECTOR( 4 DOWNTO 0);
           output : out  STD_LOGIC_vector(3 downto 0)
			  );
end component;

component card_counter1

    Port ( clock : in  STD_LOGIC;
           card : out  STD_LOGIC_vector(3 downto 0))
			  ;
end component;

component component_clock 
    Port ( board_clk : in  STD_LOGIC;
           slow : out  STD_LOGIC
			  );
end component;

component mux 
    Port ( input : in  STD_LOGIC_vector(3 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_vector(3 downto 0))
			  ;
end component;


for div1 : fdiv1 use entity work.fdiv1(behavioral);

for div2: fdiv2 use entity work.fdiv2(behavioral);

for div3: fdiv3 use entity work.fdiv3(behavioral);

for cc1,cc2,cc3 : card_counter1 use entity work.card_counter1(behavioral);

for trig1,trig2,trig3 ,trig4: trigger  use entity work.trigger(behavioral);

for sum : summer use entity work.summer(behavioral);

for  deb1,deb2,deb3,deb4 : debouncer use entity work.debouncer(behavioral);

for component_clk : component_clock use entity work.component_clock(behavioral);

for mux1,mux2,mux3,mux4 : mux use entity work.mux(behavioral);

for comp1 : comp use entity work.comp(behavioral);

for r1,r2,r3 : reg use entity work.reg(behavioral);

signal slow_1 , slow_2 , slow_3, sel1,sel2,sel3,sel4,component_c:std_logic;
signal im1,im2,im3,im4 ,im5,im6,im7: std_logic           ;
signal card_1,card_2,card_3,card_44,card_444,card_11,card_22,card_33 ,card_111,card_222,card_333: std_logic_vector(3 downto 0 );
signal card_4: std_logic_vector(4 downto 0);


begin



component_clk : component_clock port map ( board_clk, component_c);

deb1 : debouncer Port map(card1,component_c,im1);

deb2 : debouncer Port map(card2,component_c,im2);

deb3 : debouncer Port map(card3,component_c,im3);

deb4 : debouncer Port map(result,component_c,im4);

     im5 <= im3 and ( not sel4 );
	   im6 <= im2 and ( not sel4 );
		 im7 <= im1 and ( not sel4 );
     
trig1 : trigger port map(im7,reset,component_c,sel1);
trig2 : trigger port map(im6,reset,component_c,sel2);
trig3 : trigger port map(im5,reset,component_c,sel3);
trig4 : trigger port map(im4,reset,component_c,sel4);

div1 : fdiv1 port map ( board_clk , slow_1);
div2 : fdiv2 port map ( board_clk , slow_2);
div3 : fdiv3 port map ( board_clk , slow_3);

cc1 : card_counter1 port map( slow_1,card_1);
cc2 : card_counter1 port map( slow_2,card_2);
cc3 : card_counter1 port map( slow_3,card_3);
sum : summer port map( card_111,switch,card_222,card_333,slow_1,card_4);


r1 : reg port map( card_1,slow_1,reset,sel1,card_11);
r2 : reg port map( card_2,slow_2,reset,sel2,card_22);
r3 : reg port map( card_3,slow_3,reset,sel3,card_33);
comp1 : comp port map ( card_4, card_44) ;


mux1 : mux port map( card_11,sel1,card_111);
mux2 : mux port map( card_22,sel2,card_222);
mux3 : mux port map( card_33,sel3,card_333);
mux4: mux port map ( card_44,sel4,card_444);

           image1  <= card_111;
           image2  <= card_222;
           image3  <= card_333;
           resimage <= card_444;

			  
end Behavioral;

