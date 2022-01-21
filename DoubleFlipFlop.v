`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2020 11:54:34 AM
// Design Name: 
// Module Name: DoubleFlipFlop
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


module DoubleFlipFlop( input clk,FFWE,clr,stall, input [31:0] IMRD,PCp1,output reg[31:0] InstrD,PCp1D

    );
    always @ (posedge clk)
    begin
    if(clr) begin
    InstrD <= 0;
    PCp1D<= 0;
    end
    
    else if (stall)
    begin
    
    end
    
    else 
    begin
    InstrD<= IMRD;
    PCp1D<=PCp1;
    end
    end
endmodule
