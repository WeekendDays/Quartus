library ieee;
use ieee.std_logic_1164.all;
entity jcqz is 
port (RA,RB:in std_logic_vector(1 downto 0);
	  NWE,CLK:in std_logic;
      BUSS:in std_logic_vector(7 downto 0);
	  A,B:out std_logic_vector(7 downto 0));
end jcqz;
architecture fcn of jcqz is
signal AJCQ:std_logic_vector(7 downto 0):="00000011";
signal BJCQ:std_logic_vector(7 downto 0):="00000111";
signal CJCQ:std_logic_vector(7 downto 0):="00000000";
begin
	process(RA,RB)
	begin
		if (RB="00") then
			B <= AJCQ;
		elsif (RB="01") then
			B <= BJCQ;
		elsif (RB="10"OR RB="11") then
			B <= CJCQ;
		end if;
		if  (RA="00") then
			A <=AJCQ;
		elsif  (RA="01") then
			A <=BJCQ;
		elsif  (RA="10"OR RA="11") then
			A <=CJCQ;
		END IF;
	end process;
	process(NWE,BUSS,RB,CLK)
	begin
		if (CLK'event and CLK='1')then 
			if (NWE='0') then
				if (RB="00") then
					AJCQ <=BUSS;
				elsif (RB="01") then
					BJCQ <=BUSS;
				elsif (RB="10"or RB="11") then
					CJCQ <=BUSS;
				end if;
			end if;
		end if;
	end process;
end fcn;