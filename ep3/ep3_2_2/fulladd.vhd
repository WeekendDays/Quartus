library ieee;
use ieee.std_logic_1164.all;

entity fulladd is
	port(
		x, y, z:in std_logic;
		   s, c:out std_logic
	);
end fulladd;

architecture main of fulladd is
begin 
	s <= x xor y xor z;
	c <= (x and y) or (x and z) or (y and z);
end main;
