def push(segment, i):
    if segment == "constant":
        return f"@{i}\nD=A\n@SP\nA=M\nM=D\n@SP\nM=M+1\n"
    else:
        match segment:
            case "local":
                asm_out = f"@{i}\nD=A\n@LCL\nA=M+D"
            case "argument":
                asm_out = f"@{i}\nD=A\n@ARG\nA=M+D"
            case "this":
                asm_out = f"@{i}\nD=A\n@THIS\nA=M+D"
            case "that":
                asm_out = f"@{i}\nD=A\n@THAT\nA=M+D"
            case "temp":
                asm_out = f"@5\nD=A\n@{i}\nA=D+A"
            case "pointer":
                asm_out = f"@THAT" if int(i) else f"@THIS"
            case "static":
                filename = "tmp"
                asm_out = f"@{filename}.{i}"
        asm_out += "\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1\n"
        return asm_out

def pop(segment, i):
    match segment:
        case "local":
            return f"@{i}\nD=A\n@LCL\nD=M+D\n@R13\nM=D\n@SP\nM=M-1\nA=M\nD=M\n@R13\nA=M\nM=D\n"
        case "argument":
            return f"@{i}\nD=A\n@ARG\nD=M+D\n@R13\nM=D\n@SP\nM=M-1\nA=M\nD=M\n@R13\nA=M\nM=D\n"
        case "this":
            return f"@{i}\nD=A\n@THIS\nD=M+D\n@R13\nM=D\n@SP\nM=M-1\nA=M\nD=M\n@R13\nA=M\nM=D\n"
        case "that":
            return f"@{i}\nD=A\n@THAT\nD=M+D\n@R13\nM=D\n@SP\nM=M-1\nA=M\nD=M\n@R13\nA=M\nM=D\n"
        case "temp":
            return f"@5\nD=A\n@{i}\nD=D+A\n@R13\nM=D\n@SP\nM=M-1\nA=M\nD=M\n@R13\nA=M\nM=D\n"
        case "pointer":
            this_that = "THAT" if int(i) else "THIS"
            return f"@SP\nM=M-1\nA=M\nD=M\n@{this_that}\nM=D\n"
        case "static":
            filename = "tmp"
            return f"@{filename}.{i}\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1\n"

def add():
    return "@SP\nM=M-1\nA=M\nD=M\nA=A-1\nD=D+M\nM=D\n"

def sub():
    return "@SP\nM=M-1\nA=M\nD=M\nA=A-1\nD=M-D\nM=D\n"
    
def neg():
    return "@SP\nA=M-1\nM=-M\n"

def eq():
    return "@SP\nM=M-1\nA=M\nD=M\n@SP\nM=M-1\nA=M\nD=M-D\n@EQUAL_TRUE\nD;JEQ\n@SP\nA=M\nM=0\n@EQUAL_END\n0;JMP\n(EQUAL_TRUE)\n@SP\nA=M\nM=-1\n(EQUAL_END)\n@SP\nM=M+1\n"

def gt():
    return "@SP\nM=M-1\nA=M\nD=M\n@SP\nM=M-1\nA=M\nD=M-D\n@GREATER_TRUE\nD;JGT\n@SP\nA=M\nM=0\n@GREATER_END\n0;JMP\n(GREATER_TRUE)\n@SP\nA=M\nM=-1\n(GREATER_END)\n@SP\nM=M+1\n"

def it():
    return "@SP\nM=M-1\nA=M\nD=M\n@SP\nM=M-1\nA=M\nD=M-D\n@LESS_TRUE\nD;JLT\n@SP\nA=M\nM=0\n@LESS_END\n0;JMP\n(LESS_TRUE)\n@SP\nA=M\nM=-1\n(LESS_END)\n@SP\nM=M+1\n"

