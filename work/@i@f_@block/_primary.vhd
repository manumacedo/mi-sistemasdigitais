library verilog;
use verilog.vl_types.all;
entity IF_Block is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        ID_PCSrc        : in     vl_logic_vector(1 downto 0);
        ID_JumpAddr     : in     vl_logic_vector(31 downto 0);
        ID_BranchAddr   : in     vl_logic_vector(31 downto 0);
        ID_JrRsData     : in     vl_logic_vector(31 downto 0);
        MEM_MemRead     : in     vl_logic;
        MEM_MemWrite    : in     vl_logic;
        MEM_ALUOut      : in     vl_logic_vector(31 downto 0);
        MEM_RtData      : in     vl_logic_vector(31 downto 0);
        WB_WriteData    : in     vl_logic_vector(31 downto 0);
        Mem_ReadData    : in     vl_logic_vector(31 downto 0);
        IF_ForC         : in     vl_logic;
        IF_Write        : in     vl_logic;
        IF_PCWrite      : in     vl_logic;
        IF_Flush        : in     vl_logic;
        Mem_Address     : out    vl_logic_vector(31 downto 0);
        Mem_WriteData   : out    vl_logic_vector(31 downto 0);
        ID_Instruction  : out    vl_logic_vector(31 downto 0);
        ID_PCplus4      : out    vl_logic_vector(31 downto 0)
    );
end IF_Block;
