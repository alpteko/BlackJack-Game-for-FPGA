--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:34:08 05/22/2015
-- Design Name:   
-- Module Name:   C:/Users/alptekin/Desktop/ee240/proje240/test_trigger.vhd
-- Project Name:  proje240
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: trigger
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_trigger IS
END test_trigger;
 
ARCHITECTURE behavior OF test_trigger IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT trigger
    PORT(
         pulse : IN  std_logic;
         reset : IN  std_logic;
         clock : IN  std_logic;
         sig : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal pulse : std_logic := '0';
   signal reset : std_logic := '0';
   signal clock : std_logic := '0';

 	--Outputs
   signal sig : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: trigger PORT MAP (
          pulse => pulse,
          reset => reset,
          clock => clock,
          sig => sig
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
        pulse <= '0';
		  
		  wait for 100 ns;

             pulse <= '1';
		  
		  wait for 100 ns;
		  
           pulse <= '0';
		  
		  wait for 100 ns;	

         reset <= '0';

		wait for 100 ns;
       
		reset <= '1';

      wait for 100 ns;

     reset <= '0';
	  
	  wait for 100 ns;
	  
	  reset <= '1';
	  pulse <= '1';
	  
	  wait for 100 ns;
	  
	  reset <= '0';
	  pulse <= '0';
	  
	  wait for 100 ns;
	  
	 pulse <= '1';
	 
	 wait for 100 ns;
	
	 pulse <= '0';
	 

	  
      -- insert stimulus here 

      wait;
   end process;

END;
