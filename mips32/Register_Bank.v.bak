module REGISTER_BANK (
  write,
  write_data,
  write_address,
  read_address_1,
  read_address_2,
  read_data_1,
  read_data_2
);

input write;
input write_data;
input write_address;
input read_address_1;
input read_address_2;
output read_data_1;
output read_data_2;

wire write;
wire [31:0] write_data;
wire [4:0] write_address;
wire [4:0] read_address_1;
wire [4:0] read_address_2;
reg [31:0] read_data_1;
reg [31:0] read_data_2;

reg [31:0] registers [0:31];

initial begin
  integer i;

  for (i = 0; i < 32; i = i + 1) begin
    registers[i] = 0;
  end

  read_data_1 = 0;
  read_data_2 = 0;
end

always begin : register_bank_process

  if (write == 1 && write_address != 0) begin
  #5  registers[write_address] = write_data;
  end

  #5 read_data_1 = registers[read_address_1];
     read_data_2 = registers[read_address_2];

end

endmodule
