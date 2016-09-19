`ifndef ALUPARAMETERS
`define ALUPARAMETERS
/*
 Parameters for ALUControl.v and ALU.v 

*/

/*ALU Operations*/
`define AluOp_Add  4'b0010
`define AluOp_Sub  4'b0110
`define AluOp_Lui  4'b0100
`define AluOp_Sll  4'b0011
`define AluOp_Or   4'b0001
`define AluOp_Mul  4'b1000
`define AluOp_Div  4'b1001
`define AluOp_Mfhi 4'b1110
`define AluOp_Slt  4'b0111

/*ALUControl Operations*/
`define AluCtrl_R    3'b000
`define AluCtrl_Lui  3'b001
`define AluCtrl_Addi 3'b010
`define AluCtrl_Ori  3'b011
`define AluCtrl_Beq  3'b100
`define AluCtrl_Bne  3'b100
`define AluCtrl_J    3'b010
`define AluCtrl_Jal  3'b010
`define AluCtrl_Lw   3'b010
`define AluCtrl_Sw   3'b010

`endif //ALUPARAMETERS
