library ieee;
use ieee.std_logic_1164.all;

entity ZLJCQ is
	port(
		LDIR, CLK: in std_logic;
		ZL_in: in std_logic_vector(7 downto 0);
		ZL_out1, ZL_out2: out std_logic_vector(3 downto 0)
	);
end ZLJCQ;

architecture main of ZLJCQ is
signal jcq: std_logic_vector(7 downto 0) := "00000000";
begin
	process(ZL_in, LDIR, CLK)
	begin
	if (CLK'event and CLK = '0') then 
		if (LDIR = '1') then
			jcq <= ZL_in;
		end if;
	end if;
		ZL_out1 <= jcq(7 downto 4);
		ZL_out2 <= jcq(3 downto 0);
	end process;
end main;