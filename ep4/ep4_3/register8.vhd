library ieee;
use ieee.std_logic_1164.all;

entity register8 is
	port(ld, clk : in std_logic;
			a: in std_logic_vector(7 downto 0);
			c: out std_logic_vector(7 downto 0)
			);
end register8;

architecture main of register8 is
signal b: std_logic_vector(7 downto 0);
begin
	process(clk)
	begin
		if (clk'event and clk = '0') then
			if (ld = '1') then
				b <= a;
			else
				b <= "00000000";
			end if;
		end if;
	end process;
	c <= b;
end main;