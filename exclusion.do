coverage exclude -src fifo_asyc.v -code s -line 36 42-43 62-63 89
coverage exclude -src fifo_asyc.v -code b -line 36 41 61 87
coverage exclude -src fifo_asyc.v -code c -line 36-41 61-91
coverage exclude -scope /tb/dut -togglenode empty full {j[0]} {j[1]} {j[2]} {j[3]} {j[4]} {j[5]} {j[6]} {j[7]}
coverage exclude -scope /tb/dut -togglenode {j[8]} {j[9]} {j[10]} {j[11]} {j[12]} {j[13]} {j[14]} {j[15]} {j[16]} {j[17]}
coverage exclude -scope /tb/dut -togglenode {j[18]} {j[19]} {j[20]} {j[21]} {j[22]} {j[23]} {j[24]} {j[25]} {j[26]} {j[27]}
coverage exclude -scope /tb/dut -togglenode {j[28]} {j[29]} {j[30]} {j[31]} {rd_ptr[3]} {rd_ptr_g[3]} {rd_ptr_wr_clk[3]} rd_tog rd_tog_wr_clk wr_er
coverage exclude -scope /tb/dut -togglenode {wr_ptr[3]} {wr_ptr_g[3]} {wr_ptr_rd_clk[3]} wr_tog wr_tog_rd_clk  
