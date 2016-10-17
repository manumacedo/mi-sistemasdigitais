`timescale 1ns / 1ps
`include "Opcodes_Functs_Parameters.vh"
`include "Datapath_Parameters.vh"

module ControlUnitTest ();

    parameter Halfcycle = 5;

    localparam Cycle = 2*Halfcycle;

    reg Clock;

    initial Clock = 0;
    always #(Halfcycle) Clock = ~Clock;

    reg [5:0] funct, opcode;
    reg Cmp_Eq;

    wire IF_Flush;
    wire SignExt;
    wire [1:0] PCSrc;
    wire NoDest;
    wire [2:0] ALUCtrl;
    wire ALUSrc;
    wire RegDst;
    wire MemWrite;
    wire MemRead;
    wire RegWrite;
    wire MemtoReg;
    wire Branch;

    ControlUnit CtrlU (
        .Funct(funct),
        .Opcode(opcode),
        .Cmp_RsRt(Cmp_Eq),
        .IF_Flush(IF_Flush),
        .SignExt(SignExt),
        .PCSrc(PCSrc),
        .NoDest(NoDest),
        .ALUCtrl(ALUCtrl),
        .ALUSrc(ALUSrc),
        .RegDst(RegDst),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .RegWrite(RegWrite),
        .Branch(Branch),
        .MemtoReg(MemtoReg)
    );


    task checkOutput;
        input [5:0] opcode,funct;
        input Cmp;
        input [1:0] PCSrc;
        input NoDest;
        input [2:0] AluCtrl;
        input AluSrc,RegDst,MemWr,MemRd,MemtoReg,RegWr;
        input IF_Flush, SignExt, Branch;
        begin
            $display ("Opcode: %b  Funct: %b Cmp_Eq: %b",opcode,funct,Cmp);
            $display ("PCSrc: %b NoDest: %b AluCtrl: %b AluSrc: %b RegDst: %b MemWr: %b MemRd: %b MemtoReg: %b RegWr: %b",
                        PCSrc,NoDest,AluCtrl,AluSrc,RegDst,MemWr,MemRd,MemtoReg,RegWr);
            $display("IF_Flush: %b SignExt: %b Branch: %b\n",IF_Flush,SignExt,Branch);
        end
    endtask

    initial begin
        Cmp_Eq = 0;

        opcode = `Op_R;

        funct = `Funct_Add;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        funct = `Funct_Sub;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        opcode = `Op_R2;
        funct = `Funct_Mul;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        opcode = `Op_R;
        funct = `Funct_Sll;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        funct = `Funct_Div;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        funct = `Funct_Mfhi;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        funct = `Funct_Slt;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        funct = `Funct_Jr;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        opcode = `Op_Addi;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        opcode = `Op_Lui;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        opcode = `Op_Ori;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        opcode = `Op_Beq;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        opcode = `Op_Bne;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        opcode = `Op_J;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        opcode = `Op_Jal;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        opcode = `Op_Lw;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        opcode = `Op_Sw;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        $display("Branch Tests");
        Cmp_Eq = 1;
        opcode = `Op_Beq;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        opcode = `Op_Bne;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        $display("Invalid Instruction Tests");
        opcode = 6'b111111;
        funct = 6'b000000;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        opcode = 6'b000000;
        funct = 6'b111111;
        #1;
        checkOutput(opcode,funct,Cmp_Eq,PCSrc,NoDest,ALUCtrl,ALUSrc,RegDst,MemWrite,MemRead,MemtoReg,RegWrite,IF_Flush,SignExt,Branch);

        $display("Pass All Test");

        $finish();
    end
endmodule
