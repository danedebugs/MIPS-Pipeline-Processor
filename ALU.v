`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2020 07:44:52 PM
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter width = 32)
 (input [3:0]select,input signed[4:0] shamt, input signed[width-1:0]a,b,output reg Zero, output reg signed[width-1:0]ALUout

    );
    
    reg [3:0] result;
    
    always @* 
    begin
    
   case(select)
    
    4'b0000: ALUout = a+b; //add
    4'b0001: ALUout = a-b; //sub
    4'b0010: ALUout = a*b; //mult
    4'b0010: ALUout = a<<shamt; //sll
    4'b0100: ALUout = a>>shamt; //slr
    4'b0101: ALUout = a&b;
    4'b1001: ALUout = a | b; //or
    4'b0110: ALUout = a>>b;
    4'b0100: ALUout = a << b; //sllv
    4'b0111: ALUout = a>>>b;//srav
    default: ALUout = a + b;
   endcase
   if(ALUout==0)
   Zero = 1;
   else Zero =0 ;
   end
  
endmodule
