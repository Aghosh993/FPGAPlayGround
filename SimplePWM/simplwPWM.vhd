----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:49:10 07/16/2014 
-- Design Name: 
-- Module Name:    simplwPWM - Behavioral 
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

entity simplwPWM is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           counter_top : in  STD_LOGIC_VECTOR (13 downto 0);
           duty : in  STD_LOGIC_VECTOR (13 downto 0);
			  
			  pwm_output : out STD_LOGIC);
end simplwPWM;

architecture Behavioral of simplwPWM is

signal counter	: std_logic_vector(13 DOWNTO 0);

begin

-- Round counter:
process(rst,clk)
begin
	if(rst='1') then --Reset counter:
		counter<="00000000000000";
		pwm_output <= '0';
	-- Otherwise, count up until it hits the prescaler value:
	elsif(clk'EVENT AND clk='1') then--Rising edge of clock
		counter <= counter+1;
		--If counter hits duty value, reset it and toggle the output pwm line:
		if(counter=duty) then
			pwm_output <= '0';
		end if;
		if(counter=counter_top) then
			counter <= "00000000000000";
			pwm_output <= '1';
		end if;
	end if;
end process;

end Behavioral;

