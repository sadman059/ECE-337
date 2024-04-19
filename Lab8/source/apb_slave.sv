// $Id: $
// File name:   apb_slave.sv
// Created:     2/29/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry

module apb_slave(
input logic clk,
input logic n_rst,
input logic [7:0] rx_data,
input logic data_ready,
input logic overrun_error,
input logic framing_error,
output logic data_read,
input logic psel,
input logic [2:0] paddr,
input logic penable,
input logic pwrite,
input logic [7:0] pwdata,
output logic [7:0] prdata,
output logic pslverr,
output logic [3:0] data_size,
output logic [13:0] bit_period
);
logic next_data_read;
logic [7:0] next_prdata;
logic [3:0] next_data_size;
logic [13:0] next_bit_period;


always_comb begin : comb
next_data_read = 0;
next_prdata = prdata;
pslverr = 0;
next_data_size = data_size;
next_bit_period = bit_period;

 if(psel == 1) begin
     if(pwrite ==0) begin
       if(paddr == 3'b000 ) begin
          if(data_ready ==1) begin
            next_prdata = 8'd1;
          end else if (data_ready == 0)begin 
           next_prdata = 8'd0;
          end
       end else if(paddr == 3'b001) begin
          if(framing_error == 1) begin
            next_prdata = 8'd1;
          end else if(overrun_error == 1) begin
            next_prdata = 8'd2;
          end else begin 
            next_prdata = 8'd0;
          end
       end else if(paddr == 3'b110) begin
           if(data_size == 8'd5) begin
            next_prdata = {3'd0,rx_data[7:3]};
            next_data_read = 1;
           end
            if(data_size == 8'd7) begin
            next_prdata = {1'd0,rx_data[7:1]};
            next_data_read = 1;
           end
            if(data_size == 8'd8) begin
            next_prdata = rx_data;
            next_data_read = 1;
           end
       end else if(paddr == 3'b010) begin
          next_prdata = bit_period[7:0];

       end else if(paddr == 3'b011) begin
          next_prdata = {2'd0,bit_period[13:8]};
       end else if(paddr == 3'b100) begin
          next_prdata = {4'd0,data_size};
       end else begin
         pslverr = 1;
     end
     
  end else if(pwrite ==1 ) begin
        if(paddr[2:0] == 3'b100) begin
              next_data_size = pwdata[3:0];
        end else if(paddr[2:0] == 3'b010) begin
            next_bit_period[7:0] = pwdata[7:0];
        end  else if(paddr[2:0] == 3'b011) begin
           next_bit_period[13:8] = pwdata[5:0];
        end else begin 
         pslverr = 1;
        end
  end
end   
end

always_ff @( posedge clk,negedge n_rst ) begin : flipflop
if(n_rst == 0)begin
    prdata <= 0;
    data_read <= 0;
    bit_period<= 0;
    data_size <= 0;
end else begin
    prdata <= next_prdata;
    data_read <= next_data_read;
    data_size <= next_data_size;
    bit_period <= next_bit_period;   
end   
end





endmodule