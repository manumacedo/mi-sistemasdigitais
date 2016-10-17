`ifndef DATAPATHPARAMETERS
`define DATAPATHPARAMETERS
/*
 Universidade Estadual de Feira de Santana
 TEC499 - MI - Sistemas Digitais

 Sinais ativos do datapath para cada instrução

    Bit     Name        Desc
    11      Jump[1]     Sinaliza a instrução como um Branch ou Jump
    10      Jump[0]     Sinaliza a instrução como um Branch ou Jump
     9      NoDest      Sinaliza que não será necessário um Registrador de destino em EX
     8      AluCtrl[2]  Bit 2 dos 3 bits de Operação da ALU
     7      AluCtrl[1]  Bit 1 dos 3 bits de Operação da ALU
     6      AluCtrl[0]  Bit 0 dos 3 bits de Operação da ALU
     5      ALUSrc      Seleciona entre o dado de um registrador (0) ou valor imediato (1)
     4      RegDst      Seleciona entre o Rt (0) ou Rd (1) como registrador de destino
     3      MemWr       Ativa escrita na memória
     2      MemRd       Ativa leitura da memória
     1      MemtoReg    Seleciona se o dado coletado da memória (0) ou 
                            resultado da ALU (1) será escrito em um registrador
     0      RegWr       Sinaliza se a instrução escreve (1) ou não (0) em um registrador
*/

/*Tipos*/
`define DP_R 12'b00_000001_00_01
`define DP_Branch 12'b10_110000_00_00

`define DP_Add   12'b00_0_000_01_00_01
`define DP_Addi  12'b00_0_010_10_00_01
`define DP_Sub   12'b00_0_000_01_00_01
`define DP_Lui   12'b00_0_001_10_00_01
`define DP_Sll   12'b00_0_000_01_00_01
`define DP_Ori   12'b00_0_011_10_00_01
`define DP_Mul   12'b00_0_000_01_00_01
`define DP_Div   12'b00_0_000_00_00_00
`define DP_Mfhi  12'b00_0_000_01_00_01
`define DP_Slt   12'b00_0_000_01_00_01
`define DP_Beq   12'b10_1_100_00_00_00
`define DP_Bne   12'b10_1_100_00_00_00
`define DP_J     12'b01_1_010_00_00_00
`define DP_Jal   12'b01_1_010_00_00_01
`define DP_Jr    12'b11_1_000_00_00_00
`define DP_Lw    12'b00_0_010_10_01_11
`define DP_Sw    12'b00_0_010_10_10_00

`endif //DATAPATHPARAMETERS
