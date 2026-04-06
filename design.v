module ALU (
  input [7:0] A, B,
    input [3:0] opcode,
    output reg [7:0] result,
    output reg carry, overflow, zero
);

always @(*) begin
    carry = 0;
    overflow = 0;
    zero = 0;

    case(opcode)

        // Arithmetic
        4'b0000: {carry, result} = A + B;          // ADD
        4'b0001: {carry, result} = A - B;          // SUB
        4'b0010: result = A + 1;                   // INC
        4'b0011: result = A - 1;                   // DEC
        4'b0100: result = A * B;                   // MUL
        4'b0101: result = (B != 0) ? A / B : 8'b0; // DIV

        // Logical
        4'b0110: result = A & B;
        4'b0111: result = A | B;
        4'b1000: result = A ^ B;
        4'b1001: result = ~A;

        // Shift
        4'b1010: result = A << 1;
        4'b1011: result = A >> 1;

        // Rotate
        4'b1100: result = {A[6:0], A[7]};
        4'b1101: result = {A[0], A[7:1]};

        // Comparison
        4'b1110: result = (A > B) ? 8'b1 : 8'b0;
        4'b1111: result = (A == B) ? 8'b1 : 8'b0;

        default: result = 8'b0;

    endcase

    // Zero flag
    if (result == 0)
        zero = 1;

end

endmodule
