// $Id: $
// File name:   ahb_lite_fir_filter.sv
// Created:     3/24/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry

module ahb_lite_fir_filter
(
	input logic clk,
	input logic n_rst,
	input logic hsel,
	input logic [3:0] haddr,
	input logic hsize,
	input logic [1:0] htrans,
	input logic hwrite,
	input logic [15:0] hwdata,
	output logic [15:0] hrdata,
	output logic hresp
);

 logic [15:0] fir_result;
  logic err;
  logic data_ready;
  logic [15:0] sample_data;
  logic modwait;
  logic new_coefficient_set;
  logic clear_new_coefficient;
  logic load_coeff;
  logic [1:0] coefficient_num;
  logic [15:0] fir_coefficient;

  fir_filter filter
  (
    .clk(clk),
    .n_reset(n_rst),
    .sample_data(sample_data),
    .fir_coefficient(fir_coefficient),
    .load_coeff(load_coeff),
    .data_ready(data_ready),
    .modwait(modwait),
    .fir_out(fir_result),
    .err(err)
  );

  ahb_lite_slave slave
  (
    .clk(clk),
    .n_rst(n_rst),
    .coefficient_num(coefficient_num),
    .modwait(modwait),
    .fir_out(fir_result),
    .err(err),
    .hsel(hsel),
    .haddr(haddr),
    .hsize(hsize),
    .htrans(htrans),
    .hwrite(hwrite),
    .hwdata(hwdata),
    .clear_new_coefficient(clear_new_coefficient), 
    .sample_data(sample_data),
    .data_ready(data_ready),
    .new_coefficient_set(new_coefficient_set),
    .fir_coefficient(fir_coefficient),
    .hrdata(hrdata),
    .hresp(hresp)
  );

  coefficient_loader loader
  (
    .clk(clk),
    .n_reset(n_rst),
    .new_coefficient_set(new_coefficient_set),
    .modwait(modwait),
    .load_coeff(load_coeff),
    .coefficient_num(coefficient_num),
    .clear_new_coefficient(clear_new_coefficient)
  );




endmodule
