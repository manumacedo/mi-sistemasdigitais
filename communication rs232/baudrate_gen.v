`timescale 1ns/10ps

module baudrate_gen (
    sysclk,
    reset_n,
    half_baud_rate_tick_o,
    baud_rate_tick_o
);

input sysclk;
input reset_n;
output half_baud_rate_tick_o;
reg half_baud_rate_tick_o;
output baud_rate_tick_o;
reg baud_rate_tick_o;

reg [9:0] baud_gen_count_reg;





always @(posedge sysclk, negedge reset_n) begin: BAUDRATE_GEN_SEQUENTIAL_PROCESS
    if (reset_n == 0) begin
        baud_gen_count_reg <= 0;
        baud_rate_tick_o <= 0;
        half_baud_rate_tick_o <= 0;
    end
    else begin
        baud_gen_count_reg <= (baud_gen_count_reg + 1);
        baud_rate_tick_o <= 0;
        half_baud_rate_tick_o <= 0;
        if ((baud_gen_count_reg == 217)) begin
            baud_gen_count_reg <= 0;
            baud_rate_tick_o <= 1;
        end
        if ((baud_gen_count_reg == 108)) begin
            half_baud_rate_tick_o <= 1;
        end
    end
end

endmodule
