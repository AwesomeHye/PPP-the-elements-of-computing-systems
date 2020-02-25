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
//// POP LCL 3 ////
//change LCL+=3
@3
D=A
@LCL
M=M+D
//get 17
@SP
A=M-1
D=M
//SP-=1
@SP
M=M-1
//put local[LCL+3] 17
@LCL
A=M
M=D
//change LCL-=3
@3
D=A
@LCL
M=M-D
