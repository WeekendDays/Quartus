library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
Use ieee.std_logic_arith.all;

entity ALU is
	port(
		M: in std_logic;
	    S: in std_logic_vector(3 downto 0); 
		A, B: in std_logic_vector(7 downto 0);
		C, Z: out std_logic;
		ALU_out: out std_logic_vector(7 downto 0)
	);
end ALU;

architecture main of ALU is
begin
	process(S, M, A, B)
	variable r1, r2, sum: integer range 0 to 255;
	begin
		r1 := conv_integer(A);
		r2 := conv_integer(B);
		if (M = '1') then
			case S is
			when "1001" =>
				sum := r1 + r2;
				ALU_out <= conv_std_logic_vector(sum, 8);
				if (r1 + r2 > 255) then
					C <= '1';
				else
					C <= '0';
				end if;
			when "0110" =>
				sum := r1 - r2;
				ALU_out <= conv_std_logic_vector(sum, 8);
				if (r1 < r2) then
					C <= '1';
				else
					C <= '0';
				end if;
			when "1110" =>
				for n in 7 downto 0 loop
					ALU_out(n) <= A(n) and B(n);
				end loop;
			when "0101" => 
				for n in 7 downto 0 loop
					ALU_out(n) <= not B(n);
				end loop;
			when "1111" =>
				ALU_out <= A;
			when others => 
				ALU_out <= B;
			end case;
			if (sum = 0) then
				Z <= '0';
			else
				Z <= '1';
			end if;
		elsif (M = '0') then
			ALU_out <= "ZZZZZZZZ";
		end if;
	end process;
end main;