// $Id: $
// File name:   adder_1bit.sv
// Created:     1/18/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: adder_1bit.sv

module adder_1bit(
input logic a,
input logic b,
input logic carry_in,
output logic sum,
output logic carry_out
);
wire temp;

XOR2X1 A1(.Y(temp),.A(a),.B(b));
XOR2X1 A2(.Y(sum),.A(carry_in),.B(temp));

wire temp1;
wire temp2;
wire temp3;
wire temp4;
wire temp5;

OR2X1  A3 (.Y(temp1),.A(a),.B(b));
AND2X1 A4 (.Y(temp2), .A(temp1), .B(carry_in));
INVX1 A5 (.Y(temp3),.A(carry_in));
AND2X1 A6 (.Y(temp4), .A(a), .B(b));
AND2X1 A7 (.Y(temp5), .A(temp4), .B(temp3));
OR2X1  A8 (.Y(carry_out),.A(temp2),.B(temp5));

always @ (a)
 begin
    assert((a== 1'b1) || (a == 1'b0))
    else $error("Input of is not a digital logic value");
 end

always @ (b)
 begin
    assert((b== 1'b1) || (b == 1'b0))
    else $error("Input of is not a digital logic value");
 end

always @ (carry_in)
 begin
    assert((carry_in== 1'b1) || (carry_in == 1'b0))
    else $error("Input of is not a digital logic value");
 end





endmodule
