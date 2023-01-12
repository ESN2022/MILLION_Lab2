library ieee;
use ieee.std_logic_1164.all;

entity Decoder7Seg is
    port(
	     data_in  : in  std_logic_vector(3 downto 0);
		  data_out : out std_logic_vector(6 downto 0)
    );
end entity Decoder7Seg;

architecture Dataflow of Decoder7Seg is
begin
    data_out <= not("0111111") when data_in="0000" else
					 not("0000110") when data_in="0001" else
					 not("1011011") when data_in="0010" else
					 not("1001111") when data_in="0011" else
					 not("1100110") when data_in="0100" else
					 not("1101101") when data_in="0101" else
					 not("1111101") when data_in="0110" else
					 not("1000111") when data_in="0111" else
					 not("1111111") when data_in="1000" else
					 not("1101111") when data_in="1001" else
					 not("1110111") when data_in="1010" else
					 not("1111100") when data_in="1011" else
					 not("0111001") when data_in="1100" else
					 not("1011110") when data_in="1101" else
					 not("1111001") when data_in="1110" else
					 not("1110001");
end Dataflow;