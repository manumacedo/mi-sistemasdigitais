`timescale 1ns/10ps

module serial_tx (
    sysclk,
    reset_n,
    start_i,
    data_i,
    baud_rate_tick_i,
    transmit_o
);


input sysclk;
input reset_n;
input start_i;
input [7:0] data_i;
input baud_rate_tick_i;
output transmit_o;
wire transmit_o;

reg transmit_reg;
reg [2:0] count_8_bits_reg;
reg [2:0] count_8_bits;
reg [1:0] state;
reg transmit;
reg [2:0] count_stop_bits_reg;
reg [2:0] count_stop_bits;
reg [1:0] state_reg;






assign transmit_o = transmit_reg;


always @(posedge sysclk, negedge reset_n) begin: SERIAL_TX_SEQUENTIAL_PROCESS
    if (reset_n == 0) begin
        count_8_bits_reg <= 0;
        count_stop_bits_reg <= 0;
        transmit_reg <= 0;
        state_reg <= 2'b00;
    end
    else begin
        state_reg <= state;
        transmit_reg <= transmit;
        count_8_bits_reg <= count_8_bits;
        count_stop_bits_reg <= count_stop_bits;
    end
end


always @(transmit_reg, start_i, count_8_bits_reg, data_i, baud_rate_tick_i, count_stop_bits_reg, state_reg) begin: SERIAL_TX_COMBINATIONAL_PROCESS
    state = state_reg;
    transmit = transmit_reg;
    count_8_bits = count_8_bits_reg;
    count_stop_bits = count_stop_bits_reg;
    case (state_reg)
        2'b00: begin
            transmit = 1'b1;
				if ((start_i == 1'b1)) begin
                state = 2'b01;
            end
        end
        2'b01: begin
            transmit = 1'b0;
            if ((baud_rate_tick_i == 1'b1)) begin
                state = 2'b10;
            end
        end
        2'b10: begin
            transmit = data_i[count_8_bits_reg];
            if ((baud_rate_tick_i == 1'b1)) begin
                if ((count_8_bits_reg == 7)) begin
                    count_8_bits = 0;
                    state = 2'b11;
                end
                else begin
                    count_8_bits = (count_8_bits_reg + 1);
                    state = 2'b10;
                end
            end
        end
        2'b11: begin
            transmit = 1'b1;
            if ((baud_rate_tick_i == 1'b1)) begin
                if (($signed({1'b0, count_stop_bits_reg}) == (2 - 1))) begin
                    count_stop_bits = 0;
                    state = 2'b00;
                end
                else begin
                    count_stop_bits = (count_stop_bits_reg + 1);
                end
            end
        end
        default: begin
            $finish;
        end
    endcase
end

endmodule
