`timescale 1ns / 1ps

/*
    Banco de registradores.
    32 registradores de 32 bits cada.
    Não se pode escrever na posição 0.
*/

module register_bank(
    input Clock,
    input Reset,
    input [4:0] ReadRg1, ReadRg2, WriteRg,
    input RegWrite,
    input [31:0] WriteData,
    output [31:0] ReadData1, ReadData2
    );

    // 32 registradores, sendo a posição 0  só   retorna  0
    reg [31:0] registers [0:31];
    //reg [31:0] rg1,rg2;

    // Inicialização do Banco

    integer i;
    initial begin
      for (i = 0; i < 32; i=i+1) begin
        registers[i] <= 0;
      end
      registers[29] <= 65536;
      registers[30] <= 65536;
    end


    // Escrita sequencial ao descer do clock
    always @(posedge Clock) begin

            if (WriteRg != 0)
                registers[WriteRg] <= RegWrite ? WriteData : registers[WriteRg];
    end

    // Leitura combinacional
    assign ReadData1 = registers[ReadRg1];
    assign ReadData2 = registers[ReadRg2];

endmodule
