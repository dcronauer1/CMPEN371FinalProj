-- Dominic Cronauer, Gabriel Genung
-- dlc5994@psu.edu, mxg1342@psu.edu
-- AND_Operation4bit.vhd
-- Version 1.0 , 12/6/2024

-- 2 binary numbers AND operation 


library IEEE;
use IEEE.std_logic_1164.all;

entity AND_Operation4bit is
port ( 

A,B : in  std_logic_vector(3 downto 0);
F : out  std_logic_vector(3 downto 0);
);
end AND_Operation4bit;

architecture behavioral of AND_Operation4bit is
begin
 
   F(0) <= A(0) AND B(0); --Double check me because I'm not sure this is how to implement this
   F(1) <= A(1) AND B(1);
   F(2) <= A(2) AND B(2);
   F(3) <= A(3) AND B(3);
 
end behavioral;
