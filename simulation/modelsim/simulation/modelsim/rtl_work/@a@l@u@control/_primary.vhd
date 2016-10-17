library verilog;
use verilog.vl_types.all;
entity ALUControl is
    port(
        Funct           : in     vl_logic_vector(5 downto 0);
        ALUCtrl         : in     vl_logic_vector(2 downto 0);
        ALUOp           : out    vl_logic_vector(3 downto 0)
    );
end ALUControl;
