library verilog;
use verilog.vl_types.all;
entity IF_ID_Stage is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        IF_PCplus4      : in     vl_logic_vector(31 downto 0);
        IF_Instruction  : in     vl_logic_vector(31 downto 0);
        IFDWrite        : in     vl_logic;
        IF_Flush        : in     vl_logic;
        ID_Instruction  : out    vl_logic_vector(31 downto 0);
        ID_PCplus4      : out    vl_logic_vector(31 downto 0)
    );
end IF_ID_Stage;
