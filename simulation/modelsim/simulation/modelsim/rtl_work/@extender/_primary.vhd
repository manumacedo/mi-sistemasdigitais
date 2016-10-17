library verilog;
use verilog.vl_types.all;
entity Extender is
    port(
        SignExt         : in     vl_logic;
        \In\            : in     vl_logic_vector(15 downto 0);
        \Out\           : out    vl_logic_vector(31 downto 0)
    );
end Extender;
