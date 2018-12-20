library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PC is
	port( ld, inc, clk: in std_logic;
				a: in std_logic_vector(7 downto 0);
				c: out std_logic_vector(7 downto 0)
				);
end PC;

architecture main of PC is
signal b: std_logic_vector(7 downto 0);
begin
	process(clk)
	begin
		if (clk'event and clk = '0') then
			if (ld = '1' and inc = '0') then
				b <= a;
			elsif (ld = '0' and inc = '1') then
				if ( b = "11111111") then
					b <= "00000000";
				else 
					b <= b + "00000001";
				end if;
			else 
				b <= "00000000";
			end if;
		end if;
	end process;
	c <= b;
end main;