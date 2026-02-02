//`include "transaction.sv"
class driver;
	transaction t,tx;
		mailbox #(transaction)gdmb,rgdmb;
virtual intf vif;
	function new(mailbox #(transaction)gdmb,rgdmb);
	this.gdmb=gdmb;
	this.rgdmb=rgdmb;   
	vif=tb.f;
	endfunction
	
	task run();
		forever begin
    write();
	read();
	end
	endtask
    task write();
			gdmb.get(t);
			@(posedge vif.wclk);
			if(vif.rst!=1) begin
			vif.w_en	=t.w_en;
			vif.wdata   =t.wdata;
			#4;
			vif.w_en	=0;
			vif.wdata   =0;
			end
			//	t.display("driver");
	endtask 

    task read();
			rgdmb.get(tx);
			@(posedge vif.rclk);
			if(vif.rst!=1) begin
			vif.r_en    =tx.r_en;
			#8;
			vif.r_en	=0;
			end
			//	t.display("driver");
	endtask

endclass
