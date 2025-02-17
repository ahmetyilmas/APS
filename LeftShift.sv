`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2025 17:52:07
// Design Name: 
// Module Name: LeftShift
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


module LeftShift(
    input reg [7:0]a,
    output [7:0]r,
    output reg cout
    );
    
    always @(*) begin
        cout <= a[7];
        a <= a << 1'b1;
    end
endmodule
