// $Id: $
// File name:   adder_nbit.sv
// Created:     1/18/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: adder_nbit.sv
module adder_nbit
#(
    parameter BIT_WIDTH = 4

)
(
    input logic [BIT_WIDTH-1:0] a,
    input logic [BIT_WIDTH-1:0] b,
    input logic carry_in,
    output logic [BIT_WIDTH-1:0] sum,
    output logic overflow
);

wire [BIT_WIDTH:0] carrys;
genvar i;

assign carrys[0] = carry_in;

generate
    for(i = 0; i<= BIT_WIDTH-1; i = i+1)
      begin
        adder_1bit ADDi(.a(a[i]),.b(b[i]),.carry_in(carrys[i]),.sum(sum[i]),.carry_out(carrys[i+1]));
      end
endgenerate
assign overflow = carrys[BIT_WIDTH];



endmodule
