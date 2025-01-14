// megafunction wizard: %LPM_SHIFTREG%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: LPM_SHIFTREG 

// ============================================================
// File Name: lpm_shiftreg0.v
// Megafunction Name(s):
// 			LPM_SHIFTREG
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 13.0.1 Build 232 06/12/2013 SP 1 SJ Web Edition
// ************************************************************


//Copyright (C) 1991-2013 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


//lpm_shiftreg LPM_DIRECTION="LEFT" LPM_WIDTH=8 clock data enable load q sclr shiftout
//VERSION_BEGIN 13.0 cbx_lpm_shiftreg 2013:06:12:18:03:40:SJ cbx_mgl 2013:06:12:18:04:42:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463


//synthesis_resources = lut 8 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  lpm_shiftreg0_shift_reg
	( 
	clock,
	data,
	enable,
	load,
	q,
	sclr,
	shiftout) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   [7:0]  data;
	input   enable;
	input   load;
	output   [7:0]  q;
	input   sclr;
	output   shiftout;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [7:0]  data;
	tri1   enable;
	tri0   load;
	tri0   sclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[7:0]	shift_reg;
	wire  [7:0]  shift_node;
	wire shiftin;

	// synopsys translate_off
	initial
		shift_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		if (enable == 1'b1) 
			if (sclr == 1'b1) shift_reg <= 8'b0;
			else if (load == 1'b1) shift_reg <= data;
			else  shift_reg <= shift_node;
	assign
		q = shift_reg,
		shift_node = {shift_reg[6:0], shiftin},
		shiftin = 1'b1,
		shiftout = shift_reg[7];
endmodule //lpm_shiftreg0_shift_reg
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module lpm_shiftreg0 (
	clock,
	data,
	enable,
	load,
	sclr,
	q,
	shiftout)/* synthesis synthesis_clearbox = 1 */;

	input	  clock;
	input	[7:0]  data;
	input	  enable;
	input	  load;
	input	  sclr;
	output	[7:0]  q;
	output	  shiftout;

	wire  sub_wire0;
	wire [7:0] sub_wire1;
	wire  shiftout = sub_wire0;
	wire [7:0] q = sub_wire1[7:0];

	lpm_shiftreg0_shift_reg	lpm_shiftreg0_shift_reg_component (
				.clock (clock),
				.data (data),
				.load (load),
				.sclr (sclr),
				.enable (enable),
				.shiftout (sub_wire0),
				.q (sub_wire1));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ACLR NUMERIC "0"
// Retrieval info: PRIVATE: ALOAD NUMERIC "0"
// Retrieval info: PRIVATE: ASET NUMERIC "0"
// Retrieval info: PRIVATE: ASET_ALL1 NUMERIC "1"
// Retrieval info: PRIVATE: CLK_EN NUMERIC "1"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: PRIVATE: LeftShift NUMERIC "1"
// Retrieval info: PRIVATE: ParallelDataInput NUMERIC "1"
// Retrieval info: PRIVATE: Q_OUT NUMERIC "1"
// Retrieval info: PRIVATE: SCLR NUMERIC "1"
// Retrieval info: PRIVATE: SLOAD NUMERIC "1"
// Retrieval info: PRIVATE: SSET NUMERIC "0"
// Retrieval info: PRIVATE: SSET_ALL1 NUMERIC "1"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "1"
// Retrieval info: PRIVATE: SerialShiftInput NUMERIC "0"
// Retrieval info: PRIVATE: SerialShiftOutput NUMERIC "1"
// Retrieval info: PRIVATE: nBit NUMERIC "8"
// Retrieval info: PRIVATE: new_diagram STRING "1"
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: CONSTANT: LPM_DIRECTION STRING "LEFT"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_SHIFTREG"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "8"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: USED_PORT: data 0 0 8 0 INPUT NODEFVAL "data[7..0]"
// Retrieval info: USED_PORT: enable 0 0 0 0 INPUT NODEFVAL "enable"
// Retrieval info: USED_PORT: load 0 0 0 0 INPUT NODEFVAL "load"
// Retrieval info: USED_PORT: q 0 0 8 0 OUTPUT NODEFVAL "q[7..0]"
// Retrieval info: USED_PORT: sclr 0 0 0 0 INPUT NODEFVAL "sclr"
// Retrieval info: USED_PORT: shiftout 0 0 0 0 OUTPUT NODEFVAL "shiftout"
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: @data 0 0 8 0 data 0 0 8 0
// Retrieval info: CONNECT: @enable 0 0 0 0 enable 0 0 0 0
// Retrieval info: CONNECT: @load 0 0 0 0 load 0 0 0 0
// Retrieval info: CONNECT: @sclr 0 0 0 0 sclr 0 0 0 0
// Retrieval info: CONNECT: q 0 0 8 0 @q 0 0 8 0
// Retrieval info: CONNECT: shiftout 0 0 0 0 @shiftout 0 0 0 0
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_shiftreg0.vhd TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_shiftreg0.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_shiftreg0.cmp TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_shiftreg0.bsf TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_shiftreg0_inst.vhd TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_shiftreg0_syn.v TRUE
// Retrieval info: LIB_FILE: lpm
