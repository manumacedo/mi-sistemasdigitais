library verilog;
use verilog.vl_types.all;
entity Mux2 is
    generic(
        SIZE            : integer := 32
    );
    port(
        Sel             : in     vl_logic;
        In0             : in     vl_logic_vector;
        In1             : in     vl_logic_vector;
        \Out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end Mux2;
