library verilog;
use verilog.vl_types.all;
entity BranchForwardUnit is
    port(
        EXMEM_RegWrite  : in     vl_logic;
        MEMWB_RegWrite  : in     vl_logic;
        IFID_RegRs      : in     vl_logic_vector(4 downto 0);
        IFID_RegRt      : in     vl_logic_vector(4 downto 0);
        EXMEM_RegRd     : in     vl_logic_vector(4 downto 0);
        MEMWB_RegRd     : in     vl_logic_vector(4 downto 0);
        ForBranchA      : out    vl_logic_vector(1 downto 0);
        ForBranchB      : out    vl_logic_vector(1 downto 0)
    );
end BranchForwardUnit;
