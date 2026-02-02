class transaction;

	rand bit	[7:0] wdata;
	rand bit	[7:0] w_en;
	rand bit	[7:0] r_en;
         bit	[7:0] rdata;
         bit	      full;
         bit		  empty;
		

	function void display(input string class_name);
		$display("%s w_en=%0d, r_en=%0d, wdata=%0d, rdata=%0d, full=%0d, empty=%0d",class_name,w_en,r_en,wdata,rdata,full,empty);
	endfunction
	
endclass   
