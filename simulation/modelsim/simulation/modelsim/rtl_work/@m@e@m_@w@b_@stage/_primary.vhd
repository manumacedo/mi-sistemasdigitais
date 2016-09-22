library verilog;
use verilog.vl_types.all;
entity MEM_WB_Stage is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        MEMWBWrite      : in     vl_logic;
        MEM_Flush       : in     vl_logic;
        MEM_RegWrite    : in     vl_logic;
        MEM_MemtoReg    : in     vl_logic;
        MEM_MemData     : in     vl_logic_vector(31 downto 0);
        MEM_ALUOut      : in     vl_logic_vector(31 downto 0);
        MEM_RdReg       : in     vl_logic_vector(4 downto 0);
        MEM_Instruction : in     vl_logic_vector(31 downto 0);
        WB_MemData      : out    vl_logic_vector(31 downto 0);
        WB_ALUOut       : out    vl_logic_vector(31 downto 0);
        WB_RdReg        : out    vl_logic_vector(4 downto 0);
        WB_RegWrite     : out    vl_logic;
        WB_MemtoReg     : out    vl_logic;
        WB_Instruction  : out    vl_logic_vector(31 downto 0)
    );
end MEM_WB_Stage;
