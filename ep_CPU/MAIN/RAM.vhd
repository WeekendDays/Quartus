library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
Use ieee.std_logic_arith.all;
entity RAM is 
port ( DL,XL,NCS,reset,clk:in std_logic;
	   BUSS: in std_logic_vector(7 downto 0);
	   put: inout std_logic_vector(7 downto 0)
	);
end RAM;
architecture fcn of RAM is
type ram1 is array(255 downto 0) of std_logic_vector(7 downto 0);
signal r:ram1;
begin
	process(DL,XL,NCS,BUSS,reset,put,clk)
		variable num:integer range 0 to 255;
	begin
		num:=conv_integer(BUSS);
		if (reset='1') then
			for i in 0 to 255 loop
				r(i)<="00000000";
			end loop;
				r(0)<="11110001";
				r(1)<="11111100";
				r(2)<="11110111";
				r(3)<="10010001";
				r(4)<="01100100";
				r(5)<="11100100";
				r(6)<="01010100";
				r(7)<="10100100";
				r(8)<="10100111";
				r(9)<="00010001";
				r(10)<="00000000";
				r(11)<="00010010";
				r(12)<="00000000";
				r(13)<="00010000";
				r(14)<="00000000";
			put <="ZZZZZZZZ";
		elsif (NCS='0') then
			if (DL='1'and XL='0') then
				put <= r(num);
			elsif (DL='0' AND XL='1') THEN
				if (clk'event AND clk='1') then
				r(num) <= put;
				put <="ZZZZZZZZ";
				end if;
			end if;
		else
			put <="ZZZZZZZZ";
		end if;
	end process;
end fcn;
