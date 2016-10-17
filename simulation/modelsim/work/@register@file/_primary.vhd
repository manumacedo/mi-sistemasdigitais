library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        ReadRg1         : in     vl_logic_vector(4 downto 0);
        ReadRg2         : in     vl_logic_vector(4 downto 0);
        WriteRg         : in     vl_logic_vector(4 downto 0);
        RegWrite        : in     vl_logic;
        WriteData       : in     vl_logic_vector(31 downto 0);
        ReadData1       : out    vl_logic_vector(31 downto 0);
        ReadData2       : out    vl_logic_vector(31 downto 0)
    );
end RegisterFile;
