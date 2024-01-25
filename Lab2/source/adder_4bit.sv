// $Id: $
// File name:   adder_4bit.sv
// Created:     1/18/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: adder_4bit.sv
module adder_4bit(
  input logic [3:0] a,
  input logic [3:0] b,
  input logic carry_in,
  output logic [3:0] sum,
  output logic overflow
);
wire [2:0] carrys;

adder_1bit ADD0(.a(a[0]),.b(b[0]),.carry_in(carry_in),.sum(sum[0]),.carry_out(carrys[0]));
adder_1bit ADD1(.a(a[1]),.b(b[1]),.carry_in(carrys[0]),.sum(sum[1]),.carry_out(carrys[1]));
adder_1bit ADD2(.a(a[2]),.b(b[2]),.carry_in(carrys[1]),.sum(sum[2]),.carry_out(carrys[2]));
adder_1bit ADD3(.a(a[3]),.b(b[3]),.carry_in(carrys[2]),.sum(sum[3]),.carry_out(overflow));


endmodule