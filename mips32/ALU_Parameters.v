/*Operações da ALU*/
parameter [3:0] AluOp_Add  = 4'b0010;
parameter [3:0] AluOp_Sub  = 4'b0110;
parameter [3:0] AluOp_Lui  = 4'b0100;
parameter [3:0] AluOp_Sll  = 4'b0011;
parameter [3:0] AluOp_Or   = 4'b0001;
parameter [3:0] AluOp_Mul  = 4'b1000;
parameter [3:0] AluOp_Div  = 4'b1001;
parameter [3:0] AluOp_Mfhi = 4'b1110;
parameter [3:0] AluOp_Slt  = 4'b0111;

/*Operações do Controlador da ALU*/
parameter [2:0] AluCtrl_R    = 3'b000;
parameter [2:0] AluCtrl_Lui  = 3'b001;
parameter [2:0] AluCtrl_Addi = 3'b010;
parameter [2:0] AluCtrl_Ori  = 3'b011;
parameter [2:0] AluCtrl_Beq  = 3'b100;
parameter [2:0] AluCtrl_Bne  = AluCtrl_Beq;
parameter [2:0] AluCtrl_J    = AluCtrl_Addi;
parameter [2:0] AluCtrl_Jal  = AluCtrl_Addi;
parameter [2:0] AluCtrl_Lw   = AluCtrl_Addi;
parameter [2:0] AluCtrl_Sw   = AluCtrl_Addi;
