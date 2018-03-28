library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity hgenerator is
    Port ( reset : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           hsignal : out  STD_LOGIC;
			  vsignal : out  std_logic;
			  color : out std_logic_vector( 7 downto 0 )
			  );
end hgenerator;

architecture Behavioral of hgenerator is


	signal temp,temp2: STD_LOGIC ;
	
	signal colors  : std_logic_vector(7 downto 0) ;
	
	
 begin
 
  process(clock)
  
  
 variable hcounter: integer := 0;
	variable vcounter : integer :=0;
	variable w : integer := 143;
	variable h : integer := 30;
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
	 
	  
	  
	 w:= 303;
	 h:= 350;
	 
	  col:= "00011111";
	 ---------------------------------------aaaaaaaaaaaaaaaaa
	 if ( vcounter > h+5 ) 
    and ( vcounter < h+15 ) 
    then
	 
		 if (hcounter > w+5 ) 
    and ( hcounter < w+155)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
		
		-------------------------bbbbbbbbbbbb
		
		 if ( vcounter > h+15 ) 
    and ( vcounter < h+75 ) 
    then
	 
		 if (hcounter > w+5 ) 
    and ( hcounter < w+15)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
		
		------------------------ccccccccccccccc
		
			 if ( vcounter > h+15 ) 
    and ( vcounter < h+75 ) 
    then
	 
		 if (hcounter > w+145 ) 
    and ( hcounter < w+155)
	 then
	 
	  col:= "11100000";
	
	 end if;
      end if;
		
		---------------------------dddddddddddddddddddddddddd
		
			 if ( vcounter > h+75 ) 
    and ( vcounter < h+85 ) 
    then
	 
		 if (hcounter > w+5 ) 
    and ( hcounter < w+155)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
		-----------------------------------------------eeeeeeeeee
		
			 if ( vcounter > h+85 ) 
    and ( vcounter < h+145 ) 
    then
	 
		 if (hcounter > w+5 ) 
    and ( hcounter < w+15)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
		------------------------------------fffffffffffffff
		
				 if ( vcounter > h+85 ) 
    and ( vcounter < h+145 ) 
    then
	 
		 if (hcounter > w+145 ) 
    and ( hcounter < w+155)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
      end if;
		------------------------------------------------------ggggggg
		
				 if ( vcounter > h+145 ) 
    and ( vcounter < h+155 ) 
    then
	 
		 if (hcounter > w+5 ) 
    and ( hcounter < w+155)
	 then
	
	 
	  col:= "11100000";
	
	 end if;
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



   color <= col;
   hsignal <= temp;
   vsignal <= temp2;	
  
  
    end process;


   

end Behavioral;

