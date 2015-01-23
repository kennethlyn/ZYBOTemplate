library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity first is
	Port(
		led : out std_logic_vector(3 downto 0);
		btn : in  std_logic_vector(3 downto 0)
	);
end first;
architecture Behavioralfirst of first is
begin
	led <= btn;
end Behavioralfirst;
