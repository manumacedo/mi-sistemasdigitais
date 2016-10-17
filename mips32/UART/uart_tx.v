`include "uart_states.vh"

module uart_tx(
  input wire [7:0] data_in,
  input wire wr_en,
  input wire Clock,
  input wire tick,
  output reg tx,
  output wire tx_busy
);

reg [7:0] data = 8'h00;
reg [2:0] counter = 3'h0;
reg [1:0] state = `IDLE;

always @(posedge Clock) begin
	case (state)
	`IDLE: begin
		if (wr_en) begin
			state <= `START;
			data <= data_in;
			counter <= 3'h0;
		end
    	else tx <= 1'b1;
	end
	`START: begin
		if (tick) begin
			tx <= 1'b0;
			state <= `WORK;
		end
	end
	`WORK: begin
		if (tick) begin
			if (counter == 3'h7)
				state <= `STOP;
			else
				counter <= counter + 3'h1;
			tx <= data[counter];
		end
	end
	`STOP: begin
		if (tick) begin
			tx <= 1'b1;
			state <= `IDLE;
		end
	end
	default: begin
		tx <= 1'b1;
		state <= `IDLE;
	end
	endcase
end

assign tx_busy = (state != `IDLE);

endmodule
