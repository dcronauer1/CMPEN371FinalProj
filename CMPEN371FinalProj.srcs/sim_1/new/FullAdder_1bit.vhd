-- Team Number (T-ZERO)
-- Dr. Abdallah S. Abdallah 
-- aua639@psu.edu
-- FullAdder_1bit.vhd
-- Version 2.0 , 02/18/2019

-- This file implements a design of 1-bit Full-Adder Unit
library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdder_1bit is
port(
  
  B: in std_logic;
  A: in std_logic;
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

