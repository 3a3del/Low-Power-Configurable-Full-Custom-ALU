module alu_tb;

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
initial begin
    // Display header
    $display("Time\tA\tB\tSel\t\tY (Actual)\tY (Expected)");

    // Apply test vectors for Arithmetic Operations (Sel[3] = 0)
    A = 4'b0010; B = 4'b0001; Sel = 4'b0000;
    #10;
    if(Y == 6'b000011)
        $display("Test Case 1 Passed");
    else
        $display("Test Case 1 Failed");
    $display("%0t\t%b\t%b\t%b\t\t%b\t\t%b", $time, A, B, Sel, Y, 6'b000011); // A + 1

    A = 4'b0010; B = 4'b0001; Sel = 4'b0001;
    #10;
    if(Y == 6'b000001)
        $display("Test Case 2 Passed");
    else
        $display("Test Case 2 Failed");
    $display("%0t\t%b\t%b\t%b\t\t%b\t\t%b", $time, A, B, Sel, Y, 6'b000001); // A - 1

    A = 4'b0010; B = 4'b0001; Sel = 4'b0010;
    #10;
    if(Y == 6'b001000)
        $display("Test Case 3 Passed");
    else
        $display("Test Case 3 Failed");
    $display("%0t\t%b\t%b\t%b\t\t%b\t\t%b", $time, A, B, Sel, Y, 6'b001000); // A << 2

    A = 4'b0010; B = 4'b0001; Sel = 4'b0011;
    #10;
    if(Y == 6'b000010)
        $display("Test Case 4 Passed");
    else
        $display("Test Case 4 Failed");
    $display("%0t\t%b\t%b\t%b\t\t%b\t\t%b", $time, A, B, Sel, Y, 6'b000010); // B + 1

    A = 4'b0010; B = 4'b0001; Sel = 4'b0100;
    #10;
    if(Y == 6'b000000)
        $display("Test Case 5 Passed");
    else
        $display("Test Case 5 Failed");
    $display("%0t\t%b\t%b\t%b\t\t%b\t\t%b", $time, A, B, Sel, Y, 6'b000000); // B - 1

    A = 4'b0010; B = 4'b0001; Sel = 4'b0101;
    #10;
    if(Y == 6'b000010)
        $display("Test Case 6 Passed");
    else
        $display("Test Case 6 Failed");
    $display("%0t\t%b\t%b\t%b\t\t%b\t\t%b", $time, A, B, Sel, Y, 6'b000100); // B << 1

    A = 4'b0010; B = 4'b0011; Sel = 4'b0110;
    #10;
    if(Y == 6'b000101)
        $display("Test Case 7 Passed");
    else
        $display("Test Case 7 Failed");
    $display("%0t\t%b\t%b\t%b\t\t%b\t\t%b", $time, A, B, Sel, Y, 6'b000101); // A + B

    A = 4'b0010; B = 4'b0001; Sel = 4'b0111;
    #10;
    if(Y == 6'b001000)
        $display("Test Case 8 Passed");
    else
        $display("Test Case 8 Failed");
    $display("%0t\t%b\t%b\t%b\t\t%b\t\t%b", $time, A, B, Sel, Y, 6'b001000); // A << 2

    // Apply test vectors for Logical Operations (Sel[3] = 1)
    A = 4'b0010; B = 4'b0001; Sel = 4'b1000;
    #10;
    if(Y == 6'b111101)
        $display("Test Case 9 Passed");
    else
        $display("Test Case 9 Failed");
    $display("%0t\t%b\t%b\t%b\t\t%b\t\t%b", $time, A, B, Sel, Y, 6'b111101); // NOT A

    A = 4'b0010; B = 4'b0001; Sel = 4'b1001;
    #10;
    if(Y == 6'b111110)
        $display("Test Case 10 Passed");
    else
        $display("Test Case 10 Failed");
    $display("%0t\t%b\t%b\t%b\t\t%b\t\t%b", $time, A, B, Sel, Y, 6'b111110); // NOT B

    A = 4'b0010; B = 4'b0011; Sel = 4'b1010;
    #10;
    if(Y == 6'b000010)
        $display("Test Case 11 Passed");
    else
        $display("Test Case 11 Failed");
    $display("%0t\t%b\t%b\t%b\t\t%b\t\t%b", $time, A, B, Sel, Y, 6'b000010); // A AND B

    A = 4'b0010; B = 4'b0011; Sel = 4'b1011;
    #10;
    if(Y == 6'b000011)
        $display("Test Case 12 Passed");
    else
        $display("Test Case 12 Failed");
    $display("%0t\t%b\t%b\t%b\t\t%b\t\t%b", $time, A, B, Sel, Y, 6'b000011); // A OR B

    A = 4'b0010; B = 4'b0011; Sel = 4'b1100;
    #10;
    if(Y == 6'b000001)
        $display("Test Case 13 Passed");
    else
        $display("Test Case 13 Failed");
    $display("%0t\t%b\t%b\t%b\t\t%b\t\t%b", $time, A, B, Sel, Y, 6'b000001); // A XOR B

    A = 4'b0010; B = 4'b0011; Sel = 4'b1101;
    #10;
    if(Y == 6'b111110)
        $display("Test Case 14 Passed");
    else
        $display("Test Case 14 Failed");
    $display("%0t\t%b\t%b\t%b\t\t%b\t\t%b", $time, A, B, Sel, Y, 6'b111110); // A XNOR B

    A = 4'b0010; B = 4'b0011; Sel = 4'b1110;
    #10;
    if(Y == 6'b111101)
        $display("Test Case 15 Passed");
    else
        $display("Test Case 15 Failed");
    $display("%0t\t%b\t%b\t%b\t\t%b\t\t%b", $time, A, B, Sel, Y, 6'b111101); // NAND A and B

    A = 4'b0010; B = 4'b0011; Sel = 4'b1111;
    #10;
    if(Y == 6'b111010)
        $display("Test Case 16 Passed");
    else
        $display("Test Case 16 Failed");
    $display("%0t\t%b\t%b\t%b\t\t%b\t\t%b", $time, A, B, Sel, Y, 6'b111010); // Nor A and B
$stop;
end
endmodule