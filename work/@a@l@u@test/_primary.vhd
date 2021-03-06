library verilog;
use verilog.vl_types.all;
entity ALUTest is
    generic(
        Op_R            : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        Op_R2           : vl_logic_vector(5 downto 0) := (Hi0, Hi1, Hi1, Hi1, Hi0, Hi0);
        Op_Add          : vl_logic_vector(5 downto 0);
        Op_Addi         : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        Op_Sub          : vl_logic_vector(5 downto 0);
        Op_Lui          : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi1, Hi1, Hi1, Hi1);
        Op_Sll          : vl_logic_vector(5 downto 0);
        Op_Ori          : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi1, Hi1, Hi0, Hi1);
        Op_Mul          : vl_logic_vector(5 downto 0);
        Op_Div          : vl_logic_vector(5 downto 0);
        Op_Mfhi         : vl_logic_vector(5 downto 0);
        Op_Slt          : vl_logic_vector(5 downto 0);
        Op_Beq          : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        Op_Bne          : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi1);
        Op_J            : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        Op_Jal          : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi1);
        Op_Jr           : vl_logic_vector(5 downto 0);
        Op_Lw           : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi0, Hi0, Hi1, Hi1);
        Op_Sw           : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi1, Hi0, Hi0, Hi1);
        Funct_Add       : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        Funct_Sub       : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi0, Hi0, Hi1, Hi0);
        Funct_Sll       : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        Funct_Mul       : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        Funct_Div       : vl_logic_vector(5 downto 0) := (Hi0, Hi1, Hi1, Hi0, Hi1, Hi0);
        Funct_Mfhi      : vl_logic_vector(5 downto 0) := (Hi0, Hi1, Hi0, Hi0, Hi0, Hi0);
        Funct_Slt       : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi1, Hi0, Hi1, Hi0);
        Funct_Jr        : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        AluOp_Add       : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi1, Hi0);
        AluOp_Sub       : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi1, Hi0);
        AluOp_Lui       : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi0, Hi0);
        AluOp_Sll       : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi1, Hi1);
        AluOp_Or        : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi0, Hi1);
        AluOp_Mul       : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi0, Hi0);
        AluOp_Div       : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi0, Hi1);
        AluOp_Mfhi      : vl_logic_vector(3 downto 0) := (Hi1, Hi1, Hi1, Hi0);
        AluOp_Slt       : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi1, Hi1);
        AluCtrl_R       : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi0);
        AluCtrl_Lui     : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi1);
        AluCtrl_Addi    : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi0);
        AluCtrl_Ori     : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi1);
        AluCtrl_Beq     : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi0);
        AluCtrl_Bne     : vl_logic_vector(2 downto 0);
        AluCtrl_J       : vl_logic_vector(2 downto 0);
        AluCtrl_Jal     : vl_logic_vector(2 downto 0);
        AluCtrl_Lw      : vl_logic_vector(2 downto 0);
        AluCtrl_Sw      : vl_logic_vector(2 downto 0);
        Halfcycle       : integer := 5
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Op_R : constant is 2;
    attribute mti_svvh_generic_type of Op_R2 : constant is 2;
    attribute mti_svvh_generic_type of Op_Add : constant is 4;
    attribute mti_svvh_generic_type of Op_Addi : constant is 2;
    attribute mti_svvh_generic_type of Op_Sub : constant is 4;
    attribute mti_svvh_generic_type of Op_Lui : constant is 2;
    attribute mti_svvh_generic_type of Op_Sll : constant is 4;
    attribute mti_svvh_generic_type of Op_Ori : constant is 2;
    attribute mti_svvh_generic_type of Op_Mul : constant is 4;
    attribute mti_svvh_generic_type of Op_Div : constant is 4;
    attribute mti_svvh_generic_type of Op_Mfhi : constant is 4;
    attribute mti_svvh_generic_type of Op_Slt : constant is 4;
    attribute mti_svvh_generic_type of Op_Beq : constant is 2;
    attribute mti_svvh_generic_type of Op_Bne : constant is 2;
    attribute mti_svvh_generic_type of Op_J : constant is 2;
    attribute mti_svvh_generic_type of Op_Jal : constant is 2;
    attribute mti_svvh_generic_type of Op_Jr : constant is 4;
    attribute mti_svvh_generic_type of Op_Lw : constant is 2;
    attribute mti_svvh_generic_type of Op_Sw : constant is 2;
    attribute mti_svvh_generic_type of Funct_Add : constant is 2;
    attribute mti_svvh_generic_type of Funct_Sub : constant is 2;
    attribute mti_svvh_generic_type of Funct_Sll : constant is 2;
    attribute mti_svvh_generic_type of Funct_Mul : constant is 2;
    attribute mti_svvh_generic_type of Funct_Div : constant is 2;
    attribute mti_svvh_generic_type of Funct_Mfhi : constant is 2;
    attribute mti_svvh_generic_type of Funct_Slt : constant is 2;
    attribute mti_svvh_generic_type of Funct_Jr : constant is 2;
    attribute mti_svvh_generic_type of AluOp_Add : constant is 2;
    attribute mti_svvh_generic_type of AluOp_Sub : constant is 2;
    attribute mti_svvh_generic_type of AluOp_Lui : constant is 2;
    attribute mti_svvh_generic_type of AluOp_Sll : constant is 2;
    attribute mti_svvh_generic_type of AluOp_Or : constant is 2;
    attribute mti_svvh_generic_type of AluOp_Mul : constant is 2;
    attribute mti_svvh_generic_type of AluOp_Div : constant is 2;
    attribute mti_svvh_generic_type of AluOp_Mfhi : constant is 2;
    attribute mti_svvh_generic_type of AluOp_Slt : constant is 2;
    attribute mti_svvh_generic_type of AluCtrl_R : constant is 2;
    attribute mti_svvh_generic_type of AluCtrl_Lui : constant is 2;
    attribute mti_svvh_generic_type of AluCtrl_Addi : constant is 2;
    attribute mti_svvh_generic_type of AluCtrl_Ori : constant is 2;
    attribute mti_svvh_generic_type of AluCtrl_Beq : constant is 2;
    attribute mti_svvh_generic_type of AluCtrl_Bne : constant is 4;
    attribute mti_svvh_generic_type of AluCtrl_J : constant is 4;
    attribute mti_svvh_generic_type of AluCtrl_Jal : constant is 4;
    attribute mti_svvh_generic_type of AluCtrl_Lw : constant is 4;
    attribute mti_svvh_generic_type of AluCtrl_Sw : constant is 4;
    attribute mti_svvh_generic_type of Halfcycle : constant is 1;
end ALUTest;
