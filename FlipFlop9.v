`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 11:04:20 AM
// Design Name: 
// Module Name: FlipFlop9
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



module FlipFlop9(input clk, input RFWEE,MtoRFSelE,DMWEE,BranchE,zero,input[31:0] ALUOut,DMdInE,PCSE,input [4:0] rtdE,
output reg RFWEM,MtoRFSelM,DMWEM,BranchM, output reg [31:0]ALUOutM,DMdInM,PCBranchM,output reg [4:0] rtdM

    );
    
    always @(posedge clk)
    begin
    RFWEM<=RFWEE;
    MtoRFSelM<= MtoRFSelE; 
    DMWEM <= DMWEE;
    BranchM <= BranchE;
    
    ALUOutM <=ALUOut;
    DMdInM<=DMdInE;
    PCBranchM<= PCSE;
    rtdM<=rtdE;
    end 
    
endmodule
