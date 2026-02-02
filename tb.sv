`include "interface.sv"
`include "fifo_asyc.v"
`include "transaction.sv"
`include "environment.sv"
module tb;
reg wclk,rst,rclk;

intf f(wclk,rclk,rst);

fifo dut(f.wclk,f.rclk,f.rst,f.full,f.empty,f.wr_tog,f.rd_tog,f.w_en,f.r_en,f.w_er,f.r_er,f.wdata,f.rdata);
  
environment env;
string str;

initial
begin
	wclk=0;
	forever #1 wclk=~wclk;
end

initial
begin
	rclk=0;
	forever #2 rclk=~rclk;
end

initial
begin
$value$plusargs("testcase=%s",str);
f.w_en=0;f.r_en=0;f.wdata=0;
rst=1; #4;rst=0;
#10000;$finish;
end
initial
begin
	env=new();
	env.run(str);
end
endmodule
