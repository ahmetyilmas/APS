`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmet
// 
// Create Date: 17.02.2025 18:33:05
// Design Name: 
// Module Name: RB
// Project Name: APS
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


module RB(
    input [7:0]InA,
    input [7:0]InB,
    input [7:0]CUconst,
    input [7:0]ALUout,
    input [2:0]InMuxAdd,
    input writeEn,
    input [3:0] regAdd,
    
    input clk,
    input res,
    
    output [7:0]Out,
    output [7:0]ALUinA,
    output [7:0]ALUinB,
    output [3:0]OutMuxAdd
    );
    
    
    reg [7:0]register[15:0];
    logic [7:0]InMuxWire;
    logic [7:0]OutMuxWire;
    
    always @(posedge clk or posedge res) begin
        if(res)
            for(int i = 0; i < 15; i++)
                register[i] <= 8'b0;
        else begin
            if(writeEn)
                register[regAdd] <= InMuxWire;
            
            case(InMuxAdd)
                3'b000 : InMuxWire = InA;
                3'b001 : InMuxWire = InB;
                3'b010 : InMuxWire = CUconst;
                3'b011 : InMuxWire = ALUout;
                default : InMuxWire = OutMuxWire;
            endcase
            
            OutMuxWire = register[OutMuxAdd];
            
        end
    end
    assign Out = register[0];
    assign ALUinA = register[1];
    assign ALUinB = register[2];
endmodule
