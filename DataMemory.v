`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2020 11:54:49 AM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory # (parameter AW = 32,DW = 32)
(input[AW-1:0] DMA,WriteData, output reg [DW-1:0] DataOut, input WE,clk

    );
    
    reg signed[31:0] Register[0:255];
    
   initial 
    $readmemb("Datamem.mem",Register);
    
    always @ (posedge clk)
    begin
    if(WE)
    Register[DMA] <= WriteData;
    end
    
    always @* begin
      DataOut = Register[DMA];
    end
    
    
    
    
endmodule
