/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Feb 13 17:41:49 2024
/////////////////////////////////////////////////////////////


module flex_stp_sr_NUM_BITS9 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  DFFSR \parallel_out_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[3]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[5]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[6]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[7]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[8]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[0]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[1]), .A(parallel_out[0]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[2]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[3]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[5]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[6]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[7]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[8]), .A(parallel_out[7]), .S(shift_enable), .Y(
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


module flex_counter_1 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
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


module flex_counter_0 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n54;

  DFFSR \count_out_reg[0]  ( .D(n49), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n50), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n51), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI21X1 U7 ( .A(n1), .B(n2), .C(n3), .Y(n49) );
  OAI21X1 U9 ( .A(n4), .B(n1), .C(n5), .Y(n3) );
  INVX1 U10 ( .A(n6), .Y(n2) );
  MUX2X1 U11 ( .B(n7), .A(n8), .S(count_out[1]), .Y(n50) );
  NAND2X1 U12 ( .A(n9), .B(count_out[0]), .Y(n7) );
  MUX2X1 U13 ( .B(n10), .A(n16), .S(count_out[2]), .Y(n51) );
  INVX1 U14 ( .A(n17), .Y(n16) );
  OAI21X1 U15 ( .A(n18), .B(n10), .C(n19), .Y(n52) );
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
  OAI21X1 U32 ( .A(n32), .B(n33), .C(n34), .Y(n54) );
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


module timer ( clk, n_rst, enable_timer, shift_strobe, packet_done );
  input clk, n_rst, enable_timer;
  output shift_strobe, packet_done;
  wire   n1, n2;

  flex_counter_1 a1 ( .clk(clk), .n_rst(n_rst), .clear(n2), .count_enable(
        enable_timer), .rollover_val({1'b1, 1'b0, 1'b1, 1'b0}), 
        .rollover_flag(shift_strobe) );
  flex_counter_0 a2 ( .clk(clk), .n_rst(n_rst), .clear(n1), .count_enable(
        shift_strobe), .rollover_val({1'b1, 1'b0, 1'b0, 1'b1}), 
        .rollover_flag(packet_done) );
  INVX1 U3 ( .A(shift_strobe), .Y(n1) );
  INVX1 U4 ( .A(enable_timer), .Y(n2) );
endmodule


module rcu ( clk, n_rst, new_packet_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, new_packet_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   current_state;
  assign enable_timer = 1'b0;
  assign load_buffer = 1'b0;
  assign sbc_enable = 1'b0;
  assign sbc_clear = current_state;

  DFFSR current_state_reg ( .D(new_packet_detected), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(current_state) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n30, n31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19,
         n21, n23, n25, n27, n29;

  DFFSR \rx_data_reg[7]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  MUX2X1 U4 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n1) );
  INVX1 U5 ( .A(n2), .Y(n17) );
  MUX2X1 U6 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n2) );
  INVX1 U7 ( .A(n3), .Y(n19) );
  MUX2X1 U8 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(n21) );
  MUX2X1 U10 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n4) );
  INVX1 U11 ( .A(n5), .Y(n23) );
  MUX2X1 U12 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n5) );
  INVX1 U13 ( .A(n6), .Y(n25) );
  MUX2X1 U14 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n6) );
  INVX1 U15 ( .A(n7), .Y(n27) );
  MUX2X1 U16 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n7) );
  INVX1 U17 ( .A(n8), .Y(n29) );
  MUX2X1 U18 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n8) );
  OAI21X1 U19 ( .A(data_read), .B(n9), .C(n10), .Y(n31) );
  INVX1 U20 ( .A(load_buffer), .Y(n10) );
  INVX1 U21 ( .A(data_ready), .Y(n9) );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n11) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error );
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   shift_strobe, stop_bit, new_packet_detected, sbc_clear, packet_done;
  wire   [7:0] packet_data;

  sr_9bit dut1 ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_strobe), 
        .serial_in(serial_in), .packet_data(packet_data), .stop_bit(stop_bit)
         );
  start_bit_det dut2 ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .new_packet_detected(new_packet_detected) );
  stop_bit_chk dut3 ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), 
        .sbc_enable(1'b0), .stop_bit(stop_bit), .framing_error(framing_error)
         );
  timer dut4 ( .clk(clk), .n_rst(n_rst), .enable_timer(1'b0), .shift_strobe(
        shift_strobe), .packet_done(packet_done) );
  rcu dut5 ( .clk(clk), .n_rst(n_rst), .new_packet_detected(
        new_packet_detected), .packet_done(packet_done), .framing_error(
        framing_error), .sbc_clear(sbc_clear) );
  rx_data_buff dut6 ( .clk(clk), .n_rst(n_rst), .load_buffer(1'b0), 
        .packet_data(packet_data), .data_read(data_read), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error) );
endmodule

