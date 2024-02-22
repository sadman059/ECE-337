// $Id: $
// File name:   sync_low
// Created:     1/30/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry

module sync_low(
 input logic clk,
 input logic n_rst,
 input logic async_in,
 output logic sync_out
);
reg d;
always_ff @(posedge clk, negedge n_rst ) begin : sync
    if(n_rst == 0) begin
        d <= 0;
        sync_out <= 0;
    end else begin
        d <= async_in;
        sync_out <= d;
    end
end

endmodule