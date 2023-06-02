module PE(inp_n, inp_w, clk, rst, out_s, out_e, result);
	input [31:0] inp_n, inp_w;
	output reg [31:0] out_s, out_e;
	input clk, rst;
	output reg [63:0] result;
	wire [63:0] prod;
	
	
	assign prod = inp_n*inp_w;
	
	always @(posedge rst or posedge clk) begin
		if(rst) begin
			result <= 0;
			out_e <= 0;
			out_s <= 0;
		end
		else begin
			result <= result + prod;
			out_e <= inp_w;
			out_s <= inp_n;
		end
	end

endmodule
