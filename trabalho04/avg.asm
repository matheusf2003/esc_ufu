//  R0 = avg(R1,R2)  Crie um código capaz de calcular a média entre um total de R2 valores armazenados a
//  partir da posição apontada por R1, deixando o resultado em R0. Por exemplo, Se R1 contiver o valor 100
//  e R2 o valor 10, os valores da memória RAM armazenados entre os endereços 100 a 109 devem ser
//  somados e o resultado divido por 10. Reuse código feito anteriormente.

@R5
M=0

@R2
D=M

@R3 // contador
M=D-1

@R1
D=M

@R4 // endereço
M=D

@R3
D=M

@R4
M=D+M

(LOOP)
@R4
A=M
D=M

@R5
M=D+M

@R4 // decrementa endereço
M=M-1

@R3 // decrementa o contador
M=M-1
D=M

@LOOP
D;JGE

// ---------- inicio codigo div ----------

@R0
M=0

(LOOP_DIVISAO)
@R2 // divisor
D=M

@R5 // dividendo
M=M-D

@R0
M=M+1

@R5
D=M

@LOOP_DIVISAO
D;JGT

@SAIDA
D;JEQ

@R2
D=M

@R5
M=D+M

@R0
M=M-1

(SAIDA)
@R5
D=M

@R3 // resto
M=D

@END
0;JMP

// ---------- final codigo div ----------

(END)
