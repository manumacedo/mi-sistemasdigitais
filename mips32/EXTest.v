`timescale 1ns / 1ps

module EXTest ();

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
    reg [31:0] A,B,outA,outB;
    reg reset;
    reg [31:0] pc;
    wire [31:0]outmULA;
    wire [31:0] AluOut;
    reg [31:0] RefOut;
    wire [3:0] AluOp;
    wire [31:0] RS_DATA,RT_DATA,in11,Out_MEmD_ALU,in13;
    reg [4:0] RS,RT,RD ;
    reg [1:0] ForA = 2'b00;
    reg [1:0] ForB = 2'b00;
    wire  ForC;
    reg [31:0] IMM;
    wire [31:0] out0,out1,out2,out3,out4,out5;
    // Fios do ForwardingUnit
    reg MEMWB_MemToReg;
    reg MEMWB_RegWrite;
    reg EXMEM_RegWrite;
    reg EXMEM_MemWrite;
    reg [4:0] EXMEM_RegRd;
    reg [4:0] MEMWB_RegRd,Reg31;

    reg ID_EX_RegDst=   1'b0;
    reg ID_EX_NoDest=   1'b0;
    reg ID_EX_ALUSrc=   1'b0;

    Mux4 Mux00(
        .sel(ForA),
        .in0(A),
        .in1(Out_MEmD_ALU),
        .in2(EX_Out),
        .in3(0),
        .out(outA)
      );

      Mux4 Mux01(
          .sel(ForB),
          .in0(B),
          .in1(Out_MEmD_ALU),
          .in2(EX_Out),
          .in3(0),
          .out(out1)
        );


        Mux2 Mux20(
          .sel(ID_EX_ALUSrc),
          .in0(out1),
          .in1(IMM),
          .out(outB)
          );

        Mux2 (.WIDTH(5)), Mux30(
            .sel(ID_EX_RegDst),
            .in0(RT), // endereco de rt 1-31
            .in1(RD), // endereco de rd 1-31
            .out(out3)
          );


        Mux2 (.WIDTH(5)), Mux40(
            .sel(ID_EX_RegWrite),
            .in0(5'b0), // zero
            .in1(Reg31), // reg 31
            .out(out4)
          );


        Mux2 (.WIDTH(5)), Mux50(
            .sel(ID_EX_NoDest),
            .in0(out3), // RT ou RD
            .in1(out4), // reg 31 ou 0
            .out(EXMEM_RegRd)  //
          );


      ForwardingUnit ForwardingUnit(
        .MEMWB_MemToReg(MEMWB_MemToReg),
        .MEMWB_RegWrite(MEMWB_RegWrite),
        .EXMEM_RegWrite(EXMEM_RegWrite),
        .EXMEM_MemWrite(EXMEM_MemWrite),
        .IDEX_RegRs(RS),
        .IDEX_RegRt(RT),
        .EXMEM_RegRd(EXMEM_RegRd),
        .MEMWB_RegRd(MEMWB_RegRd),
        .ForB(ForB),
        .ForA(ForA),
        .ForC(ForC)
        );

    ALUControl AluControl (
        .Funct(funct),
        .ALUCtrl(AluCtrl),
        .ALUOp(AluOp)
    );

    ALU alu (
        .Clock(Clock),
        .Reset(reset),
        .A(outA),
        .B(outB),
        .Shamt(shamt),
        .ALUOp(AluOp),
        .ALUOut(AluOut)
    );

      Mux2 Mux60(
              .sel(ID_EX_NoDest),
              .in0(AluOut),
              .in1(pc),
              .out(outmULA)
              );

    task checkOutput;
        input [31:0] pc;
        input [31:0] A,B;
        input [4:0] shamt;
        input [31:0] AluOut, RefOut;
        input [5:0] funct;
        input [2:0] AluCtrl;
        // ForwardingUnit
        input MEMWB_MemToReg;
        input MEMWB_RegWrite;
        input EXMEM_RegWrite;
        input EXMEM_MemWrite;

        input [4:0] RS;
        input [4:0] RT;
        input [4:0] EXMEM_RegRd;
        input [4:0] MEMWB_RegRd;
        input [4:0] Reg31;
        input [31:0] IMM;
        input [1:0] ForB;
        input [1:0] ForA;
        input       ForC;

        reg EQ_REGA;
        reg EQ_REGB;
        reg EQ_REGAMEM;
        reg EQ_REGBMEM;
        reg [1:0] a;
        reg [1:0] b;
        begin

            if (RS == EXMEM_RegRd) // Se o o rgRS é igual ao rg do EXMem
               EQ_REGA = 1; // deve-se fazer o forward A
            if (RT == EXMEM_RegRd)
                EQ_REGB = 1;
            if (RS == MEMWB_RegRd)
               EQ_REGAMEM = 1;
            if (RT == MEMWB_RegRd)
               EQ_REGBMEM = 1;
            a= ForA;

            $display ( "RS = %d ,RT=  %d,EXMEM_RegRd = %d ,MEMWB_RegRd = %d",RS,RT,EXMEM_RegRd,MEMWB_RegRd);
            if (EQ_REGA | EQ_REGAMEM) begin
               $display ("RegA deve realizar forward");
               if (EXMEM_RegWrite & EXMEM_RegRd != 0) begin
                 $display ( "ForA deve ser ativado");
                 if(a !=2'b00) begin
                 $display ( "ForA é %d",ForA);
                      end
                 end
              end
              b= ForB;
              if (EQ_REGB | EQ_REGBMEM) begin
                 $display ("RegA deve realizar forward");
                 if (EXMEM_RegWrite & (EXMEM_RegRd != 0)) begin
                   $display ( "ForB deve ser ativado");
                   if(b !=2'b00) begin
                   $display ( "ForB é %d",ForB);
                        end
                   end
                end

        end
    endtask

    integer i;
    localparam loops = 5000;
    initial begin
        reset = 0;
        for (i = 0; i < loops; i=i+1) begin
            #1;
            A = {$random} & 32'hFFFFFFFF;
            B = {$random} & 32'hFFFFFFFF;
            IMM= {$random} & 32'hFFFFFFFF;
            shamt = {$random} & 5'h1F;
            RS = {$random} & 5'b11111;
            RT = {$random} & 5'b11111;  // destino
            RD = {$random} & 5'b11111; // destino
            Reg31 = 5'b11111;
            ID_EX_RegDst = {$random} & 1'b1;  //mux
            ID_EX_NoDest = {$random} & 1'b1;  //mux
            ID_EX_ALUSrc = {$random} & 1'b1;
            MEMWB_MemToReg =  {$random} & 1'b1;
            MEMWB_RegWrite =  {$random} & 1'b1;
            EXMEM_RegWrite =  {$random} & 1'b1 ;
            EXMEM_MemWrite =  {$random} & 1'b1;
            pc = {$random} & 32'hFFFFFFFF;
            AluCtrl = AluCtrl_R;
            funct = Funct_Add;

            RefOut = A + B;

            #1;

            checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);
            funct = Funct_Sub;
            RefOut = A - B;
            #1;
            MEMWB_RegRd = EXMEM_RegRd;
           checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



            funct = Funct_Sll;
            RefOut = B << shamt;
            #1;
            MEMWB_RegRd = EXMEM_RegRd;
          checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



            funct = Funct_Mul;
            RefOut = $signed(A)*$signed(B);
            #1;

            MEMWB_RegRd = EXMEM_RegRd;

          checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);




            funct = Funct_Slt;
            RefOut = $signed(A) < $signed(B) ? 32'h00000001 : 32'h00000000;
            #1;

            MEMWB_RegRd = EXMEM_RegRd;


          checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



            funct = Funct_Jr;
            RefOut = A + B;
            #1;

            MEMWB_RegRd = EXMEM_RegRd;


          checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



            AluCtrl = AluCtrl_Lui;
            RefOut = {B[15:0],16'b0};
            #1;

            MEMWB_RegRd = EXMEM_RegRd;


          checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



            AluCtrl = AluCtrl_Addi;
            RefOut = A + B;
            #1;

            MEMWB_RegRd = EXMEM_RegRd;


          checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



            AluCtrl = AluCtrl_Ori;
            RefOut = A | B;
            #1;

            MEMWB_RegRd = EXMEM_RegRd;


          checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



            AluCtrl = AluCtrl_Beq;
            RefOut = A - B;
            #1;

            MEMWB_RegRd = EXMEM_RegRd;


          checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



            AluCtrl = AluCtrl_Bne;
            RefOut = A - B;
            #1;

            MEMWB_RegRd = EXMEM_RegRd;

          checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



            AluCtrl = AluCtrl_J;
            RefOut = A + B;
            #1;
            MEMWB_RegRd = EXMEM_RegRd;
          checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



            AluCtrl = AluCtrl_Jal;
            RefOut = A + B;
            #1;
            MEMWB_RegRd = EXMEM_RegRd;
          checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



            AluCtrl = AluCtrl_Lw;
            RefOut = A + B;
            #1;
            MEMWB_RegRd = EXMEM_RegRd;
          checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



            AluCtrl = AluCtrl_Sw;
            RefOut = A + B;
            #1;
            MEMWB_RegRd = EXMEM_RegRd;
          checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);


        end

        shamt = 0;
        AluCtrl = AluCtrl_R;

        funct = Funct_Mul;
        A = -1;
        B = 1;
        RefOut = $signed(A)*$signed(B);
        #1;
        MEMWB_RegRd = EXMEM_RegRd;
      checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



        A = -1;
        B = 0;
        RefOut = $signed(A)*$signed(B);
        #1;
        MEMWB_RegRd = EXMEM_RegRd;
      checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



        funct = Funct_Div;
        A = 6;
        B = 3;

        #(Cycle);
        funct = Funct_Mfhi;
        RefOut = 0;
        #1;
        MEMWB_RegRd = EXMEM_RegRd;
      checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



        funct = Funct_Div;
        A = 1;
        B = 3;

        #(Cycle);
        funct = Funct_Mfhi;
        RefOut = 1;
        #1;
        MEMWB_RegRd = EXMEM_RegRd;
      checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



        reset = 1;
        funct = Funct_Div;
        A = 10;
        B = 3;

        #(Cycle);
        funct = Funct_Mfhi;
        RefOut = 0;
        #1;
        MEMWB_RegRd = EXMEM_RegRd;
      checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



        reset = 0;
        funct = Funct_Div;
        A = 11;
        B = 3;

        #(Cycle);
        funct = Funct_Mfhi;
        RefOut = 2;
        #1;
        MEMWB_RegRd = EXMEM_RegRd;
      checkOutput(pc,A,B,shamt,AluOut,RefOut,funct,AluCtrl,MEMWB_MemToReg, MEMWB_RegWrite, EXMEM_RegWrite , EXMEM_MemWrite,RS,RT,EXMEM_RegRd,MEMWB_RegRd,Reg31,IMM,ForB,ForA,ForC);



        $finish();
    end
endmodule
