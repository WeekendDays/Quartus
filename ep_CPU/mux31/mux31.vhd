library ieee;
use ieee.std_logic_1164.all;
entity mux31 is
port(
	  MADD: in std_logic_vector(1 downto 0);
	  zl,ra,rb: in std_logic_vector(7 downto 0);
	  output: out std_logic_vector(7 downto 0)
	 );
end mux31;
architecture fcn of mux31 is 
begin
	process(MADD,zl,ra,rb)
	begin
		case MADD is 
			when "00" => output <= zl;
			when "01" => output <= ra;
			when "10" => output <= rb;
			when others => output <="ZZZZZZZZ";
		end case;
	end process;
end fcn;
