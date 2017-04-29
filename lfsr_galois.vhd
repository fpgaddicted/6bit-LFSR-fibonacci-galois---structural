----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:58:27 10/29/2015 
-- Design Name: 
-- Module Name:    lfsr_galois - Behavioral 
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

entity lfsr_galois is
    Port ( preset : in  STD_LOGIC_VECTOR (5 downto 0);
           clear : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (5 downto 0));
end lfsr_galois;
architecture Behavioral of lfsr_galois is
signal sq: STD_LOGIC_VECTOR (5 downto 0);
signal s:std_logic;
COMPONENT dff
    PORT(
         q : OUT  std_logic;
         clk : IN  std_logic;
         clear : IN  std_logic;
         preset : IN  std_logic;
         d : IN  std_logic
        );
    END COMPONENT;	 
begin
		ddf0: dff PORT MAP (
          q => sq(5),
          clk => clk,
          clear => clear,
          preset => preset(0),
          d => sq(4)
        );
		  
		 dff1: dff PORT MAP (
          q => sq(4),
          clk => clk,
          clear => clear,
          preset => preset(1),
          d => sq(3)
        );
		  
		 dff2: dff PORT MAP (
          q => sq(3),
          clk => clk,
          clear => clear,
		 preset => preset(2),
          d => sq(2)
        );
		  
		 dff3: dff PORT MAP (
          q => sq(2),
          clk => clk,
          clear => clear,
          preset => preset(3),
          d => sq(1)
        );
		  
		 dff4: dff PORT MAP (
          q => sq(1),
          clk => clk,
          clear => clear,
          preset => preset(4),
          d => s
        );
		  
		 dff5: dff PORT MAP (
          q => sq(0),
          clk => clk,
          clear => clear,
          preset => preset(5),
          d => sq(5)
			 
		  );
		  
s <=sq(5) xor sq(0);
q <= sq;
end Behavioral;

