library verilog;
use verilog.vl_types.all;
entity ALU is
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
        OVERFLOW        : out    vl_logic;
        UNDERFLOW       : out    vl_logic
    );
end ALU;
