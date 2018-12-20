library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

entity st2_1 is
	generic( n: integer:=4 );
	port(A: in std_logic_vector(2**n-1 downto 0);
		EN: in std_logic_vector(n-1 downto 0);
		B: out std_logic);
end st2_1;

architecture structural of st2_1 is
signal C:integer range 0 to 2**n-1;
begin
	C <= CONV_INTEGER(EN);
	B <= A(C);
end structural;