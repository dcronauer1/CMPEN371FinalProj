--Team Number(???)
-- Gabriel Genung, Dominic Cornauer
-- mxg1342@psu.edu, dlc5994@psu.edu
--One_to_SixteenDEMUX.vhd


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity One_to_Sixteen4Bit_DEMUX is
    Port ( DataIn : in STD_LOGIC_VECTOR (3 downto 0);
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


end Behavioral;
