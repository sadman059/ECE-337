// $Id: $
// File name:   sensor_b.sv
// Created:     1/18/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: sensor_b.sv
// logic = A + BC + BD
module sensor_b(
    input logic[3:0] sensors,
    output logic error
);
always_comb begin 
    error <= 0;
    if ( sensors[0] == 1 | ( (sensors[1] & sensors[2]) == 1)| ( (sensors[1] & sensors[3]) == 1))
          error <= 1;
        
end
endmodule
