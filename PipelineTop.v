`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 11:52:41 AM
// Design Name: 
// Module Name: PipelineTop
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


module PipelineTop(input clk

    );
    
    wire[31:0] PC,PCF,PCp1F,PCp1D,PCp1E,PCSE,PCBranchM,IMRD,InstrD,RFRD1,RFRD2,SImmD,
    ALUIn1E,ALUIn2E,ALUIn2EMUX,SImmE,DMdInE,ALUOut,ALUOutM,ALUOutW,DMOutW,ResultW,
    DMdInM,SImm,DMInM,DMRD,ForwardAD,ForwardBD,ShiftOut,ALUIn1,ALUIn2,ALUMux2Out;
    
    wire[4:0] rtD,rdD,rtE,rdE,rsE,rtdE,rtdM,rtdW,RfMuxOut1,RfMuxOut2,RFAM;
    wire [3:0] ALUSelE,ALUSelD,ALUSel;
    wire [1:0] ForwardAE,ForwardBE;
    
    
    wire  RFWED,MtoRFSelD,DMWED,BranchD,ALUInSelD,RFDSelD, //13 inputs
    RFWEE,MtoRFSelE,DMWEE,BranchE,ALUInSelE,RFDSelE, //13 outputs and 9 inputs
    RFWEM,MtoRFSelM,DMWEM,BranchM,zero,zeroM, //9 outputs,5 inputs
    RFWEW,MtoRFSelW,PCSelM,PCSelD,PCBranchD,
    stall,flush,
    EqualD; // 5 outputs
    
    reg [5:0] opcode,funct;
    reg [4:0] rs,rt,rd;
    reg [15:0] Imm;
    reg [25:0] Jaddr;
    reg [4:0]shamt ;
    
    MUX M0 (.select(PCSelD),.a(PCp1F),.b(PCBranchD),.c(PC));
    ProgramCounter M1 (.clk(clk),.PCEn(stall),.PCnext(PC),.PCout(PCF));
    InstructionMem M2 (.pc(PCF),.InstOut(IMRD));
    Adder M3 (.a(PCF),.b(1),.out(PCp1F));
    DoubleFlipFlop M4 (.clk(clk),.clr(PCSelD),.FFWE(stall),.IMRD(IMRD),.PCp1(PCp1F),.InstrD(InstrD),.PCp1D(PCp1D));
    
    always @ (InstrD) begin
    opcode = InstrD [31:26]; 
    rs = InstrD[25:21];
    rt = InstrD [20:16];
    rd = InstrD [15:11];
    Imm = InstrD [15:0];
    funct = InstrD [5:0];
    Jaddr = InstrD [25:0];
    shamt = InstrD [10:6];
    end
    
    RegisterFile M5 (.clk(clk),.WriteEnable(RFWEW),.Read1(rs),.Read2(rt),.WriteReg(rtdW),.WriteData(ResultW),
    .ReadData1(RFRD1),.ReadData2(RFRD2));
    
    Mux5Bit M16 (.select(ForwardAD),.a(RFRD1),.b(SImm),.c(RfMuxOut1));
    Mux5Bit M17 (.select(ForwardBD),.a(RFRD2),.b(SImm),.c(RfMuxOut2));
    
    Equal M18 (.a(RfMuxOut1),.b(RfMuxOut2),.Equal(EqualD) );
    
    SignExtend M6(.a(Imm),.c(SImm));
    Shift M19 (.a(SImm),.out(ShiftOut));
    
    PLFF13 M7 (.clk(clk),.clr(flush),.RFWED(RFWED),.MtoRFSelD(MtoRFSelD),.DMWED(DMWED),.BranchD(BranchD),.ALUSelD(ALUSelD),.ALUInSelD(ALUInSelD),.RFDSelD(RFDSelD),
    .RFRD1(RFRD1),.RFRD2(RFRD2),.SImmD(SImm),.PCp1D(PCp1D),//inputs
    .rtD(rt),.rdD(rd),.rsD(rs), //inputs
    .RFWEE(RFWEE),.MtoRFSelE(MtoRFSelE),.DMWEE(DMWEE),.BranchE(BranchE),.ALUSelE(ALUSelE),.ALUInSelE(ALUInSelE),.RFDSelE(RFDSelE),
    .ALUIn1E(ALUIn1E),.DMdInE(DMdInE),.SImmE(SImmE),.PCp1E(PCp1E),
    .rtE(rtE),.rdE(rdE),.rsE(rsE));
    
    MUX ALU2 (.select(ALUInSelE),.a(ALUMux2Out),.b(SImmE),.c(ALUIn2E));
    RTDMux rtmux (.select (RFDSelE),.a(rtE),.b(rdE),.c(rtdE));
    
    Mux32Out M20 (.select(ForwardAE),.a(ALUIn1E),.b(ResultW),.c(ALUOutM),.out(ALUIn1));
    Mux32Out M21 (.select(ForwardBE),.a(DMdInE),.b(ResultW),.c(ALUOutM),.out(ALUMux2Out));
    
    ALU M8 (.select(ALUSelE),.a(ALUIn1E),.b(ALUIn2E),.shamt(shamt),.Zero(),.ALUout(ALUOut));
    
    Adder M9 (.a(ShiftOut),.b(PCp1D),.out(PCBranchD));
    
    FlipFlop9 M10 (.clk(clk),.RFWEE(RFWEE),.MtoRFSelE(MtoRFSelE),.DMWEE(DMWEE),.BranchE(BranchE),
    .ALUOut(ALUOut),.DMdInE(DMdInE),.PCSE(PCSE),.rtdE(rtdE),//inputs
    .RFWEM(RFWEM),.MtoRFSelM(MtoRFSelM),.DMWEM(DMWEM),.BranchM(BranchM),//outputs
    .ALUOutM(ALUOutM),.DMdInM(DMdInM),.PCBranchM(PCBranchM),
    .rtdM(rtdM));
    
    AndGate M11 (.a(BranchD),.b(EqualD),.c(PCSelD));
    
    DataMemory M12 (.clk(clk),.WE(DMWEM),.DMA(ALUOutM),.WriteData(DMdInM),.DataOut(DMRD));
    
    FlipFlop5 M13 (.clk(clk),.RFWEM(RFWEM),.MtoRFSelM(MtoRFSelM),.ALUOutM(ALUOutM),.DMRD(DMRD),.rtdM(rtdM),
    .RFWEW(RFWEW),.MtoRFSelW(MtoRFSelW),.ALUOutW(ALUOutW),.DMOutW(DMOutW),.rtdW(rtdW));
    
    MUX PC1 (.select(MtoRFSelW),.a(ALUOutW),.b(DMOutW),.c(ResultW));
    
    ControlUnit M14 (.opcode(opcode),.funct(funct),.RFWE(RFWED),.MtoRFSel(MtoRFSelD),.DMWE(DMWED),.Branch(BranchD),.ALUSel(ALUSelD),
    .ALUInSel(ALUInSelD),.RFDSel(RFDSelD));
    
    HazardUnit M15 (.rsD(rs),.rtD(rt),.rsE(rsE),.rtE(rtE),.rtdW(rtdW),.MtoRFSelE(MtoRFSelE),.MtoRFSelM(MtoRFSelM),
    .RFAM(rtdM),.RFAW(rtdW),.RFAE(rtdE),.RFWEM(RFWEM),.RFWEW(RFWEW),.BranchD(BranchD)//inputs
    ,.stall(stall),.flush(flush),.ForwardAD(ForwardAD),.ForwardBD(ForwardBD),.ForwardAE(ForwardAE),.ForwardBE(ForwardBE) ); //outputs
    
    
    
endmodule
