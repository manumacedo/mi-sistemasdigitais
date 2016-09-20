`timescale 1ns / 1ps

module ALUTest ();

    `include "Opcodes_Functs_Parameters.v"
    `include "ALU_Parameters.v"

    parameter Halfcycle = 5;

    localparam Cycle = 2*Halfcycle;

    reg Clock;

    initial Clock = 0;
    always #(Halfcycle) Clock = ~Clock;

    reg [5:0] funct;
    reg [2:0] AluCtrl;
    reg [4:0] shamt;
    reg [31:0] A,B;
    reg reset;

    wire [31:0] AluOut;
    reg [31:0] RefOut;
    wire [3:0] AluOp;

    ALUControl AluControl (
        .Funct(funct),
        .ALUCtrl(AluCtrl),
        .ALUOp(AluOp)
    );

    ALU alu (
        .Clock(Clock),
        .Reset(reset),
        .A(A),
        .B(B),
        .Shamt(shamt),
        .ALUOp(AluOp),
        .ALUOut(AluOut)
    );


    task checkOutput;
        input [31:0] A,B;
        input [4:0] shamt;
        input [31:0] AluOut, RefOut;
        input [5:0] funct;
        input [2:0] AluCtrl;

        begin
            $display ("Funct: %b  AluCtrl: %b A: %d B: %d  shamt: %d",funct,AluCtrl,A,B,shamt);
            $display ("AluOut: %d  RefOut: %d",AluOut,RefOut);
            if (AluOut == RefOut) begin
                $display("Pass!\n");
            end
            else begin
                $display("Failed.\n");
                $finish();
            end
        end
    endtask

    integer i;
    localparam loops = 500;
    initial begin
        reset = 0;
        for (i = 0; i < loops; i=i+1) begin
            #1;
            A = {$random} & 32'hFFFFFFFF;
            B = {$random} & 32'hFFFFFFFF;
            shamt = {$random} & 5'h1F;

            AluCtrl = AluCtrl_R;
            funct = Funct_Add;

            RefOut = A + B;
            #1;
            checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

            funct = Funct_Sub;
            RefOut = A - B;
            #1;
            checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

            funct = Funct_Sll;
            RefOut = B << shamt;
            #1;
            checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

            funct = Funct_Mul;
            RefOut = $signed(A)*$signed(B);
            #1;
            checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);


            funct = Funct_Slt;
            RefOut = $signed(A) < $signed(B) ? 32'h00000001 : 32'h00000000;
            #1;
            checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

            funct = Funct_Jr;
            RefOut = A + B;
            #1;
            checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

            AluCtrl = AluCtrl_Lui;
            RefOut = {B[15:0],16'b0};
            #1;
            checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

            AluCtrl = AluCtrl_Addi;
            RefOut = A + B;
            #1;
            checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

            AluCtrl = AluCtrl_Ori;
            RefOut = A | B;
            #1;
            checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

            AluCtrl = AluCtrl_Beq;
            RefOut = A - B;
            #1;
            checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

            AluCtrl = AluCtrl_Bne;
            RefOut = A - B;
            #1;
            checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

            AluCtrl = AluCtrl_J;
            RefOut = A + B;
            #1;
            checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

            AluCtrl = AluCtrl_Jal;
            RefOut = A + B;
            #1;
            checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

            AluCtrl = AluCtrl_Lw;
            RefOut = A + B;
            #1;
            checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

            AluCtrl = AluCtrl_Sw;
            RefOut = A + B;
            #1;
            checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);
        end

        shamt = 0;
        AluCtrl = AluCtrl_R;

        funct = Funct_Mul;
        A = -1;
        B = 1;
        RefOut = $signed(A)*$signed(B);
        #1;
        checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

        A = -1;
        B = 0;
        RefOut = $signed(A)*$signed(B);
        #1;
        checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

        funct = Funct_Div;
        A = 6;
        B = 3;

        #(Cycle);
        funct = Funct_Mfhi;
        RefOut = 0;
        #1;
        checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

        funct = Funct_Div;
        A = 1;
        B = 3;

        #(Cycle);
        funct = Funct_Mfhi;
        RefOut = 1;
        #1;
        checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

        reset = 1;
        funct = Funct_Div;
        A = 10;
        B = 3;

        #(Cycle);
        funct = Funct_Mfhi;
        RefOut = 0;
        #1;
        checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

        reset = 0;
        funct = Funct_Div;
        A = 11;
        B = 3;

        #(Cycle);
        funct = Funct_Mfhi;
        RefOut = 2;
        #1;
        checkOutput(A,B,shamt,AluOut,RefOut,funct,AluCtrl);

        $finish();
    end
endmodule
