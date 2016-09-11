library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
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
        AluCtrl_Sw      : vl_logic_vector(2 downto 0)
    );
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        Shamt           : in     vl_logic_vector(4 downto 0);
        ALUOp           : in     vl_logic_vector(3 downto 0);
        ALUOut          : out    vl_logic_vector(31 downto 0);
        ZERO            : out    vl_logic;
        NEGATIVE        : out    vl_logic;
        CARRY           : out    vl_logic;
        OVERFLOW        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
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
end ALU;
