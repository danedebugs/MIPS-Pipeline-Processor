`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2020 01:14:27 PM
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit( input[5:0] opcode,funct, output reg RFWE,RFDSel,ALUInSel,
Branch,DMWE,MtoRFSel,Jump,output reg [3:0] ALUSel

    );
    
    reg [1:0] ALUOp;
    
    always @(opcode or funct) begin
    case(opcode) 
    
    6'b000000: begin RFWE = 1;
    RFDSel = 1; ALUInSel = 0; Branch = 0; DMWE = 0; //r type
    MtoRFSel = 0; ALUOp = 2'b10;
    end
    
    6'b100011: begin RFWE =1;  RFDSel = 0; ALUInSel = 1; Branch = 0; DMWE = 0; //lw
    MtoRFSel = 1; ALUOp = 2'b00;
    end
    
    6'b101011: begin RFWE =0;  RFDSel = 1'bx; ALUInSel = 1; Branch = 0; DMWE = 1; //sw
    MtoRFSel = 1'bx; ALUOp = 2'b00;
    end
    
    6'b000100: begin RFWE =0;  RFDSel = 1'bx; ALUInSel = 0; Branch = 1; DMWE = 0;
    MtoRFSel = 1'bx; ALUOp = 2'b01;
    end
    
    6'b000010: begin RFWE = 0; RFDSel = 1'bx; ALUInSel = 1'bx; Branch = 1'bx; DMWE = 0;
     MtoRFSel = 1'bx; ALUOp = 1'bx; Jump = 1;
     end
     
     6'b001000: begin RFWE = 1; RFDSel = 0; ALUInSel = 1; Branch = 0; DMWE = 0; //addi 
     MtoRFSel = 0; ALUOp = 2'b00; Jump = 0;
    
    end
    
    
   endcase
     
    end
    
    always @* begin
    case(ALUOp)
    2'b00:ALUSel = 4'b0000; //add
    2'b01: ALUSel = 4'b0001; //sub
    2'b10: case(funct)
           6'b100000: ALUSel = 4'b0000; //add
           6'b100010: ALUSel = 4'b0001;//sub
           6'b100100: ALUSel = 4'b0101;//and
           6'b100101: ALUSel = 4'b1001;//or
           6'b000000: ALUSel = 4'b0010; //sll
           6'b000100: ALUSel = 4'b0100;//sllv
           6'b000111: ALUSel = 4'b0111; //srav
           
           //6'b100100: ALUSel = 4'b0000
           endcase
           endcase
           end
           
    
    
    
    
endmodule
