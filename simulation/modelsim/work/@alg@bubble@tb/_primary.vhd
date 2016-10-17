library verilog;
use verilog.vl_types.all;
entity AlgBubbleTb is
    generic(
        Halfcycle       : integer := 13
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Halfcycle : constant is 1;
end AlgBubbleTb;
