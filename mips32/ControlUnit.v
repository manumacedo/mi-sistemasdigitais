`timescale 1ns / 1ps

`include "Opcodes_Functs_Parameters.vh"
`include "Datapath_Parameters.vh"

module ControlUnit (
    input [5:0] Opcode,
    input [5:0] Funct,
    input Cmp_RsRt,

    output IF_Flush,
    output SignExt,
    output [1:0] PCSrc,
    output NoDest,
    output [2:0] ALUCtrl,
    output ALUSrc,
    output RegDst,
    output MemWrite,
    output MemRead,
    output RegWrite,
    output Branch,
    output MemtoReg
    );

    reg [11:0] datapath;

    assign PCSrc[0]     = datapath[10];
    assign NoDest       = datapath[9];
    assign ALUCtrl      = datapath[8:6];
    assign ALUSrc       = datapath[5];
    assign RegDst       = datapath[4];
    assign MemWrite     = datapath[3];
    assign MemRead      = datapath[2];
    assign MemtoReg     = datapath[1];
    assign RegWrite     = datapath[0];

    wire Branch_Eq, Branch_Neq;

    always @(*) begin
        case (Opcode)
            `Op_R: begin
                case (Funct)
                    `Funct_Add:  datapath <= `DP_Add;
                    `Funct_Sub:  datapath <= `DP_Sub;
                    `Funct_Sll:  datapath <= `DP_Sll;
                    `Funct_Div:  datapath <= `DP_Div;
                    `Funct_Mfhi: datapath <= `DP_Mfhi;
                    `Funct_Slt:  datapath <= `DP_Slt;
                    `Funct_Jr :  datapath <= `DP_Jr;
                    default  :  datapath <= 12'b0;
                endcase
            end

            `Op_R2: begin
                case (Funct)
                    `Funct_Mul: datapath <= `DP_Mul;
                    default:   datapath <= 12'b0;
                endcase
            end

            `Op_Addi:  datapath <= `DP_Addi;
            `Op_Lui :  datapath <= `DP_Lui;
            `Op_Ori :  datapath <= `DP_Ori;
            `Op_Beq :  datapath <= `DP_Beq;
            `Op_Bne :  datapath <= `DP_Bne;
            `Op_J   :  datapath <= `DP_J;
            `Op_Jal :  datapath <= `DP_Jal;
            `Op_Lw  :  datapath <= `DP_Lw;
            `Op_Sw  :  datapath <= `DP_Sw;
            default:  datapath <= 12'b0;
        endcase
    end

    // Instruction in ID is a Branch
    assign Branch = (datapath[11] & ~datapath[10]);
    // Branch Equal
    assign Branch_Eq  =  (~Opcode[3] & Opcode[2] & ~Opcode[1] & ~Opcode[0]) & Cmp_RsRt;
    // Branch Not Equal
    assign Branch_Neq =  (~Opcode[3] & Opcode[2] & ~Opcode[1] &  Opcode[0]) & ~Cmp_RsRt;

    assign PCSrc[1] = (Branch) ? (Branch_Eq | Branch_Neq) : datapath[11];
    // Insturction in ID is a Jump
    assign Jump = (~datapath[11] & datapath[10]);
    // Instruction in ID is a JumpReg
    assign JumpReg = (datapath[11] & datapath[10]);

    // Flush IF/ID Pipeline Registers
    assign IF_Flush = (Branch_Eq | Branch_Neq) | (Jump | JumpReg);

    // Extend Immediate field sign if instruction is different from ORI or LUI
    assign SignExt = (Opcode[5:2] != 4'b0011);


endmodule
