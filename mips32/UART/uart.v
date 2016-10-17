module uart(
	input wire [7:0] din,
	input wire Clock,
	input wire enable,
	output wire tx,
	output wire tx_busy,
	input wire rx,
	output wire rdy,
	input wire rdy_clr,
	output wire [7:0] dout
);

	wire rxclk_en, txclk_en;

	baud_rate_gen uart_baud(
		.clk_50m(Clock),
		.rxclk_en(rxclk_en),
		.txclk_en(txclk_en)
	);

	uart_tx transmitter(
		.data_in(din),
		.wr_en(enable),
		.Clock(Clock),
		.tick(txclk_en),
		.tx(tx),
		.tx_busy(tx_busy)
	);
	uart_rx receiver(
		.rx(rx),
		.rdy(rdy),
		.Reset(rdy_clr),
		.Clock(Clock),
		.tick(rxclk_en),
		.data_out(dout)
	);
endmodule
