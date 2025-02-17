`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmet
// 
// Create Date: 17.02.2025 17:25:57
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [7:0]ALUinA,
    input [7:0]ALUinB,
    input [1:0]inSel,
    output reg [7:0]ALUout,
    output reg cout,
    output zeroFlag
    );
    
    wire [7:0]andWire;
    wire [7:0]addWire;
    wire [7:0]xorWire;
    wire [7:0]LSWire;
    
    wire addCarry;
    wire shiftCarry;
    
    
    And andModule(
        .a(ALUinA),
        .b(ALUinB),
        .r(andWire)
    );
    
    Xor xorModule (
        .a(ALUinA),
        .b(ALUinB),
        .r(xorWire)
    );
    
    Add addModule (
        .a(ALUinA),
        .b(ALUinB),
        .r(addWire),
        .cout(addCarry)
    );
    
    LeftShift shiftModule (
        .a(ALUinA),
        .r(LSWire),
        .cout(shiftCarry)
        );
        
    zeroComparator ZeroComparator (
        .a(ALUout),
        .Z(zeroFlag)
        );
        
    always @(*) begin
        case (inSel)
            2'b00 : ALUout <= andWire;
            2'b01 : ALUout <= xorWire;
            2'b10 : ALUout <= addWire;
            2'b11 : ALUout <= LSWire;
        endcase
        case (inSel)
            2'b00 : cout <= 1'b0;
            2'b01 : cout <= 1'b0;
            2'b10 : cout <= addWire;
            2'b11 : cout <= LSWire;
        endcase
    end
    
endmodule
