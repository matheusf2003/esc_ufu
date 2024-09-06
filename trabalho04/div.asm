//  R0 = div(R1,R2)  Crie um código capaz de dividir dois números armazenados em R1 e R2 (no fundo,
//  calcular R1/R2), deixando o resultado em R0. Como a ALU não faz divisões, trabalhe com a ideia de fazer
//  múltiplas subtrações na sua solução.
//  armazena o resto em R4

@R0
M=0

(LOOP)
@R2 // divisor
D=M

@R1 // dividendo
M=M-D

@R0
M=M+1

@R1
D=M

@LOOP
D;JGT

@SAIDA
D;JEQ

@R2
D=M

@R1
M=D+M

@R0
M=M-1

(SAIDA)
@R1
D=M

@R3 // resto
M=D

@END
0;JMP

(END)
