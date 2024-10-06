def main():
    dados = ''
    while True:
        try:
            line = input().strip()
            if line[:2] != "//" and line != '':
                if line[0] == '@':
                    dados += f"{int(line[1:]):016b}\n"
                else:   # Symbolic syntax:  dest = comp ; jump
                        # Binary syntax:    1 1 1 a c c c c c c d d d j j j

                    if '=' in line:
                        line = line.split('=')  # divide a string separando line[0] = dest; line[1] = (comp;jump)
                        match line[0]:
                            case 'M':
                                dest = "001"
                            case 'D':
                                dest = "010"
                            case "DM" | "MD":
                                dest = "011"
                            case 'A':
                                dest = "100"
                            case "AM" | "MA":
                                dest = "101"
                            case "AD" | "DA":
                                dest = "110"
                            case "ADM":
                                dest = "111"
                        line = line[1]          # line = (comp;jump)
                    else:
                        dest = "000"

                    if ';' in line: 
                        line = line.split(';')  # divide a string separando line[0] = comp; line[1] = jump
                        match line[1]:
                            case "JGT":
                                jump = "001"
                            case "JEQ":
                                jump = "010"
                            case "JGE":
                                jump = "011"
                            case "JLT":
                                jump = "100"
                            case "JNE":
                                jump = "101"
                            case "JLE":
                                jump = "110"
                            case "JMP":
                                jump = "111"
                        line = line[0]          # line = comp
                    else:
                        jump = "000"

                    match line:
                        case '0':
                            comp = "0101010"
                        case '1':
                            comp = "0111111"
                        case "-1":
                            comp = "0111010"
                        case 'D':
                            comp = "0001100"
                        case 'A':
                            comp = "0110000"
                        case 'M':
                            comp = "1110000"
                        case "!D":
                            comp = "0001101"
                        case "!A":
                            comp = "0110001"
                        case "!M":
                            comp = "1110001"
                        case "-D":
                            comp = "0001111"
                        case "-A":
                            comp = "0110011"
                        case "-M":
                            comp = "1110011"
                        case "D+1":
                            comp = "0011111"
                        case "A+1":
                            comp = "0110111"
                        case "M+1":
                            comp = "1110111"
                        case "D-1":
                            comp = "0001110"
                        case "A-1":
                            comp = "0110010"
                        case "M-1":
                            comp = "1110010"
                        case "D+A":
                            comp = "0000010"
                        case "D+M":
                            comp = "1000010"
                        case "D-A":
                            comp = "0010011"
                        case "D-M":
                            comp = "1010011"
                        case "A-D":
                            comp = "0000111"
                        case "M-D":
                            comp = "1000111"
                        case "D&A":
                            comp = "0000000"
                        case "D&M":
                            comp = "1000000"
                        case "D|A":
                            comp = "0010101"
                        case "D|M":
                            comp = "1010101"
                        case _:
                            comp = "0000000"
                    dados += f"111{comp}{dest}{jump}\n"

        except EOFError:
            break

    # Nome do arquivo
    nome_arquivo = 'python_out.hack'

    # Abrir o arquivo em modo binário para escrita
    with open(nome_arquivo, 'w') as arquivo:
        arquivo.write(dados[:-1])


if __name__ == "__main__":
    main()