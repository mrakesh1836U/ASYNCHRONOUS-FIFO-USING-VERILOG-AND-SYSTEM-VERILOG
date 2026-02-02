class scoreboard;
mailbox#(transaction) mtsb,gtsb;
transaction tx,tx1,tx2,tx3,ex_tx[$],ac_tx[$];
function new(mailbox #(transaction) mtsb,gtsb);
this.mtsb=mtsb;
this.gtsb=gtsb;
endfunction

task run();   
forever
fork 
expected();
actual();
compare();
join
endtask
task expected();
transaction tx4;
tx=new();
tx4=new();
gtsb.get(tx);
tx4=new tx;
ex_tx.push_back(tx4);
//$display("expected=%p",ex_tx);
endtask
task actual();
transaction tx;
tx1=new();
mtsb.get(tx1);
tx=new tx1;
ac_tx.push_back(tx);
//$display("actual=%p",ac_tx);
endtask
task compare();
if(ex_tx.size()>0&ac_tx.size()>0)
		begin
		tx2=new();
		tx3=new();
tx2=ex_tx.pop_front();
tx3=ac_tx.pop_front();
if(tx2.w_en==tx3.w_en) 
		begin
		$display("*******************test case passed*************************");
		end
		else
				begin
				$display("*******************test case failed****************");
				tx2.display("expected");
				tx3.display("actual");
				end
				end
endtask
endclass
