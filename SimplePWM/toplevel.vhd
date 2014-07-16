----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:11:39 07/15/2014 
-- Design Name: 
-- Module Name:    toplevel - Behavioral 
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

entity toplevel is
    Port ( clr : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  
				output : out STD_LOGIC);
end toplevel;

architecture Behavioral of toplevel is

	signal clk_prescaler	: std_logic_vector(31 DOWNTO 0);
	signal pwm_clock	: std_logic;
	signal pwm_top_val : std_logic_vector(13 DOWNTO 0);
	signal pwm_duty_val : std_logic_vector(13 DOWNTO 0);
	
	component clock_divider is
    Port ( clk_in : in  STD_LOGIC;
				rst : in STD_LOGIC;
           prescaler : in  STD_LOGIC_VECTOR (31 downto 0);
           clk_out : out  STD_LOGIC);
	end component clock_divider;
	
	component simplePWM is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           counter_top : in  STD_LOGIC_VECTOR (13 downto 0);
           duty : in  STD_LOGIC_VECTOR (13 downto 0);
			  
			  pwm_output : out STD_LOGIC);
	end component simplePWM;

begin

clk_prescaler <= "00000000000000000000101111101100"; --3052 decimal
pwm_top_val <= "11111111111111"; --2^14 - 1
pwm_duty_val <= "10000000000000"; --~50% duty cycle

div_clock : clock_divider port map (clk_in=>clk, rst=>clr, prescaler=>clk_prescaler, 
													clk_out=>pwm_clock);
pwm1 : simplePWM port map (clk=>pwm_clock, rst=>clr, counter_top=>pwm_top_val, 
										duty=>pwm_duty_val, pwm_output=>output);

end Behavioral;