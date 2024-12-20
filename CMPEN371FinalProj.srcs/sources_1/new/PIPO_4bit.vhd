-- Gabriel Genung, Dominic Cornauer
-- mxg1342@psu.edu, dlc5994@psu.edu
--PIPO_4bit.vhd
-- Version 1.0 , 12/11/2024

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Asyncronus
--Load or shift
--dir

entity PIPO_4bit is
    Port ( A : in std_logic_vector (3 downto 0);
           LorS : in std_logic;
           Dir : in std_logic;
           Enclk : in std_logic;
           push_val: in std_logic;
           Reset: in std_logic;
           B : out std_logic_vector (3 downto 0));
end PIPO_4bit;

architecture Behavioral of PIPO_4bit is
signal Q : std_logic_vector(3 downto 0);

begin
process(Enclk)is
begin
    if rising_edge(Enclk) then
       if (Reset ='0') then     
            if(LorS = '0') then
            Q<=A;
            else
                if(dir = '1') then
                    Q(2 downto 0) <= Q(3 downto 1); --Right
                    Q(3) <= push_val;
                else
                    Q(3 downto 1) <= Q(2 downto 0); --Left
                    Q(0)<= push_val;
                end if;
            end if;
       else
            Q <= "0000";
       end if;
   end if;
end process;

    B <= Q;
end Behavioral;
