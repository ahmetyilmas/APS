`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2025 17:34:23
// Design Name: 
// Module Name: Add
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


module Add(
    input [7:0]a,
    input [7:0]b,
    output [7:0]r,
    output cout
    );
    
    logic [8:0]sum;
    
    always begin
        sum[8:0] <= a[7:0] + b[7:0];
    end
    assign r[7:0] = sum[7:0];
    assign cout = sum[8];
endmodule
