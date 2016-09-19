`timescale 1ns / 1ps

/*
 Universidade Estadual de Feira de Santana
 TEC499 - MI - Sistemas Digitais

 Module: ALUControl.v
 Desc: Unit that dictates what function the ALU must execute
 Inputs:
    Funct: R Instruction Funct field
    ALUCtrl: 3-bit Control bits from datapath signals

Output:
    ALUOp: 4-bit ALU Operation

*/
`include "ALU_Parameters.vh"
`include "Opcodes_Functs_Parameters.vh"
module ALUControl (
    input [5:0] Funct,
    input [2:0] ALUCtrl,
    output reg [3:0] ALUOp
    );

    always @(*) begin
        case (ALUCtrl)
            `AluCtrl_R: begin
                case (Funct)
                    `Funct_Add : ALUOp <= `AluOp_Add;
                    `Funct_Sub : ALUOp <= `AluOp_Sub;
                    `Funct_Sll : ALUOp <= `AluOp_Sll;
                    `Funct_Mul : ALUOp <= `AluOp_Mul;
                    `Funct_Div : ALUOp <= `AluOp_Div;
                    `Funct_Mfhi: ALUOp <= `AluOp_Mfhi;
                    `Funct_Slt : ALUOp <= `AluOp_Slt;
                    `Funct_Jr  : ALUOp <= `AluOp_Add;
                    default: ALUOp <= `AluOp_Add;
                endcase
            end

            `AluCtrl_Lui : ALUOp <= `AluOp_Lui;
            `AluCtrl_Addi: ALUOp <= `AluOp_Add;
            `AluCtrl_Ori : ALUOp <= `AluOp_Or;
            `AluCtrl_Beq : ALUOp <= `AluOp_Sub;
            `AluCtrl_Bne : ALUOp <= `AluOp_Sub;
            `AluCtrl_J   : ALUOp <= `AluOp_Add;
            `AluCtrl_Jal : ALUOp <= `AluOp_Add;
            `AluCtrl_Lw  : ALUOp <= `AluOp_Add;
            `AluCtrl_Sw  : ALUOp <= `AluOp_Add;
            default: ALUOp <= `AluOp_Add;
        endcase
    end
endmodule
