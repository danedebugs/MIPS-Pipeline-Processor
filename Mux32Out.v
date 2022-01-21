`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2020 02:59:38 PM
// Design Name: 
// Module Name: Mux32Out
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


module Mux32Out(input[1:0] select,input [31:0] a,b,c,output reg [31:0] out

    );
    
    always@*
    begin
    
    case(select)
    2'b00: out = a;
    2'b01: out = b;
    2'b10: out = c;
    endcase
    end
    
endmodule
