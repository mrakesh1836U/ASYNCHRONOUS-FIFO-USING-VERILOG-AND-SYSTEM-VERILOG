class monitor;
transaction tx;
virtual intf vif;
mailbox #(transaction) mtsb;
bit temp,temp1;
function new(mailbox #(transaction) mtsb);
this.mtsb=mtsb;
vif=tb.f;
endfunction

task run();
forever  
begin
@(negedge vif.wclk);
if(vif.w_en==1) begin
tx=new();
temp		=vif.w_en;
temp1		=vif.r_en;
tx.w_en		=vif.w_en;
tx.r_en		=vif.r_en;
tx.wdata	=vif.wdata;
tx.rdata	=vif.rdata;
mtsb.put(tx);
//tx.display("monitor");
end
end
endtask
endclass
