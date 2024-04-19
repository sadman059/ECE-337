// $Id: $
// File name:   coefficient_loader.sv
// Created:     3/24/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry

module coefficient_loader (
input logic clk,
input logic n_reset,
input logic new_coefficient_set,
input logic modwait,
output logic load_coeff,
output logic [1:0] coefficient_num,
output logic clear_new_coefficient
);
	

typedef enum bit [3:0] {IDLE,
			LOAD1,
			WAIT1,
			LOAD2,
			WAIT2,
			LOAD3,
			WAIT3,
			LOAD4,
            CLEAR} stateType;

stateType  state;
stateType next_state;

always_comb begin: COEFF_LOADER_CONTROLLER
	next_state = state;
	case(state)
		IDLE:  begin if((modwait == 0) && (new_coefficient_set == 1) )begin
             next_state = LOAD1;
        end else begin
             next_state = IDLE;
        end
        end
		LOAD1: next_state = WAIT1;
		WAIT1: begin if(modwait == 0)begin
             next_state = LOAD2;
        end else begin
             next_state = WAIT1;
        end
        end
		LOAD2: next_state = WAIT2;
		WAIT2: begin if(modwait == 0 )begin
             next_state = LOAD3;
        end else begin
             next_state = WAIT2;
        end
        end
		LOAD3: next_state = WAIT3;
		WAIT3: begin if(modwait == 0 )begin
             next_state = LOAD4;
        end else begin
             next_state = WAIT3;
        end
        end
		LOAD4: next_state = CLEAR;
        CLEAR: next_state = IDLE;
	endcase
end

always_ff @(posedge clk, negedge n_reset) begin: FF
	if(!n_reset) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end

always_comb begin: CONTROLLER_OUTPUT
	load_coeff = 0;
	coefficient_num = 2'd0;
    clear_new_coefficient = 0;
	case(state)
		IDLE: load_coeff = 0;
		LOAD1: begin 
			coefficient_num = 2'd0;
			load_coeff = 1;
		end
		WAIT1: begin
			coefficient_num = 2'd0;
			load_coeff = 0;
		end
		LOAD2: begin 
			coefficient_num = 2'd1;
			load_coeff = 1;
		end
		WAIT2: begin
			coefficient_num = 2'd1;
			load_coeff = 0;
		end
		LOAD3: begin 
			coefficient_num = 2'd2;
			load_coeff = 1;
		end
		WAIT3: begin
			coefficient_num = 2'd2;
			load_coeff = 0;
		end
		LOAD4: begin 
			coefficient_num = 2'd3;
			load_coeff = 1;
		end
        CLEAR : begin 
            load_coeff = 0;
            clear_new_coefficient = 1;
            coefficient_num = 2'd3;
        end
	endcase
end
// ask about wait4 needed or not

endmodule

