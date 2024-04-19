// $Id: $
// File name:   controller.sv
// Created:     2/22/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
module controller (
input logic clk,
input logic n_rst,
input logic dr,
input logic lc,
input logic overflow,
output logic cnt_up,
output logic clear,
output logic modwait,
output logic [2:0] op,
output logic [3:0] src1,
output logic [3:0] src2,
output logic [3:0] dest,
output logic err
);
typedef enum logic [4:0] {IDLE,LOAD1,WAIT1,LOAD2,WAIT2,LOAD3,WAIT3,LOAD4,STORE,ZERO,SORT1,SORT2,SORT3,SORT4,MUL1,ADD1,MUL2,SUB1,MUL3,ADD2,MUL4,SUB2,EIDLE } state;

state next_state;
state curr_state;
logic next_modwait;



always_comb begin : nextlogic
    next_state = curr_state;
    case(curr_state)
    IDLE : begin if(lc == 1) begin
        next_state = LOAD1;       
    end else if (dr == 0) begin
        next_state = IDLE;
    end else if (dr == 1) begin
        next_state = STORE;
    end
    end 

    LOAD1 : next_state = WAIT1;

    WAIT1 : begin if(lc == 1) begin
        next_state = LOAD2;
    end else begin
        next_state = WAIT1;
    end
    end

    LOAD2 : next_state = WAIT2;

    WAIT2 : begin if(lc == 1) begin
        next_state = LOAD3;
    end else begin
        next_state = WAIT2;
    end
    end


    LOAD3 : next_state = WAIT3;

    WAIT3 : begin if(lc == 1) begin
        next_state = LOAD4;
    end else begin
        next_state = WAIT3;
    end
    end

    LOAD4 : next_state = IDLE;

    STORE : begin if(dr == 1) begin
        next_state = ZERO;
    end else if (dr ==0) begin
        next_state = EIDLE;
    end
    end

    ZERO : next_state = SORT1;

    SORT1 : next_state = SORT2;

    SORT2 : next_state = SORT3;

    SORT3 : next_state = SORT4;

    SORT4 : next_state = MUL1;

    MUL1 : next_state = ADD1;

    ADD1 : begin if(overflow == 1) begin
        next_state = EIDLE;
    end else begin
        next_state = MUL2;
    end
    end

    MUL2 : next_state = SUB1;

    SUB1 : begin if(overflow == 1) begin
        next_state = EIDLE;
    end else begin
        next_state = MUL3;
    end
    end

    MUL3 : next_state = ADD2;

    ADD2 : begin if(overflow == 1) begin
        next_state = EIDLE;
    end else begin
        next_state = MUL4;
    end
    end

    MUL4 : next_state = SUB2;

    SUB2 : begin if(overflow == 1) begin
        next_state = EIDLE;
    end else begin
        next_state = IDLE;
    end
    end

    EIDLE : begin if(dr == 0) begin
        next_state = EIDLE;
    end else if ( dr == 1) begin
        next_state = STORE;
    end
    end
    endcase
end


always_ff @( posedge clk,negedge n_rst ) begin : flipflop
    if(n_rst == 0) begin 
        curr_state <= IDLE;
        modwait <= 0;
    end else begin 
      curr_state <= next_state;
      modwait <= next_modwait;
end
end


always_comb begin : outlogic

    cnt_up = 0;
	clear = 0;
	next_modwait = 0;
	err = 0;
	op = '0;
	src1 = '0;
	src2 = '0;
	dest = '0;

    case (curr_state)

    IDLE : begin if (lc == 1) begin
    next_modwait = 1;
    end
    end
    
    WAIT1 : begin if (lc == 1) begin
    next_modwait = 1;
    end
    end

    WAIT2 : begin if (lc == 1) begin
    next_modwait = 1;
    end
    end

    WAIT3 : begin if (lc == 1) begin
    next_modwait = 1;
    end
    end


    LOAD1 : begin
         op = 3'b011;
         dest = 4'd9;
         clear = 1;
         next_modwait = 0;
        
    end
   
    LOAD2 : begin 
        op = 3'b011;
        dest = 4'd8;
        clear = 1;
        next_modwait = 0;
       
    end
 
    LOAD3 : begin
        op = 3'b011;
        dest = 4'd7;
        clear = 1;
        next_modwait = 0;
        
    end
   
    LOAD4 : begin
            op = 3'b011;
            dest = 4'd6;
            clear = 1;
            next_modwait = 0;
           
    end

    STORE : begin
            next_modwait = 1;
            dest = 4'b0101;
            err = 0;
            op = 3'b010;
    end

    ZERO : begin
           dest = 4'b0;
           src1 = 4'b0;
           src2 = 4'b0;
           op = 3'b101;
           cnt_up = 1;
           next_modwait = 1;
    end
    SORT1 : begin
            dest = 4'b0001;
            src1 = 4'b0010;
            op = 3'b001;
            next_modwait = 1;
    end
    
    SORT2 : begin 
            dest = 4'b0010;
            src1 = 4'b0011;
            op = 3'b001;
            next_modwait = 1;
    end

    SORT3 : begin 
            dest = 4'b011;
            src1 = 4'b0100;
            op = 3'b001;
            next_modwait = 1;
    end

    SORT4 : begin 
            dest = 4'b0100;
            src1 = 4'b0101;
            op = 3'b001;
            next_modwait = 1;
    end

    MUL1 : begin 
           dest = 4'b1010;
           src1 = 4'b0001;
           src2 = 4'b0110;
           op = 3'b110;
           next_modwait = 1;
    end

    ADD1 : begin 
           dest = 4'b0;
           src1 = 4'b0;
           src2 = 4'b1010;
           op = 3'b100;
           next_modwait = 1;
    end

    MUL2 : begin
           dest = 4'b1010;
           src1 = 4'b0010;
           src2 = 4'b0111;
           op = 3'b110;
           next_modwait = 1;
    end

    SUB1 : begin
           dest = 4'b0;
           src1 = 4'b0;
           src2 = 4'b1010;
           op = 3'b101;
           next_modwait = 1;
    end

    MUL3 : begin
           dest = 4'b1010;
           src1 = 4'b011;
           src2 = 4'b1000;
           op = 3'b110;
           next_modwait = 1;
    end
    
    ADD2 : begin 
           dest = 4'b0;
           src1 = 4'b0;
           src2 = 4'b1010;
           op = 3'b100;
           next_modwait = 1;
    end

    MUL4 : begin 
           dest = 4'b1010;
           src1 = 4'b0100;
           src2 = 4'b1001;
           op = 3'b110;
           next_modwait = 1;
    end

    SUB2 : begin
           dest = 4'b0;
           src1 = 4'b0;
           src2 = 4'b1010;
           op = 3'b101;
           next_modwait = 1;
    end


    EIDLE : begin
         err = 1;
    end
    endcase 
end


endmodule