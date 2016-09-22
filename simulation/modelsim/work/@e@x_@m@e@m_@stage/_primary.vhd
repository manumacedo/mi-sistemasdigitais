library verilog;
use verilog.vl_types.all;
entity EX_MEM_Stage is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        EXMEMWrite      : in     vl_logic;
        EX_Flush        : in     vl_logic;
        EX_RegWrite     : in     vl_logic;
        EX_MemtoReg     : in     vl_logic;
        EX_MemRead      : in     vl_logic;
        EX_MemWrite     : in     vl_logic;
        EX_ALUOut       : in     vl_logic_vector(31 downto 0);
        EX_RtData       : in     vl_logic_vector(31 downto 0);
        EX_RdReg        : in     vl_logic_vector(4 downto 0);
        EX_Instruction  : in     vl_logic_vector(31 downto 0);
        MEM_ALUOut      : out    vl_logic_vector(31 downto 0);
        MEM_RtData      : out    vl_logic_vector(31 downto 0);
        MEM_RdReg       : out    vl_logic_vector(4 downto 0);
        MEM_RegWrite    : out    vl_logic;
        MEM_MemtoReg    : out    vl_logic;
        MEM_MemRead     : out    vl_logic;
        MEM_MemWrite    : out    vl_logic;
        MEM_Instruction : out    vl_logic_vector(31 downto 0)
    );
end EX_MEM_Stage;
