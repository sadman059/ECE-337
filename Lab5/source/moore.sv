// $Id: $
// File name:   moore.sv
// Created:     2/6/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry

module moore(
 input logic clk,
 input logic n_rst,
 input logic i,
 output logic o
);
logic [3:0] next;
logic [3:0] state;

always_comb begin : next_state_logic
    next = '0;
    case (next)
     4'b0000 : if(i == 1) begin
        next = next << 1;
        nexxt[0] = i;
     end
     4'b0001 : if(i == 1) begin
        next = next << 1;
        nexxt[0] = i;
     end
     4'b0011 : if(i == 0) begin
        next = next << 1;
        nexxt[0] = i;
     end
     4'b0110 : if(i == 1) begin
        next = next << 1;
        nexxt[0] = i;
     end
     4'b1101 : 
    endcase
end

always_ff @( posedge clk, negedge n_rst ) begin : flipflop
    if(n_rst == 0) begin
        state <= '0;
    end else begin
        state <= next;
    end
end

always_comb begin : output_logic
   if(state == 4'b1101) begin
    o = 1;
end else begin
    o = 0;
    end   
end



endmodule