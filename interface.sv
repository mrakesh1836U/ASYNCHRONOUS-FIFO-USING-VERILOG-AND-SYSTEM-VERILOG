interface intf(input wclk,rclk,rst);

    logic                 w_en;    
    logic                 r_en;    
    logic [7:0] 		  wdata;   
    logic [7:0] 		  rdata;      
    logic                 full;
    logic                 empty;
    logic                 wr_tog,rd_tog;
    logic                 w_er,r_er;

endinterface
