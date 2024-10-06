module alu(
    input [3:0] A,       // 4-bit input operand A
    input [3:0] B,       // 4-bit input operand B
    input [3:0] Sel,     // 4-bit selection signal (Sel[3] determines arithmetic or logical operations)
    output reg [5:0] Y   // 6-bit output result (result width allows for extended range for arithmetic and logical results)
);

always @(*) begin
    // Check the most significant bit of Sel (Sel[3])
    // If Sel[3] is 0, perform arithmetic operations
    if (!Sel[3]) begin
        // Use the lower three bits of Sel to choose the arithmetic operation
        case({Sel[2], Sel[1], Sel[0]})
            3'b000 : Y <= $signed(A) + 4'b0001;   // Increment A by 1
            3'b001 : Y <= $signed(A) - 4'b0001;   // Decrement A by 1
            3'b010 : Y <= $signed(A) << 2;        // Shift A left by 2 (multiply A by 4)
            3'b011 : Y <= $signed(B) + 4'b0001;   // Increment B by 1
            3'b100 : Y <= $signed(B) - 4'b0001;   // Decrement B by 1
            3'b101 : Y <= $signed(B) << 1;        // Shift B left by 2 (multiply B by 4)
            3'b110 : Y <= $signed(A) + $signed(B);// Add A and B
            3'b111 : Y <= $signed(A) << 2;        // Shift A left by 4 (multiply A by 16)
        endcase
    end
    // If Sel[3] is 1, perform logical operations
    else begin
        // Use the lower three bits of Sel to choose the logical operation
        case({Sel[2], Sel[1], Sel[0]})
            3'b000 : Y <= ~$signed(A);             // Bitwise NOT of A
            3'b001 : Y <= ~$signed(B);             // Bitwise NOT of B
            3'b010 : Y <= $signed(A) & $signed(B); // Bitwise AND of A and B
            3'b011 : Y <= $signed(A) | $signed(B); // Bitwise OR of A and B
            3'b100 : Y <= $signed(A) ^ $signed(B); // Bitwise XOR of A and B
            3'b101 : Y <= ~($signed(A) ^ $signed(B)); // Bitwise XNOR of A and B
            3'b110 : Y <= ~($signed(A) & $signed(B)); // Bitwise NAND of A and B
            3'b111 : Y <= ~($signed(A) + $signed(B)); // Negated sum of A and B (two's complement)
        endcase
    end
end

endmodule

