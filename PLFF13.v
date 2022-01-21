`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 10:30:33 AM
// Design Name: 
// Module Name: PLFF13
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


module PLFF13(input clk,clr, input RFWED,MtoRFSelD,DMWED,BranchD,ALUInSelD,RFDSelD,input [3:0] ALUSelD,
input [31:0] RFRD1,RFRD2,SImmD, PCp1D, input [4:0]rtD,rdD,rsD, output reg [3:0] ALUSelE, output reg RFWEE,MtoRFSelE,DMWEE,BranchE,ALUInSelE,RFDSelE,
output reg[31:0] DMdInE,ALUIn1E,SImmE,PCp1E,output reg [4:0] rtE,rdE,rsE

    );
    
    always @ (posedge clk) begin
    if(clr) begin
    RFWEE<=0;
    MtoRFSelE<=0;
    DMWEE<=0;
    BranchE<= 0;
    ALUInSelE<=0;
    RFDSelE<=0;
    ALUIn1E<=0;
    DMdInE<= 0;
    SImmE<=0;
    PCp1E<=0;
    rtE <= 0;
    rdE<=0;
    rsE <=0;
    end
    
    else
    begin
    RFWEE<=RFWED;
    MtoRFSelE<=MtoRFSelD;
    DMWEE<=DMWED;
    BranchE<= BranchD;
    ALUSelE<=ALUSelD;
    ALUInSelE<=ALUInSelD;
    RFDSelE<=RFDSelD;
    ALUIn1E<=RFRD1;
    DMdInE<= RFRD2;
    SImmE<=SImmD;
    PCp1E<=PCp1D;
    rtE <= rtD;
    rdE<=rdD;
    rsE<= rsD;
    end
    
    end
    
    
    
endmodule
