-- Team Number 7
-- Alfonzo Palerm, Gabriel Genung
-- amp7756@psu.edu, mxg1342@psu.edu
-- RippleCarryAdder_4bit.vhd
-- Version 3.0 , 02/14/2023

-- This file implements a design simple OR gate


library IEEE;
use IEEE.std_logic_1164.all;

entity XOR_Operation4bit is
port ( 

A,B : in std_logic_vector(3 downto 0);
F : out std_logic_vector(3 downto 0)
);
end XOR_Operation4bit;

-- Simple OR gate design
architecture rtl of XOR_Operation4bit is
begin

    F <= A XOR B;
 
end rtl;
