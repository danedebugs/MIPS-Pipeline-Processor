`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 11:40:02 AM
// Design Name: 
// Module Name: FlipFlop5
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


module FlipFlop5(input clk,RFWEM,MtoRFSelM, input[31:0] ALUOutM, DMRD,input [4:0] rtdM,
output reg RFWEW,MtoRFSelW,output reg [31:0] ALUOutW,DMOutW,output reg [4:0] rtdW

    );
    always @ (posedge clk)
    begin
    RFWEW<=RFWEM;
    MtoRFSelW<= MtoRFSelM;
    ALUOutW<= ALUOutM;
    DMOutW<= DMRD;
    rtdW <= rtdM;
    end
endmodule
