`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2023 11:39:22 AM
// Design Name: 
// Module Name: d_ff
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


module d_ff(
    input clk,rst,
    input [15:0] inp,
    output [15:0] q_out
   
    );
    reg [15:0] q;
    always @ (posedge clk) begin
        if (rst)
            q<=0;        
        else
            q<=inp;
        end
    assign q_out=q;
endmodule
