.data
md:      .string "Move Disk "
from:    .string " from '"
to:      .string "' to '"
newline: .string "'\n"
src:     .string "A"
aux:     .string "B"
dst:     .string "C"
n:       .word   4

.text
.globl main
main:
    lw a1, n           # Load the value of n (number of disks) into a1
    la t0, src         # Load the address of source pole ('A') into t0
    la t1, dst         # Load the address of destination pole ('C') into t1
    la t2, aux         # Load the address of auxiliary pole ('B') into t2
    lbu a2, 0(t0)      # Load the first character of source pole into a2
    lbu a3, 0(t2)      # Load the first character of auxiliary pole into a3
    lbu a4, 0(t1)      # Load the first character of destination pole into a4
    jal x1, towerOfHanoi  # Jump and call the towerOfHanoi function
    li a7, 10          # Load the system call number for program exit into a7
    ecall              # Make the system call to exit the program

towerOfHanoi:
    addi sp, sp, -20    # Allocate space on the stack for local variables
    sw x1, 0(sp)        # Save the return address on the stack
    sw a1, 4(sp)        # Save a1 (number of disks) on the stack
    sw a2, 8(sp)        # Save a2 (source pole) on the stack
    sw a3, 12(sp)       # Save a3 (destination pole) on the stack
    sw a4, 16(sp)       # Save a4 (auxiliary pole) on the stack
    addi t0, x0, 1      # Load the value 1 into t0
    beq a1, t0, return  # If a1 (number of disks) is 1, jump to the return label
    lw a1, 4(sp)        # Load the value of a1 (number of disks) from the stack
    addi a1, a1, -1     # Decrement a1 (number of disks) by 1
    lbu a2, 8(sp)       # Load source pole from the stack
    lbu a3, 16(sp)      # Load destination pole from the stack
    lbu a4, 12(sp)      # Load auxiliary pole from the stack
    jal x1, towerOfHanoi  # Recursive call to towerOfHanoi
    lw a1, 4(sp)        # Load the value of a1 (number of disks) from the stack
    lbu a2, 8(sp)       # Load source pole from the stack
    lbu a3, 16(sp)      # Load destination pole from the stack
    jal x1, print       # Call the print function
    lw a1, 4(sp)        # Load the value of a1 (number of disks) from the stack
    addi a1, a1, -1     # Decrement a1 (number of disks) by 1
    lbu a2, 12(sp)      # Load auxiliary pole from the stack
    lbu a3, 8(sp)       # Load source pole from the stack
    lbu a4, 16(sp)      # Load destination pole from the stack
    jal x1, towerOfHanoi  # Recursive call to towerOfHanoi
    lw x1, 0(sp)        # Load the return address from the stack
    addi sp, sp, 20     # Deallocate space on the stack
    jalr x0, x1, 0      # Jump and link to the return address

return:
    lw a1, 4(sp)        # Load the value of a1 (number of disks) from the stack
    lbu a2, 8(sp)       # Load source pole from the stack
    lbu a3, 16(sp)      # Load destination pole from the stack
    jal x1, print       # Call the print function
    lw x1, 0(sp)        # Load the return address from the stack
    addi sp, sp, 20     # Deallocate space on the stack
    jalr x0, x1, 0      # Jump and link to the return address

print:
    la a0, md           # Load the address of "Move Disk " into a0
    li a7, 4            # Load the system call number for printing a string into a7
    ecall               # Make the system call to print the string
    addi a0, a1, 0      # Load the value of a1 (number of disks) into a0
    li a7, 1            # Load the system call number for printing an integer into a7
    ecall               # Make the system call to print the integer
    la a0, from         # Load the address of " from '" into a0
    li a7, 4            # Load the system call number for printing a string into a7
    ecall               # Make the system call to print the string
    addi a0, a2, 0      # Load the value of a2 (source pole) into a0
    li a7, 11           # Load the system call number for printing a character into a7
    ecall               # Make the system call to print the character
    la a0, to           # Load the address of "' to '" into a0
    li a7, 4            # Load the system call number for printing a string into a7
    ecall               # Make the system call to print the string
    addi a0, a3, 0      # Load the value of a3 (destination pole) into a0
    li a7, 11           # Load the system call number for printing a character into a7
    ecall               # Make the system call to print the character
    la a0, newline      # Load the address of "'\n" into a0
    li a7, 4            # Load the system call number for printing a string into a7
    ecall               # Make the system call to print the string
    jalr x0, x1, 0      # Jump and link to the return address
