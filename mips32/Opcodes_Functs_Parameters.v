/*Tipos de Opcode*/
parameter [5:0] Op_R  = 6'b000000;
parameter [5:0] Op_R2 = 6'b011100;

/*Opcodes das Instruções*/
parameter [5:0] Op_Add  = Op_R;
parameter [5:0] Op_Addi = 6'b001000;
parameter [5:0] Op_Sub  = Op_R;
parameter [5:0] Op_Lui  = 6'b001111;
parameter [5:0] Op_Sll  = Op_R;
parameter [5:0] Op_Ori  = 6'b001101;
parameter [5:0] Op_Mul  = Op_R2;
parameter [5:0] Op_Div  = Op_R;
parameter [5:0] Op_Mfhi = Op_R;
parameter [5:0] Op_Slt  = Op_R;
parameter [5:0] Op_Beq  = 6'b000100;
parameter [5:0] Op_Bne  = 6'b000101;
parameter [5:0] Op_J    = 6'b000010;
parameter [5:0] Op_Jal  = 6'b000011;
parameter [5:0] Op_Jr   = Op_R;
parameter [5:0] Op_Lw   = 6'b100011;
parameter [5:0] Op_Sw   = 6'b101001;

/*Function Codes das instruções tipo R*/
parameter [5:0] Funct_Add  = 6'b100000;
parameter [5:0] Funct_Sub  = 6'b100010;
parameter [5:0] Funct_Sll  = 6'b000000;
parameter [5:0] Funct_Mul  = 6'b000010;
parameter [5:0] Funct_Div  = 6'b011010;
parameter [5:0] Funct_Mfhi = 6'b010000;
parameter [5:0] Funct_Slt  = 6'b101010;
parameter [5:0] Funct_Jr   = 6'b001000;
