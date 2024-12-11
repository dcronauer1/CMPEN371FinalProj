-- Gabriel Genung, Dominic Cornauer
-- mxg1342@psu.edu, dlc5994@psu.edu
-- IsOdd4bit.vhd
-- Version 1.0 , 12/10/2024

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Asyncronus
--Load or shift
--dir

entity IsOdd4bit is
    Port ( A : in std_logic_vector (3 downto 0);
           B : out std_logic);
end IsOdd4bit;

architecture rtl of IsOdd4bit is
begin
    B <= A(0);
end rtl;
