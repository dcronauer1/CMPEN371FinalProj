-- Gabriel Genung, Dominic Cornauer
-- mxg1342@psu.edu, dlc5994@psu.edu
--DFF.vhd
-- Version 1.0 , 12/6/2024


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;


entity DFF is
    Port ( clock : in STD_LOGIC;
           MyData : in STD_LOGIC;
           OutD : out STD_LOGIC);
end DFF;

architecture Behavioral of DFF is

begin

   process(clock)
   begin
    if(rising_edge(clock)) then
        OutD<= MyData;
     end if;
  end process;

end Behavioral;
