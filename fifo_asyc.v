module fifo(wr_clk,rd_clk,rst,full,empty,wr_tog,rd_tog,wr_en,rd_en,wr_er,rd_er,wr_data,rd_data);
parameter WIDTH=8, DEPTH=16, ADDRESS=4; 
input wr_clk,rd_clk,rst,wr_en,rd_en;
input [WIDTH-1:0]wr_data;
output reg [WIDTH-1:0]rd_data;
output reg wr_er,rd_er,full,empty,rd_tog,wr_tog;
integer j;

reg rd_tog_wr_clk,wr_tog_rd_clk;
reg [ADDRESS-1:0]wr_ptr,rd_ptr,wr_ptr_g,rd_ptr_g;
reg [ADDRESS-1:0]wr_ptr_rd_clk,rd_ptr_wr_clk;
reg [WIDTH-1:0]fif[DEPTH-1:0];

always@(posedge wr_clk)
begin
if(rst==1) begin
		full=0;
		empty=1;
        rd_tog_wr_clk=0;
		wr_tog_rd_clk=0;
		wr_ptr=0;
		wr_ptr_g=0;
        wr_ptr_rd_clk=0;
		rd_ptr_wr_clk=0;
		rd_ptr=0;
		rd_ptr_g=0;
		wr_er=0;
		rd_er=0;
		rd_data=0;
		wr_tog=0;
		rd_tog=0;
		for(j=0;j<DEPTH;j=j+1)
		fif[j]=0;
		end
else if(wr_en==1) begin
		if(full==1) wr_er=1;
		else begin
		wr_er=0;
		wr_ptr_g={wr_ptr[ADDRESS-1],wr_ptr[ADDRESS-1:1]^wr_ptr[ADDRESS-2:0]};
		fif[wr_ptr_g]=wr_data;// 0111-0110-0100-0000-1000
		if(wr_ptr==DEPTH) begin
                wr_tog=~wr_tog;
				wr_ptr=0;
				end                           
				else 
				wr_ptr=wr_ptr+1;   
				end
		end
end


always@(posedge rd_clk)
begin
if(rst==0) begin
  if(rd_en==1) begin
		if(empty==1) rd_er=1;
		else begin
		rd_er=0;
		rd_ptr_g={rd_ptr[ADDRESS-1],rd_ptr[ADDRESS-1:1]^rd_ptr[ADDRESS-2:0]};
		rd_data=fif[rd_ptr_g];
		if(rd_ptr==DEPTH) begin
                rd_tog=~rd_tog;
				rd_ptr=0;
				end
				else 
				rd_ptr=rd_ptr+1;
				end
		end
end
end


always@(posedge wr_clk) begin
rd_ptr_wr_clk<=rd_ptr_g;
rd_tog_wr_clk<=rd_tog;
end

always@(posedge rd_clk) begin
wr_ptr_rd_clk<=wr_ptr_g;
wr_tog_rd_clk<=wr_tog;
end

always@(*)
begin
full=0;
empty=0;
if((wr_ptr_g == rd_ptr_wr_clk)&&(wr_tog != rd_tog_wr_clk))
		begin
		full=1; empty=0;
		end
if((wr_ptr_rd_clk == rd_ptr_g)&&(wr_tog_rd_clk == rd_tog))
		begin
		empty=1; full=0;
		end
end 

/*
always@(*)
begin
full=0; empty=0;
if((wr_ptr==rd_ptr)&&(wr_tog != rd_tog))
		begin
		full=1; 
		end
else if((wr_ptr==rd_ptr)&&(wr_tog == rd_tog))
		begin
		empty=1;
		end
end */
endmodule


