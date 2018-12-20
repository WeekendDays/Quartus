library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity ep3_3 is
   port (X,Y,S:in std_logic_vector(7 downto 0);
           cout:out std_logic_vector(7 downto 0));
end ep3_3;
         
 architecture ALU of ep3_3 is
 begin 
	process(X,Y,S)
	begin
		if (S = "10010001" or S = "10010100") then 
			cout <= X + Y;
		elsif (S = "01100001") then 
			cout <= X - Y;
		elsif (S = "11100001") then 
			cout <= X and Y;
		elsif (S(7 downto 2) = "010100") then 
			cout <= not X;
		elsif (S="10100000") then 
			cout <= X(0) & X(7 downto 1);
		elsif (S="10100011") then 
			cout <= X(6 downto 0) & X(7);
		else  
			cout<="00000000";
		end if;
	end process;
end ALU;
