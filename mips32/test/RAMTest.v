`timescale 1ns / 1ps

module RAMTest ();

    parameter Halfcycle = 5;

    localparam Cycle = 2*Halfcycle;

    reg Clock;

    initial Clock = 0;
    always #(Halfcycle) Clock = ~Clock;

    reg [13:0] address;
    reg wr;
    reg [31:0] writeData;
    wire [31:0] readData;

    RAM ram (
        .Clock(Clock),
        .Address(address),
        .MemWrite(wr),
        .WriteData(writeData),
        .ReadData(readData)
    );

    task printOutput;
        input [13:0] addr;
        input writeEn;
        input [31:0] dIn,dOut;
        begin
            $display ("Address: %d  Write: %d",addr,writeEn);
            $display("DataOut: %d  DataIn: %d/n",dOut,dIn);
        end
    endtask

    localparam wordsInFile = 8192;

    reg [31:0] fileContent [0:wordsInFile-1];
    integer i;

    initial begin
      wr = 1;

      $readmemb("C:/Users/Preton/Documents/github/mi-sistemasdigitais/mips32/test/RamEx.mc", fileContent);

      for (i = 0; i < wordsInFile; i=i+1) begin
        address = i[13:0];
        writeData = fileContent[i];
        #(Cycle);
      end
      wr = 0;

      address = 14'b0;
      #(Cycle);
      printOutput(address,wr,writeData,readData);

      address = 14'b1;
      #(Cycle);
      printOutput(address,wr,writeData,readData);

      address = 14'b10;
      #(Cycle);
      printOutput(address,wr,writeData,readData);

      address = 14'b11;
      #(Cycle);
      printOutput(address,wr,writeData,readData);

      wr = 1;
      writeData = 32'b111;

      #(Cycle);
      printOutput(address,wr,writeData,readData);

      writeData = 32'b1;

      #(Cycle);
      printOutput(address,wr,writeData,readData);

      writeData = 32'hFFFFFFFF;

      #(Cycle);
      printOutput(address,wr,writeData,readData);

      writeData = 32'hFFFFFFFF;

      #(Cycle);
      printOutput(address,wr,writeData,readData);

      writeData = 32'h7FFFFFFF;

      #(Cycle);
      printOutput(address,wr,writeData,readData);

      wr = 0;
      writeData = 32'b0;

      #(Cycle);
      printOutput(address,wr,writeData,readData);

      $finish();
    end
endmodule
