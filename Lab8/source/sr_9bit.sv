// $Id: $
// File name:   sr_9bit.sv
// Created:     2/12/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry

module sr_9bit(
input logic clk,
input logic n_rst,
input logic shift_strobe,
input logic serial_in,
output logic [7:0] packet_data,
output logic stop_bit
);

flex_stp_sr #(9) dut(.clk(clk),.n_rst(n_rst),.shift_enable(shift_strobe),.serial_in(serial_in),.parallel_out({stop_bit,packet_data}));



endmodule
