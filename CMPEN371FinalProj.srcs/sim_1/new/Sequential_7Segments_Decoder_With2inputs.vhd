-- Dominic Cronauer, Gabriel Genung
-- dlc5994@psu.edu, mxg1342@psu.edu
-- Sequential_7Segments_Decoder_With2inputs.vhd
-- Version 1.0 , 12/6/2023

---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sequential_7Segments_Decoder is
    Port ( 
		
		value1 : in std_logic_vector(3 downto 0);
		value2 : in std_logic_vector(3 downto 0);  
		value3 : in std_logic_vector(3 downto 0);
		value4 : in std_logic_vector(3 downto 0);
		mclk : in std_logic;
		dp : out std_logic;
		-- The anodes will be treated as if they are different 
		-- communication channels, which are getting activated and deactivated according to the internal subclock (Sclk)
		channels : out std_logic_vector(3 downto 0);
	    segs : out std_logic_vector(6 downto 0)
	    );
end Sequential_7Segments_Decoder;


architecture behavioral of Sequential_7Segments_Decoder is
    
    
    signal counting: integer :=1; 
	signal intAn: std_logic_vector(3 downto 0); -- internal states of the Anodes
	signal flipper : std_logic_vector(1 downto 0);
    signal Sclk : std_logic;

begin
	
	channels <= intAn;
	Sclk <= mclk;
  --seg <= hex; 
  process(Sclk)
  begin
  if (Sclk'event and Sclk = '1') then
     if flipper = "11" then
         flipper <= "00";
         else
         flipper <= flipper + 1;
       end if;
    end if;
	
       if  flipper = "00" then               
              intAn <=  "1110";
			  dp <= '1';                                  
	      end if;
	      
       if  flipper = "01" then          
              intAn <= "1101";
              dp <= '0';             
           end if;
           
       if  flipper = "10" then          
              intAn <= "1011";
              dp <= '1';             
           end if;
       if  flipper = "11" then          
              intAn <= "0111";
              dp <= '0';             
           end if;
                    
           
	end process;
   	
	
    process (intAn) 
    begin
	
	if (intAn = "1110" ) THEN 
	    case value1 is
	 --   case counting is
		when "0000" => segs <= NOT "0111111"; -- 0
		when "0001" => segs <=NOT "0000110"; -- 1
		when "0010" => segs <=NOT "1011011"; -- 2
		when "0011" => segs <=NOT "1001111"; -- 3
		when "0100" => segs <=NOT "1100110"; -- 4
		when "0101" => segs <=NOT "1101101"; -- 5
		when "0110" => segs <=NOT "1111101"; -- 6
		when "0111" => segs <=NOT "0000111"; -- 7
		when "1000" => segs <=NOT "1111111"; -- 8
		when "1001" => segs <=NOT "1100111"; -- 9
		when "1010" => segs <=NOT "1110111"; -- A
		when "1011" => segs <=NOT "1111100"; -- b
		when "1100" => segs <=NOT "0111001"; -- c
		when "1101" => segs <=NOT "1011110"; -- d
		when "1110" => segs <=NOT "1111001"; -- E
		when others => segs <=NOT "1110001"; -- F
	    end case;
	    
	    elsif (intAn = "1101") THEN
	      case value2 is
     --   case counting is
        when "0000" => segs <= NOT "0111111"; -- 0
        when "0001" => segs <=NOT "0000110"; -- 1
        when "0010" => segs <=NOT "1011011"; -- 2,l
        when "0011" => segs <=NOT "1001111"; -- 3
        when "0100" => segs <=NOT "1100110"; -- 4
        when "0101" => segs <=NOT "1101101"; -- 5
        when "0110" => segs <=NOT "1111101"; -- 6
        when "0111" => segs <=NOT "0000111"; -- 7
        when "1000" => segs <=NOT "1111111"; -- 8
        when "1001" => segs <=NOT "1100111"; -- 9
        when "1010" => segs <=NOT "1110111"; -- A
        when "1011" => segs <=NOT "1111100"; -- b
        when "1100" => segs <=NOT "0111001"; -- c
        when "1101" => segs <=NOT "1011110"; -- d
        when "1110" => segs <=NOT "1111001"; -- E
        when others => segs <=NOT "1110001"; -- F
        end case;
        
         elsif (intAn = "1011") THEN
           case value3 is
        --   case counting is
        when "0000" => segs <= NOT "0111111"; -- 0
        when "0001" => segs <=NOT "0000110"; -- 1
        when "0010" => segs <=NOT "1011011"; -- 2,l
        when "0011" => segs <=NOT "1001111"; -- 3
        when "0100" => segs <=NOT "1100110"; -- 4
        when "0101" => segs <=NOT "1101101"; -- 5
        when "0110" => segs <=NOT "1111101"; -- 6
        when "0111" => segs <=NOT "0000111"; -- 7
        when "1000" => segs <=NOT "1111111"; -- 8
        when "1001" => segs <=NOT "1100111"; -- 9
        when "1010" => segs <=NOT "1110111"; -- A
        when "1011" => segs <=NOT "1111100"; -- b
        when "1100" => segs <=NOT "0111001"; -- c
        when "1101" => segs <=NOT "1011110"; -- d
        when "1110" => segs <=NOT "1111001"; -- E
        when others => segs <=NOT "1110001"; -- F
       end case;
               
     elsif (intAn = "0111") THEN
       case value4 is
     --   case counting is
        when "0000" => segs <= NOT "0111111"; -- 0
        when "0001" => segs <=NOT "0000110"; -- 1
        when "0010" => segs <=NOT "1011011"; -- 2,l
        when "0011" => segs <=NOT "1001111"; -- 3
        when "0100" => segs <=NOT "1100110"; -- 4
        when "0101" => segs <=NOT "1101101"; -- 5
        when "0110" => segs <=NOT "1111101"; -- 6
        when "0111" => segs <=NOT "0000111"; -- 7
        when "1000" => segs <=NOT "1111111"; -- 8
        when "1001" => segs <=NOT "1100111"; -- 9
        when "1010" => segs <=NOT "1110111"; -- A
        when "1011" => segs <=NOT "1111100"; -- b
        when "1100" => segs <=NOT "0111001"; -- c
        when "1101" => segs <=NOT "1011110"; -- d
        when "1110" => segs <=NOT "1111001"; -- E
        when others => segs <=NOT "1110001"; -- F
     end case;
                  
        
        end if ;
	
    end process;
    
  

end behavioral;
  
    
