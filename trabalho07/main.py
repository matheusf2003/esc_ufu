# Matheus Fernandes Melo - 12121ECP017

import vm_translation

def main():
    dados = ""
    while True:
        try:
            line = input().strip()
            if line[:2] != "//" and line != '':
                line = line.split()
                match line[0]:
                    case "push":
                        dados += vm_translation.push(line[1], line[2])
                    case "pop":
                        dados += vm_translation.pop(line[1], line[2])
                    case "add":
                        dados += vm_translation.add()
                    case "sub":
                        dados += vm_translation.sub()
                    case "neg":
                        dados += vm_translation.neg()
                    case "eq":
                        dados += vm_translation.eq()
                    case "gt":
                        dados += vm_translation.gt()
                    case "it":
                        dados += vm_translation.it()

        except EOFError:
            break
    
    # Nome do arquivo
    nome_arquivo = 'python_out.asm'

    # Abrir o arquivo em modo binário para escrita
    with open(nome_arquivo, 'w') as arquivo:
        arquivo.write(dados[:-1])
    arquivo.close()


if __name__ == "__main__":
    main()