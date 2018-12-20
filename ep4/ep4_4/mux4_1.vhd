--mux4_1
library ieee;
use ieee.std_logic_1164.all;

entity mux4_1 is
	port( 	 en: in std_logic;
			sel: in std_logic_vector(1 downto 0);
			in0, in1, in2: in std_logic_vector(7 downto 0);
			out0: out std_logic_vector(7 downto 0)
		 );
end mux4_1;

architecture main of mux4_1 is
begin
	process(sel)
	begin
		if en = '1' then
			if sel = "00" then
				out0 <= in0;
			elsif sel = "01" then
				out0 <= in1;
			elsif sel = "10" then
				out0 <= in2;
			else
				out0 <= "00000000";
			end if;
		end if;
	end process;
end main;