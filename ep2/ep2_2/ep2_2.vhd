library ieee;
use ieee.std_logic_1164.all;

entity ep2_2 is
	port(A0: in std_logic_vector(15 downto 0);
		EN0: in std_logic_vector(3 downto 0);
		B0: out std_logic);
end ep2_2;

architecture structural of ep2_2 is

component st2_1
	generic( n:integer:=4 );
	port(A: in std_logic_vector(2**n-1 downto 0);
		EN: in std_logic_vector(n-1 downto 0);
		B: out std_logic);
end component;

begin
	g0: st2_1 generic map(n => 4) port map(A => A0, EN => EN0, B => B0);
end structural;