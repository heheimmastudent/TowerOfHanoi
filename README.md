# TowerOfHanoi

## Description
This is a RISC-V Assembly program for solving the Tower of Hanoi problem. The program is designed to be executed on a 32-bit Single Cycle RISC-V Processor. The `towerOfHanoi` function is the main function responsible for solving the problem and takes four arguments: Num_of_Disks, src_rod_char, aux_rod_char, and dst_rod_char, stored in registers a1, a2, a3, and a4, respectively. The a0 register is not used (personal preference).

The program prints the steps of the Tower of Hanoi solution to the console and does not return any values.

## Usage
1. Ensure that you have a 32-bit Single Cycle RISC-V Processor environment.
2. Load and execute the program on your RISC-V processor.

## Function Parameters
- `Num_of_Disks`: Number of disks in the Tower of Hanoi problem.
- `src_rod_char`: Character representation of the source rod.
- `aux_rod_char`: Character representation of the auxiliary rod.
- `dst_rod_char`: Character representation of the destination rod.

## Example
```assembly
# Example usage
li a1, 3       # Number of disks
li a2, 'A'     # Source rod character
li a3, 'B'     # Auxiliary rod character
li a4, 'C'     # Destination rod character
jal towerOfHanoi

## DISCLAIMER

Feel free to modify the content based on your preferences or if you have additional information to include. The usage section provides a simple example to demonstrate how someone might use your program.
