//// set THIS[17]=234 ////
//change THIS[i] TO THIS[i+17]
@17
D=A
@THIS
M=M+D
//set THIS[i+17]=234
@234
D=A
@THIS
A=M
M=D
//change THIS[i+17] TO THIS[i]
@17
D=A
@THIS
M=M-D

//// PUSH POINTER 17 ////
//change THIS[i] TO THIS[i+17]
@17
D=A
@THIS
M=M+D
A=M
D=M
//update 17 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change THIS[i+17] TO THIS[i]
@17
D=A
@THIS
M=M-D