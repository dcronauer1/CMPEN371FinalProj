-- Gabriel Genung, Dominic Cornauer
-- mxg1342@psu.edu, dlc5994@psu.edu
-- IsOdd4bit.vhd
-- Version 1.0 , 12/10/2024

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IsOdd4bit is
    Port ( A : in std_logic_vector (3 downto 0);
           F : out std_logic_vector (3 downto 0));
end IsOdd4bit;

architecture rtl of IsOdd4bit is
begin
    F(0) <= A(0);
end rtl;
