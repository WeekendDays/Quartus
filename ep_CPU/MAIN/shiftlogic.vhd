library ieee;
use ieee.std_logic_1164.all;
entity shiftlogic is
port( FB,FL,FR: in std_logic;
	  BIN:in std_logic_vector(7 downto 0);
	  BOUT:out std_logic_vector(7 downto 0));
end shiftlogic;
architecture fcn of shiftlogic is 
begin
	process (FB,FL,FR,BIN)
	BEGIN
	if (FB='1') THEN 
		if (FL='1' AND FR='0') THEN 
			BOUT(7 downto 1) <= BIN(6 downto 0);
			BOUT(0) <='0';
		elsif (FL='0' AND FR='1') THEN
			BOUT(6 downto 0) <=BIN(7 downto 1);
			BOUT(7) <='0';
		else
			BOUT <=BIN;
		END IF;
	ELSE
		BOUT<="ZZZZZZZZ";
	END IF;
	END PROCESS;
END fcn;
