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
    lw a1, n
    la t0, src
    la t1, dst
    la t2, aux
    lbu a2, 0(t0)
    lbu a3, 0(t2)
    lbu a4, 0(t1)
    jal x1, towerOfHanoi
    li a7, 10
    ecall

towerOfHanoi:
    addi sp, sp, -20
    sw x1, 0(sp)
    sw a1, 4(sp)
    sw a2, 8(sp)
    sw a3, 12(sp)
    sw a4, 16(sp)
    addi t0, x0, 1
    beq a1, t0, return
    lw a1, 4(sp)
    addi a1, a1, -1
    lbu a2, 8(sp)
    lbu a3, 16(sp)
    lbu a4, 12(sp)
    jal x1, towerOfHanoi
    lw a1, 4(sp)
    lbu a2, 8(sp)
    lbu a3, 16(sp)
    jal x1, print
    lw a1, 4(sp)
    addi a1, a1, -1
    lbu a2, 12(sp)
    lbu a3, 8(sp)
    lbu a4, 16(sp)
    jal x1, towerOfHanoi
    lw x1, 0(sp)
    addi sp, sp, 20
    jalr x0, x1, 0

return:
    lw a1, 4(sp)
    lbu a2, 8(sp)
    lbu a3, 16(sp)
    jal x1, print
    lw x1, 0(sp)
    addi sp, sp, 20
    jalr x0, x1, 0

print:
    la a0, md
    li a7, 4
    ecall
    addi a0, a1, 0
    li a7, 1
    ecall
    la a0, from
    li a7, 4
    ecall
    addi a0, a2, 0
    li a7, 11
    ecall
    la a0, to
    li a7, 4
    ecall
    addi a0, a3, 0
    li a7, 11
    ecall
    la a0, newline
    li a7, 4
    ecall
    jalr x0, x1, 0
