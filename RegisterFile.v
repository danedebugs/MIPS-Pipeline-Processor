`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2020 07:46:23 PM
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile //# (parameter RL = 5 , DL = 32)
 (input WriteEnable,clk, input [5-1:0] Read1,Read2,WriteReg,input[32-1:0] WriteData,output reg signed[32-1:0] ReadData1,
ReadData2
);
 
 reg[32-1:0] Register [0:63];
 initial
 $readmemb("RegisterFileData.mem",Register);
 

 always @ (posedge clk)
 begin
 if(WriteEnable)
  Register[WriteReg] <= WriteData;
 end
 
always @* begin
    ReadData1 = Register[Read1]; // asynchrounous Read
    ReadData2 = Register[Read2];
   end
 

endmodule
