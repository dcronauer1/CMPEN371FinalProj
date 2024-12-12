----------------------------------------------------------------------------------
-- Gabriel Genung, Dominic Cornauer
-- mxg1342@psu.edu, dlc5994@psu.edu
-- 7Seg_Decoder.vhd
-- Version 1.0 , 12/8/2024
----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity SevenSeg_Decoder is
port ( 

X : in std_logic_vector(3 downto 0);
-- make input for DP and handling
AN : out std_logic_vector(3 downto 0);
DP : out  std_logic;
CXX : out std_logic_vector(6 downto 0)
);
end SevenSeg_Decoder;

-- Seven segment decoder
architecture rtl of SevenSeg_Decoder is
begin
    CXX <= "1000000" when (X="0000") 
 else "1111001" when (X="0001") 
 else "0100100" when (X="0010") 
 else "0110000" when (X="0011") 
 else "0011001" when (X="0100") 
 else "0010010" when (X="0101") 
 else "0000010" when (X="0110") 
 else "1111000" when (X="0111") 
 else "0000000" when (X="1000") 
 else "0011000" when (X="1001") 
 else "0001000" when (X="1010")
 else "0000011" when (X="1011") 
 else "1000110" when (X="1100") 
 else "0100001" when (X="1101") 
 else "0000110" when (X="1110") 
 else "0001110" when (X="1111"); 
    DP <= '1';
    AN <= "0111";
 
end rtl;
