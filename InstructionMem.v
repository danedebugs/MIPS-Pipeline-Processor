`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2020 07:18:33 PM
// Design Name: 
// Module Name: InstructionMem
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


module InstructionMem # (parameter pcl = 32,In = 32)(input[pcl-1:0] pc, //address input
    output reg [In-1:0] InstOut

    );
   
    
    reg[31:0] Register[0:63];
  reg [5:0]opcode;
   reg [4:0]rs;
    reg [4:0]rt;
    reg [4:0]rd;
    reg [15:0] Imm;
    initial 
    $readmemb("XValues.mem",Register); //load word
    
   always @* begin
   InstOut = Register[pc];
   end
    
   
endmodule
