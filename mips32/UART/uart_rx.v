`include "uart_states.vh"

module uart_rx(
  input wire rx,
  input wire Reset,
  input wire Clock,
  input wire tick,
  output reg rdy,
  output reg [7:0] data_out
);

  reg [1:0] state = `START;
  reg [3:0] sample = 0;
  reg [3:0] counter = 0;
  reg [7:0] data = 8'b0;

  always @ ( posedge Clock ) begin

    if(Reset) rdy <= 0;

    if(tick) begin
      case (state)
        `START: begin

          if(~rx || sample != 0) sample <= sample + 4'b1;

          if(sample == 15) begin
            state <= `WORK;
            counter <= 4'd0;
            sample <= 4'd0;
            data <= 8'd0;
          end
        end
        `WORK: begin

          sample <= sample + 4'b1;

          if (sample == 4'd8) begin
    				data[counter[2:0]] <= rx;
    				counter <= counter + 4'b1;
    			end
    			if (counter == 8 && sample == 15) state <= `STOP;
        end
        `STOP: begin
          if (sample == 15 || (sample >= 8 && ~rx)) begin
            state <= `START;
            data_out <= data;
            rdy <= 1'b1;
            sample <= 4'd0;
          end
          else begin
            sample <= sample + 4'b1;
          end
        end
        default: state <= `START;
      endcase
    end
  end
endmodule
