library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity RAM3 is
    port(
        BUSS:in std_logic_vector(7 downto 0);
        NCS,DL,XL,reset,clk:in std_logic;
        put: inout std_logic_vector(7 downto 0)
    );
end RAM3;

architecture fcn of RAM3 is
type ram3 is array(0 to 255) of std_logic_vector(7 downto 0);
signal: r:ram3;
begin
    set_ram:process(reset,r)
    begin
        if(reset='1') then 
        for i in 15 to 255 loop
            r(i)<="00000000";
        end loop;
            r(0)<="11110001";
            r(1)<="11111100";
            r(2)<="11110111";
            r(3)<="10010001";
            r(4)<="01100100";
            r(5)<="11100100";
            r(6)<="01010100";
            r(7)<="10100100";
            r(8)<="10100111";
            r(9)<="00010001";
            r(10)<="00000000";
            r(11)<="00010010";
            r(12)<="00000000";
            r(13)<="00010000";
            r(14)<="00000011";
        end if;
    end process;
    ram_out:process(BUSS,NCS,DL,XL)
    variable num:integer range 0 to 255:=conv_integer(BUSS);
    begin
        if (NCS='0'and DL='1'and XL='0') then
            put <= r(num);
        else
            put <= "ZZZZZZZZ";
        end if;
    end process;
    ram_in:process(BUSS,NCS,DL,XL,clk)
    variable num:integer range 0 to 255:=conv_integer(BUSS);
    begin
        if (clk'EVENT AND clk='1')
            if (NCS='0'AND DL='0' AND XL='1') THEN
                r(num) <= put;
            end if;
        end if;
    end process;
end fcn;
