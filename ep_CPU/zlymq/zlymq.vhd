library ieee;
use ieee.std_logic_1164.all;
entity zlymq is
port
(
	SM,C,Z:in std_logic;
	IN1,IN2:in std_logic_vector(3 downto 0);
	INPC,LDPC,NWE,FB,FL,FR,NCS,DL,XL,M:out std_logic;
	MADD,RA,RB:out std_logic_vector(1 downto 0);
	S: out std_logic_vector(3 downto 0)
);
end zlymq;
architecture fcn of zlymq is
begin
RA <= IN2(1 downto 0);
RB <= IN2(3 downto 2);
S <=IN1;
process(IN1,IN2,SM,C,Z)
begin
	if (SM='0') then
		MADD<="00";
		INPC<='1';
		LDPC<='0';
		NWE<='1';
		M<='0';
		FB<='0';
		NCS<='0';
		DL<='1';
		XL<='0';
	elsif (SM='1') then
		case IN1 is 
		when "1111" =>
			if (IN2(3 downto 2)="11") then
				MADD<="10";
				M<='1';
				FB<='0';
				INPC<='0';
				LDPC<='0';
				NCS<='0';
				XL<='1';
				DL<='0';
				NWE<='1';
			elsif(IN2(1 downto 0)="11") then
				MADD<="01";
				M<='0';
				FB<='0';
				INPC<='0';
				LDPC<='0';
				NCS<='0';
				DL<='1';
				XL<='0';
				NWE<='0';
			else
				NCS<='1';
				INPC<='0';
				LDPC<='0';
				MADD<="00";
				M<='1';
				FB<='0';
				NWE<='0';
			end if;
		when "1001"=>
			NCS<='1';
			MADD<="00";
			INPC<='0';
			LDPC<='0';
			M<='1';
			NWE<='0';
			FB<='0';
		when "0110"=>
			NCS<='1';
			MADD<="00";
			INPC<='0';
			LDPC<='0';
			M<='1';
			NWE<='0';
			FB<='0';
		when "1110"=>
			NCS<='1';
			MADD<="00";
			INPC<='0';
			LDPC<='0';
			M<='1';
			NWE<='0';
			FB<='0';
		when "0101"=>
			NCS<='1';
			MADD<="00";
			INPC<='0';
			LDPC<='0';
			M<='1';
			NWE<='0';
			FB<='0';
		when "1010"=>
			NCS<='1';
			MADD<="00";
			INPC<='0';
			LDPC<='0';
			M<='1';
			NWE<='0';
			FB<='1';
			if (IN2(1 downto 0)="00") then 
				FR<='1';
				FL<='0';
			elsif(IN2(1 downto 0)="11") then 
				FR<='0';
				FL<='1';
			end if;
		when "0001" =>
			NCS<='0';
			DL<='1';
			XL<='0';
			MADD <="00";
			NWE<='1';
			M<='0';
			FB<='0';
			if (IN2(1 downto 0)="00") then 
				LDPC<='1';
				INPC<='0';
			elsif (IN2(1 downto 0)="01") then
				if (Z='0') then
					LDPC<='1';
					INPC<='0';
				else
					LDPC<='0';
					INPC<='1';
				end if;
			elsif(IN2(1 downto 0)="10") then
				if (C='1') then
					LDPC<='1';
					INPC<='0';
				else
					LDPC<='0';
					INPC<='1';
				end if;
			end if;
		when others =>
			NCS<='1';
			MADD<="00";
			NWE<='1';
			M<='0';
			FB<='0';
			LDPC<='0';
			INPC<='0';
		end case;
	end if;
end process;
end fcn;
			