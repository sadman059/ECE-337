// $Id: $
// File name:   ahb_lite_slave.sv
// Created:     3/21/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry

module ahb_lite_slave(
input logic clk,
input logic n_rst,
output logic [15:0] sample_data,
output logic data_ready,
output logic new_coefficient_set,
input logic [1:0] coefficient_num,
output logic [15:0] fir_coefficient,
input logic clear_new_coefficient,
input logic modwait,
input logic [15:0]fir_out,
input logic err,
input logic hsel,
input logic [3:0] haddr,
input logic hsize,
input logic [1:0] htrans,
input logic hwrite,
input logic [15:0] hwdata,
output logic [15:0] hrdata,
output logic hresp
);

logic [15:0] next_hrdata;
logic next_new_coefficient_set;
logic next_data_ready;
//logic next_data_ready1;
logic prev_hsel;
logic [1:0] prev_htrans;
logic prev_hwrite;
logic prev_hsize;
logic [3:0]prev_haddr;
logic [15:0] next_sample_data;
logic [15:0] next_fir_coefficient0;
logic [15:0] next_fir_coefficient1;
logic [15:0] next_fir_coefficient2;
logic [15:0] next_fir_coefficient3;
logic [15:0] fir_coefficient0;
logic [15:0] fir_coefficient1;
logic [15:0] fir_coefficient2;
logic [15:0] fir_coefficient3;



always_comb begin : read_block
next_hrdata = 0;
if(hsel == 1) begin 
if(htrans == 2) begin
if(hwrite == 0) begin 
if(hsize == 0) begin
case(haddr)
4'h0 : next_hrdata = {15'd0,modwait || next_new_coefficient_set};
4'h1 : next_hrdata = {7'd0,err,8'd0};
4'h2 : next_hrdata = {8'd0,fir_out[7:0]};
4'h3 : next_hrdata = {8'd0,fir_out[15:8]};
4'h4 : next_hrdata = {8'd0,next_sample_data[7:0]};
4'h5 : next_hrdata = {8'd0,next_sample_data[15:8]};
4'h6 : next_hrdata = {8'd0,next_fir_coefficient0[7:0]};
4'h7 : next_hrdata = {8'd0,next_fir_coefficient0[15:8]};
4'h8 : next_hrdata = {8'd0,next_fir_coefficient1[7:0]};
4'h9 : next_hrdata = {8'd0,next_fir_coefficient1[15:8]};
4'hA : next_hrdata = {8'd0,next_fir_coefficient2[7:0]};
4'hB : next_hrdata = {8'd0,next_fir_coefficient2[15:8]};
4'hC : next_hrdata = {8'd0,next_fir_coefficient3[7:0]};
4'hD : next_hrdata = {8'd0,next_fir_coefficient3[15:8]};
4'hE : next_hrdata = {15'd0,next_new_coefficient_set};
endcase
end else if (hsize == 1) begin
case(haddr)
4'h0, 4'h1 : next_hrdata = {7'd0,err,7'd0,modwait || next_new_coefficient_set};
4'h2, 4'h3 : next_hrdata = fir_out;
4'h4,  4'h5 : next_hrdata = next_sample_data;
4'h6,  4'h7 : next_hrdata = next_fir_coefficient0;
4'h8, 4'h9 : next_hrdata = next_fir_coefficient1;
4'hA, 4'hB : next_hrdata = next_fir_coefficient2;
4'hC, 4'hD : next_hrdata = next_fir_coefficient3;
4'hE : next_hrdata = {15'd0,next_new_coefficient_set};
endcase
end
end
end
end
end

always_comb begin : write_block
next_sample_data = sample_data;
next_fir_coefficient0 = fir_coefficient0;
next_fir_coefficient1 = fir_coefficient1;
next_fir_coefficient2 = fir_coefficient2;
next_fir_coefficient3 = fir_coefficient3;
next_data_ready = data_ready && !modwait;
next_new_coefficient_set = new_coefficient_set;

if(modwait == 1) begin
    next_data_ready = 0;
end

if(clear_new_coefficient == 1) begin
  next_new_coefficient_set = 0;
end

if(prev_hsel == 1) begin
if(prev_htrans == 2)begin
if(prev_hwrite == 1) begin
if(prev_hsize == 0) begin
    case(prev_haddr)
4'h4 : begin next_sample_data[7:0] = hwdata[7:0]; 
      next_data_ready = 1; // should i add data_ready1
end
4'h5 : begin next_sample_data[15:8] = hwdata[15:8];
      next_data_ready = 1;// should i add data_ready1
end
4'h6 : next_fir_coefficient0[7:0] = hwdata[7:0];
4'h7 : next_fir_coefficient0[15:8] = hwdata[15:8];
4'h8 : next_fir_coefficient1[7:0] = hwdata[7:0];
4'h9 : next_fir_coefficient1[15:8] = hwdata[15:8];
4'hA : next_fir_coefficient2[7:0] = hwdata[7:0];
4'hB : next_fir_coefficient2[15:8] = hwdata[15:8];
4'hC : next_fir_coefficient3[7:0] = hwdata[7:0];
4'hD : next_fir_coefficient3[15:8] = hwdata[15:8];
4'hE : next_new_coefficient_set = hwdata[0];
    
endcase
end else if (prev_hsize ==1) begin
case(prev_haddr)
4'h4,4'h5 : begin next_sample_data = hwdata;
                next_data_ready = 1;
              end
4'h6,4'h7 : next_fir_coefficient0 = hwdata;
4'h8, 4'h9 : next_fir_coefficient1 = hwdata; 
4'hA, 4'hB : next_fir_coefficient2 = hwdata; 
4'hC, 4'hD : next_fir_coefficient3 = hwdata; 
4'hE : next_new_coefficient_set = hwdata[0];
  
endcase
end
end
end
end
end

always_comb begin : fir_coeff
case(coefficient_num) 
2'd0 : fir_coefficient = fir_coefficient0;
2'd1 : fir_coefficient = fir_coefficient1;
2'd2 : fir_coefficient = fir_coefficient2;
2'd3 : fir_coefficient = fir_coefficient3;
endcase
end

always_comb begin : error
  hresp = 0;
  if((hwrite == 1 && (haddr == 4'd0 || haddr == 4'd1 || haddr == 4'd2 || haddr == 4'd3 )) || haddr == 4'd15) begin
    hresp = 1;
  end  
end



always_ff @( posedge clk, negedge n_rst ) begin : flip_flop
if(n_rst == 0) begin
prev_haddr <= 0;
prev_hsize <= 0;
prev_hsel <= 0;
prev_htrans <= 0;
prev_hwrite <= 0;
sample_data <=0;
fir_coefficient0 <= 0;
fir_coefficient1 <= 0;
fir_coefficient2 <= 0;
fir_coefficient3 <= 0;
new_coefficient_set <= 0;
hrdata <= 0;
//next_data_ready1 <= 0;
data_ready <= 0;

end else begin
prev_haddr <= haddr;
prev_hsize <= hsize;
prev_hsel <= hsel;
prev_htrans <= htrans;
prev_hwrite <= hwrite;
sample_data <= next_sample_data;
data_ready <= next_data_ready;
fir_coefficient0 <= next_fir_coefficient0;
fir_coefficient1 <= next_fir_coefficient1;
fir_coefficient2 <= next_fir_coefficient2;
fir_coefficient3 <= next_fir_coefficient3;
new_coefficient_set <= next_new_coefficient_set;
hrdata <= next_hrdata;
//next_data_ready1 <= next_data_ready;

end
end
//assign data_ready = (next_data_ready | next_data_ready1);
// need to figure out the read right after write
// need to figure out the coefficient set and the next_data_ready
// driven in a comb_block error
// next_new_coefficient
endmodule

