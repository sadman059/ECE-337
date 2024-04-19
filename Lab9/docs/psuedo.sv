
hresp = 0
if(HSEL == 1)
if(HTRANS == 2)
if(HWRITE == 0)
if(HSIZE == 0)
case(HADDR)
0x0 : next_hrdata = {15'd0,modwait|new_coefficient_set};
0x1 : next_hrdata = {7'd0,err,8'd0};
0x2 : next_hrdata = {8'd0,fir_out[7:0]};
0x3 : next_hrdata = {fir_out[15:8],8'd0};
0x4 : next_hrdata = {8'd0,sample_data[7:0]};
0x5 : next_hrdata = {sample_data[15:8],8'd0};
0x6 : next_hrdata = {8'd0,fir_coefficient0[7:0]};
0x7 : next_hrdata = {fir_coefficient0[15:8],8'd0};
0x8 : next_hrdata = {8'd0,fir_coefficient1[7:0]};
0x9 : next_hrdata = {fir_coefficient1[15:8],8'd0};
0xA : next_hrdata = {8'd0,fir_coefficient2[7:0]};
0xB : next_hrdata = {fir_coefficient2[15:8],8'd0};
0xC : next_hrdata = {8'd0,fir_coefficient3[7:0]};
0xD : next_hrdata = {fir_coefficient3[15:8],8'd0};
0xE : next_hrdata = new_coefficient_set;
Default: hresp = 1;
else if (HSIZE == 1)
case(HADDR)
0x0 | 0x1 : next_hrdata = {7'd0,err,7'd0,modwait|new_coefficient_set};
0x2 | 0x3 : next_hrdata = fir_out;
0x4 | 0x5 : next_hrdata = sample_data;
0x6 | 0x7 : next_hrdata = fir_coefficient0;
0x8 | 0x9 : next_hrdata = fir_coefficient1;
0xA | 0xB : next_hrdata = fir_coefficient2;
0xC | 0xD : next_hrdata = fir_coefficient3;
0xE : next_hrdata = new_coefficient_set;
Default: hresp = 1;
if(prev_htrans == 2)
if(prev_sel == 2)
if(HWRITE == 1)
if(prev_HSIZE == 1)
case(Prev_HADDR)
0x4 | 0x5 : next_sample_data = hwdata;
      next_data_ready = 1
0x6 | 0x7 : next_fir_coefficient0 = hwdata;
0x8 | 0x9 : next_fir_coefficient1 = hwdata; 
0xA | 0xB : next_fir_coefficient2 = hwdata; 
0xC | 0xD : next_fir_coefficient3 = hwdata; 
0xE : next_new_coefficient_set = hwdata;
Default : hresp = 1;
else if (HSIZE == 0) 
0x4 : next_sample_data[7:0] = hwdata[7:0]; 
      next_data_ready = 1;
0x5 : next_sample_data[15:8] = hwdata[15:8];
      next_data_ready = 1;
0x6 : next_fir_coefficient0[7:0] = hwdata[7:0];
0x7 : next_fir_coefficient0[15:8] = hwdata[15:8];
0x8 : next_fir_coefficient1[7:0] = hwdata[7:0];
0x9 : next_fir_coefficient1[15:8] = hwdata[15:8];
0xA : next_fir_coefficient2[7:0] = hwdata[7:0];
0xB : next_fir_coefficient2[15:8] = hwdata[15:8];
0xC : next_fir_coefficient3[7:0] = hwdata[7:0];
0xD : next_fir_coefficient3[15:8] = hwdata[15:8];
0xE : if(clear_new_coefficient == 0)
      next_new_coefficient_set = hwdata;
      else if(clear_new_coefficient == 1)
      next_new_coefficient_set = 0;

//have data ready high for 2 clock cycles so do 2 flip flops for it
// clear new coeff