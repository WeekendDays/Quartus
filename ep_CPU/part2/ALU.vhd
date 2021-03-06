library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
Use ieee.std_logic_arith.all;
entity ALU is
port (S:in std_logic_vector(3 downto 0);
	  M:in std_logic;
	  A,B:in std_logic_vector(7 downto 0);
	  C,Z:out std_logic;
	  bbus:out std_logic_vector(7 downto 0));
end ALU;
architecture fcn of ALU is
begin
process(S,M,A,B)
variable r1int,r2int,sum :integer range 0 to 255;
begin
	r1int:=conv_integer(A);
	r2int:=conv_integer(B);
	if (M='1') then
		case S is
		when "1001" => 
			sum:=r1int+r2int;
			bbus <= conv_std_logic_vector(sum,8);
			if (r1int+r2int>255) then
				C <='1';
			else
				C <='0';
			end if;
		when "0110" => 
			sum:=r1int-r2int;
			bbus <= conv_std_logic_vector(sum,8);
			if (r1int < r2int) then
				C <='1';
			else
				C <='0';
			end if;
		when "1110" =>
			for n in 7 downto 0 loop
				bbus(n)<= A(n) and B(n);
			end loop;
		when "0101" => 
			for n in 7 downto 0 loop
				bbus(n)<=not B(n);
			end loop;
		when "1111" =>
			bbus <=A;
		when others => bbus <=B;
		end case;
		if (sum=0) then
			Z <='0';
		else
			Z <='1';
		end if;
	elsif (M='0') then
		bbus <="ZZZZZZZZ";
	end if;
end process;
end fcn;