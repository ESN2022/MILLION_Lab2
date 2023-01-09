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
    data_out <= not("1111110") when data_in="0000" else
					 not("0110000") when data_in="0001" else
					 not("1101101") when data_in="0010" else
					 not("1111001") when data_in="0011" else
					 not("0110011") when data_in="0100" else
					 not("1011011") when data_in="0101" else
					 not("1011111") when data_in="0110" else
					 not("1110001") when data_in="0111" else
					 not("1111111") when data_in="1000" else
					 not("1111011") when data_in="1001" else
					 not("0000000");
end Dataflow;