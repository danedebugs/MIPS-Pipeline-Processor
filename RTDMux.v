`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 05:01:28 PM
// Design Name: 
// Module Name: RTDMux
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


module RTDMux(input select,input[4:0]a,b,output reg[4:0] c

    );
    
    always @* begin
    if(select)
    c = b;
    else
    c = a;
    end
endmodule
