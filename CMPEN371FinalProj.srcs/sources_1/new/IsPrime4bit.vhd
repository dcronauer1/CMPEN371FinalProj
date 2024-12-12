-- Gabriel Genung, Dominic Cornauer
-- mxg1342@psu.edu, dlc5994@psu.edu
-- IsPrime4bit.vhd
-- Version 1.0 , 12/10/2024

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IsPrime4bit is
    Port ( A : in std_logic_vector (3 downto 0);
           F : out std_logic_vector (3 downto 0));
end IsPrime4bit;

architecture rtl of IsPrime4bit is
begin
    -- !BCD+!A!BC+B!CD+!ABD
    F(0) <= (not A(2) and A(1) and A(0)) or
         (not A(3) and not A(2) and A(1)) or
         (A(2) and not A(1) and A(0)) or
         (not A(3) and A(2) and A(0));
end rtl;
