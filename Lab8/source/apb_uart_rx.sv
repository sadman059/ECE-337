// $Id: $
// File name:   apb_uart_rx.sv
// Created:     2/29/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry

module apb_uart_rx(
input logic clk,
input logic n_rst,
input logic serial_in,
input logic psel,
input logic [2:0] paddr,
input logic penable,
input logic pwrite,
input logic [7:0] pwdata,
output logic [7:0] prdata,
output logic pslverr
);

logic framing_error;
logic overrun_error;
logic data_read;
logic data_ready;
logic [3:0] data_size;
logic [13:0] bit_period;
logic [7:0] rx_data;

apb_slave slave1(.clk(clk),
		.n_rst(n_rst),
		.rx_data(rx_data),
		.data_ready(data_ready),
		.overrun_error(overrun_error),
		.framing_error(framing_error),
		.psel(psel),
		.paddr(paddr),
		.penable(penable),
		.pwrite(pwrite),
		.pwdata(pwdata),
		.data_read(data_read),
		.prdata(prdata),
		.pslverr(pslverr),
		.data_size(data_size),
		.bit_period(bit_period));

rcv_block uart2(.clk(clk),
		.n_rst(n_rst),
		.data_read(data_read),
		.serial_in(serial_in),
		.data_size(data_size),
		.bit_period(bit_period),
		.rx_data(rx_data),
		.data_ready(data_ready),
		.overrun_error(overrun_error),
		.framing_error(framing_error));

endmodule