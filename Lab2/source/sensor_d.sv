// $Id: $
// File name:   sensor_d.sv
// Created:     1/18/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: sensor_d.sv.
// logic = A + BC + BD
module sensor_d(
input logic [3:0] sensors,
output logic error
);
assign error = sensors[0] | (sensors[1] & sensors[2]) | (sensors[1] & sensors[3]);
endmodule
