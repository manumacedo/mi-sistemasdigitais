library verilog;
use verilog.vl_types.all;
entity Processor is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        Mem_DataIn      : in     vl_logic_vector(31 downto 0);
        Mem_Address     : out    vl_logic_vector(31 downto 0);
        Mem_WriteEnable : out    vl_logic;
        Mem_DataOut     : out    vl_logic_vector(31 downto 0)
    );
end Processor;
