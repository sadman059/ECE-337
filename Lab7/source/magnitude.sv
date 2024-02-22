// $Id: $
// File name:   magnitude.sv
// Created:     2/22/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry

module magnitude(
input logic [16:0] in,
output logic [15:0] out
);

always_comb begin : mag
    if(in[16]) begin
        out = ~in[15:0] + 1;
    end else begin
        out = in[15:0];
    end
end
endmodule