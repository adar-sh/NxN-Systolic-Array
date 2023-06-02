module syst_array_tb;

reg rst, clk;

reg [31:0] inp_w0, inp_w1, inp_w2, inp_w3, inp_n0, inp_n1, inp_n2, inp_n3;
wire done;

syst_array uut(inp_w0, inp_w1, inp_w2, inp_w3,inp_n0, inp_n1, inp_n2, inp_n3,clk, rst, done);


initial begin
	#3  inp_w0 <= 32'd1;
	inp_n0 <= 32'd1;
	 #10 inp_w0 <= 32'd5;
	inp_n0 <= 32'd2;
	#10 inp_w0 <= 32'd9;
	inp_n0 <= 32'd3;
	#10 inp_w0 <= 32'd13;
	inp_n0 <= 32'd4;
	 #10 inp_w0 <= 32'd0;
	inp_n0 <= 32'd0;
	#10 inp_w0 <= 32'd0;
	inp_n0 <= 32'd0;
	 #10 inp_w0 <= 32'd0;	
	inp_n0 <= 32'd0;
end

initial begin
	#3  inp_w1 <= 32'd0;
	  inp_n1 <= 32'd0;
	#10 inp_w1 <= 32'd2;
	 inp_n1 <= 32'd5;
	#10 inp_w1 <= 32'd6;
	   inp_n1 <= 32'd6;
	#10 inp_w1 <= 32'd10;
	  inp_n1 <= 32'd7;
	#10 inp_w1 <= 32'd14;
	 inp_n1 <= 32'd8;
	#10 inp_w1 <= 32'd0;
	   inp_n1 <= 32'd0;
	#10 inp_w1 <= 32'd0;	
	 inp_n1 <= 32'd0;
end

initial begin
	#3  inp_w2 <= 32'd0;
	 inp_n2 <= 32'd0;
		#10 inp_w2 <= 32'd0;
	   inp_n2 <= 32'd0;
	#10 inp_w2 <= 32'd3;
	   inp_n2 <= 32'd9;
	#10 inp_w2 <= 32'd7;
	   inp_n2 <= 32'd10;
	 #10 inp_w2 <= 32'd11;
	   inp_n2 <= 32'd11;
	#10 inp_w2 <= 32'd15;
	   inp_n2 <= 32'd12;
	 #10 inp_w2 <= 32'd0;	
	    inp_n2 <= 32'd0;
end

initial begin
	#3  inp_w3 <= 32'd0;
	  inp_n3 <= 32'd0;
		#10 inp_w3 <= 32'd0;
	inp_n3 <= 32'd0;
	#10 inp_w3 <= 32'd0;
	   inp_n3 <= 32'd0;
	#10 inp_w3 <= 32'd4;
	   inp_n3 <= 32'd13;
	 #10 inp_w3 <= 32'd8;
	   inp_n3 <= 32'd14;
#10 inp_w3 <= 32'd12;
	    inp_n3 <= 32'd15;
	#10 inp_w3 <= 32'd16;	
	   inp_n3 <= 32'd16;
end

initial begin
	rst <= 1;
clk <= 0;
#3
	rst <= 0;
end

initial begin
	repeat(25)
		#5 clk <= ~clk;
end



endmodule