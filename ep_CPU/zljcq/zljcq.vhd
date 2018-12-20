library ieee;
use ieee.std_logic_1164.all;
entity zljcq is
port ( BUSS: in std_logic_vector(7 downto 0);
	   LDIR,clk: in std_logic;
	   out1,out2:out std_logic_vector( 3 downto 0));
end zljcq;
architecture fcn of zljcq is
signal jcq:std_logic_vector(7 downto 0):="00000000";
begin
	process(BUSS,LDIR,clk)
	begin
	if (clk'event and clk='1') then 
		if (LDIR='1') then
			jcq<=BUSS;
		end if;
	end if;
		out1<=jcq(7 downto 4);
		out2<=jcq(3 downto 0);
	end process;
end fcn;
			