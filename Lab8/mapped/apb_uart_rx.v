/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Mar  7 12:13:59 2024
/////////////////////////////////////////////////////////////


module apb_slave ( clk, n_rst, rx_data, data_ready, overrun_error, 
        framing_error, data_read, psel, paddr, penable, pwrite, pwdata, prdata, 
        pslverr, data_size, bit_period );
  input [7:0] rx_data;
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  output [3:0] data_size;
  output [13:0] bit_period;
  input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable,
         pwrite;
  output data_read, pslverr;
  wire   next_data_read, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148;

  DFFSR \data_size_reg[3]  ( .D(n173), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[3]) );
  DFFSR \data_size_reg[2]  ( .D(n172), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[2]) );
  DFFSR \data_size_reg[1]  ( .D(n140), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[1]) );
  DFFSR \data_size_reg[0]  ( .D(n171), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[0]) );
  DFFSR data_read_reg ( .D(next_data_read), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_read) );
  DFFSR \bit_period_reg[13]  ( .D(n169), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[13]) );
  DFFSR \bit_period_reg[12]  ( .D(n170), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[12]) );
  DFFSR \bit_period_reg[11]  ( .D(n141), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[11]) );
  DFFSR \bit_period_reg[10]  ( .D(n142), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[10]) );
  DFFSR \bit_period_reg[9]  ( .D(n143), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[9]) );
  DFFSR \bit_period_reg[8]  ( .D(n144), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[8]) );
  DFFSR \bit_period_reg[7]  ( .D(n165), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[7]) );
  DFFSR \prdata_reg[7]  ( .D(n157), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[7]) );
  DFFSR \bit_period_reg[6]  ( .D(n166), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[6]) );
  DFFSR \prdata_reg[6]  ( .D(n158), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[6]) );
  DFFSR \bit_period_reg[5]  ( .D(n167), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[5]) );
  DFFSR \prdata_reg[5]  ( .D(n159), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[5]) );
  DFFSR \bit_period_reg[4]  ( .D(n168), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[4]) );
  DFFSR \prdata_reg[4]  ( .D(n160), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[4]) );
  DFFSR \bit_period_reg[3]  ( .D(n145), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[3]) );
  DFFSR \prdata_reg[3]  ( .D(n161), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[3]) );
  DFFSR \bit_period_reg[2]  ( .D(n146), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[2]) );
  DFFSR \prdata_reg[2]  ( .D(n162), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[2]) );
  DFFSR \bit_period_reg[1]  ( .D(n147), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[1]) );
  DFFSR \prdata_reg[1]  ( .D(n163), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[1]) );
  DFFSR \bit_period_reg[0]  ( .D(n148), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[0]) );
  DFFSR \prdata_reg[0]  ( .D(n164), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[0]) );
  OAI21X1 U30 ( .A(n28), .B(n29), .C(n30), .Y(pslverr) );
  NAND3X1 U31 ( .A(paddr[2]), .B(paddr[0]), .C(psel), .Y(n30) );
  NAND2X1 U32 ( .A(n31), .B(n32), .Y(n29) );
  NOR2X1 U33 ( .A(n33), .B(n34), .Y(next_data_read) );
  OAI21X1 U34 ( .A(n35), .B(n36), .C(n37), .Y(n34) );
  NOR2X1 U35 ( .A(n38), .B(n39), .Y(n35) );
  INVX1 U36 ( .A(n40), .Y(n140) );
  MUX2X1 U37 ( .B(pwdata[1]), .A(data_size[1]), .S(n41), .Y(n40) );
  MUX2X1 U38 ( .B(n42), .A(n43), .S(n44), .Y(n141) );
  MUX2X1 U39 ( .B(n45), .A(n46), .S(n44), .Y(n142) );
  INVX1 U40 ( .A(pwdata[2]), .Y(n46) );
  INVX1 U41 ( .A(n47), .Y(n143) );
  MUX2X1 U42 ( .B(bit_period[9]), .A(pwdata[1]), .S(n44), .Y(n47) );
  INVX1 U43 ( .A(n48), .Y(n144) );
  MUX2X1 U44 ( .B(bit_period[8]), .A(pwdata[0]), .S(n44), .Y(n48) );
  MUX2X1 U45 ( .B(n49), .A(n43), .S(n50), .Y(n145) );
  INVX1 U46 ( .A(bit_period[3]), .Y(n49) );
  INVX1 U47 ( .A(n51), .Y(n146) );
  MUX2X1 U48 ( .B(bit_period[2]), .A(pwdata[2]), .S(n50), .Y(n51) );
  INVX1 U49 ( .A(n52), .Y(n147) );
  MUX2X1 U50 ( .B(bit_period[1]), .A(pwdata[1]), .S(n50), .Y(n52) );
  INVX1 U51 ( .A(n53), .Y(n148) );
  MUX2X1 U52 ( .B(bit_period[0]), .A(pwdata[0]), .S(n50), .Y(n53) );
  MUX2X1 U53 ( .B(n43), .A(n54), .S(n41), .Y(n173) );
  INVX1 U54 ( .A(pwdata[3]), .Y(n43) );
  INVX1 U55 ( .A(n55), .Y(n172) );
  MUX2X1 U56 ( .B(pwdata[2]), .A(data_size[2]), .S(n41), .Y(n55) );
  INVX1 U57 ( .A(n56), .Y(n171) );
  MUX2X1 U58 ( .B(pwdata[0]), .A(data_size[0]), .S(n41), .Y(n56) );
  NAND3X1 U59 ( .A(pwrite), .B(psel), .C(n57), .Y(n41) );
  INVX1 U60 ( .A(n58), .Y(n170) );
  MUX2X1 U61 ( .B(bit_period[12]), .A(pwdata[4]), .S(n44), .Y(n58) );
  INVX1 U62 ( .A(n59), .Y(n169) );
  MUX2X1 U63 ( .B(bit_period[13]), .A(pwdata[5]), .S(n44), .Y(n59) );
  NOR2X1 U64 ( .A(n31), .B(n28), .Y(n44) );
  INVX1 U65 ( .A(n60), .Y(n168) );
  MUX2X1 U66 ( .B(bit_period[4]), .A(pwdata[4]), .S(n50), .Y(n60) );
  INVX1 U67 ( .A(n61), .Y(n167) );
  MUX2X1 U68 ( .B(bit_period[5]), .A(pwdata[5]), .S(n50), .Y(n61) );
  INVX1 U69 ( .A(n62), .Y(n166) );
  MUX2X1 U70 ( .B(bit_period[6]), .A(pwdata[6]), .S(n50), .Y(n62) );
  INVX1 U71 ( .A(n63), .Y(n165) );
  MUX2X1 U72 ( .B(bit_period[7]), .A(pwdata[7]), .S(n50), .Y(n63) );
  NOR2X1 U73 ( .A(n32), .B(n28), .Y(n50) );
  NAND3X1 U74 ( .A(psel), .B(n64), .C(pwrite), .Y(n28) );
  INVX1 U75 ( .A(n65), .Y(n164) );
  MUX2X1 U76 ( .B(prdata[0]), .A(n66), .S(n67), .Y(n65) );
  NAND3X1 U77 ( .A(n68), .B(n69), .C(n70), .Y(n66) );
  NOR2X1 U78 ( .A(n71), .B(n72), .Y(n70) );
  OAI22X1 U79 ( .A(n73), .B(n74), .C(n75), .D(n64), .Y(n72) );
  OAI21X1 U80 ( .A(n76), .B(n77), .C(n78), .Y(n71) );
  NAND3X1 U81 ( .A(n79), .B(n38), .C(prdata[0]), .Y(n78) );
  NAND2X1 U82 ( .A(n80), .B(n81), .Y(n77) );
  MUX2X1 U83 ( .B(data_ready), .A(framing_error), .S(paddr[0]), .Y(n76) );
  AOI22X1 U84 ( .A(bit_period[8]), .B(n82), .C(rx_data[1]), .D(n83), .Y(n69)
         );
  AOI22X1 U85 ( .A(bit_period[0]), .B(n84), .C(rx_data[0]), .D(n36), .Y(n68)
         );
  OAI21X1 U86 ( .A(n85), .B(n86), .C(n87), .Y(n163) );
  OAI21X1 U87 ( .A(n88), .B(n89), .C(n67), .Y(n87) );
  OAI21X1 U88 ( .A(n90), .B(n91), .C(n92), .Y(n89) );
  AOI22X1 U89 ( .A(rx_data[2]), .B(n83), .C(bit_period[1]), .D(n84), .Y(n92)
         );
  INVX1 U90 ( .A(rx_data[1]), .Y(n90) );
  NAND2X1 U91 ( .A(n93), .B(n94), .Y(n88) );
  AOI22X1 U92 ( .A(n82), .B(bit_period[9]), .C(n95), .D(rx_data[4]), .Y(n94)
         );
  INVX1 U93 ( .A(n96), .Y(n93) );
  OAI21X1 U94 ( .A(n64), .B(n97), .C(n98), .Y(n96) );
  NAND3X1 U95 ( .A(overrun_error), .B(paddr[0]), .C(n99), .Y(n98) );
  NOR2X1 U96 ( .A(paddr[1]), .B(framing_error), .Y(n99) );
  INVX1 U97 ( .A(prdata[1]), .Y(n86) );
  OAI21X1 U98 ( .A(n85), .B(n100), .C(n101), .Y(n162) );
  OAI21X1 U99 ( .A(n102), .B(n103), .C(n67), .Y(n101) );
  OAI21X1 U100 ( .A(n91), .B(n104), .C(n105), .Y(n103) );
  AOI22X1 U101 ( .A(n83), .B(rx_data[3]), .C(bit_period[2]), .D(n84), .Y(n105)
         );
  INVX1 U102 ( .A(rx_data[2]), .Y(n104) );
  OAI21X1 U103 ( .A(n31), .B(n45), .C(n106), .Y(n102) );
  AOI22X1 U104 ( .A(n57), .B(data_size[2]), .C(rx_data[5]), .D(n95), .Y(n106)
         );
  INVX1 U105 ( .A(bit_period[10]), .Y(n45) );
  INVX1 U106 ( .A(prdata[2]), .Y(n100) );
  OAI21X1 U107 ( .A(n85), .B(n107), .C(n108), .Y(n161) );
  OAI21X1 U108 ( .A(n109), .B(n110), .C(n67), .Y(n108) );
  OAI21X1 U109 ( .A(n74), .B(n91), .C(n111), .Y(n110) );
  AOI22X1 U110 ( .A(rx_data[4]), .B(n83), .C(bit_period[3]), .D(n84), .Y(n111)
         );
  INVX1 U111 ( .A(n36), .Y(n91) );
  INVX1 U112 ( .A(rx_data[3]), .Y(n74) );
  OAI21X1 U113 ( .A(n31), .B(n42), .C(n112), .Y(n109) );
  AOI22X1 U114 ( .A(n57), .B(data_size[3]), .C(rx_data[6]), .D(n95), .Y(n112)
         );
  INVX1 U115 ( .A(n64), .Y(n57) );
  NAND3X1 U116 ( .A(n113), .B(n80), .C(paddr[2]), .Y(n64) );
  INVX1 U117 ( .A(paddr[1]), .Y(n80) );
  INVX1 U118 ( .A(bit_period[11]), .Y(n42) );
  INVX1 U119 ( .A(prdata[3]), .Y(n107) );
  OAI21X1 U120 ( .A(n85), .B(n114), .C(n115), .Y(n160) );
  OAI21X1 U121 ( .A(n116), .B(n117), .C(n67), .Y(n115) );
  INVX1 U122 ( .A(n118), .Y(n117) );
  AOI22X1 U123 ( .A(n36), .B(rx_data[4]), .C(n84), .D(bit_period[4]), .Y(n118)
         );
  OAI21X1 U124 ( .A(n119), .B(n120), .C(n121), .Y(n116) );
  AOI22X1 U125 ( .A(rx_data[7]), .B(n95), .C(bit_period[12]), .D(n82), .Y(n121) );
  INVX1 U126 ( .A(n73), .Y(n95) );
  NAND2X1 U127 ( .A(n79), .B(n122), .Y(n73) );
  INVX1 U128 ( .A(rx_data[5]), .Y(n120) );
  INVX1 U129 ( .A(prdata[4]), .Y(n114) );
  INVX1 U130 ( .A(n123), .Y(n159) );
  AOI21X1 U131 ( .A(n124), .B(prdata[5]), .C(n125), .Y(n123) );
  AOI21X1 U132 ( .A(n126), .B(n127), .C(n128), .Y(n125) );
  AOI22X1 U133 ( .A(n36), .B(rx_data[5]), .C(n84), .D(bit_period[5]), .Y(n127)
         );
  AOI22X1 U134 ( .A(n83), .B(rx_data[6]), .C(n82), .D(bit_period[13]), .Y(n126) );
  INVX1 U135 ( .A(n31), .Y(n82) );
  NAND3X1 U136 ( .A(paddr[0]), .B(n81), .C(paddr[1]), .Y(n31) );
  OAI21X1 U137 ( .A(n129), .B(n128), .C(n130), .Y(n158) );
  NAND2X1 U138 ( .A(prdata[6]), .B(n124), .Y(n130) );
  AOI21X1 U139 ( .A(rx_data[6]), .B(n36), .C(n131), .Y(n129) );
  INVX1 U140 ( .A(n132), .Y(n131) );
  AOI22X1 U141 ( .A(n84), .B(bit_period[6]), .C(n83), .D(rx_data[7]), .Y(n132)
         );
  INVX1 U142 ( .A(n119), .Y(n83) );
  NAND3X1 U143 ( .A(n133), .B(n122), .C(data_size[1]), .Y(n119) );
  INVX1 U144 ( .A(n38), .Y(n122) );
  INVX1 U145 ( .A(n39), .Y(n133) );
  OAI21X1 U146 ( .A(n134), .B(n128), .C(n135), .Y(n157) );
  NAND2X1 U147 ( .A(prdata[7]), .B(n124), .Y(n135) );
  INVX1 U148 ( .A(n85), .Y(n124) );
  AOI21X1 U149 ( .A(n38), .B(n79), .C(n128), .Y(n85) );
  NOR2X1 U150 ( .A(n39), .B(n136), .Y(n79) );
  OAI21X1 U151 ( .A(n38), .B(n97), .C(n137), .Y(n136) );
  INVX1 U152 ( .A(data_size[1]), .Y(n97) );
  NAND3X1 U153 ( .A(data_size[0]), .B(n54), .C(data_size[2]), .Y(n38) );
  INVX1 U154 ( .A(data_size[3]), .Y(n54) );
  INVX1 U155 ( .A(n67), .Y(n128) );
  NOR2X1 U156 ( .A(n33), .B(n138), .Y(n67) );
  OAI21X1 U157 ( .A(n113), .B(n81), .C(n37), .Y(n138) );
  INVX1 U158 ( .A(pwrite), .Y(n37) );
  INVX1 U159 ( .A(psel), .Y(n33) );
  AOI22X1 U160 ( .A(bit_period[7]), .B(n84), .C(rx_data[7]), .D(n36), .Y(n134)
         );
  NOR2X1 U161 ( .A(n137), .B(n39), .Y(n36) );
  NAND3X1 U162 ( .A(paddr[2]), .B(n113), .C(paddr[1]), .Y(n39) );
  NAND3X1 U163 ( .A(data_size[3]), .B(n75), .C(n139), .Y(n137) );
  NOR2X1 U164 ( .A(data_size[2]), .B(data_size[1]), .Y(n139) );
  INVX1 U165 ( .A(data_size[0]), .Y(n75) );
  INVX1 U166 ( .A(n32), .Y(n84) );
  NAND3X1 U167 ( .A(n113), .B(n81), .C(paddr[1]), .Y(n32) );
  INVX1 U168 ( .A(paddr[2]), .Y(n81) );
  INVX1 U169 ( .A(paddr[0]), .Y(n113) );
endmodule


module flex_stp_sr_NUM_BITS9 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[8]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n9) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;


  flex_stp_sr_NUM_BITS9 dut ( .clk(clk), .n_rst(n_rst), .shift_enable(
        shift_strobe), .serial_in(serial_in), .parallel_out({stop_bit, 
        packet_data}) );
endmodule


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected, 
        new_packet_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected, new_packet_detected;
  wire   start_bit_detected, old_sample, new_sample, sync_phase, n4;
  assign new_packet_detected = start_bit_detected;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U6 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX1 U7 ( .A(old_sample), .Y(n4) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U3 ( .A(sbc_clear), .B(n2), .Y(n5) );
  MUX2X1 U4 ( .B(framing_error), .A(n3), .S(sbc_enable), .Y(n2) );
  INVX1 U5 ( .A(stop_bit), .Y(n3) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_inc_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_dec_0 ( A, SUM );
  input [14:0] A;
  output [14:0] SUM;
  wire   n2, n4, n6, n8, n10, n12, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33;

  INVX2 U1 ( .A(n29), .Y(SUM[13]) );
  INVX2 U2 ( .A(A[12]), .Y(n2) );
  INVX2 U3 ( .A(n32), .Y(SUM[11]) );
  INVX2 U4 ( .A(A[10]), .Y(n4) );
  INVX2 U5 ( .A(n15), .Y(SUM[9]) );
  INVX2 U6 ( .A(A[8]), .Y(n6) );
  INVX2 U7 ( .A(n19), .Y(SUM[7]) );
  INVX2 U8 ( .A(A[6]), .Y(n8) );
  INVX2 U9 ( .A(n22), .Y(SUM[5]) );
  INVX2 U10 ( .A(A[4]), .Y(n10) );
  INVX2 U11 ( .A(n25), .Y(SUM[3]) );
  INVX2 U12 ( .A(A[2]), .Y(n12) );
  INVX2 U13 ( .A(n28), .Y(SUM[1]) );
  INVX2 U14 ( .A(A[0]), .Y(SUM[0]) );
  AOI21X1 U15 ( .A(n16), .B(A[9]), .C(n17), .Y(n15) );
  OAI21X1 U16 ( .A(n18), .B(n6), .C(n16), .Y(SUM[8]) );
  AOI21X1 U17 ( .A(n20), .B(A[7]), .C(n18), .Y(n19) );
  OAI21X1 U18 ( .A(n21), .B(n8), .C(n20), .Y(SUM[6]) );
  AOI21X1 U19 ( .A(n23), .B(A[5]), .C(n21), .Y(n22) );
  OAI21X1 U20 ( .A(n24), .B(n10), .C(n23), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n26), .B(A[3]), .C(n24), .Y(n25) );
  OAI21X1 U22 ( .A(n27), .B(n12), .C(n26), .Y(SUM[2]) );
  AOI21X1 U23 ( .A(A[0]), .B(A[1]), .C(n27), .Y(n28) );
  AOI21X1 U24 ( .A(n30), .B(A[13]), .C(SUM[14]), .Y(n29) );
  NOR2X1 U25 ( .A(n30), .B(A[13]), .Y(SUM[14]) );
  OAI21X1 U26 ( .A(n31), .B(n2), .C(n30), .Y(SUM[12]) );
  NAND2X1 U27 ( .A(n31), .B(n2), .Y(n30) );
  AOI21X1 U28 ( .A(n33), .B(A[11]), .C(n31), .Y(n32) );
  NOR2X1 U29 ( .A(n33), .B(A[11]), .Y(n31) );
  OAI21X1 U30 ( .A(n17), .B(n4), .C(n33), .Y(SUM[10]) );
  NAND2X1 U31 ( .A(n17), .B(n4), .Y(n33) );
  NOR2X1 U32 ( .A(n16), .B(A[9]), .Y(n17) );
  NAND2X1 U33 ( .A(n18), .B(n6), .Y(n16) );
  NOR2X1 U34 ( .A(n20), .B(A[7]), .Y(n18) );
  NAND2X1 U35 ( .A(n21), .B(n8), .Y(n20) );
  NOR2X1 U36 ( .A(n23), .B(A[5]), .Y(n21) );
  NAND2X1 U37 ( .A(n24), .B(n10), .Y(n23) );
  NOR2X1 U38 ( .A(n26), .B(A[3]), .Y(n24) );
  NAND2X1 U39 ( .A(n27), .B(n12), .Y(n26) );
  NOR2X1 U40 ( .A(A[1]), .B(A[0]), .Y(n27) );
endmodule


module flex_counter_NUM_CNT_BITS14 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [13:0] rollover_val;
  output [13:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19,
         N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n1, n2, n4, n5, n6, n7, n8, n9, n10, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128;

  DFFSR \count_out_reg[0]  ( .D(n99), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(n85), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[1]  ( .D(n98), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n97), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n96), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n95), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n94), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n93), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n92), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n91), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(n90), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_out_reg[10]  ( .D(n89), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[10]) );
  DFFSR \count_out_reg[11]  ( .D(n88), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[11]) );
  DFFSR \count_out_reg[12]  ( .D(n87), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[12]) );
  DFFSR \count_out_reg[13]  ( .D(n86), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[13]) );
  flex_counter_NUM_CNT_BITS14_DW01_inc_0 r315 ( .A(count_out), .SUM({N37, N36, 
        N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24}) );
  flex_counter_NUM_CNT_BITS14_DW01_dec_0 sub_30 ( .A({1'b0, rollover_val}), 
        .SUM({N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, 
        N5}) );
  INVX2 U8 ( .A(n104), .Y(n2) );
  OAI21X1 U9 ( .A(n1), .B(n2), .C(n4), .Y(n99) );
  AOI22X1 U21 ( .A(n5), .B(n6), .C(N24), .D(n7), .Y(n4) );
  OAI21X1 U22 ( .A(n8), .B(n2), .C(n9), .Y(n98) );
  NAND2X1 U23 ( .A(N25), .B(n7), .Y(n9) );
  OAI21X1 U24 ( .A(n10), .B(n2), .C(n26), .Y(n97) );
  NAND2X1 U25 ( .A(N26), .B(n7), .Y(n26) );
  OAI21X1 U26 ( .A(n27), .B(n2), .C(n28), .Y(n96) );
  NAND2X1 U27 ( .A(N27), .B(n7), .Y(n28) );
  OAI21X1 U28 ( .A(n29), .B(n2), .C(n30), .Y(n95) );
  NAND2X1 U29 ( .A(N28), .B(n7), .Y(n30) );
  OAI21X1 U30 ( .A(n31), .B(n2), .C(n32), .Y(n94) );
  NAND2X1 U31 ( .A(N29), .B(n7), .Y(n32) );
  OAI21X1 U32 ( .A(n33), .B(n2), .C(n34), .Y(n93) );
  NAND2X1 U33 ( .A(N30), .B(n7), .Y(n34) );
  OAI21X1 U34 ( .A(n35), .B(n2), .C(n36), .Y(n92) );
  NAND2X1 U35 ( .A(N31), .B(n7), .Y(n36) );
  OAI21X1 U36 ( .A(n37), .B(n2), .C(n38), .Y(n91) );
  NAND2X1 U37 ( .A(N32), .B(n7), .Y(n38) );
  OAI21X1 U38 ( .A(n39), .B(n2), .C(n40), .Y(n90) );
  NAND2X1 U39 ( .A(N33), .B(n7), .Y(n40) );
  OAI21X1 U40 ( .A(n41), .B(n2), .C(n42), .Y(n89) );
  NAND2X1 U41 ( .A(N34), .B(n7), .Y(n42) );
  OAI21X1 U42 ( .A(n43), .B(n2), .C(n44), .Y(n88) );
  NAND2X1 U43 ( .A(N35), .B(n7), .Y(n44) );
  OAI21X1 U44 ( .A(n45), .B(n2), .C(n46), .Y(n87) );
  NAND2X1 U45 ( .A(N36), .B(n7), .Y(n46) );
  OAI21X1 U46 ( .A(n47), .B(n2), .C(n48), .Y(n86) );
  NAND2X1 U47 ( .A(N37), .B(n7), .Y(n48) );
  NOR2X1 U48 ( .A(n49), .B(n6), .Y(n7) );
  AND2X1 U49 ( .A(n50), .B(n51), .Y(n6) );
  OAI21X1 U50 ( .A(rollover_val[13]), .B(n47), .C(n52), .Y(n51) );
  OAI21X1 U51 ( .A(count_out[13]), .B(n53), .C(n54), .Y(n52) );
  OAI21X1 U52 ( .A(rollover_val[12]), .B(n45), .C(n55), .Y(n54) );
  OAI21X1 U53 ( .A(count_out[12]), .B(n56), .C(n57), .Y(n55) );
  AOI22X1 U54 ( .A(rollover_val[11]), .B(n58), .C(n59), .D(n43), .Y(n57) );
  INVX1 U55 ( .A(n60), .Y(n59) );
  NAND2X1 U56 ( .A(count_out[11]), .B(n60), .Y(n58) );
  OAI21X1 U57 ( .A(rollover_val[10]), .B(n41), .C(n61), .Y(n60) );
  OAI21X1 U58 ( .A(count_out[10]), .B(n62), .C(n63), .Y(n61) );
  AOI22X1 U59 ( .A(rollover_val[9]), .B(n64), .C(n65), .D(n39), .Y(n63) );
  INVX1 U60 ( .A(count_out[9]), .Y(n39) );
  INVX1 U61 ( .A(n66), .Y(n65) );
  NAND2X1 U62 ( .A(count_out[9]), .B(n66), .Y(n64) );
  OAI21X1 U63 ( .A(rollover_val[8]), .B(n37), .C(n67), .Y(n66) );
  OAI21X1 U64 ( .A(count_out[8]), .B(n68), .C(n69), .Y(n67) );
  AOI22X1 U65 ( .A(rollover_val[7]), .B(n70), .C(n71), .D(n35), .Y(n69) );
  INVX1 U66 ( .A(n72), .Y(n71) );
  NAND2X1 U67 ( .A(count_out[7]), .B(n72), .Y(n70) );
  OAI21X1 U68 ( .A(rollover_val[6]), .B(n33), .C(n73), .Y(n72) );
  OAI21X1 U69 ( .A(count_out[6]), .B(n74), .C(n75), .Y(n73) );
  AOI22X1 U70 ( .A(rollover_val[5]), .B(n76), .C(n77), .D(n31), .Y(n75) );
  INVX1 U71 ( .A(count_out[5]), .Y(n31) );
  INVX1 U72 ( .A(n78), .Y(n77) );
  NAND2X1 U73 ( .A(count_out[5]), .B(n78), .Y(n76) );
  OAI22X1 U74 ( .A(n79), .B(n80), .C(rollover_val[4]), .D(n29), .Y(n78) );
  OAI21X1 U75 ( .A(count_out[3]), .B(n81), .C(n82), .Y(n80) );
  OAI21X1 U76 ( .A(n83), .B(n27), .C(rollover_val[3]), .Y(n82) );
  INVX1 U77 ( .A(n81), .Y(n83) );
  OAI21X1 U78 ( .A(rollover_val[2]), .B(n10), .C(n84), .Y(n81) );
  OAI21X1 U79 ( .A(count_out[2]), .B(n100), .C(n101), .Y(n84) );
  AOI22X1 U80 ( .A(n102), .B(rollover_val[0]), .C(rollover_val[1]), .D(n8), 
        .Y(n101) );
  INVX1 U81 ( .A(n103), .Y(n102) );
  OAI21X1 U82 ( .A(n8), .B(rollover_val[1]), .C(n1), .Y(n103) );
  INVX1 U83 ( .A(rollover_val[2]), .Y(n100) );
  AND2X1 U84 ( .A(n29), .B(rollover_val[4]), .Y(n79) );
  INVX1 U85 ( .A(rollover_val[6]), .Y(n74) );
  INVX1 U86 ( .A(rollover_val[8]), .Y(n68) );
  INVX1 U87 ( .A(count_out[8]), .Y(n37) );
  INVX1 U88 ( .A(rollover_val[10]), .Y(n62) );
  INVX1 U89 ( .A(rollover_val[12]), .Y(n56) );
  INVX1 U90 ( .A(count_out[12]), .Y(n45) );
  INVX1 U91 ( .A(rollover_val[13]), .Y(n53) );
  INVX1 U92 ( .A(count_out[13]), .Y(n47) );
  OAI21X1 U93 ( .A(n49), .B(n50), .C(n105), .Y(n85) );
  NAND2X1 U94 ( .A(rollover_flag), .B(n104), .Y(n105) );
  NAND2X1 U95 ( .A(n106), .B(n107), .Y(n50) );
  NOR2X1 U96 ( .A(n108), .B(n109), .Y(n107) );
  NAND3X1 U97 ( .A(n110), .B(n111), .C(n112), .Y(n109) );
  NOR2X1 U98 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U99 ( .A(count_out[9]), .B(N14), .Y(n114) );
  XOR2X1 U100 ( .A(count_out[8]), .B(N13), .Y(n113) );
  XOR2X1 U101 ( .A(n41), .B(N15), .Y(n111) );
  INVX1 U102 ( .A(count_out[10]), .Y(n41) );
  XOR2X1 U103 ( .A(n43), .B(N16), .Y(n110) );
  INVX1 U104 ( .A(count_out[11]), .Y(n43) );
  NAND3X1 U105 ( .A(n115), .B(n116), .C(n117), .Y(n108) );
  NOR2X1 U106 ( .A(N19), .B(n118), .Y(n117) );
  XOR2X1 U107 ( .A(count_out[5]), .B(N10), .Y(n118) );
  XOR2X1 U108 ( .A(n33), .B(N11), .Y(n116) );
  INVX1 U109 ( .A(count_out[6]), .Y(n33) );
  XOR2X1 U110 ( .A(n35), .B(N12), .Y(n115) );
  INVX1 U111 ( .A(count_out[7]), .Y(n35) );
  NOR2X1 U112 ( .A(n119), .B(n120), .Y(n106) );
  NAND3X1 U113 ( .A(n121), .B(n122), .C(n123), .Y(n120) );
  XOR2X1 U114 ( .A(n27), .B(N8), .Y(n123) );
  INVX1 U115 ( .A(count_out[3]), .Y(n27) );
  XOR2X1 U116 ( .A(n29), .B(N9), .Y(n122) );
  INVX1 U117 ( .A(count_out[4]), .Y(n29) );
  XOR2X1 U118 ( .A(n10), .B(N7), .Y(n121) );
  INVX1 U119 ( .A(count_out[2]), .Y(n10) );
  NAND3X1 U120 ( .A(n124), .B(n125), .C(n126), .Y(n119) );
  NOR2X1 U121 ( .A(n127), .B(n128), .Y(n126) );
  XOR2X1 U122 ( .A(count_out[13]), .B(N18), .Y(n128) );
  XOR2X1 U123 ( .A(count_out[12]), .B(N17), .Y(n127) );
  XOR2X1 U124 ( .A(n1), .B(N5), .Y(n125) );
  INVX1 U125 ( .A(count_out[0]), .Y(n1) );
  XOR2X1 U126 ( .A(n8), .B(N6), .Y(n124) );
  INVX1 U127 ( .A(count_out[1]), .Y(n8) );
  INVX1 U128 ( .A(n5), .Y(n49) );
  NOR2X1 U129 ( .A(n104), .B(clear), .Y(n5) );
  NOR2X1 U130 ( .A(count_enable), .B(clear), .Y(n104) );
endmodule


module flex_counter_NUM_CNT_BITS4 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n53, n54, n55, n56, n57, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48;

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
  OAI21X1 U7 ( .A(n1), .B(n2), .C(n3), .Y(n57) );
  OAI21X1 U9 ( .A(n4), .B(n1), .C(n5), .Y(n3) );
  INVX1 U10 ( .A(n6), .Y(n2) );
  MUX2X1 U11 ( .B(n7), .A(n8), .S(count_out[1]), .Y(n56) );
  NAND2X1 U12 ( .A(n9), .B(count_out[0]), .Y(n7) );
  MUX2X1 U13 ( .B(n10), .A(n16), .S(count_out[2]), .Y(n55) );
  INVX1 U14 ( .A(n17), .Y(n16) );
  OAI21X1 U15 ( .A(n18), .B(n10), .C(n19), .Y(n54) );
  OAI21X1 U16 ( .A(n9), .B(n17), .C(count_out[3]), .Y(n19) );
  OAI21X1 U17 ( .A(count_out[1]), .B(n20), .C(n8), .Y(n17) );
  AOI21X1 U18 ( .A(n1), .B(n9), .C(n6), .Y(n8) );
  NAND3X1 U19 ( .A(count_out[0]), .B(count_out[1]), .C(n9), .Y(n10) );
  INVX1 U20 ( .A(n20), .Y(n9) );
  NAND2X1 U21 ( .A(n5), .B(n21), .Y(n20) );
  INVX1 U22 ( .A(n4), .Y(n21) );
  OAI21X1 U23 ( .A(rollover_val[3]), .B(n22), .C(n23), .Y(n4) );
  OAI21X1 U24 ( .A(count_out[3]), .B(n24), .C(n25), .Y(n23) );
  OAI21X1 U25 ( .A(rollover_val[2]), .B(n18), .C(n26), .Y(n25) );
  OAI21X1 U26 ( .A(count_out[2]), .B(n27), .C(n28), .Y(n26) );
  AOI22X1 U27 ( .A(n29), .B(rollover_val[0]), .C(rollover_val[1]), .D(n30), 
        .Y(n28) );
  AND2X1 U28 ( .A(n1), .B(n31), .Y(n29) );
  INVX1 U29 ( .A(rollover_val[2]), .Y(n27) );
  INVX1 U30 ( .A(rollover_val[3]), .Y(n24) );
  INVX1 U31 ( .A(count_out[3]), .Y(n22) );
  OAI21X1 U32 ( .A(n32), .B(n33), .C(n34), .Y(n53) );
  NAND2X1 U33 ( .A(rollover_flag), .B(n6), .Y(n34) );
  NAND2X1 U34 ( .A(n35), .B(n36), .Y(n33) );
  MUX2X1 U35 ( .B(n37), .A(n38), .S(n39), .Y(n36) );
  NOR2X1 U36 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n38) );
  OR2X1 U37 ( .A(n40), .B(n41), .Y(n37) );
  OAI21X1 U38 ( .A(rollover_val[0]), .B(n30), .C(n31), .Y(n41) );
  NAND2X1 U39 ( .A(count_out[1]), .B(n42), .Y(n31) );
  XOR2X1 U40 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n40) );
  MUX2X1 U41 ( .B(n1), .A(n43), .S(rollover_val[0]), .Y(n35) );
  OAI21X1 U42 ( .A(count_out[1]), .B(n42), .C(n1), .Y(n43) );
  INVX1 U43 ( .A(rollover_val[1]), .Y(n42) );
  INVX1 U44 ( .A(count_out[0]), .Y(n1) );
  NAND3X1 U45 ( .A(n44), .B(n45), .C(n5), .Y(n32) );
  NOR2X1 U46 ( .A(n6), .B(clear), .Y(n5) );
  NOR2X1 U47 ( .A(count_enable), .B(clear), .Y(n6) );
  OAI21X1 U48 ( .A(n46), .B(n30), .C(n39), .Y(n45) );
  INVX1 U49 ( .A(count_out[1]), .Y(n30) );
  XOR2X1 U50 ( .A(n18), .B(rollover_val[2]), .Y(n46) );
  INVX1 U51 ( .A(count_out[2]), .Y(n18) );
  XOR2X1 U52 ( .A(n47), .B(count_out[3]), .Y(n44) );
  OAI21X1 U53 ( .A(rollover_val[2]), .B(n48), .C(rollover_val[3]), .Y(n47) );
  INVX1 U54 ( .A(n39), .Y(n48) );
  NOR2X1 U55 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n39) );
endmodule


module timer ( clk, n_rst, enable_timer, shift_strobe, packet_done, data_size, 
        bit_period );
  input [3:0] data_size;
  input [13:0] bit_period;
  input clk, n_rst, enable_timer;
  output shift_strobe, packet_done;
  wire   \_2_net_[3] , \_2_net_[2] , \_2_net_[1] , n1, n2, n3, n4, n5;

  flex_counter_NUM_CNT_BITS14 a1 ( .clk(clk), .n_rst(n_rst), .clear(n4), 
        .count_enable(enable_timer), .rollover_val(bit_period), 
        .rollover_flag(shift_strobe) );
  flex_counter_NUM_CNT_BITS4 a2 ( .clk(clk), .n_rst(n_rst), .clear(n4), 
        .count_enable(shift_strobe), .rollover_val({\_2_net_[3] , \_2_net_[2] , 
        \_2_net_[1] , n5}), .rollover_flag(packet_done) );
  INVX1 U2 ( .A(enable_timer), .Y(n4) );
  INVX1 U3 ( .A(data_size[0]), .Y(n5) );
  XOR2X1 U4 ( .A(data_size[3]), .B(n1), .Y(\_2_net_[3] ) );
  NOR2X1 U5 ( .A(n2), .B(n3), .Y(n1) );
  XOR2X1 U6 ( .A(n3), .B(n2), .Y(\_2_net_[2] ) );
  NAND2X1 U7 ( .A(data_size[1]), .B(data_size[0]), .Y(n2) );
  INVX1 U8 ( .A(data_size[2]), .Y(n3) );
  XOR2X1 U9 ( .A(data_size[1]), .B(data_size[0]), .Y(\_2_net_[1] ) );
endmodule


module rcu ( clk, n_rst, new_packet_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, new_packet_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  wire   [2:0] next_state;
  wire   [2:0] current_state;

  DFFSR \current_state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(current_state[0]) );
  DFFSR \current_state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(current_state[2]) );
  DFFSR \current_state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(current_state[1]) );
  NOR2X1 U6 ( .A(current_state[2]), .B(n4), .Y(sbc_clear) );
  OAI21X1 U7 ( .A(n5), .B(n6), .C(n7), .Y(next_state[2]) );
  INVX1 U8 ( .A(sbc_enable), .Y(n7) );
  NOR2X1 U9 ( .A(n8), .B(current_state[2]), .Y(sbc_enable) );
  NAND2X1 U10 ( .A(current_state[2]), .B(n9), .Y(n6) );
  NAND2X1 U11 ( .A(n8), .B(n10), .Y(n5) );
  NAND2X1 U12 ( .A(current_state[1]), .B(current_state[0]), .Y(n8) );
  NOR2X1 U13 ( .A(current_state[2]), .B(n9), .Y(next_state[1]) );
  INVX1 U14 ( .A(n11), .Y(n9) );
  OAI21X1 U15 ( .A(current_state[0]), .B(n12), .C(n4), .Y(n11) );
  OAI21X1 U16 ( .A(n13), .B(n14), .C(n15), .Y(next_state[0]) );
  NAND2X1 U17 ( .A(packet_done), .B(enable_timer), .Y(n15) );
  NAND2X1 U18 ( .A(n16), .B(n12), .Y(n14) );
  MUX2X1 U19 ( .B(n10), .A(new_packet_detected), .S(n17), .Y(n13) );
  INVX1 U20 ( .A(framing_error), .Y(n10) );
  INVX1 U21 ( .A(n18), .Y(enable_timer) );
  NAND3X1 U22 ( .A(n16), .B(n17), .C(current_state[1]), .Y(n18) );
  INVX1 U23 ( .A(current_state[0]), .Y(n16) );
  NOR2X1 U24 ( .A(n4), .B(n17), .Y(load_buffer) );
  INVX1 U25 ( .A(current_state[2]), .Y(n17) );
  NAND2X1 U26 ( .A(current_state[0]), .B(n12), .Y(n4) );
  INVX1 U27 ( .A(current_state[1]), .Y(n12) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n30, n31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19,
         n21, n23, n25, n27, n29;

  DFFSR \rx_data_reg[7]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  MUX2X1 U4 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n1) );
  INVX1 U5 ( .A(n2), .Y(n17) );
  MUX2X1 U6 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n2) );
  INVX1 U7 ( .A(n3), .Y(n19) );
  MUX2X1 U8 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(n21) );
  MUX2X1 U10 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n4) );
  INVX1 U11 ( .A(n5), .Y(n23) );
  MUX2X1 U12 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n5) );
  INVX1 U13 ( .A(n6), .Y(n25) );
  MUX2X1 U14 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n6) );
  INVX1 U15 ( .A(n7), .Y(n27) );
  MUX2X1 U16 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n7) );
  INVX1 U17 ( .A(n8), .Y(n29) );
  MUX2X1 U18 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n8) );
  OAI21X1 U19 ( .A(data_read), .B(n9), .C(n10), .Y(n31) );
  INVX1 U20 ( .A(load_buffer), .Y(n10) );
  INVX1 U21 ( .A(data_ready), .Y(n9) );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n11) );
endmodule


module rcv_block ( clk, n_rst, data_size, bit_period, serial_in, data_read, 
        rx_data, data_ready, overrun_error, framing_error );
  input [3:0] data_size;
  input [13:0] bit_period;
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   shift_strobe, stop_bit, new_packet_detected, sbc_clear, sbc_enable,
         enable_timer, packet_done, load_buffer;
  wire   [7:0] packet_data;

  sr_9bit dut1 ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_strobe), 
        .serial_in(serial_in), .packet_data(packet_data), .stop_bit(stop_bit)
         );
  start_bit_det dut2 ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .new_packet_detected(new_packet_detected) );
  stop_bit_chk dut3 ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), 
        .sbc_enable(sbc_enable), .stop_bit(stop_bit), .framing_error(
        framing_error) );
  timer dut4 ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), 
        .shift_strobe(shift_strobe), .packet_done(packet_done), .data_size(
        data_size), .bit_period(bit_period) );
  rcu dut5 ( .clk(clk), .n_rst(n_rst), .new_packet_detected(
        new_packet_detected), .packet_done(packet_done), .framing_error(
        framing_error), .sbc_clear(sbc_clear), .sbc_enable(sbc_enable), 
        .load_buffer(load_buffer), .enable_timer(enable_timer) );
  rx_data_buff dut6 ( .clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), 
        .packet_data(packet_data), .data_read(data_read), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error) );
endmodule


module apb_uart_rx ( clk, n_rst, serial_in, psel, paddr, penable, pwrite, 
        pwdata, prdata, pslverr );
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  input clk, n_rst, serial_in, psel, penable, pwrite;
  output pslverr;
  wire   data_ready, overrun_error, framing_error, data_read;
  wire   [7:0] rx_data;
  wire   [3:0] data_size;
  wire   [13:0] bit_period;

  apb_slave slave1 ( .clk(clk), .n_rst(n_rst), .rx_data(rx_data), .data_ready(
        data_ready), .overrun_error(overrun_error), .framing_error(
        framing_error), .data_read(data_read), .psel(psel), .paddr(paddr), 
        .penable(penable), .pwrite(pwrite), .pwdata(pwdata), .prdata(prdata), 
        .pslverr(pslverr), .data_size(data_size), .bit_period(bit_period) );
  rcv_block uart2 ( .clk(clk), .n_rst(n_rst), .data_size(data_size), 
        .bit_period(bit_period), .serial_in(serial_in), .data_read(data_read), 
        .rx_data(rx_data), .data_ready(data_ready), .overrun_error(
        overrun_error), .framing_error(framing_error) );
endmodule

