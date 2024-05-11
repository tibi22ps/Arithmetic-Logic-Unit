# ALU VHDL Project

This VHDL project implements an Arithmetic Logic Unit (ALU) capable of performing various arithmetic and logical operations.

## Arithmetical Operations
- Addition
- Subtraction
- Multiplication
- Increment
- Decrement

## Logical Operations
- AND
- OR
- NOT
- XOR
- NAND

## Other Operations
- Left Shift
- Right Shift

## Simulation
The simulation demonstrates the ALU's functionality. It automatically fetches two numbers from the ROM memory on each clock cycle and returns the result of the operation based on the opcode stored in the counter.

## Control Unit
Operations are encoded in the Control Unit using opcodes:
- 1: Addition
- 2: Subtraction
- 3: Multiplication
- ...
