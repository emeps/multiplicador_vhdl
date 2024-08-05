lpm_shiftreg0_inst : lpm_shiftreg0 PORT MAP (
		clock	 => clock_sig,
		data	 => data_sig,
		enable	 => enable_sig,
		load	 => load_sig,
		sclr	 => sclr_sig,
		q	 => q_sig,
		shiftout	 => shiftout_sig
	);
