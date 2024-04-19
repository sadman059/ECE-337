// $Id: $
// File name:   counter.sv
// Created:     2/22/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
module counter(
input logic clk,
input logic n_rst,
input logic cnt_up,
input logic clear,
output logic one_k_samples
);

flex_counter#(10) flex(.clk(clk),.n_rst(n_rst),.count_enable(cnt_up),.clear(clear),.rollover_flag(one_k_samples),.rollover_val(10'd1000));

endmodule