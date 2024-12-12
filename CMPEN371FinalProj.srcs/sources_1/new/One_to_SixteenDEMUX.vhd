-- Gabriel Genung, Dominic Cornauer
-- mxg1342@psu.edu, dlc5994@psu.edu
--One_to_SixteenDEMUX.vhd
-- Version 1.0 , 12/11/2024

--implements a one to sixteen demux with disconnect z 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity One_to_Sixteen4Bit_DEMUX is
    port ( DataIn : in STD_LOGIC_VECTOR (3 downto 0);
          SEL : in STD_LOGIC_VECTOR (3 downto 0);
           y0 : out STD_LOGIC_VECTOR (3 downto 0);
           y1 : out STD_LOGIC_VECTOR (3 downto 0);
           y2 : out STD_LOGIC_VECTOR (3 downto 0);
           y3 : out STD_LOGIC_VECTOR (3 downto 0);
           y4 : out STD_LOGIC_VECTOR (3 downto 0);
           y5 : out STD_LOGIC_VECTOR (3 downto 0);
           y6 : out STD_LOGIC_VECTOR (3 downto 0);
           y7 : out STD_LOGIC_VECTOR (3 downto 0);
           y8 : out STD_LOGIC_VECTOR (3 downto 0);
           y9 : out STD_LOGIC_VECTOR (3 downto 0);
           y10 : out STD_LOGIC_VECTOR (3 downto 0);
           y11 : out STD_LOGIC_VECTOR (3 downto 0);
           y12 : out STD_LOGIC_VECTOR (3 downto 0);
           y13 : out STD_LOGIC_VECTOR (3 downto 0);
           y14 : out STD_LOGIC_VECTOR (3 downto 0);
           y15 : out STD_LOGIC_VECTOR (3 downto 0));
end One_to_Sixteen4Bit_DEMUX;

architecture Behavioral of One_to_Sixteen4Bit_DEMUX is

begin
process(DataIn, SEL)
begin

        y0 <= "ZZZZ";
        y1 <= "ZZZZ";
        y2 <= "ZZZZ";
        y3 <= "ZZZZ";
        y4 <= "ZZZZ";
        y5 <= "ZZZZ";
        y6 <= "ZZZZ";
        y7 <= "ZZZZ";
        y8 <= "ZZZZ";
        y9 <= "ZZZZ";
        y10 <= "ZZZZ";
        y11 <= "ZZZZ";
        y12 <= "ZZZZ";
        y13 <= "ZZZZ";
        y14 <= "ZZZZ";
        y15 <= "ZZZZ";
        
      case SEL is
            when "0000" => y0 <= DataIn;
            when "0001" => y1 <= DataIn;
            when "0010" => y2 <= DataIn;
            when "0011" => y3 <= DataIn;
            when "0100" => y4 <= DataIn;
            when "0101" => y5 <= DataIn;
            when "0110" => y6 <= DataIn;
            when "0111" => y7 <= DataIn;
            when "1000" => y8 <= DataIn;
            when "1001" => y9 <= DataIn;
            when "1010" => y10 <= DataIn;
            when "1011" => y11 <= DataIn;
            when "1100" => y12 <= DataIn;
            when "1101" => y13 <= DataIn;
            when "1110" => y14 <= DataIn;
            when "1111" => y15 <= DataIn;
        end case;
end process;
    
end Behavioral;