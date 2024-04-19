// $Id: $
// File name:   timer.sv
// Created:     2/12/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry

module timer(
    input logic clk,
    input logic n_rst,
    input logic enable_timer,
    output logic shift_strobe,
    output logic packet_done
);

flex_counter  a1(.clk(clk),.n_rst(n_rst),.count_enable(enable_timer),.clear(!enable_timer),.rollover_val(4'b1010),.count_out(),.rollover_flag(shift_strobe));
flex_counter  a2(.clk(clk),.n_rst(n_rst),.count_enable(shift_strobe),.clear(!enable_timer),.rollover_val(4'b1001),.count_out(),.rollover_flag(packet_done));

endmodule
