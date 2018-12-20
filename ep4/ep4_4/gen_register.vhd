library ieee;
use ieee.std_logic_1164.all;

entity gen_register is
	port(  clk, WE: in std_logic;
			RA, WA: in std_logic_vector(1 downto 0);
			     i: in std_logic_vector(7 downto 0);
			AO, BO: out std_logic_vector(7 downto 0)
			);
end gen_register;

architecture main of gen_register is

component mux4_1
	port( 	 en: in std_logic;
			sel: in std_logic_vector(1 downto 0);
			in0, in1, in2: in std_logic_vector(7 downto 0);
			out0: out std_logic_vector(7 downto 0)
		 );
end component;

signal A, B, C: std_logic_vector(7 downto 0) := "00000000";
begin
	process(clk)
	begin
		if (clk'event and clk = '0' and WE = '0') then
			if WA = "00" then
				A <= i;
			elsif WA = "01" then
				B <= i;
			elsif WA = "10" then
				C <= i;
			end if;
		end if;
	end process;
	
	m0: mux4_1 port map(WE, RA, A, B, C, AO);
	m1: mux4_1 port map(WE, WA, A, B, C, BO);
	
end main;