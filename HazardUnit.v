`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2020 12:12:56 PM
// Design Name: 
// Module Name: HazardUnit
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


module HazardUnit( input [4:0]rsD,rtD,rsE,rtE, rtdW,RFAM,RFAW,RFAE, input MtoRFSelE,MtoRFSelM,BranchD,RFWEW,RFWEM,output reg stall, RFWEE,flush
,ForwardAD,ForwardBD,output reg [1:0] ForwardAE,ForwardBE

    );
    
    reg LWStall;
    reg BRstall;
    always @(rsD or rsE or rtD or rtE)//@*
    begin
    
    LWStall = (MtoRFSelE & ((rtE==rsD)) | (rtE==rtD));
    //stall = LWStall;
    
    ForwardAD = (rsD != 0) & (rsD==RFAM) & RFWEM;
    ForwardBD = (rtD !=0) & (rtD==RFAM) & RFWEM;
    
    BRstall = ((rsD == RFAE | rtD == RFAE) & BranchD & RFWEE) | ((rsD==RFAM |rtD == RFAM)
    & BranchD & MtoRFSelM); //or m
    
    flush = LWStall | BRstall;
    
    stall = LWStall | BRstall;
    
    
    //flush = LWStall | BRstall;
    //stall = LWStall | BRstall;
    
    if((rsE!=0) & RFWEM & (rsE==RFAM))
    ForwardAE = 2'b10;
    else if ((rsE!=0) & RFWEW & (rsE==rtdW))
    ForwardAE = 2'b01;
    else
    ForwardAE = 2'b00;
    
    if((rtE!=0) & RFWEM & (rtE==RFAM))
    ForwardBE = 2'b10;
    else if((rtE!=0) & RFWEW & (rtE==rtdW))
    ForwardBE = 2'b01;
    else ForwardBE = 2'b00;
    end
endmodule
