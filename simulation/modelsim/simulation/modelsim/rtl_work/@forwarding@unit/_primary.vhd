library verilog;
use verilog.vl_types.all;
entity ForwardingUnit is
    port(
        MEMWB_MemToReg  : in     vl_logic;
        MEMWB_RegWrite  : in     vl_logic;
        EXMEM_RegWrite  : in     vl_logic;
        EXMEM_MemWrite  : in     vl_logic;
        IDEX_RegRs      : in     vl_logic_vector(4 downto 0);
        IDEX_RegRt      : in     vl_logic_vector(4 downto 0);
        EXMEM_RegRd     : in     vl_logic_vector(4 downto 0);
        MEMWB_RegRd     : in     vl_logic_vector(4 downto 0);
        ForA            : out    vl_logic_vector(1 downto 0);
        ForB            : out    vl_logic_vector(1 downto 0);
        ForC            : out    vl_logic
    );
end ForwardingUnit;
