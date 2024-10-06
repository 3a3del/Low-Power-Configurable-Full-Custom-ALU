## Low-Power-Configurable-Full-Custom-ALU
This project involves the design and implementation of a low-power, fully customizable Arithmetic Logic Unit (ALU) capable of performing both arithmetic and logical operations. The ALU is configurable through a selection line, where the most significant bit (MSB) determines whether the operation is arithmetic or logical. The remaining bits select the specific operation.

# Key Features:
Configurable Operations: Perform various arithmetic (addition, subtraction, shifting) and logical operations (AND, OR, XOR, etc.) based on the input selection.
Power Optimization: The design prioritizes low power consumption, with optimized gate sizing and transistor-level design choices.
Custom Schematics: Custom-built logic gates (AND, OR, XOR) using efficient Transmission Gate Logic (TGL) for optimal delay times.
Flip-Flop Integration: Input and output flip-flops are included for synchronized operation and minimizing glitches.
6-bit Output: The ALU produces a 6-bit result for arithmetic operations, supporting extended ranges.

# The project includes:

Verilog code for the ALU and testbenches.
Detailed transistor-level schematic designs for all components.
Power and delay optimization strategies applied to custom-built gates.
Test cases for validating ALU functionality with both arithmetic and logical operations.
