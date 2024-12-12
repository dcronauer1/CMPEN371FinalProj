-- Gabriel Genung, Dominic Cornauer
-- mxg1342@psu.edu, dlc5994@psu.edu
-- IsOdd4bit.vhd
-- Version 1.0 , 12/10/2024

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IsOdd4bit is
    Port ( A : in std_logic_vector (3 downto 0);
           EVEN : in std_logic;
           F : out std_logic_vector (3 downto 0));
end IsOdd4bit;

architecture rtl of IsOdd4bit is
begin
    process(A, EVEN)
    begin
        if EVEN = '0' then
            F(0) <= A(0);
        else
            F(0) <= not A(0);
        end if;
        F(1) <= '0';
        F(2) <= '0';
        F(3) <= '0';
    end process;
end rtl;
