LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux4_3_1 IS
	port(d0, d1, d2: in STD_LOGIC_VECTOR(3 DOWNTO 0);
	     --signal from dial switch
				sel: in STD_LOGIC_VECTOR(1 DOWNTO 0);
				--signal from counter4
			   dout: out STD_LOGIC_VECTOR(3 DOWNTO 0)
	     );
END mux4_3_1;

ARCHITECTURE rtl OF mux4_3_1 IS
BEGIN
	dout <= d0 WHEN sel = "00" ELSE
			d1 WHEN sel = "01" ELSE
			d2;
	--choose different signals
END rtl;