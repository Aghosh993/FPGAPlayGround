----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:59:52 07/16/2014 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider is
    Port ( clk_in : in  STD_LOGIC;
				rst : in STD_LOGIC;
           prescaler : in  STD_LOGIC_VECTOR (31 downto 0);
           clk_out : out  STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is

signal counter : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal output : STD_LOGIC;

begin

clk_out <= output;

process(rst,clk_in)
begin
	if(rst='1') then
		output <= '0';
		counter <= "00000000000000000000000000000000";
	elsif(clk_in'EVENT AND clk_in='1') then
		counter <= counter+1;
		if(counter=prescaler) then
			counter <= "00000000000000000000000000000000";
			if(output='0') then
				output <= '1';
			else
				output <= '0';
			end if;
		end if;
	end if;
end process;

end Behavioral;

