library ieee;
use ieee.std_logic_1164.all;

entity PC is 
	port(
		LDPC, INPC, CLK: in std_logic;
		PC_in: in std_logic_vector(7 downto 0);
		PC_out: out std_logic_vector(7 downto 0)
	);
end PC;

architecture main of PC is
signal address:std_logic_vector(7 downto 0):="00000000";
begin
	process(PC_in, LDPC, INPC)
	variable C: std_logic := '1';
	begin
	if (CLK'event and CLK = '0') then
		if (INPC = '1'and LDPC = '0') then
			for i in 0 to 7 loop
				address(i) <= C xor address(i);
				C := C and address(i);
			end loop;
			C := '1';
		elsif (INPC = '0' and LDPC = '1') then
			address <= PC_in;
		end if;
	end if;
	PC_out <= address;
	end process;
end main;