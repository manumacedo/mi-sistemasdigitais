`timescale 1ns / 1ps
module AlgBubbleTb ();
    parameter Halfcycle = 13;
    localparam Cycle = 2*Halfcycle;
    reg Clock, Reset;
    initial Clock = 0;
    always #(Halfcycle) Clock = ~Clock;
    wire [31:0] address;
    wire writeEnable;
    wire [31:0] writeData;
    wire [31:0] readData;
    RAM ram (
        .Clock(Clock),
        .Address(address[15:2]),
        .MemWrite(writeEnable),
        .WriteData(writeData),
        .ReadData(readData)
    );
    Processor cpu (
        .Clock(Clock),
        .Reset(Reset),
        .Mem_DataIn(readData),
        .Mem_Address(address),
        .Mem_WriteEnable(writeEnable),
        .Mem_DataOut(writeData)
    );
    integer i;
    localparam wordsInMemoryFile = 16384;
    localparam wordsInRegFile = 32;
    reg [31:0] memSimContent [0:wordsInMemoryFile-1];
    reg [31:0] regfileSimContent [0:wordsInRegFile-1];
    task checkMemory;
        begin
            for (i = 0; i < wordsInMemoryFile; i= i+1) begin
                if (ram.memory[i] != memSimContent[i]) begin
                    $display("Memory Address: 0x%h RAM: %b Simulated Result: %b",i,ram.memory[i],memSimContent[i]);
                    $display("FAILED.");
                    $finish();
                end
            end
            $display("Memory: PASSED!");
        end
    endtask

    initial begin
      $readmemb("C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/test/bubble_mem_out.bin",memSimContent);
      $readmemb("C:/Users/manue/Documents/GitHub/mi-sistemasdigitais/mips32/test/bubble_regs_out.bin",regfileSimContent);
      Reset = 1;
      #(Cycle);
      Reset = 0;

      while (address != 32'h3ffc) begin
        #(Cycle);
      end

      checkMemory();
      //checkRegisterFile();
      $finish();
    end
endmodule
