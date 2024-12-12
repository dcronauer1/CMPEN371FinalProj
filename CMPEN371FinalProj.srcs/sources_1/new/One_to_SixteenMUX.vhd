-- Gabriel Genung, Dominic Cornauer
-- mxg1342@psu.edu, dlc5994@psu.edu
--One_to_SixteenMUX.vhd
-- Version 1.0 , 12/10/2024

--implements a one to sixteen demux with disconnect z 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity One_to_SixteenMUX is
    port ( DataOut : out STD_LOGIC_VECTOR (3 downto 0);
          SEL : in STD_LOGIC_VECTOR (3 downto 0);
           y0 : in STD_LOGIC_VECTOR (3 downto 0);
           y1 : in STD_LOGIC_VECTOR (3 downto 0);
           y2 : in STD_LOGIC_VECTOR (3 downto 0);
           y3 : in STD_LOGIC_VECTOR (3 downto 0);
           y4 : in STD_LOGIC_VECTOR (3 downto 0);
           y5 : in STD_LOGIC_VECTOR (3 downto 0);
           y6 : in STD_LOGIC_VECTOR (3 downto 0);
           y7 : in STD_LOGIC_VECTOR (3 downto 0);
           y8 : in STD_LOGIC_VECTOR (3 downto 0);
           y9 : in STD_LOGIC_VECTOR (3 downto 0);
           y10 :in  STD_LOGIC_VECTOR (3 downto 0);
           y11 :in  STD_LOGIC_VECTOR (3 downto 0);
           y12 :in  STD_LOGIC_VECTOR (3 downto 0);
           y13 :in  STD_LOGIC_VECTOR (3 downto 0);
           y14 :in  STD_LOGIC_VECTOR (3 downto 0);
           y15 :in  STD_LOGIC_VECTOR (3 downto 0));
end One_to_SixteenMUX;

architecture Behavioral of One_to_SixteenMUX is

begin
process(SEL)
begin

        DataOut <= "ZZZZ";
        
      case SEL is
            when "0000" => DataOut <= y0 ;
            when "0001" => DataOut <= y1 ;
            when "0010" => DataOut <= y2 ;
            when "0011" => DataOut <= y3 ;
            when "0100" => DataOut <= y4 ;
            when "0101" => DataOut <= y5 ;
            when "0110" => DataOut <= y6 ;
            when "0111" => DataOut <= y7 ;
            when "1000" => DataOut <= y8 ;
            when "1001" => DataOut <= y9 ;
            when "1010" => DataOut  <=y10;
            when "1011" => DataOut  <=y11;
            when "1100" => DataOut  <=y12;
            when "1101" => DataOut  <=y13;
            when "1110" => DataOut  <=y14;
            when "1111" => DataOut  <=y15;
        end case;
end process;
    
end Behavioral;