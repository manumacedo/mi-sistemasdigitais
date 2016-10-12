library verilog;
use verilog.vl_types.all;
entity \Register\ is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        Enable          : in     vl_logic;
        \In\            : in     vl_logic_vector(31 downto 0);
        \Out\           : out    vl_logic_vector(31 downto 0)
    );
end \Register\;
