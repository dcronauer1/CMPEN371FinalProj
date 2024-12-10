-- Gabriel Genung, Dominic Cornauer
-- mxg1342@psu.edu, dlc5994@psu.edu
-- ClockDivider.vhd
-- Version 1.0 , 11/21/2024


-- This file devides the master clock

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ClockDivider is
port ( 

clk : in std_logic;
clkout : out std_logic

);
end ClockDivider;


architecture behavior of ClockDivider is  
        

signal cnt: std_logic_vector(25 downto 0); 
signal s: std_logic;
 
begin
	process(clk)
	 begin
	 
   if (clk'event and clk = '1') then
         -- 
         -- The counter below will reset every 50000000 rising edges, which is every 6.250 Million cycles
             if (cnt = "10111110101111000010000000") then -- 10111110101111000010000000 Binary to 125000 Decimal
                 s <= not s; -- toggle s
                 cnt <="00000000000000000000000000";
             else
                 cnt <= cnt +1;
             end if;
     end if;
     end process;
    
      clkout <= s;
    
end behavior;