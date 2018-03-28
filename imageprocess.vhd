library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity imageprocess is
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
end imageprocess;

architecture Behavioral of imageprocess is

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
component fdiv_vga 
    Port ( board_clk : in  STD_LOGIC;
           slow : out  STD_LOGIC
			  );
end component;


for u1: logic_part use entity work.logic_part(behavioral);

for u2 : fdiv_vga use entity work.fdiv_vga(behavioral);
signal clock : std_logic;
signal image1,image2,image3,resimage: std_logic_vector(3 downto 0);

 
 begin
  
  u1 : logic_part port map ( card1,switch,card2,card3,result,board_clk,reset,image1,image2,image3,resimage);
  u2 : fdiv_vga port map (board_clk,clock);
 
  process(clock)
  
  
 variable hcounter: integer := 0;
	variable vcounter : integer :=0;
	variable w : integer := 143;
	variable h : integer := 30;
	variable w1 : integer ;
	variable w2 : integer ;
	variable h1 : integer ;
	variable col : std_logic_vector(7 downto 0);
	variable temp,temp2: STD_LOGIC ;
	
  begin 
 

   if  rising_edge(clock) then
	
	
      
		hcounter := hcounter +  1 ;	

    		
	  -----
     if( vcounter > 30 ) 
    and ( vcounter < 511 ) 
    then
	 if (hcounter > 143 ) 
    and ( hcounter < 785)
    then
	 
	  
	 
	  col:= "00011111";
	     h1:= 190;
	    w:= 64 + 143;
		 w2 := 128 + 64 + 64 + 143;
		 w1 :=  64+  128 + 64 + 128 + 64 + 143 ;
	 h:= 350;
	          
	  
	 -------------------- -------------------aaaaaaaaaaaaaaaaa
	
    if( image1 = "0001" or image1 = "1001" or image1="1000"  or image1 = "0101" or image1 = "0011" or image1 ="0010")
	 then
	 
	 if ( vcounter >= h+5 ) 
    and ( vcounter <= h+15 ) 
    then
	 
		 if (hcounter > w+4 ) 
    and ( hcounter < w+124)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
	end if;
		-------------------------bbbbbbbbbbbb
		if( image1="0001" or image1 = "1001" or image1="1000"  or image1 = "0110"  or image1 = "0101" or image1="0100" )
	 then
		 if ( vcounter >= h+15 ) 
    and ( vcounter <= h+75 ) 
    then
	 
		 if (hcounter > w+4 ) 
    and ( hcounter < w+14)
	 then
	
	 
	  col:= "11100000";
	 end if;
      end if;
	end if;
		------------------------ccccccccccccccc
	 if( image1="0001" or image1 = "1001" or image1="1000"  or image1 = "0100" or image1 = "0011" or image1 ="0010" )
	 then
			 if ( vcounter >=  h+15 ) 
    and ( vcounter <= h+75 ) 
    then
	 
		 if (hcounter > w+114 ) 
    and ( hcounter < w+124)
	 then
	 
	  col:= "11100000";
	
	 end if;
      end if;
		end if;
		---------------------------dddddddddddddddddddddddddd
		    if(image1 ="0001" or image1 = "1001" or image1="1000" or image1 = "0110" or image1 = "0101" or  image1="0100" or image1 = "0011" or image1 ="0010")
	 then
			 if ( vcounter >= h+75 ) 
    and ( vcounter <= h+85 ) 
    then
	 
		 if (hcounter > w+4 ) 
    and ( hcounter < w+124)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
	end if;
		-----------------------------------------------eeeeeeeeee
		if( image1 ="0001" or image1="1000"  or image1 = "0110"  or image1 ="0010")
	 then
			 if ( vcounter > h+85 ) 
    and ( vcounter < h+145 ) 
    then
	 
		 if (hcounter >=w+4 ) 
    and ( hcounter < w+14)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
	   end if;
		------------------------------------fffffffffffffff
		if( image1="0001" or image1="1010" or image1 = "1001" or image1="1000"  or image1 = "0110" or image1 ="0101" or image1 ="0100" or image1 = "0011" )
	 then
				 if ( vcounter >=h+85 ) 
    and ( vcounter <= h+145 ) 
    then
	 
		 if (hcounter > w+114 ) 
    and ( hcounter < w+124)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
		end if;
		------------------------------------------------------ggggggg
		if( image1 = "1001" or image1="1000" or image1 = "0110" or image1 = "0101" or image1 = "0011" or image1 ="0010")
	 then
				 if ( vcounter >= h+145 ) 
    and ( vcounter <= h+155 ) 
    then
	 
		 if (hcounter > w+4 ) 
    and ( hcounter < w+124)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
		end if;
		--------------------------------------ten
		
		if( image1 = "1010") then	

		
		if ( vcounter >= h+5 ) 
    and ( vcounter <= h+155 ) 
    then
		 if (hcounter > w+4 ) 
    and ( hcounter < w+14)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+5 ) 
    and ( vcounter <= h+15 ) 
    then
		 if (hcounter > w+24 ) 
    and ( hcounter < w+124)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+145 ) 
    and ( vcounter <= h+155 ) 
    then
		 if (hcounter > w+24 ) 
    and ( hcounter < w+124)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		end if;
		------------------------joker
		if( image1 = "1011") then	

		
		if ( vcounter >= h+5 ) 
    and ( vcounter <= h+155 ) 
    then
		 if (hcounter > w+59 ) 
    and ( hcounter < w+69)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+145 ) 
    and ( vcounter <= h+155 ) 
    then
		 if (hcounter >= w+29) 
    and ( hcounter <= w+ 59)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+135 ) 
    and ( vcounter <= h+155 ) 
    then
		 if (hcounter > w+19 ) 
    and ( hcounter < w+29)
	 then
	col:= "11100000";
	
	 end if;
      end if;





		end if;
		
		---------------------------------------Queennn
		
				if( image1 = "1100") then	

		
		if ( vcounter >= h+10 ) 
    and ( vcounter <= h+20 ) 
    then
		 if (hcounter > w+10 ) 
    and ( hcounter < w+120)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+20 ) 
    and ( vcounter <= h+140 ) 
    then
		 if (hcounter >= w+10) 
    and ( hcounter <= w+20)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+20 ) 
    and ( vcounter <= h+140 ) 
    then
		 if (hcounter >= w+110 ) 
    and ( hcounter <= w+120)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		
	if ( vcounter >= h+140	) 
    and ( vcounter <= h+150 ) 
    then
		 if (hcounter >= w+10 ) 
    and ( hcounter <= w+120)
	 then
	col:= "11100000";
	
	 end if;
      end if;
    
	 
      if ( vcounter >= h+135 ) 
    and ( vcounter <= h+155 ) 
    then
	      
	       
		 if (hcounter >= w+105 + vcounter - h -135) 
    and ( hcounter <= w + 115 + vcounter -  h -135)
	 then
	col:= "11100000";
	
	 end if;
      end if;

		end if;
		
		---------------------------------------------------KING
		if( image1 = "1100") then	

		
		if ( vcounter >= h+10 ) 
    and ( vcounter <= h+150 ) 
    then
		 if (hcounter > w+10 ) 
    and ( hcounter < w+20)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+10 ) 
    and ( vcounter <= h+80 ) 
    then
		 if (hcounter >= w+90 + h +10 - vcounter) 
    and ( hcounter <= w+100 + h + 10 - vcounter)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter > h+80 ) 
    and ( vcounter <= h+150 ) 
    then
		 if (hcounter >= w + 20 + vcounter - h - 80 ) 
    and ( hcounter <= w + 30 + vcounter - h - 80 )
	 then
	col:= "11100000";
	
	 end if;
      end if;
		end if;
		----------------------------------------------seven
		if ( image1 = "0111" ) then
		
	if ( vcounter >= h+15 ) 
    and ( vcounter <= h+25 ) 
    then
		 if (hcounter >= w+4 ) 
    and ( hcounter <= w+124)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter > h+25 ) 
    and ( vcounter <= h+135 ) 
    then
		 if (hcounter >= w + 114 + vcounter - h - 25 ) 
    and ( hcounter <= w + 124 + vcounter - h - 25 )
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		end if;
		
		-----------------------------------------------------------------------------slot2
			 -------------------- -------------------aaaaaaaaaaaaaaaaa
	
    if( image2 = "0001" or image2 = "1001" or image2="1000"  or image2 = "0101" or image2 = "0011" or image2 ="0010")
	 then
	 
	 if ( vcounter >= h+5 ) 
    and ( vcounter <= h+15 ) 
    then
	 
		 if (hcounter > w1+4 ) 
    and ( hcounter < w1+124)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
	end if;
		-------------------------bbbbbbbbbbbb
		if( image2="0001" or image2 = "1001" or image2="1000"  or image2 = "0110"  or image2 = "0101" or image2="0100" )
	 then
		 if ( vcounter >= h+15 ) 
    and ( vcounter <= h+75 ) 
    then
	 
		 if (hcounter > w1+4 ) 
    and ( hcounter < w1+14)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
	end if;
		------------------------ccccccccccccccc
	 if( image2="0001" or image2 = "1001" or image2="1000"  or image2 = "0100" or image2 = "0011" or image2 ="0010" or image2="1010")
	 then
			 if ( vcounter >=  h+15 ) 
    and ( vcounter <= h+75 ) 
    then
	 
		 if (hcounter > w1+114 ) 
    and ( hcounter < w1+124)
	 then
	 
	  col:= "11100000";
	
	 end if;
      end if;
		end if;
		---------------------------dddddddddddddddddddddddddd
		    if(image2="0001" or image2 = "1001" or image2="1000" or image2 = "0110" or image2 = "0101" or  image2="0100" or image2 = "0011" or image2 ="0010")
	 then
			 if ( vcounter >= h+75 ) 
    and ( vcounter <= h+85 ) 
    then
	 
		 if (hcounter > w1 +4 ) 
    and ( hcounter < w1 + 124)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
	end if;
		-----------------------------------------------eeeeeeeeee
		if( image2="0001" or image2="1000"  or image2 = "0100" or image2 = "0011" or image2 ="0010")
	 then
			 if ( vcounter >= h+85 ) 
    and ( vcounter < h+145 ) 
    then
	 
		 if (hcounter >= w1+4 ) 
    and ( hcounter < w1+14)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
	   end if;
		------------------------------------fffffffffffffff
		if( image2="0001" or image2="1010" or image2 = "1001" or image2="1000"  or image2 = "0110" or image2 ="0101" or image2 ="0100" or image2 = "0011" )
	 then
				 if ( vcounter >=h+85 ) 
    and ( vcounter <= h+145 ) 
    then
	 
		 if (hcounter > w1+114 ) 
    and ( hcounter < w1+124)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
		end if;
		------------------------------------------------------ggggggg
		if( image2 = "1001" or image2="1000" or image2 = "0110" or image2 = "0101" or image2 = "0011" or image2 ="0010")
	 then
				 if ( vcounter >= h+145 ) 
    and ( vcounter <= h+155 ) 
    then
	 
		 if (hcounter > w1+4 ) 
    and ( hcounter < w1+124)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
		end if;
		--------------------------------------ten
		
		if( image2 = "1010") then	

		
		if ( vcounter >= h+5 ) 
    and ( vcounter <= h+155 ) 
    then
		 if (hcounter > w1 +4 ) 
    and ( hcounter < w1 +14)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+5 ) 
    and ( vcounter <= h+15 ) 
    then
		 if (hcounter > w1 +24 ) 
    and ( hcounter < w1 +124)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+145 ) 
    and ( vcounter <= h+155 ) 
    then
		 if (hcounter > w1 +24 ) 
    and ( hcounter < w1 +124)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		end if;
		------------------------joker
		if( image2 = "1011") then	

		
		if ( vcounter >= h+5 ) 
    and ( vcounter <= h+155 ) 
    then
		 if (hcounter > w1 +59 ) 
    and ( hcounter < w1 +69)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+145 ) 
    and ( vcounter <= h+155 ) 
    then
		 if (hcounter >= w1 +29) 
    and ( hcounter <= w1 + 59)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+135 ) 
    and ( vcounter <= h+155 ) 
    then
		 if (hcounter > w1+19 ) 
    and ( hcounter < w1+29)
	 then
	col:= "11100000";
	
	 end if;
      end if;





		end if;
		
		---------------------------------------Queennn
		
				if( image2 = "1100") then	

		
		if ( vcounter >= h+10 ) 
    and ( vcounter <= h+20 ) 
    then
		 if (hcounter > w1+10 ) 
    and ( hcounter < w1+120)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+20 ) 
    and ( vcounter <= h+140 ) 
    then
		 if (hcounter >= w1+10) 
    and ( hcounter <= w1+20)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+20 ) 
    and ( vcounter <= h+140 ) 
    then
		 if (hcounter >= w1+110 ) 
    and ( hcounter <= w1+120)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		
	if ( vcounter >= h+140	) 
    and ( vcounter <= h+150 ) 
    then
		 if (hcounter >= w1+10 ) 
    and ( hcounter <= w1+120)
	 then
	col:= "11100000";
	
	 end if;
      end if;
    
	 
      if ( vcounter >= h+135 ) 
    and ( vcounter <= h+155 ) 
    then
	      
	       
		 if (hcounter >= w1 +105 + vcounter - h -135) 
    and ( hcounter <= w1 + 115 + vcounter -  h -135)
	 then
	col:= "11100000";
	
	 end if;
      end if;

		end if;
		
		---------------------------------------------------KING
		if( image2 = "1100") then	

		
		if ( vcounter >= h+10 ) 
    and ( vcounter <= h+150 ) 
    then
		 if (hcounter > w1+10 ) 
    and ( hcounter < w1+20)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+10 ) 
    and ( vcounter <= h+80 ) 
    then
		 if (hcounter >= w1 +90 + h +10 - vcounter) 
    and ( hcounter <= w1 +100 + h + 10 - vcounter)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter > h+80 ) 
    and ( vcounter <= h+150 ) 
    then
		 if (hcounter >= w1 + 20 + vcounter - h - 80 ) 
    and ( hcounter <= w1 + 30 + vcounter - h - 80 )
	 then
	col:= "11100000";
	
	 end if;
      end if;
		end if;
		----------------------------------------------seven
		if ( image2 = "0111" ) then
		
	if ( vcounter >= h+15 ) 
    and ( vcounter <= h+25 ) 
    then
		 if (hcounter >= w1+4 ) 
    and ( hcounter <= w1+124)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter > h+25 ) 
    and ( vcounter <= h+135 ) 
    then
		 if (hcounter >= w1 + 114 + vcounter - h - 25 ) 
    and ( hcounter <= w1 + 124 + vcounter - h - 25 )
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		end if;
		
		--------------------------------------------------------------------------------slot3
			 -------------------- -------------------aaaaaaaaaaaaaaaaa
	
    if( image3 = "0001" or image3 = "1001" or image3="1000"  or image3 = "0101" or image3 = "0011" or image3 ="0010")
	 then
	 
	 if ( vcounter >= h+5 ) 
    and ( vcounter <= h+15 ) 
    then
	 
		 if (hcounter > w2+4 ) 
    and ( hcounter < w2+124)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
	end if;
		-------------------------bbbbbbbbbbbb
		if( image3 ="0001" or image3 = "1001" or image3="1000"  or image3 = "0110"  or image3 = "0101" or image3="0100" )
	 then
		 if ( vcounter >= h+15 ) 
    and ( vcounter <= h+75 ) 
    then
	 
		 if (hcounter > w2+4 ) 
    and ( hcounter < w2+14)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
	end if;
		------------------------ccccccccccccccc
	 if( image3="0001" or image3 = "1001" or image3="1000"  or image3 = "0100" or image3 = "0011" or image3 ="0010" or image3="1010")
	 then
			 if ( vcounter >=  h+15 ) 
    and ( vcounter <= h+75 ) 
    then
	 
		 if (hcounter > w2+114 ) 
    and ( hcounter < w2+124)
	 then
	 
	  col:= "11100000";
	
	 end if;
      end if;
		end if;
		---------------------------dddddddddddddddddddddddddd
		    if(image3="0001" or image3 = "1001" or image3="1000" or image3 = "0110" or image3 = "0101" or  image3="0100" or image3 = "0011" or image3 ="0010")
	 then
			 if ( vcounter >= h+75 ) 
    and ( vcounter <= h+85 ) 
    then
	 
		 if (hcounter > w2+4 ) 
    and ( hcounter < w2+124)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
	end if;
		-----------------------------------------------eeeeeeeeee
		if( image3="0001" or image3="1000"  or image3 = "0100" or image3 = "0011" or image3 ="0010")
	 then
			 if ( vcounter >= h+85 ) 
    and ( vcounter < h+145 ) 
    then
	 
		 if (hcounter >=w2+4 ) 
    and ( hcounter < w2+14)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
	   end if;
		------------------------------------fffffffffffffff
		if( image3 ="0001" or image3="1010" or image3 = "1001" or image3="1000"  or image3 = "0110" or image3 ="0101" or image3 ="0100" or image3 = "0011" )
	 then
				 if ( vcounter >=h+85 ) 
    and ( vcounter <= h+145 ) 
    then
	 
		 if (hcounter > w2 +114 ) 
    and ( hcounter < w2 +124)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
		end if;
		------------------------------------------------------ggggggg
		if( image3 = "1001" or image3="1000" or image3 = "0110" or image3 = "0101" or image3 = "0011" or image3 ="0010")
	 then
				 if ( vcounter >= h+145 ) 
    and ( vcounter <= h+155 ) 
    then
	 
		 if (hcounter > w2+4 ) 
    and ( hcounter < w2+124)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
		end if;
		--------------------------------------ten
		
		if( image3 = "1010") then	

		
		if ( vcounter >= h+5 ) 
    and ( vcounter <= h+155 ) 
    then
		 if (hcounter > w2+4 ) 
    and ( hcounter < w2+14)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+5 ) 
    and ( vcounter <= h+15 ) 
    then
		 if (hcounter > w2+24 ) 
    and ( hcounter < w2+124)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+145 ) 
    and ( vcounter <= h+155 ) 
    then
		 if (hcounter > w2+24 ) 
    and ( hcounter < w2+124)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		end if;
		------------------------joker
		if( image3 = "1011") then	

		
		if ( vcounter >= h+5 ) 
    and ( vcounter <= h+155 ) 
    then
		 if (hcounter > w2+59 ) 
    and ( hcounter < w2+69)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+145 ) 
    and ( vcounter <= h+155 ) 
    then
		 if (hcounter >= w2+29) 
    and ( hcounter <= w2+ 59)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+135 ) 
    and ( vcounter <= h+155 ) 
    then
		 if (hcounter > w2 +19 ) 
    and ( hcounter < w2 +29)
	 then
	col:= "11100000";
	
	 end if;
      end if;





		end if;
		
		---------------------------------------Queennn
		
				if( image3 = "1100") then	

		
		if ( vcounter >= h+10 ) 
    and ( vcounter <= h+20 ) 
    then
		 if (hcounter > w2 +10 ) 
    and ( hcounter < w2 +120)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+20 ) 
    and ( vcounter <= h+140 ) 
    then
		 if (hcounter >= w2 +10) 
    and ( hcounter <= w2 +20)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+20 ) 
    and ( vcounter <= h+140 ) 
    then
		 if (hcounter >= w2 +110 ) 
    and ( hcounter <= w2 +120)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		
	if ( vcounter >= h+140	) 
    and ( vcounter <= h+150 ) 
    then
		 if (hcounter >= w2+10 ) 
    and ( hcounter <= w2+120)
	 then
	col:= "11100000";
	
	 end if;
      end if;
    
	 
      if ( vcounter >= h+135 ) 
    and ( vcounter <= h+155 ) 
    then
	      
	       
		 if (hcounter >= w2 +105 + vcounter - h -135) 
    and ( hcounter <= w2 + 115 + vcounter -  h -135)
	 then
	col:= "11100000";
	
	 end if;
      end if;

		end if;
		
		---------------------------------------------------KING
		if( image3 = "1100") then	

		
		if ( vcounter >= h+10 ) 
    and ( vcounter <= h+150 ) 
    then
		 if (hcounter > w2+10 ) 
    and ( hcounter < w2+20)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter >= h+10 ) 
    and ( vcounter <= h+80 ) 
    then
		 if (hcounter >= w2 +90 + h +10 - vcounter) 
    and ( hcounter <= w2 +100 + h + 10 - vcounter)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter > h+80 ) 
    and ( vcounter <= h+150 ) 
    then
		 if (hcounter >= w2 + 20 + vcounter - h - 80 ) 
    and ( hcounter <= w2 + 30 + vcounter - h - 80 )
	 then
	col:= "11100000";
	
	 end if;
      end if;
		end if;
		----------------------------------------------seven
		if ( image3 = "0111" ) then
		
	if ( vcounter >= h+15 ) 
    and ( vcounter <= h+25 ) 
    then
		 if (hcounter >= w2 +4 ) 
    and ( hcounter <= w2 +124)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter > h+25 ) 
    and ( vcounter <= h+135 ) 
    then
		 if (hcounter >= w2 + 114 + vcounter - h - 25 ) 
    and ( hcounter <= w2 + 124 + vcounter - h - 25 )
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		end if;
		
		
		
		
		if( resimage = "1111") then

     if ( vcounter >= 170 ) 
    and ( vcounter <= 250 ) 
    then
		 if (hcounter >= 143+  5 + vcounter - 170 ) 
    and ( hcounter <=  143 + 10 + vcounter -170 )
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		if ( vcounter > 170 ) 
    and ( vcounter <= 250 ) 
    then
		 if (hcounter >= 143 + 165 - 170 + vcounter  ) 
    and ( hcounter <= 143 + 170 - 170 + vcounter )
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
			if ( vcounter > 170 ) 
    and ( vcounter <= 250 ) 
    then
		 if (hcounter >= 143 + 165 + 170 - vcounter  ) 
    and ( hcounter <= 143+  170 + 170 - vcounter )
	 then
	col:= "11100000";
	
	 end if;
      end if;
			if ( vcounter > 170 ) 
    and ( vcounter <= 250 ) 
    then
		 if (hcounter >= 143 +325 + 170 - vcounter  ) 
    and ( hcounter <= 143+  330 + 170 - vcounter )
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		
				if ( vcounter > 170 ) 
    and ( vcounter <= 250 ) 
    then
		 if (hcounter >= 143 +  340  ) 
    and ( hcounter <=  143 + 350 )
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
				if ( vcounter > 170 ) 
    and ( vcounter <= 250 ) 
    then
		 if (hcounter >= 143+ 360  ) 
    and ( hcounter <= 143 + 365 )
	 then
	col:= "11100000";
	
	 end if;
      end if;
				if ( vcounter > 170 ) 
    and ( vcounter <= 250 ) 
    then
		 if (hcounter >=  143+  360 - 170 + vcounter  ) 
    and ( hcounter <= 143 + 365  - 170 + vcounter )
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
						if ( vcounter > 170 ) 
    and ( vcounter <= 250 ) 
    then
		 if (hcounter >= 143 + 440  ) 
    and ( hcounter <= 143 + 445)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
     end if;
	  --------------------------------------------------------------
	  if(resimage = "1100") then
	  
	  	if ( vcounter > 170 ) 
    and ( vcounter <= 250 ) 
    then
		 if (hcounter >= 143 + 5  ) 
    and ( hcounter <=  143 + 15)
	 then
	col:= "11100000";
	
	 end if;
      end if;
	  
	 -----------------------------------------------------------------
	  
	  
	  					if ( vcounter > 240 ) 
    and ( vcounter <= 250 ) 
    then
		 if (hcounter >= 143 + 15) 
    and ( hcounter <= 143  + 105)
	 then
	col:= "11100000";
	
	 end if;
      end if;
  -----------------------------------------------------------------------  
  	if ( vcounter > 170  ) 
    and ( vcounter <= 250 ) 
    then
		 if (hcounter >= 143 + 105 +10) 
    and ( hcounter <= 143  + 105 + 20)
	 then
	col:= "11100000";
	
	 end if;
      end if;	
	-------------------------------------------------------------	

  if ( vcounter > 170 ) 
    and ( vcounter <= 180 ) 
    then
		 if (hcounter >= 143 + 125) 
    and ( hcounter <=  143  + 125 + 90 )
	 then
	col:= "11100000";
	
	 end if;
      end if;
	------------------------------------------------	
		
		 if ( vcounter > 170 ) 
    and ( vcounter <= 250 ) 
    then
		 if (hcounter >= 143 + 125 +100) 
    and ( hcounter <= 143  + 125+ 110)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		-------------------------------------------
		  					
			if ( vcounter > 240 ) 
    and ( vcounter <= 250 ) 
    then
		 if (hcounter >= 143 + 125 ) 
    and ( hcounter <= 143  + 125 + 90 )
	 then
	col:= "11100000";
	
	 end if;
      end if;
	----------------------------------------------------
	  if ( vcounter > 170 ) 
    and ( vcounter <= 175 ) 
    then
		 if (hcounter >= 143 + 125 + 100) 
    and ( hcounter <= 143  + 125 +200)
	 then
	col:= "11100000";
	
	 end if;
      end if;
	-------------------------------------------
	 if ( vcounter > 175 ) 
    and ( vcounter <= 205 ) 
    then
		 if (hcounter >= 143 + 125 +100) 
    and ( hcounter <= 143  +  230 )
	 then
	col:= "11100000";
	
	 end if;
      end if;
--------------------------------------		
		if ( vcounter > 205 ) 
    and ( vcounter <= 215 ) 
    then
		 if (hcounter >= 143 + 125 +100) 
    and ( hcounter <= 143  + 125 + 200)
	 then
	col:= "11100000";
	
	 end if;
      end if;
	-----------------------------------------------------
	
	  if ( vcounter > 215 ) 
    and ( vcounter <= 245 ) 
    then
		 if (hcounter >= 143 + 125 +195) 
    and ( hcounter <= 143  + 125 + 200)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		  if ( vcounter > 245) 
    and ( vcounter <= 250 ) 
    then
		 if (hcounter >= 143 + 125 +100) 
    and ( hcounter <= 143  + 125 +200)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		-------------------------------
		
		  if ( vcounter > 170 ) 
    and ( vcounter <= 175  ) 
    then
		 if (hcounter >= 143 + 125 + 210 ) 
    and ( hcounter <= 143  + 125 +210 +100)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		---------------------------------------------------
       if ( vcounter > 170 ) 
    and ( vcounter <= 250 ) 
    then
		 if (hcounter >= 143 + 125 +210) 
    and ( hcounter <= 143  + 125 +210 +5)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		
		-----------------------------------------
				  if ( vcounter > 245) 
    and ( vcounter <= 250  ) 
    then
		 if (hcounter >= 143 + 125 + 210 ) 
    and ( hcounter <= 143  + 125 +210 +100)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		-------------------------------------
				  if ( vcounter > 205 ) 
    and ( vcounter <= 215  ) 
    then
		 if (hcounter >= 143 + 125 + 210 ) 
    and ( hcounter <= 143  + 125 +210 +100)
	 then
	col:= "11100000";
	
	 end if;
      end if;
		-------------------------------------
	end if;
	else
	col := "00000000";
		

      end if;
	   else
		
		col := "00000000";
		end  if;
	
	 

    if ( hcounter >= 0 ) and (hcounter < 96) 
    then
      temp := '0';
    else
      temp := '1';
    end if;
	 
	 
	 
	 ------
    if (vcounter >= 0 )
      and (vcounter < 2 ) 
		then
      temp2 := '0';
    else
      temp2 := '1';
    end if;
	 
	 
	 
	 -----------
	 ----------
    if (hcounter = 799 ) 
	 then
      vcounter := vcounter + 1;
      hcounter :=  0 ;
    end if;
	 
	 
	 
	 ------------------------------
    if (vcounter = 521 ) then
      vcounter := 0;
		end if;
	------------------------------------

	
    end if;



   red <= col(7 downto 5);
	green <= col( 4 downto 2);
	blue <= col( 1 downto 0);
   hsync <= temp;
   vsync <= temp2;	
  
  
    end process;


   

end Behavioral;

