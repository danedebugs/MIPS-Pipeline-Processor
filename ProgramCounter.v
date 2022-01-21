`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2020 01:25:40 PM
// Design Name: 
// Module Name: ProgramCounter
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


module ProgramCounter( input clk,PCEn,input[31:0] PCnext, output reg[31:0] PCout

    );
    
    initial
    PCout = 0;
    
    always @ (posedge clk)
    begin
    if(PCEn) begin
    PCout <= PCnext;
    end
    
    else begin
   
    end
    end
    
endmodule
