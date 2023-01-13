library ieee;
use ieee.std_logic_1164.all;

entity Lab2 is
	 port(
        clock, reset                    : in  std_logic;
		  ctp_in                          : in  std_logic_vector(3 downto 0);
		  seg7_out0, seg7_out1, seg7_out2 : out std_logic_vector(6 downto 0)
	 );
end entity Lab2;

architecture Structural of Lab2 is
    component Lab2_sys is
        port (
            clk_clk             : in  std_logic                     := 'X'; -- clk
            pio_data_seg_export : out std_logic_vector(11 downto 0);        -- export
            reset_reset_n       : in  std_logic                     := 'X'  -- reset_n
		);
	end component Lab2_sys;

	 
	 component Decoder7Seg is
        port(
	         data_in  : in  std_logic_vector(3 downto 0);
		      data_out : out std_logic_vector(6 downto 0)
        );
    end component Decoder7Seg;
	 
	 signal seg_decoder_in : std_logic_vector(11 downto 0);
	 
begin
    u0 : component Lab2_sys
    port map (
        clk_clk             => clock,    -- clk.clk
        pio_data_seg_export => seg_decoder_in, -- pio_data_seg.export
        reset_reset_n       => reset     -- reset.reset_n
    );
	 
	 first_decoder : component Decoder7Seg
	 port map (
	     data_in  => seg_decoder_in(3 downto 0),
        data_out => seg7_out0
	 );
	 
	 second_decoder : component Decoder7Seg
	 port map (
	     data_in  => seg_decoder_in(7 downto 4),
        data_out => seg7_out1
	 );
	
	 third_decoder : component Decoder7Seg
	 port map (
	     data_in  => seg_decoder_in(11 downto 8),
        data_out => seg7_out2
	 );
end Structural;
