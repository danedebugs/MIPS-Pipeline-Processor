`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2020 01:46:03 PM
// Design Name: 
// Module Name: Mux5Bit
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


module Mux5Bit( input select, input [4:0] a,b, output reg [4:0] c

    );
    
    always @*
    begin
    if(select)
    c = b;
    else
    c = a;
    
    end
    
    
endmodule
