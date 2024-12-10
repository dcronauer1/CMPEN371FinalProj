-- Cominic Cronaur, Gabriel Genung
-- dlc5994@psu.edu, mxg1342@psu.edu
-- FullAdder_1bit.vhd
-- Version 3.0 , 12/6/2024

-- design of 1-bit Full-Adder
library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdder_1bit is
port(
  
  A,B: in std_logic;
  Cin: in std_logic;
  SUM: out std_logic;
  Cout: out std_logic 
  );
  
  
end FullAdder_1bit;

architecture rtl of FullAdder_1bit is
begin		
	SUM <= A XOR B XOR Cin ;
	Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ; 
	
end rtl;