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
 logic [2:0] next_state;
 logic [2:0] state;

typedef enum bit [2:0] {IDLE, STATE_1, STATE_2, STATE_3, SUCCESS} stateType;
	
always_comb begin: NXT_LOGIC
	next_state = state;
	case(state)
		IDLE: next_state = i ? STATE_1 : IDLE;
		STATE_1: next_state = i ? STATE_2 : IDLE;
		STATE_2: next_state = i ? STATE_2 : STATE_3;
		STATE_3: next_state = i ? SUCCESS : IDLE;
		SUCCESS: next_state = i ? STATE_2 : IDLE;
	endcase
end

always_ff @(posedge clk, negedge n_rst) begin: REG_LOGIC
	if(!n_rst)
		state <= IDLE;
	else
		state <= next_state;
end

always_comb begin: OUT_LOGIC
	o = 1'b0;
	if(state == SUCCESS)
		o = 1'b1;
end


endmodule