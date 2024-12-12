----------------------------------------------------------------------------------
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
           Pause : in STD_LOGIC;  --permanently pauses?
           Reset : in STD_LOGIC; --doesnt do anything, probably dont need though
           clk: in STD_LOGIC;
           --Data_Out : out STD_LOGIC_VECTOR (3 downto 0);
          -- Carry_Out : out STD_LOGIC
          DP : out std_logic;
		-- The anodes will be treated as if they are different 
		-- communication channels, which are getting activated and deactivated according to the internal subclock (Sclk)
		AN : out std_logic_vector(3 downto 0);
	    CXX : out std_logic_vector(6 downto 0)
          );
end FinalPROJ;

architecture Behavioral of FinalPROJ is
--Internal Components
    
component ClockDivider is
    Port ( clk : in std_logic;
           Pause : in std_logic;
           clkout : out std_logic);
    end component;
    
component One_to_Sixteen4Bit_DEMUX is
    Port ( DataIn : in STD_LOGIC_VECTOR (3 downto 0);
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
    end component;
    
component One_to_SixteenMUX is
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
end component;


component PIPO_4bit is
    port ( A : in std_logic_vector (3 downto 0);
           LorS : in std_logic;
           Dir : in std_logic;
           Enclk : in std_logic;
           B : out std_logic_vector (3 downto 0));
    end component;
    
component DFF is 
    port ( clock : in STD_LOGIC;
           MyData : in STD_LOGIC;
           OutD : out STD_LOGIC);
    end component;

component SevenSeg_Decoder is
port ( X : in std_logic_vector(3 downto 0);
        AN : out std_logic_vector(3 downto 0);
        DP : out  std_logic;
        CXX : out std_logic_vector(6 downto 0)
        );
     end component;
   
component AND_Operation4bit is
     port ( A,B : in  std_logic_vector(3 downto 0);
             F : out  std_logic_vector(3 downto 0));
    end component;
    
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
    
component IsOdd4bit is
    Port ( A: in std_logic_vector(3 downto 0);
          EVEN: in std_logic;
          F: Out std_logic_vector(3 downto 0));
    end component;
    
component IsPrime4bit is
    Port ( A: in std_logic_vector(3 downto 0);
          F: Out std_logic_vector(3 downto 0));
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
signal A_RShift: std_logic_vector (3 downto 0);
signal A_LShift: std_logic_vector (3 downto 0);
signal A_ODD: std_logic_vector (3 downto 0);
signal A_EVEN: std_logic_vector (3 downto 0);
signal A_PRIME: std_logic_vector (3 downto 0);
signal Display_data:std_logic_vector (3 downto 0);
signal dp_data:std_logic;
signal Pause_Reg:std_logic;

signal M_ADD: std_logic_vector (3 downto 0);
signal M_AND: std_logic_vector (3 downto 0);
signal M_OR: std_logic_vector (3 downto 0);
signal M_XOR: std_logic_vector (3 downto 0);
signal M_RSHIFT: std_logic_vector (3 downto 0);
signal M_LSHIFT: std_logic_vector (3 downto 0);
signal M_ODD: std_logic_vector (3 downto 0);
signal M_EVEN: std_logic_vector (3 downto 0);
signal M_PRIME: std_logic_vector (3 downto 0);

signal Dummy_Input : std_logic_vector(3 downto 0) := (others => '0'); --used for unused 1-16 MUX

begin

--Display_data<="0000";
Clock1: ClockDivider port map(clk=>clk, Pause=>Pause_Reg, clkout=>MainClk);
Reg1: PIPO_4bit port map(A=>Ain, LorS=>'0', Dir=>'0', Enclk=>MainClk, B=>A_Reg);
Reg2: PIPO_4bit port map(A=>Bin, LorS=>'0', Dir=>'0', Enclk=>MainClk, B=>B_Reg);
Reg3: PIPO_4bit port map(A=>OP_Code, LorS=>'0', Dir=>'0', Enclk=>MainClk, B=>OP_Reg);
DFF1: DFF port map (clock=>MainClk, MyData=>Extra, OutD=>Extra_Reg);
DFF2: DFF port map (clock=>clk, MyData=>Pause, OutD=>Pause_Reg); --dont use MainClk here lol
ADemux: One_to_Sixteen4Bit_DEMUX port map(DataIn=>A_Reg, SEL=>OP_Reg, y0=>A_ADD, y1=>A_AND, y2=>A_OR, y3=>A_XOR, y4=>A_RShift, y5=>A_LShift, y6=>A_ODD, y7=>A_EVEN, y8=>A_PRIME, y9=>open, y10=>open, y11=>open, y12=>open, y13=>open, y14=>open, y15=>open);
BDemux: One_to_Sixteen4Bit_DEMUX port map(DataIn=>B_Reg, SEL=>OP_Reg, y0=>B_ADD, y1=>B_AND, y2=>B_OR, y3=>B_XOR, y4=>open, y5=>open, y6=>open, y7=>open, y8=>open, y9=>open, y10=>open, y11=>open, y12=>open, y13=>open, y14=>open, y15=>open);
ADD1: RippleCarryAdder_4bit port map(EX_Cin=>Extra_Reg, EX_A=>A_ADD, EX_B=>B_ADD, EX_SUM=>M_ADD, EX_Cout=>dp_data);
AND1: AND_Operation4bit port map(A=>A_AND, B=>B_AND, F=>M_AND);
OR1: OR_Operation4bit port map(A=>A_OR, B=>B_OR, F=>M_OR);
XOR1: XOR_Operation4bit port map(A=>A_XOR, B=>B_XOR, F=>M_XOR);
RSHIFT: PIPO_4bit port map(A=>A_RShift, LorS=>'1', Dir=>'1', Enclk=>MainClk, B=>M_RSHIFT); --doesnt do anything
LSHIFT: PIPO_4bit port map(A=>A_LShift, LorS=>'1', Dir=>'0', Enclk=>MainClk, B=>M_LSHIFT); --doesnt do anything
ODD: IsOdd4bit port map(A=>A_ODD, EVEN=>'0', F=>M_ODD);
EVEN: IsOdd4bit port map(A=>A_EVEN, EVEN=>'1', F=>M_EVEN); --dont need isEven <3
PRIME: IsPrime4bit port map(A=>A_PRIME, F=>M_PRIME);

DP<=dp_data; --not working

MUX1: One_to_SixteenMUX port map(DataOut=>Display_data, SEL=>OP_Reg, y0=>M_ADD, y1=>M_AND, y2=>M_OR, y3=>M_XOR, y4=>M_RSHIFT, y5=>M_LSHIFT, y6=>M_ODD, y7=>M_EVEN, y8=>M_PRIME, y9=>Dummy_Input, y10=>Dummy_Input, y11=>Dummy_Input, y12=>Dummy_Input, y13=>Dummy_Input, y14=>Dummy_Input, y15=>Dummy_Input);

Display: SevenSeg_Decoder port map(X=>Display_data, AN=>AN, DP=>DP, CXX=>CXX);

end Behavioral;