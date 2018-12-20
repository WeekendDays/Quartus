library ieee;
use ieee.std_logic_1164.all;

entity TYJCQZ is 
	port(
		WE, RESET, CLK: in std_logic;
		RAA, RWBA: in std_logic_vector(1 downto 0);
		TY_in: in std_logic_vector(7 downto 0);
		TY_outA, TY_outB: out std_logic_vector(7 downto 0)
	);
end TYJCQZ;

architecture main of TYJCQZ is
signal JCQ_A, JCQ_B, JCQ_C: STD_LOGIC_VECTOR(7 DOWNTO 0);
begin
	process(RAA, RWBA)
	begin
		if (RWBA = "00") then
			TY_outB <= JCQ_A;
		elsif (RWBA = "01") then
			TY_outB <= JCQ_B;
		elsif (RWBA = "10" or RWBA = "11") then
			TY_outB <= JCQ_C;
		end if;
		if  (RAA = "00") then
			TY_outA <= JCQ_A;
		elsif  (RAA = "01") then
			TY_outA <= JCQ_B;
		elsif  (RAA = "10" or RAA = "11") then
			TY_outA <= JCQ_C;
		end if;
	end process;
	
	process(RESET, WE, TY_in, RWBA, CLK)
	begin
		if (RESET = '1') then 
			JCQ_A <= "00000000";
			JCQ_B <= "00000000";
			JCQ_C <= "00000000";
		elsif (CLK'event and CLK = '0')then 
			if (WE = '0') then
				if (RWBA = "00") then
					JCQ_A <= TY_in;
				elsif (RWBA = "01") then
					JCQ_B <= TY_in;
				elsif (RWBA = "10") then
					JCQ_C <= TY_in;
				end if;
			end if;
		end if;
	end process;
end main;