----------------------------------------------------------------------------------
-- Team Number 404
-- Gabriel Genung, Dominic Cornauer
-- mxg1342@psu.edu, dlc5994@psu.edu
-- FinalPROJ.vhd
-- Version 1.0 , 11/21/2024
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FinalPROJ is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           OP_Code : in STD_LOGIC_VECTOR (3 downto 0);
           Extra : in STD_LOGIC;
           Pause : in STD_LOGIC;
           Data_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Carry_Out : out STD_LOGIC);
end FinalPROJ;

architecture Behavioral of FinalPROJ is

begin


end Behavioral;
