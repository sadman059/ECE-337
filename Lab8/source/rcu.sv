// $Id: $
// File name:   rcu.sv
// Created:     2/12/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry

module rcu(
input logic clk,
input logic n_rst,
input logic new_packet_detected,
input logic packet_done,
input logic framing_error,
output logic sbc_clear,
output logic sbc_enable,
output logic load_buffer,
output logic enable_timer
);



typedef enum logic[2:0]{ IDLE, CLEAR ,ENABLE_TIMER, ENABLE,CHECK, LOAD  } state_t;
state_t next_state;
state_t current_state;

always_comb begin : rcu
  next_state = IDLE;
  case (current_state)
  
  IDLE : if(new_packet_detected == 1) next_state = CLEAR;

  CLEAR : next_state = ENABLE_TIMER;

  ENABLE_TIMER : if(packet_done == 1) begin
    next_state = ENABLE;
  end else begin
    next_state = ENABLE_TIMER;
  end

  ENABLE : next_state = CHECK;

  CHECK : if(framing_error == 0) next_state = LOAD;
 
  LOAD : next_state = IDLE;
  endcase
    
end


always_ff @( posedge clk, negedge n_rst ) begin : flipflop
    if(!n_rst)begin
    current_state <= IDLE;
    end else 
    current_state <= next_state;
end

always_comb begin : outlogic
    sbc_clear = 0;
    sbc_enable = 0;
    load_buffer = 0;
    enable_timer = 0;
    if(current_state == CLEAR) begin
        sbc_clear = 1'b1;
    end else if(current_state == ENABLE_TIMER) begin
        enable_timer = 1'b1;
    end else if (current_state == ENABLE) begin
        sbc_enable = 1'b1;
    end else if (current_state == LOAD) begin
        load_buffer = 1'b1;
    end
end

endmodule