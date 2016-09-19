`timescale 1ns / 1ps

/*
    Memória RAM de 64KB.
    Endereço de 14 bits e saída de 32 bits
*/

module RAM #(parameter SIZE = 16384, FILE = "C:/Users/Preton/Documents/github/tec499-pbl01-assembler/algs/primes.mc")(
    input Clock,
    input [13:0] Address,
    input MemWrite,
    input [31:0] WriteData,
    output [31:0] ReadData
    );

    // 2^14 registradores de 32 bits
    reg [31:0] memory [0:(SIZE-1)];

    reg [13:0] addr_reg;

    integer i;
    initial begin

        for (i = 0; i < SIZE; i=i+1) begin
            memory[i] = 0;
        end
        $readmemb(FILE, memory);
    end

    // Escrita sequencial ao subir do clock
    always @(posedge Clock) begin
        if (MemWrite) begin
            memory[Address] <= WriteData;
        end

    end

    assign ReadData = MemWrite ? WriteData : memory[Address];

endmodule
