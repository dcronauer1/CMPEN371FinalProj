-- Dominic Cronauer, Gabriel Genung
-- dlc5994@psu.edu, mxg1342@psu.edu
-- OR_Operation4bit.vhd
-- Version 3.0 , 12/9/2024

-- 4 bit OR operation


library IEEE;
use IEEE.std_logic_1164.all;

entity OR_Operation4bit is
port ( 

A,B : in  std_logic_vector(3 downto 0);
F : out  std_logic_vector(3 downto 0)
);
end OR_Operation4bit;

-- 4 bit OR operation
architecture rtl of OR_Operation4bit is
begin
 
    F <= A OR B;
 
end rtl;