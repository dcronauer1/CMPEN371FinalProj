-- Dominic Cronauer, Gabriel Genung
-- dlc5994@psu.edu, mxg1342@psu.edu
-- XOR_Operation4bit.vhd
-- Version 3.0 , 12/9/2024

-- 4bit XOR operation


library IEEE;
use IEEE.std_logic_1164.all;

entity XOR_Operation4bit is
port ( 

A,B : in std_logic_vector(3 downto 0);
F : out std_logic_vector(3 downto 0)
);
end XOR_Operation4bit;

-- 4bit XOR operation
architecture rtl of XOR_Operation4bit is
begin

    F <= A XOR B;
 
end rtl;
