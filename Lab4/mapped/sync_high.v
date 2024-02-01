/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Jan 30 19:50:58 2024
/////////////////////////////////////////////////////////////


module sync_high ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   d;

  DFFSR d_reg ( .D(async_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(d) );
  DFFSR sync_out_reg ( .D(d), .CLK(clk), .R(1'b1), .S(n_rst), .Q(sync_out) );
endmodule

