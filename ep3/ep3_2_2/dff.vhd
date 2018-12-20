library ieee;
use ieee.std_logic_1164.all;

entity Dff1 is
	port(
		clk, reset, d:in std_logic;
		            q:out std_logic
	);
end Dff1;

architecture main of Dff1 is
begin
	process(clk, reset, d)
	begin
		if (reset = '1') then
			q <= '0';
		elsif (clk'event and clk = '1') then
			q <= d;
		end if;
	end process;
end main;
