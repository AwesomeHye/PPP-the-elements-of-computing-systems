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
//// eq ////
//pop & SP-=1
@SP
A=M-1
D=M
@SP
M=M-1
//D=a&b
@SP
A=M-1
D=D&M
//if D == 0, GOTO line 31
@31
D;JEQ
//FALSE 
//set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
//GOTO line 36
@36
0;JMP
//line 31. TRUE
//set -1(0xFFFF)
@15
D=A
//update -1
@SP
A=M-1
M=D