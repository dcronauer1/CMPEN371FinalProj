-- Gabriel Genung, Dominic Cornauer
-- mxg1342@psu.edu, dlc5994@psu.edu
--One_to_SixteenDEMUX.vhd


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity One_to_Sixteen4Bit_DEMUX is
    Port ( DataIn : in STD_LOGIC_VECTOR (3 downto 0);
          SEL : in STD_LOGIC (3 downto 0);
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
process(DataIn, SEL);
begin
    if(SEL = "0000") then
        y0 <= DataIn;
    elsif(SEL = "0001") then
        y1 <= DataIn;
    elsif(SEL = "0010") then
        y2 <= DataIn;
    elsif(SEL = "0011") then
        y3 <= DataIn;
    elsif(SEL = "0100") then
        y4 <= DataIn;
      elsif(SEL = "0101") then
        y5 <= DataIn;
      elsif(SEL = "0110") then
        y6 <= DataIn;
      elsif(SEL = "0111") then
        y7 <= DataIn;
     elsif(SEL = "1000") then
        y8 <= DataIn;
     elsif(SEL = "1001") then
        y9 <= DataIn;
      elsif(SEL = "1010") then
        y10 <= DataIn;
     elsif(SEL = "1011") then
        y11 <= DataIn;
     elsif(SEL = "1100") then
        y12 <= DataIn;
     elsif(SEL = "1101") then
        y13 <= DataIn;
    elsif(SEL = "1110") then
        y14 <= DataIn;
    elsif(SEL = "1111") then
        y15 <= DataIn;
    end if;
end process;
    
end Behavioral;
