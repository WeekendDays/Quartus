library ieee;
use ieee.std_logic_1164.all;

entity shiftLogic is
	port( 
		F,FL,FR: in std_logic;
		SL_in: in std_logic_vector(7 downto 0);
		SL_out: out std_logic_vector(7 downto 0)
	);
end shiftLogic;

architecture main of shiftLogic is 
begin
	process (F, FL, FR, SL_in)
	begin
		if (F = '1' and FL = '1' and FR = '0') then 
			SL_out(7 downto 1) <= SL_in(6 downto 0);
			SL_out(0) <= SL_in(7);
		elsif (F = '1' and FL = '0' and FR = '1') then
			SL_out(6 downto 0) <= SL_in(7 downto 1);
			SL_out(7) <= SL_in(0);
		else
			SL_out <= SL_in;
		end if;
	end process;
end main;