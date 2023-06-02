`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Adarsh K
// 
// Create Date: 05/24/2023 11:56:20 AM
// Design Name: Systolic Array
// Module Name: syst_array
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module syst_array(inp_w0,inp_w4,inp_w8,inp_w12,inp_n0,inp_n1,inp_n2,inp_n3,clk,rst,done);
	
	input [15:0] inp_w0, inp_w4, inp_w8, inp_w12,inp_n0, inp_n1, inp_n2, inp_n3;
	output reg done;
	input clk, rst;
	reg [3:0] count;
	
	
	
	wire [15:0] inp_n0, inp_n1, inp_n2, inp_n3;
	wire [15:0] inp_w0, inp_w4, inp_w8, inp_w12;
	wire [15:0] out_s0, out_s1, out_s2, out_s3, out_s4, out_s5, out_s6, out_s7, out_s8, out_s9, out_s10, out_s11, out_s12, out_s13, out_s14, out_s15;
	wire [15:0] out_e0, out_e1, out_e2, out_e3, out_e4, out_e5, out_e6, out_e7, out_e8, out_e9, out_e10, out_e11, out_e12, out_e13, out_e14, out_e15;
	// change
	wire [15:0] result0, result1, result2, result3, result4, result5, result6, result7, result8, result9, result10, result11, result12, result13, result14, result15;
	
	
	
	PE P0 (inp_n0, inp_w0, clk, rst, out_s0, out_e0, result0);

	PE P1 (inp_n1, out_e0, clk, rst, out_s1, out_e1, result1);
	PE P2 (inp_n2, out_e1, clk, rst, out_s2, out_e2, result2);
	PE P3 (inp_n3, out_e2, clk, rst,out_s3, out_e3, result3);
	
	PE P4 (out_s0, inp_w4, clk, rst, out_s4, out_e4, result4);
	PE P8 (out_s4, inp_w8, clk, rst, out_s8, out_e8, result8);
	PE P12 (out_s8, inp_w12, clk, rst, out_s12, out_e12, result12);
	
	PE P5 (out_s1, out_e4, clk, rst, out_s5, out_e5, result5);
	PE P6 (out_s2, out_e5, clk, rst, out_s6, out_e6, result6);
	PE P7 (out_s3, out_e6, clk, rst, out_s7, out_e7, result7);

	PE P9 (out_s5, out_e8, clk, rst, out_s9, out_e9, result9);
	PE P10 (out_s6, out_e9, clk, rst, out_s10, out_e10, result10);
	PE P11 (out_s7, out_e10, clk, rst, out_s11, out_e11, result11);

	PE P13 (out_s9, out_e12, clk, rst, out_s13, out_e13, result13);
	PE P14 (out_s10, out_e13, clk, rst, out_s14, out_e14, result14);
	PE P15 (out_s11, out_e14, clk, rst, out_s15, out_e15, result15);
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			done <= 0;
			count <= 0;
		end
		else begin
			if(count == 9) begin
				done <= 1;
				count <= 0;
			end
			else begin
				done <= 0;
				count <= count + 1;
			end
		end	
	end 
endmodule
