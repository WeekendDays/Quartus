--decoder2_4
library ieee;
use ieee.std_logic_1164.all;

entity decoder2_4 is
	port( a: in std_logic_vector(1 downto 0);
		  b: out std_logic_vector(3 downto 0)
		  );
end decoder2_4;

architecture main of decoder2_4 is
begin
	process(a)
	begin
		if a = "00" then
			b <= "0001";
		end if;
		if a = "01" then
			b <= "0010";
		end if;
		if a = "10" then
			b <= "0011";
		end if;
	end process;
end main;