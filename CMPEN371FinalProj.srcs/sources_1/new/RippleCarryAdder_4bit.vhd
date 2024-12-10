-- Dominic Cronaur, Gabriel Genung
-- dlc5994@psu.edu, mxg1342@psu.edu
-- RippleCarryAdder_4bit.vhd
-- Version 3.0 , 12/6/2024

-- This file implements a design of 4-bits Ripple Carry Adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity RippleCarryAdder_4bit is
Port (
  EX_Cin: in std_logic;
  EX_A: in std_logic_vector(3 downto 0);
  EX_B: in std_logic_vector(3 downto 0);
  EX_SUM: out std_logic_vector(3 downto 0);
  EX_Cout: out std_logic 

);
end RippleCarryAdder_4bit;
 
architecture Structural of RippleCarryAdder_4bit is
-- Full Adder VHDL Code Component Decalaration  
-- (The original FullAdder_1bit.vhd File MUST EXIST in same folder)
-- The same folder in this case is basically the VHDL project resources
component FullAdder_1bit is

port(
  Cin: in std_logic;
  A: in std_logic;
  B: in std_logic;
  SUM: out std_logic;
  Cout: out std_logic 
  ); 

end component;
-- declaring internal signals in order to use as wires 
-- between the two instances of the FullAdder_1bit module
signal c0: STD_LOGIC;
signal c1: STD_LOGIC;
signal c2: STD_LOGIC;
begin
-- Port Mapping Full Adder 4 times
FA0: FullAdder_1bit port map(Cin=>EX_Cin, A=>EX_A(0),B=>EX_B(0),SUM=>EX_SUM(0),Cout=>c0);
FA1: FullAdder_1bit port map(Cin=>c0, A=>EX_A(1),B=>EX_B(1),SUM=>EX_SUM(1),Cout=>c1);
FA2: FullAdder_1bit port map(Cin=>c1, A=>EX_A(2),B=>EX_B(2),SUM=>EX_SUM(2),Cout=>c2);
FA3: FullAdder_1bit port map(Cin=>c2, A=>EX_A(3),B=>EX_B(3),SUM=>EX_SUM(3),Cout=>EX_cout);

end Structural;