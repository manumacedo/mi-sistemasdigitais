library verilog;
use verilog.vl_types.all;
entity WB_Block is
    port(
        WB_MemData      : in     vl_logic_vector(31 downto 0);
        WB_ALUOut       : in     vl_logic_vector(31 downto 0);
        WB_MemtoReg     : in     vl_logic;
        WB_WriteData    : out    vl_logic_vector(31 downto 0)
    );
end WB_Block;
