// $Id: $
// File name:   flex_pts_sr.sv
// Created:     2/6/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
module flex_pts_sr 
#(
     parameter NUM_BITS = 4, 
     parameter SHIFT_MSB = 1   
)(
input logic clk,
input logic n_rst,
input logic shift_enable,
input logic load_enable,
input logic [NUM_BITS-1:0] parallel_in,
output logic serial_out
);
logic [NUM_BITS-1:0] next;
logic [NUM_BITS-1:0] prev;

always_comb begin : next_state_logic
   next = prev;
   //prev = serial_out;
    if(load_enable == 1) begin
        next = parallel_in;
    end
    if(load_enable == 0 && shift_enable == 1 && SHIFT_MSB == 1) begin
        next = prev << 1;
        next[0] = 1;
    end else if (load_enable == 0 && shift_enable == 1 && SHIFT_MSB == 0) begin
      next = prev >> 1;
      next[NUM_BITS-1] = 1;
    end
end
always_ff @( posedge clk, negedge n_rst ) begin : flipflop
  if(n_rst == 0) begin
      prev <= '1;
  end else begin
    prev <= next;
  end
end

always_comb begin : output_logic
    if(SHIFT_MSB == 1) begin
        serial_out = prev[NUM_BITS-1];
    end else if ( SHIFT_MSB == 0) begin
        serial_out = prev[0];
    end
end


endmodule
