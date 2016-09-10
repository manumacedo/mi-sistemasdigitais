`timescale 1ns / 1ps

/*
    Extensor capaz de extender um valor de 16 bits
    com ou sem sinal para 32 bits
*/

module Extender (
        input SignExt,
        input [15:0] In,
        output [31:0] Out
    );

    wire signBit = In[15];

    assign Out = (SignExt) ? ((signBit) ? { 16'hFFFF, In } : { 16'b0 , In} ) : { 16'b0, In };
endmodule
