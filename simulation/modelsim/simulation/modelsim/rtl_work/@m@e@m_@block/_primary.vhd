library verilog;
use verilog.vl_types.all;
entity MEM_Block is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        MEM_ALUOut      : in     vl_logic_vector(31 downto 0);
        MEM_RtData      : in     vl_logic_vector(31 downto 0);
        MEM_Instruction : in     vl_logic_vector(31 downto 0);
        MEM_DestReg     : in     vl_logic_vector(4 downto 0);
        MEM_RegWrite    : in     vl_logic;
        MEM_MemtoReg    : in     vl_logic;
        MEM_MemRead     : in     vl_logic;
        MEM_MemWrite    : in     vl_logic;
        Mem_ReadData    : in     vl_logic_vector(31 downto 0);
        WB_MemData      : out    vl_logic_vector(31 downto 0);
        WB_ALUOut       : out    vl_logic_vector(31 downto 0);
        WB_Instruction  : out    vl_logic_vector(31 downto 0);
        WB_DestReg      : out    vl_logic_vector(4 downto 0);
        WB_RegWrite     : out    vl_logic;
        WB_MemtoReg     : out    vl_logic
    );
end MEM_Block;
