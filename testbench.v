module testbench;

reg [7:0] A, B;
reg [3:0] opcode;
wire [7:0] result;
wire carry, overflow, zero;

//  ALU initiation 
ALU uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry(carry),
    .overflow(overflow),
    .zero(zero)
);

initial begin
    $dumpfile("dump.vcd");   // waveform file
    $dumpvars(0, testbench); // track all signals
    $monitor("Time=%0t | A=%d B=%d Opcode=%b Result=%d", 
          $time, A, B, opcode, result);
    A = 8'd10; B = 8'd5;

    opcode = 4'b0000; #10;
    opcode = 4'b0001; #10;
    opcode = 4'b0010; #10;
    opcode = 4'b0011; #10;
    opcode = 4'b0100; #10;
    opcode = 4'b0101; #10;
    opcode = 4'b1010; #10;
    opcode = 4'b1100; #10;
    opcode = 4'b1110; #10;
    opcode = 4'b1111; #10;

    $finish;
end

endmodule
