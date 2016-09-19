`ifndef OPCODEPARAMETERS
`define OPCODEPARAMETERS

/*Tipos de Opcode*/
`define Op_R  6'b000000
`define Op_R2 6'b011100

/*Opcodes das Instruções*/
`define Op_Add  6'b000000
`define Op_Addi 6'b001000
`define Op_Sub  6'b000000
`define Op_Lui  6'b001111
`define Op_Sll  6'b000000
`define Op_Ori  6'b001101
`define Op_Mul  6'b011100
`define Op_Div  6'b000000
`define Op_Mfhi 6'b000000
`define Op_Slt  6'b000000
`define Op_Beq  6'b000100
`define Op_Bne  6'b000101
`define Op_J    6'b000010
`define Op_Jal  6'b000011
`define Op_Jr   6'b000000
`define Op_Lw   6'b100011
`define Op_Sw   6'b101011

/*Function Codes das instruções tipo R*/
`define Funct_Add  6'b100000
`define Funct_Sub  6'b100010
`define Funct_Sll  6'b000000
`define Funct_Mul  6'b000010
`define Funct_Div  6'b011010
`define Funct_Mfhi 6'b010000
`define Funct_Slt  6'b101010
`define Funct_Jr   6'b001000

`endif //OPCODEPARAMETERS
