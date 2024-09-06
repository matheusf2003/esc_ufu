//  R0 = mul(R1,R2)  Crie um código capaz de multiplicar dois números armazenados em R1 e R2 
//  (no fundo, calcular R1*R2), deixando o resultado em R0. Como a ALU não faz multiplicações,
//  trabalhe com a ideia de fazer múltiplas adições na sua solução.

@R0
M=0

@R1
D=M

@R2
D=D-M

@R1_MAIOR
D;JGT

@R2_MAIOR
0;JMP

(R1_MAIOR)
@R1
D=M

@R4 // multiplicando
M=D

@R2
D=M

@R3 // contador
M=D

@LOOP
0;JMP

(R2_MAIOR)
@R2
D=M

@R4 // multiplicando
M=D

@R1
D=M

@R3 // contador
M=D

(LOOP)
@R4 // multiplicando
D=M

@R0
M=D+M

@R3
M=M-1

D=M

@LOOP
D;JGT

@END
0;JMP

(END)
