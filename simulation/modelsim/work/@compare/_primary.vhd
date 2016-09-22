library verilog;
use verilog.vl_types.all;
entity Compare is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        EQ              : out    vl_logic;
        TLZ             : out    vl_logic;
        NE              : out    vl_logic;
        GEZ             : out    vl_logic
    );
end Compare;
