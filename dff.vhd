----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:04:44 10/26/2015 
-- Design Name: 
-- Module Name:    dff - Behavioral 
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

entity dff is
    Port ( q : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           preset : in  STD_LOGIC;
           d : in  STD_LOGIC);
end dff;

architecture Behavioral of dff is
begin
	process (clk, clear, preset)
		begin
			if clear = '0' then
				q <= '0';
			elsif preset = '0' then
				q <= '1';
			elsif clk'event and clk = '1' then
				q <= d;
			end if;			
	end process;
end Behavioral;
