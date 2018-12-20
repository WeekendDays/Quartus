library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
Use ieee.std_logic_arith.all;
entity RAM2 is 
port ( DL,XL,NCS,reset,clk:in std_logic;
	   BUSS: in std_logic_vector(7 downto 0);
	   input: in std_logic_vector(7 downto 0);
	   output: out std_logic_vector(7 downto 0)
	);
end RAM2;
architecture fcn of RAM2 is
type ram1 is array(255 downto 0) of std_logic_vector(7 downto 0);
signal r:ram1;
begin
	process(DL,XL,NCS,BUSS,reset,input,clk)
		variable num:integer range 0 to 255;
	begin
		num:=conv_integer(BUSS);
		if (reset='1') then
			for i in 0 to 255 loop
				r(i)<="00000000";
			end loop;
			output <="ZZZZZZZZ";
		elsif (NCS='0') then
			if (DL='1'and XL='0') then
				output <= r(num);
			elsif (DL='0' AND XL='1') THEN
				if (clk'event AND clk='1') then
				r(num) <= input;
				output <="ZZZZZZZZ";
				end if;
			end if;
		else
			output <="ZZZZZZZZ";
		end if;
	end process;
end fcn;