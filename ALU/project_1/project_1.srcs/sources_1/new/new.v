module alu(
input [3:0] A,       // 4-bit input operand A
input [3:0] B,       // 4-bit input operand B
input [3:0] Sel,     // 4-bit selection signal (Sel[3] determines arithmetic or logical operations)
output reg [5:0] Y   // 6-bit output result (result width allows for extended range for arithmetic and logical results)
);

always @(*) begin
Y <= 4'b0000;
if (!Sel[3]) begin
// Use the lower three bits of Sel to choose the arithmetic operation
case({Sel[2],Sel[1],Sel[0]})
3'b000? Y <= A + 4'b0001;  
3'b001? Y <= A - 4'b0001;   // Decrement A by 1
3'b011? Y <= B + 4'b0001;   // Increment B by 1
3'b100? Y <= B - 4'b0001;   // Decrement B by 1
3'b110? Y <= A + B;// Add A and B
endcase
end
end

endmodule
