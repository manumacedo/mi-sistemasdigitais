`timescale 1ns / 1ps

module Compare(
    input  [31:0] A,
    input  [31:0] B,
    output EQ, 
    output TLZ, 
    output NE, 
    output GEZ

    );

    assign EQ  = ( A == B);
    assign NE =  ( A != B);
    assign TLZ  = ( A[31] < 32'b0 );
    assign GEZ =  ~A[31];


endmodule
