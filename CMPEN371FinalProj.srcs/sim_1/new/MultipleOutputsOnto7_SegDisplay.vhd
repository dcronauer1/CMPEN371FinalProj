-- Dominic Cronauer, Gabriel Genung
-- dlc5994@psu.edu, mxg1342@psu.edu
-- MultipleOutputsOnto7_SegDisplay.vhd
-- Version 1.0 , 12/6/2024

-- This file implements 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MultipleOutputsOnto7SegDisplay is
port ( 
clk :in std_logic;
 	value1 : in std_logic_vector(3 downto 0);
    value2 : in std_logic_vector(3 downto 0);  
    value3 : in std_logic_vector(3 downto 0);
    value4 : in std_logic_vector(3 downto 0);
    segs : out std_logic_vector(6 downto 0);
    channels : out std_logic_vector(3 downto 0);
    dp : out std_logic

);
end MultipleOutputsOnto7SegDisplay;


architecture Structure of MultipleOutputsOnto7SegDisplay is

component ClockDivider is Port(
clk : in std_logic;
clkout : out std_logic
);
end component;

component Sequential_7Segments_Decoder is Port(

	value1 : in std_logic_vector(3 downto 0);
		value2 : in std_logic_vector(3 downto 0);  
		value3 : in std_logic_vector(3 downto 0);
		value4 : in std_logic_vector(3 downto 0);
		mclk : in std_logic;
		dp : out std_logic;
		-- The anodes will be treated as if they are different 
		-- communication channels, which are getting activated and deactivated according to the internal subclock (Sclk)
		channels : out std_logic_vector(3 downto 0);
	    segs : out std_logic_vector(6 downto 0)

);
end component;

signal DevClk : std_logic;

begin

CLOCK: ClockDivider port map (clk => clk, clkout => DevClk);
DECODER: Sequential_7Segments_Decoder port map (value1=>value1,value2=>value2,value3=>value3,value4=>value4,mclk=>DevClk,dp=>dp,segs=>segs,channels=>channels);

end Structure;
