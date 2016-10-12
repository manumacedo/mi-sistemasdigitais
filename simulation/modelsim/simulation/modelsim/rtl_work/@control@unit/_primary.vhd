library verilog;
use verilog.vl_types.all;
entity ControlUnit is
    port(
        Opcode          : in     vl_logic_vector(5 downto 0);
        Funct           : in     vl_logic_vector(5 downto 0);
        Cmp_RsRt        : in     vl_logic;
        IF_Flush        : out    vl_logic;
        SignExt         : out    vl_logic;
        PCSrc           : out    vl_logic_vector(1 downto 0);
        NoDest          : out    vl_logic;
        ALUCtrl         : out    vl_logic_vector(2 downto 0);
        ALUSrc          : out    vl_logic;
        RegDst          : out    vl_logic;
        MemWrite        : out    vl_logic;
        MemRead         : out    vl_logic;
        RegWrite        : out    vl_logic;
        Branch          : out    vl_logic;
        MemtoReg        : out    vl_logic
    );
end ControlUnit;
