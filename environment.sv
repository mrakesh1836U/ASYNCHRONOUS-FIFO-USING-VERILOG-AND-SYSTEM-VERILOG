`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
	generator gen;
	driver drv;
	monitor mon;   
	scoreboard sbd;
	mailbox #(transaction)gdmb,rgdmb;
	mailbox #(transaction)mtsb;
	mailbox #(transaction)gtsb;

	function new();
		gdmb=new(20);
		rgdmb=new(20);
		mtsb=new(20);
		gtsb=new(20);
		gen=new(gdmb,rgdmb,gtsb);
		drv=new(gdmb,rgdmb);
		mon=new(mtsb);
		sbd=new(mtsb,gtsb);
	endfunction
	
	task run(string str);
		fork
		gen.run(str);
		drv.run();
		mon.run();
		sbd.run();
	join
	endtask
endclass
