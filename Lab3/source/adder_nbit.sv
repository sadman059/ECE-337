// $Id: $
// File name:   adder_nbit.sv
// Created:     1/18/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: adder_nbit.sv
`timescale 1ns / 100ps
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

for( i = 0;i <BIT_WIDTH-1;i++)begin
always @ (a[i])
 begin
    assert((a[i]== 1'b1) || (a[i] == 1'b0))
    else $error("Input of is not a digital logic value");
 end

always @ (b[i])
 begin
    assert((b[i]== 1'b1) || (b[i] == 1'b0))
    else $error("Input of is not a digital logic value");
 end

always @(a[i],b[i],carrys[i])
begin
  #2 assert(((a[i]+b[i]+carrys[i]) % 2) == sum[i])
  else $error("output 's' of first 1 bit adder is not correct");
end
end

always @ (carry_in)
 begin
    assert((carry_in== 1'b1) || (carry_in == 1'b0))
    else $error("Input of is not a digital logic value");
 end

generate
    for(i = 0; i<= BIT_WIDTH-1; i = i+1)
      begin
        adder_1bit ADDi(.a(a[i]),.b(b[i]),.carry_in(carrys[i]),.sum(sum[i]),.carry_out(carrys[i+1]));
      end
endgenerate
assign overflow = carrys[BIT_WIDTH];





endmodule
