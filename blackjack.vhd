----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:31:00 05/25/2015 
-- Design Name: 
-- Module Name:    blackjack - Behavioral 
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


entity blackjack is
 Port (  switch : in  STD_LOGIC;
	       card1 : in std_logic;
           card2 : in  STD_LOGIC;
           card3 : in  STD_LOGIC;
           result : in  STD_LOGIC;
           board_clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
          red : out  STD_LOGIC_vector( 2 downto 0);
          green : out  STD_LOGIC_vector( 2 downto 0);
          blue : out  STD_LOGIC_vector( 1 downto 0);
           vsync: out  STD_LOGIC;
			  hsync : out std_logic
			  );
end blackjack;

architecture Behavioral of blackjack is

component logic_part 
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
			  
end component;
component  fdiv_vga 
    Port ( board_clk : in  STD_LOGIC;
           slow : out  STD_LOGIC
			  );
end component;
component  imageprocess
    Port ( 
           clock : in  STD_LOGIC;
           hsignal : out  STD_LOGIC;
			  vsignal : out  std_logic;
			    image1 : in  STD_LOGIC_vector( 3 downto 0);
           image2 : in  STD_LOGIC_vector( 3 downto 0);
           image3 : in  STD_LOGIC_vector( 3 downto 0);
           resimage : in  STD_LOGIC_vector( 3 downto 0);
			  color : out std_logic_vector( 7 downto 0 ) 
			  );
end component;

for u1 : fdiv_vga use entity work.fdiv_vga(behavioral);
for u2 : logic_part use entity work.logic_part(behavioral);
for u3 : imageprocess use entity work.imageprocess(behavioral); 
signal slow : std_logic ;
signal im1,im2,im3,im4 : std_logic_vector( 3 downto 0);
signal colors : std_logic_vector( 7 downto 0 );
begin

u1 : fdiv_vga port map (board_clk,slow);
u2 : logic_part port map (  card1, switch ,card2,card3,result,board_clk,reset,im1,im2,im3,im4 );
u3: imageprocess port map(slow,hsync,vsync,im1,im2,im3,im4,colors );


 red <= colors(7 downto 5);
 green <= colors(4 downto 2);
 blue <= colors (1 downto 0);



end Behavioral;

