//`include "transaction.sv"
class generator;
	transaction t;
	mailbox #(transaction)gdmb,rgdmb,gtsb;
	int i;
	bit [7:0] temp;
//string str;
	function new(mailbox #(transaction)gdmb,rgdmb,gtsb);
	this.gdmb=gdmb;
	this.rgdmb=rgdmb;
	this.gtsb=gtsb;   
	endfunction


	task run(string str);
//	str="inc_testcase";
	case(str)
	"wr_rd_testcase" :begin
	                 			repeat(16)
	    							begin
									t=new();
									assert (t.randomize() with {w_en==1;r_en==0;});
									gdmb.put(t);
									gtsb.put(t);
									//	t.di	splay("generator");
									end
	                 			repeat(16)
	    							begin
									t=new();
									assert (t.randomize() with {w_en==0;r_en==1;});
									rgdmb.put(t);
									//	t.di	splay("generator");
									end

							end
	"run_one_testcase" :begin
	                            temp=8'b00000001;
	                 			repeat(16)
	    							begin
									t=new();
									assert (t.randomize() with {w_en==1;r_en==0;wdata==temp;});
									gdmb.put(t);
									gtsb.put(t);
									temp={temp[6:0],temp[7]};
									//	t.di	splay("generator");
									end
	                 			repeat(16)
	    							begin
									t=new();
									assert (t.randomize() with {w_en==0;r_en==1;});
									rgdmb.put(t);
									//	t.di	splay("generator");
									end
					  end
	"run_zero_testcase" :begin
	                            temp=8'b11111110;
	                 			repeat(16)
	    							begin
									t=new();
									assert (t.randomize() with {w_en==1;r_en==0;wdata==temp;});
									gdmb.put(t);
									gtsb.put(t);
									temp={temp[6:0],temp[7]};
									//	t.di	splay("generator");
									end
	                 			repeat(16)
	    							begin
									t=new();
									assert (t.randomize() with {w_en==0;r_en==1;});
									rgdmb.put(t);
									//	t.di	splay("generator");
									end
					  end


    endcase
	endtask
	
endclass
