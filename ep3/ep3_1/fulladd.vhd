LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fulladd IS
	PORT( a, b, C0: in std_logic;
		      C, S: out std_logic);
END fulladd;

ARCHITECTURE add OF fulladd IS
BEGIN
	S <= a xor b xor C0;
	C <= (a and b) or (a and C0) or (b and C0);
END add;