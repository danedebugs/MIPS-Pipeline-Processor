`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2020 01:30:34 PM
// Design Name: 
// Module Name: Equal
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


module Equal( input [31:0] a,b, output reg Equal

    );
    
    always @*
    begin
    if(a==b)
    Equal = 1;
    else
    Equal = 0;
    
    end
endmodule
