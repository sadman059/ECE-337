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
    output logic packet_done,
    input logic [3:0] data_size,
    input logic [13:0] bit_period
);

flex_counter #(.NUM_CNT_BITS(14))  a1(.clk(clk),.n_rst(n_rst),.count_enable(enable_timer),.clear(!enable_timer),.rollover_val(bit_period),.count_out(),.rollover_flag(shift_strobe));
flex_counter #(.NUM_CNT_BITS(4))  a2(.clk(clk),.n_rst(n_rst),.count_enable(shift_strobe),.clear(!enable_timer),.rollover_val(data_size +1'b1),.count_out(),.rollover_flag(packet_done));

endmodule
