//// PUSH CONSTANT 7 ////
//set 7
@7
D=A
//update 7 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 8 ////
//set 8
@8
D=A
//update 8 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// ADD ////
//pop & SP-=1
@SP
A=M-1
D=M
@SP
M=M-1
//add
@SP
A=M-1
D=M+D
@SP
A=M-1
M=D
