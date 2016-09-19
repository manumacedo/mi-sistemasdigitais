library verilog;
use verilog.vl_types.all;
entity HazardDetectionUnit is
    port(
        IDEX_MemRead    : in     vl_logic;
        IDEX_RegWrite   : in     vl_logic;
        EXMEM_MemWrite  : in     vl_logic;
        EXMEM_MemRead   : in     vl_logic;
        MemWrite        : in     vl_logic;
        Branch          : in     vl_logic;
        IDEX_DestReg    : in     vl_logic_vector(4 downto 0);
        IFID_RegRs      : in     vl_logic_vector(4 downto 0);
        IFID_RegRt      : in     vl_logic_vector(4 downto 0);
        EXMEM_RegRd     : in     vl_logic_vector(4 downto 0);
        IFID_Write      : out    vl_logic;
        PCWrite         : out    vl_logic;
        HazZero         : out    vl_logic
    );
end HazardDetectionUnit;
