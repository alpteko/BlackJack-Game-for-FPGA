  ----aaaaaaaaaaaaaaaa
		  if (hcounter > w+5 ) 
    and ( hcounter < w+155)
    and ( vcounter > h+5 ) 
    and ( vcounter < h+15 ) 
    then
	 
	 colors <= "11100000";
	 
	 else 
	 colors <= "00000000";
	 
	 
	 end if;
	 
	 end if;
	 ----------bbbbbbbbbbbbbbbbbbbb
		  if (hcounter > w+5 ) 
    and ( hcounter < w+15)
    and ( vcounter > h+15 ) 
    and ( vcounter < h+75 ) 
    then
	 
	 colors <= "11100000";
	 
	 else 
	 colors <= "00000111";
	 
	 
	 end if;
	 
	 end if;
	 ------cccccccccccccccccccccccc
		  if (hcounter > w+145 ) 
    and ( hcounter < w+155)
    and ( vcounter > h+15 ) 
    and ( vcounter < h+75 ) 
    then
	 
	 colors <= "11100000";
	 
	 else 
	 colors <= "00000111";
	 
	 
	 end if;
	 
	 end if;
	 -----------------------ddddddddddddddddddddddddddddd
		  if (hcounter > w+5 ) 
    and ( hcounter < w+155)
    and ( vcounter > h+75 ) 
    and ( vcounter < h+85 ) 
    then
	 
	 colors <= "11100000";
	 
	 else 
	 colors <= "00000111";
	 
	 
	 end if;
	 
	 end if;
	 
	 
	 -----------------------------eeeeeeeeeeeeeeeeeeeee
		  if (hcounter > w+5 ) 
    and ( hcounter < w+15)
    and ( vcounter > h+85 ) 
    and ( vcounter < h+145 ) 
    then
	 
	 colors <= "11100000";
	 
	 else 
	 colors <= "00000111";
	 
	 
	 end if;
	 
	 end if;
	 --------------------------------ffffffffffffff
	 
		  if (hcounter > w+145 ) 
    and ( hcounter < w+155)
    and ( vcounter > h+85 ) 
    and ( vcounter < h+145 ) 
    then
	 
	 colors <= "11100000";
	 
	 else 
	 colors <= "00000000";
	 
	 
	 end if;
	 
	 end if;
	 
	 
	 -----------------------------ggggggggggggggggggggggggg
		  if (hcounter > w+5 ) 
    and ( hcounter < w+155)
    and ( vcounter > h+5 ) 
    and ( vcounter < h+155 ) 
    then
	 
	 colors <= "11100000";
	 
	 else 
	 colors <= "00000000";
	 
	 
	 end if;
	 
	 end if;
	 --------------------------------------------
	 
	 
	 for  a if w+5 < x < w+155  and h+5 < y < h+15 :::::
for b if w+5 < x < w+15 and h+15 < y < h+75 :::::::
for c if w+145 < x < w+155 and h+15 < y < h+ 75 :::::::
for d if w+5 < x < w+155 and h+75 < y < h+85 :::::::
for e if w+5 < x < w+15 and h + 85 < y < h+ 145 :::::
for f if w+145 < x < w+155 and h+85 < y < h+145:::::
for g if w+5 < x < w+155 and h+145 < y < 155 :::::::
for one if w+75 < x < w+85 and h+5 < y < h+155 ::::::
for seven if w+145 < x < w+155 and h+15 < y < h+155 ::::: 