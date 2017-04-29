----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:32 10/30/2015 
-- Design Name: 
-- Module Name:    fibonacci_lfsr - Behavioral 
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

entity fibonacci_lfsr is
    Port ( clk : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           preset : in  STD_LOGIC_VECTOR (5 downto 0);
           q : out  STD_LOGIC_VECTOR (5 downto 0));
end fibonacci_lfsr;

architecture Behavioral of fibonacci_lfsr is
signal sq: std_logic_vector (5 downto 0);
signal feedback: std_logic;
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
		dff0: dff PORT MAP (
          q => sq(0),
          clk => clk,
          clear => clear,
          preset => preset(0),
          d => sq(1)
        );

		dff1: dff PORT MAP (
          q => sq(1),
          clk => clk,
          clear => clear,
          preset => preset(1),
          d => sq(2)
        );
		  
		  dff2: dff PORT MAP (
          q => sq(2),
          clk => clk,
          clear => clear,
          preset => preset(2),
          d => sq(3)
        );
		  
		  dff3: dff PORT MAP (
          q => sq(3),
          clk => clk,
          clear => clear,
          preset => preset(3),
          d => sq(4)
        );
		  
		  dff4: dff PORT MAP (
          q => sq(4),
          clk => clk,
          clear => clear,
          preset => preset(4),
          d => sq(5)
        );
		  
		  dff5: dff PORT MAP (
          q => sq(5),
          clk => clk,
          clear => clear,
          preset => preset(5),
          d => feedback
        );
		  
feedback <= sq(1) xor sq(0);
q <= sq;
       

end Behavioral;

