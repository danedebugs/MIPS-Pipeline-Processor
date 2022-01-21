`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2020 11:35:39 AM
// Design Name: 
// Module Name: Step2
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


module Step2( input clk, input [31:0] h0,h1,h2

    );
    
    wire [31:0] PCIn,PCOut,XN,XN1,XN2,mult1out
    ,mult2out,mult3out,adder1out,adder2out,YN ;
    
    
    ProgramCounter M0(.clk(clk),.PCEn(1),.PCnext(PCIn),.PCout(PCOut));
    PCAdder M1 (.PCIn(PCOut),.out(PCIn));
    
    InstructionMem M2 (.pc(PCOut),.InstOut(XN));
    
    FlipFlop M3 (.clk(clk),.FFWE(1),.D(XN),.Q(XN1));
    FlipFlop M7 (.clk(clk),.FFWE(1),.D(XN1),.Q(XN2));
    Multiplier M4 (.a(h0),.b(XN),.out(mult1out));
    
    Multiplier M5 (.a(XN1),.b(h1),.out(mult2out));
    Adder M6 (.a(mult1out),.b(mult2out),.out(adder1out));
    
    Multiplier M8 (.a(h2),.b(XN2),.out(mult3out));
    
    Adder M9 (.a(adder1out),.b(mult3out),.out(YN));
    
endmodule
