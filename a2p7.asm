
print:

sw $10, -4($30)
lis $10
.word 10

sw $14, -8($30)
lis $14
.word 4

sw $6, -12($30)
lis $6
.word 0

sw $11, -16($30)
lis $11
.word 1

sw $5, -20($30)
lis $5
.word 0xffff000c

sw $15, -24($30)
lis $15
.word 45

sw $18, -28($30)
lis $18
.word 48

sw $19, -32($30)
lis $19
.word -1

sw $2, -36($30)
slt $2, $1, $0
beq $2, $0, pos

sw $15, 0($5)
mult $19, $1
mflo $1


pos:
div $1, $10
mfhi $3
mflo $1
sub $30, $30, $14
add $6, $6, $11
sw $3, 0($30)
bne $1, $0, pos

print:
lw $7, 0($30)
add $7,$7, $18
sw $7, 0($5)
add $30,$30,$14
sub $6, $6, $11
bne $6, $0, print

sw $10, 0($5)

lw $10, -4($30)
lw $14, -8($30)
lw $6, -12($30)
lw $11, -16($30)
lw $5, -20($30)
lw $15, -24($30)
lw $18, -28($30)
lw $19, -32($30)
lw $2, -36($30)
jr $31