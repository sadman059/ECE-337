// $Id: $
// File name:   flex_stp_sr.sv
// Created:     2/6/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry

module flex_stp_sr 
#(
     parameter NUM_BITS = 4, 
     parameter SHIFT_MSB = 0   
)(
input logic clk,
input logic n_rst,
input logic shift_enable,
input logic serial_in,
output logic [NUM_BITS-1:0] parallel_out
);

logic [NUM_BITS-1:0] next;
always_comb begin : next_state_logic
    next = parallel_out;
    if(shift_enable == 1 && SHIFT_MSB == 1) begin
        next = parallel_out << 1;
        next[0] = serial_in;
    end else if (shift_enable == 1 && SHIFT_MSB == 0) begin
        next = parallel_out >> 1;
        next[NUM_BITS-1] = serial_in;
    end else begin
        next = parallel_out;
    end
end

always_ff @(posedge clk, negedge n_rst ) begin : flipflop
   if(n_rst == 0) begin
    parallel_out <= '1;
   end else begin
   parallel_out <= next; 
   end
end

endmodule
