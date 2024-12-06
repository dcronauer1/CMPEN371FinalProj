-- Dr. Abdallah S. Abdallah 
-- aua639@psu.edu
-- or_gate.vhd
-- Version 1.0 , 09/17/2018

-- This file implements a design simple OR gate


library IEEE;
use IEEE.std_logic_1164.all;

entity or_gate is
port ( 

A,B : in  std_logic;
F : out  std_logic
);
end or_gate;

-- Simple OR gate design
architecture rtl of or_gate is
begin
 
    F <= A or B;
 
end rtl;
