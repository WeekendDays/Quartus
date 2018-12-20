LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY scan_led IS
	port(cin: in STD_LOGIC_VECTOR(3 DOWNTO 0);
		--signal from the choosen dial switch
		cout: out STD_LOGIC_VECTOR(6 DOWNTO 0)
		--show specific character
		);
END scan_led;

ARCHITECTURE show OF scan_led IS
BEGIN
	cout <= "1111110" WHEN cin = "0000" ELSE --when wanna show 0
			"0110000" WHEN cin = "0001" ELSE --when wanna show 1
			"1101101" WHEN cin = "0010" ELSE --when wanna show 2
			"1111001" WHEN cin = "0011" ELSE --when wanna show 3
			"0110011" WHEN cin = "0100" ELSE --when wanna show 4
			"1011011" WHEN cin = "0101" ELSE --when wanna show 5
			"1011111" WHEN cin = "0110" ELSE --when wanna show 6
			"1110000" WHEN cin = "0111" ELSE --when wanna show 7
			"1111111" WHEN cin = "1000" ELSE --when wanna show 8
			"1111011" WHEN cin = "1001" ELSE --when wanna show 9
			"1110111" WHEN cin = "1010" ELSE --when wanna show a
			"0011111" WHEN cin = "1011" ELSE --when wanna show b
			"1001110" WHEN cin = "1100" ELSE --when wanna show c
			"0111101" WHEN cin = "1101" ELSE --when wanna show d
			"1001111" WHEN cin = "1110" ELSE --when wanna show e
			"1000111";                       --when wanna show f
END show;


