library verilog;
use verilog.vl_types.all;
entity Mux4 is
    generic(
        SIZE            : integer := 32
    );
    port(
        Sel             : in     vl_logic_vector(1 downto 0);
        In00            : in     vl_logic_vector;
        In01            : in     vl_logic_vector;
        In10            : in     vl_logic_vector;
        In11            : in     vl_logic_vector;
        \Out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end Mux4;
