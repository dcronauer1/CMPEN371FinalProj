----------------------------------------------------------------------------------
-- Team Number 404
-- Gabriel Genung, Dominic Cornauer
-- mxg1342@psu.edu, dlc5994@psu.edu
-- FinalPROJ.vhd
-- Version 1.0 , 12/8/2024
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;


entity FinalPROJ is
    Port ( Ain : in STD_LOGIC_VECTOR (3 downto 0);
           Bin : in STD_LOGIC_VECTOR (3 downto 0);
           OP_Code : in STD_LOGIC_VECTOR (3 downto 0);
           Extra : in STD_LOGIC;
           Pause : in STD_LOGIC;
           Data_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Carry_Out : out STD_LOGIC);
end FinalPROJ;

architecture Behavioral of FinalPROJ is
--Internal Components
    
component ClockDivider is
    Port ( clk : in std_logic;
        clkout : out std_logic);
    end component;
    
component One_to_Sixteen4Bit_DEMUX is
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
    end component;

component PIPO_4bit is
    Port ( A : in std_logic_vector (3 downto 0);
           LorS : in std_logic;
           Dir : in std_logic;
           Enclk : in std_logic;
           B : out std_logic_vector (3 downto 0));
    end component;

component MultipleOutputsOnto7SegDisplay is
    port ( clk :in std_logic;
 	    value1 : in std_logic_vector(3 downto 0);
        value2 : in std_logic_vector(3 downto 0);  
        value3 : in std_logic_vector(3 downto 0);
        value4 : in std_logic_vector(3 downto 0);
        segs : out std_logic_vector(6 downto 0);
        channels : out std_logic_vector(3 downto 0);
        dp : out std_logic);
     end component;
component AND_Operation4bit is
     port ( A,B : in  std_logic_vector(3 downto 0);
             F : out  std_logic_vector(3 downto 0));
    end AND_Operation4bit;
    
component OR_Operation4bit is
    port ( A,B : in  std_logic_vector(3 downto 0);
            F : out  std_logic_vector(3 downto 0));
    end component;

component XOR_Operation4bit is
    port ( A,B : in std_logic_vector(3 downto 0);
            F : out std_logic_vector(3 downto 0));
    end component;

component RippleCarryAdder_4bit is
    Port ( EX_Cin: in std_logic;
          EX_A: in std_logic_vector(3 downto 0);
          EX_B: in std_logic_vector(3 downto 0);
          EX_SUM: out std_logic_vector(3 downto 0);
          EX_Cout: out std_logic);
    end component;
--List of internal signals
signal MainClk: std_logic;
signal A_Reg: std_logic_vector (3 downto 0);
signal B_Reg: std_logic_vector (3 downto 0);
signal OP_Reg: std_logic_vector (3 downto 0);
signal Extra_Reg: std_logic;
signal A_ADD: std_logic_vector (3 downto 0);
signal B_ADD: std_logic_vector (3 downto 0);
signal A_AND: std_logic_vector (3 downto 0);
signal B_AND: std_logic_vector (3 downto 0);
signal A_OR: std_logic_vector (3 downto 0);
signal B_OR: std_logic_vector (3 downto 0);
signal A_XOR: std_logic_vector (3 downto 0);
signal B_XOR: std_logic_vector (3 downto 0);
--signal A_RShift: std_logic_vector (3 downto 0);
--signal A_LShift: std_logic_vector (3 downto 0);
--signal A_ODD: std_logic_vector (3 downto 0);
--signal A_EVEN: std_logic_vector (3 downto 0);
--signal A_PRIME: std_logic_vector (3 downto 0);

begin

Clock1: ClockDivider port map(clk=>Clock, clkout=>MainClk);
Reg1: PIPO_4bit port map(A=>Ain, LorS=>'0', Dir=>'0', Enclk=>MainClk, B=>A_Reg);
Reg2: PIPO_4bit port map(A=>Bin, LorS=>'0', Dir=>'0', Enclk=>MainClk, B=>B_Reg);
Reg3: PIPO_4bit port map(A=>OP_Code, LorS=>'0', Dir=>'0', Enclk=>MainClk, B=>OP_Reg);
    --Need to add extra 1 bit register for extra data line
ADemux: One_to_Sixteen4Bit_DEMUX port map(DataIn=>A_Reg, SEL=>OP_Reg, y0=>A_ADD, y1=>A_AND, y2=>A_OR, y3=>A_XOR, y4=>open, y5=>open, y6=>open, y7=>open, y7=>open, y8=>open, y9=>open, y10=>open, y11=>open, y12=>open, y13=>open, y14=>open, y15=>open);
BDemux: One_to_Sixteen4Bit_DEMUX port map(DataIn=>B_Reg, SEL=>OP_Reg, y0=>B_ADD, y1=>B_AND, y2=>B_OR, y3=>B_XOR, y4=>open, y5=>open, y6=>open, y7=>open, y7=>open, y8=>open, y9=>open, y10=>open, y11=>open, y12=>open, y13=>open, y14=>open, y15=>open);
ADD1: RippleCarryAdder_4bit port map(EX_Cin=>Extra_Reg, EX_A=>A_ADD, EX_B=>B_ADD, EX_SUM=>Data_Out, EX_Cout=>Carry_Out);
AND1: AND_Operation4bit port map(A=>A_AND, B=>B_AND, F=>Data_Out);
OR1: OR_Operation4bit port map(A=>A_OR, B=>B_OR, F=>Data_Out);
XOR1: XOR_Operation4bit port map(A=>A_XOR, B=>B_XOR, F=>Data_Out);


end Behavioral;
