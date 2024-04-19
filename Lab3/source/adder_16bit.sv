// $Id: $
// File name:   adder_16bit.sv
// Created:     1/25/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry

module adder_16bit(

     input logic [15:0] a,
     input logic [15:0] b,
     input logic carry_in,
     output logic [15:0] sum,
     output logic overflow

);
 adder_nbit#(.BIT_WIDTH(16)) A1(.a(a),.b(b),.carry_in(carry_in),.sum(sum),.overflow(overflow));
genvar i;
for(i = 0;i <15;i++) begin
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
end
always @ (carry_in)
 begin
    assert((carry_in== 1'b1) || (carry_in == 1'b0))
    else $error("Input of is not a digital logic value");
 end

 


endmodule