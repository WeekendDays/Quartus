library ieee;
use ieee.std_logic_1164.all;

entity mux3_1 is
	port(
		MADD: in std_logic_vector(1 downto 0);
		PC, RA, RB: in std_logic_vector(7 downto 0);
		MUX_out: out std_logic_vector(7 downto 0)
	);
end mux3_1;

architecture main of mux3_1 is 
begin
	process(MADD, PC, RA, RB)
	begin
		case MADD is 
			when "00" => MUX_out <= PC;
			when "01" => MUX_out <= RA;
			when "10" => MUX_out <= RB;
			when others => MUX_out <= "ZZZZZZZZ";
		end case;
	end process;
end main;