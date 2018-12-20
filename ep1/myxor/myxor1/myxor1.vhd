LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY myxor1 IS
	PORT(a, b: in STD_LOGIC;
			d: out STD_LOGIC);
END myxor1;

ARCHITECTURE myxor OF myxor1 IS
BEGIN
	d <= ((NOT a) AND b) OR (a AND (NOT b));
END myxor;