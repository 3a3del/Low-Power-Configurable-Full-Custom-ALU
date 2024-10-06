module alu_tb2;

// Testbench signals
reg [3:0] A;          // 4-bit test input operand A
reg [3:0] B;          // 4-bit test input operand B
reg [3:0] Sel;        // 4-bit test input selection signal
wire [5:0] Y;         // 6-bit test output result (wire)

// Instantiate the ALU module
alu uut (
    .A(A),
    .B(B),
    .Sel(Sel),
    .Y(Y)
);
integer i;
initial begin
    // Display header
    $display("Time\tA\tB\tSel\t\tY");
    
    // Initialize inputs
    A = 4'b0000;
    B = 4'b0000;
    Sel = 4'b0000;

    // Apply test cases
    for(i = 1; i <= 30; i = i + 1) begin
        $display("Test Case %d", i);
        A = $random % 16;  // Limit to 4-bit values (0-15)
        B = $random % 16;  // Limit to 4-bit values (0-15)
        Sel = $random % 16;  // Limit to 4-bit values (0-15)
        #10;
        $display("%0t\t%b\t%b\t%b\t", $time, A, B, Sel, Y);
    end
    
    // Stop simulation
    $stop;
end
endmodule
