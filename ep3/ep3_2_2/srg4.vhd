library ieee;
use ieee.std_logic_1164.all;

1tr2t3tr2t41tr2t3tr2tw	port(
		clk, reset, SI:in std_logic;
		            SO:out std_logic
	);
end srg4;

architecture main of srg4 is
signal shift:std_logic_vector(3 downto 0);
begin
	process(reset, clk)
		begin
		if(reset = '1') then
			shift <= "0000";
		elsif(clk'event and (clk = '1')) then
			shift <= SI & shift(3 downto 1);
		end if;
	end process;
	SO <= shift(0);
end main;
