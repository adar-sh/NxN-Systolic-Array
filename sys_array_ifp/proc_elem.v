`timescale 1ns / 1ps

module PE #(parameter xlen=16)
(inp_n, inp_w, clk, rst, out_s, out_e, out);
	input [xlen-1:0] inp_n, inp_w;
	output reg [xlen-1:0] out_s, out_e;
	input clk, rst;
	output [xlen-1:0] out;     
	wire [xlen-1:0] prod;      
	wire [xlen-1:0] res_i;     
    wire [xlen-1:0] result;
    
    
	floating_multi F1 (.A(inp_n),.B(inp_w),.out(prod));
	
	
	//adder a1 (.operand_1(prod),.operand_2(result),.clk(clk),.Sum(res_i),.reset(rst));
	//FloatingAddition a1 (.A(prod),.B(result),.clk(clk),.result(res_i));
	
	float_adder ad1 (.num1(prod),.num2(result),.result(res_i));
	d_ff d1 (.clk(clk),.rst(rst),.inp(res_i),.q_out(result));
	
 
//    always @ result $monitor(" %h %g %d",result,$time,1);
//    always @ res_i $monitor(" %h %g %d",res_i,$time,2);
   
    always @(posedge clk) begin
       if(rst) begin
            //result <=0;
            //res_i <= 0;
            out_e <= 0;
            out_s <= 0;
	end
	else begin
		//result <= result + prod;
	
                
        out_e <= inp_w;
        out_s <= inp_n;
	end
	end

assign out=result;

endmodule
