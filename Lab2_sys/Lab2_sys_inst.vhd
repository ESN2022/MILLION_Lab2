	component Lab2_sys is
		port (
			clk_clk             : in  std_logic                     := 'X'; -- clk
			pio_data_seg_export : out std_logic_vector(11 downto 0);        -- export
			reset_reset_n       : in  std_logic                     := 'X'  -- reset_n
		);
	end component Lab2_sys;

	u0 : component Lab2_sys
		port map (
			clk_clk             => CONNECTED_TO_clk_clk,             --          clk.clk
			pio_data_seg_export => CONNECTED_TO_pio_data_seg_export, -- pio_data_seg.export
			reset_reset_n       => CONNECTED_TO_reset_reset_n        --        reset.reset_n
		);

