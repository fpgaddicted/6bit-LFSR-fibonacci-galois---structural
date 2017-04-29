--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:51:35 10/29/2015
-- Design Name:   
-- Module Name:   C:/Xilinx/LFSR_6bit_Galois/lfsr_tb.vhd
-- Project Name:  LFSR_6bit_Galois
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lfsr_galois
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
 
ENTITY lfsr_tb IS
END lfsr_tb;
 
ARCHITECTURE behavior OF lfsr_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lfsr_galois
    PORT(
         preset : IN  std_logic_vector(5 downto 0);
         clear : IN  std_logic;
         clk : IN  std_logic;
         q : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal preset : std_logic_vector(5 downto 0) := (others => '0');
   signal clear : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(5 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lfsr_galois PORT MAP (
          preset => preset,
          clear => clear,
          clk => clk,
          q => q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for clk_period*5;
		preset <= "101011";
      clear <= '1';
		wait for clk_period*3;	
      preset <= "111111";
      wait for clk_period*70;
		clear <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
