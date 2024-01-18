// $Id: $
// File name:   sensor_s.sv
// Created:     1/18/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: module for sensor_s
// logic = A + BC + BD
module sensor_s(
    input logic[3:0] sensors,
    output logic error
);
wire a;
wire b;
wire c;
AND2X1 A1 (.Y(a), .A(sensors[1]), .B(sensors[2]));
AND2X1 A2 (.Y(b), .A(sensors[1]), .B(sensors[3]));
OR2X1  A3 (.Y(c),.A(a),.B(b));
OR2X1  A4 (.Y(error),.A(c),.B(sensors[0]));

endmodule 

 