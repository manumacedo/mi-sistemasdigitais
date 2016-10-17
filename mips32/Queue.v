module Queue #(parameter DEPTH = 64, parameter WIDTH = 32) (
    input Clock,
    input Reset,
    input [(WIDTH-1):0] Data_In,
    input InputValid,
    input ConsumerBusy,
    output IsFull,
    output [(WIDTH-1):0] Data_Out,
    output OutputValid
);
localparam addr_width = $clog2(DEPTH);
reg [(addr_width-1):0] addr, next_addr, temp_addr;
reg shift_enable;
reg [(WIDTH-1):0] shift_register [(DEPTH-1):0];
localparam EMPTY     = 1'b0;
localparam NOT_EMPTY = 1'b1;
reg state, next_state;
wire addr_full, addr_zero;
assign addr_full = (addr == (DEPTH-1));
assign addr_zero = (addr == 0);
assign Data_Out = shift_register[addr];
assign OutputValid = (state == EMPTY) ? 0 : 1;
assign IsFull = addr_full;
always @(posedge Clock) begin
    if (Reset) begin
        state <= EMPTY;
        addr <= 0;
    end
    else begin
        state <= next_state;
        addr  <= next_addr;
    end
end
always @(posedge Clock) begin
    if (shift_enable) begin
        for (temp_addr = DEPTH-1; temp_addr > 0; temp_addr=temp_addr-1) begin
            shift_register[temp_addr] <= shift_register[temp_addr-1];
        end
        shift_register[0] <= Data_In;
    end
end
always @(*) begin
    case (state)
        EMPTY: begin
            if (InputValid) begin
                shift_enable <= 1;
                next_addr <= 0;
                next_state <= NOT_EMPTY;
            end
            else begin
                shift_enable <= 0;
                next_addr <= 0;
                next_state <= EMPTY;
            end
        end
        NOT_EMPTY: begin
            if (addr_full) begin
                if (ConsumerBusy) begin  // idle
                    shift_enable <= 0;
                    next_addr <= addr;
                    next_state <= NOT_EMPTY;
                end
                else begin  // produce
                    shift_enable <= 0;
                    next_addr <= addr-1;
                    next_state <= NOT_EMPTY;
                end
            end
            else begin
                if (InputValid && ConsumerBusy) begin // consume
                    shift_enable <= 1;
                    next_addr <= addr+1;
                    next_state <= NOT_EMPTY;
                end
                else if (InputValid && !ConsumerBusy) begin // consume + produce
                    shift_enable <= 1;
                    next_addr <= addr;
                    next_state <= NOT_EMPTY;
                end
                else if (!InputValid && ConsumerBusy) begin // idle
                    shift_enable <= 0;
                    next_addr <= addr;
                    next_state <= NOT_EMPTY;
                end
                else if (!InputValid && !ConsumerBusy) begin // produce
                    shift_enable <= 0;
                    next_addr <= addr_zero ? 0 : addr-1;
                    next_state <= addr_zero ? EMPTY: NOT_EMPTY;
                end
            end
        end
    endcase
end
endmodule
