//// PUSH CONSTANT 17 ////
//set 17
@17
D=A
//update 17 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 17 ////
//set 17
@17
D=A
//update 8 & SP+=1
@SP
A=M
M=D
@SP
M=M+1

//// neg ////
//update 
@SP
A=M-1
D=-M
M=D
