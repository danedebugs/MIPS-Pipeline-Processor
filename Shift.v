`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2020 01:37:11 PM
// Design Name: 
// Module Name: Shift
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


module Shift( input[31:0] a,output reg [31:0] out

    );
    
    always @*
    begin
     out = a<<2;
    
    end
endmodule
