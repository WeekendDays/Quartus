library ieee;
use ieee.std_logic_1164.all;
entity ep2_1_2 is
	port(A: in std_logic;
		EN: in std_logic;
		Out1: out std_logic);
end ep2_1_2;

architecture structural of ep2_1_2 is
begin
	process(A,EN)
	begin
		if(EN='0') then
			Out1<= 'Z';
		elsif(A='1') then
			Out1<= '1';
		else 
			Out1<= '0';
	end if;
	end process;
end structural;