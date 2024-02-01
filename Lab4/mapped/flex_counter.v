/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Feb  1 00:06:43 2024
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100;

  DFFSR \count_out_reg[0]  ( .D(n57), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n56), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n55), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI21X1 U51 ( .A(n58), .B(n59), .C(n60), .Y(n57) );
  OAI21X1 U52 ( .A(n61), .B(n58), .C(n62), .Y(n60) );
  INVX1 U53 ( .A(n63), .Y(n59) );
  MUX2X1 U54 ( .B(n64), .A(n65), .S(count_out[1]), .Y(n56) );
  NAND2X1 U55 ( .A(n66), .B(count_out[0]), .Y(n64) );
  MUX2X1 U56 ( .B(n67), .A(n68), .S(count_out[2]), .Y(n55) );
  INVX1 U57 ( .A(n69), .Y(n68) );
  OAI21X1 U58 ( .A(n70), .B(n67), .C(n71), .Y(n54) );
  OAI21X1 U59 ( .A(n66), .B(n69), .C(count_out[3]), .Y(n71) );
  OAI21X1 U60 ( .A(count_out[1]), .B(n72), .C(n65), .Y(n69) );
  AOI21X1 U61 ( .A(n58), .B(n66), .C(n63), .Y(n65) );
  NAND3X1 U62 ( .A(count_out[0]), .B(count_out[1]), .C(n66), .Y(n67) );
  INVX1 U63 ( .A(n72), .Y(n66) );
  NAND2X1 U64 ( .A(n62), .B(n73), .Y(n72) );
  INVX1 U65 ( .A(n61), .Y(n73) );
  OAI21X1 U66 ( .A(rollover_val[3]), .B(n74), .C(n75), .Y(n61) );
  OAI21X1 U67 ( .A(count_out[3]), .B(n76), .C(n77), .Y(n75) );
  OAI21X1 U68 ( .A(rollover_val[2]), .B(n70), .C(n78), .Y(n77) );
  OAI21X1 U69 ( .A(count_out[2]), .B(n79), .C(n80), .Y(n78) );
  AOI22X1 U70 ( .A(n81), .B(rollover_val[0]), .C(rollover_val[1]), .D(n82), 
        .Y(n80) );
  AND2X1 U71 ( .A(n58), .B(n83), .Y(n81) );
  INVX1 U72 ( .A(rollover_val[2]), .Y(n79) );
  INVX1 U73 ( .A(rollover_val[3]), .Y(n76) );
  INVX1 U74 ( .A(count_out[3]), .Y(n74) );
  OAI21X1 U75 ( .A(n84), .B(n85), .C(n86), .Y(n53) );
  NAND2X1 U76 ( .A(rollover_flag), .B(n63), .Y(n86) );
  NAND2X1 U77 ( .A(n87), .B(n88), .Y(n85) );
  MUX2X1 U78 ( .B(n89), .A(n90), .S(n91), .Y(n88) );
  NOR2X1 U79 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n90) );
  OR2X1 U80 ( .A(n92), .B(n93), .Y(n89) );
  OAI21X1 U81 ( .A(rollover_val[0]), .B(n82), .C(n83), .Y(n93) );
  NAND2X1 U82 ( .A(count_out[1]), .B(n94), .Y(n83) );
  XOR2X1 U83 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n92) );
  MUX2X1 U84 ( .B(n58), .A(n95), .S(rollover_val[0]), .Y(n87) );
  OAI21X1 U85 ( .A(count_out[1]), .B(n94), .C(n58), .Y(n95) );
  INVX1 U86 ( .A(rollover_val[1]), .Y(n94) );
  INVX1 U87 ( .A(count_out[0]), .Y(n58) );
  NAND3X1 U88 ( .A(n96), .B(n97), .C(n62), .Y(n84) );
  NOR2X1 U89 ( .A(n63), .B(clear), .Y(n62) );
  NOR2X1 U90 ( .A(count_enable), .B(clear), .Y(n63) );
  OAI21X1 U91 ( .A(n98), .B(n82), .C(n91), .Y(n97) );
  INVX1 U92 ( .A(count_out[1]), .Y(n82) );
  XOR2X1 U93 ( .A(n70), .B(rollover_val[2]), .Y(n98) );
  INVX1 U94 ( .A(count_out[2]), .Y(n70) );
  XOR2X1 U95 ( .A(n99), .B(count_out[3]), .Y(n96) );
  OAI21X1 U96 ( .A(rollover_val[2]), .B(n100), .C(rollover_val[3]), .Y(n99) );
  INVX1 U97 ( .A(n91), .Y(n100) );
  NOR2X1 U98 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n91) );
endmodule

