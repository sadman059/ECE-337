// $Id: $
// File name:   fir_filter.sv
// Created:     2/22/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry

module fir_filter(
input logic clk,
input logic n_reset,
input logic [15:0] sample_data,
input logic [15:0] fir_coefficient,
input logic load_coeff,
input logic data_ready,
output logic one_k_samples,
output logic modwait,
output logic [15:0]fir_out,
output logic err
);
    logic lc;
	logic dr;
	logic overflow;
	logic cnt_up;
	logic clear;
	logic [2:0] op;
	logic [3:0] src1;
	logic [3:0] src2;
	logic [3:0] dest;
	logic [16:0] in;


sync_low LC (.clk(clk),
		.n_rst(n_reset),
		.async_in(load_coeff),
		.sync_out(lc));

sync_low DR (.clk(clk),
		.n_rst(n_reset),
		.async_in(data_ready),
		.sync_out(dr));

controller CONTROL (.clk(clk),
		.n_rst(n_reset),
		.dr(dr),
		.lc(lc),
		.overflow(overflow),
		.cnt_up(cnt_up),
		.clear(clear),
		.modwait(modwait),
		.op(op),
		.src1(src1),
		.src2(src2),
		.dest(dest),
		.err(err));

datapath DATAPATH(.clk(clk),
		.n_reset(n_reset),
		.op(op),
		.src1(src1),
		.src2(src2),
		.dest(dest),
		.ext_data1(fir_coefficient),
		.ext_data2(sample_data),
		.outreg_data(in),
		.overflow(overflow));

counter COUNT (.clk(clk),
		.n_rst(n_reset),
		.cnt_up(cnt_up),
		.clear(clear),
		.one_k_samples(one_k_samples));

magnitude MAG (.in(in),
		.out(fir_out));









 





endmodule