//// PUSH CONSTANT 111 ////
//set 111
@111
D=A
//update 111 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 333 ////
//set 333
@333
D=A
//update 333 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 888 ////
//set 888
@888
D=A
//update 888 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// POP STATIC 8 ////
//get value from stack
@SP
A=M-1
D=M
//SP-=1
@SP
M=M-1
//set value to variable StaticTest.8
@StaticTest.8
M=D
//// POP STATIC 3 ////
//get value from stack
@SP
A=M-1
D=M
//SP-=1
@SP
M=M-1
//set value to variable StaticTest.3
@StaticTest.3
M=D
//// POP STATIC 1 ////
//get value from stack
@SP
A=M-1
D=M
//SP-=1
@SP
M=M-1
//set value to variable StaticTest.1
@StaticTest.1
M=D
//// PUSH STATIC 3 ////
//get value from variable StaticTest.3
@StaticTest.3
D=M
//update 3 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH STATIC 1 ////
//get value from variable StaticTest.1
@StaticTest.1
D=M
//update 1 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// SUB ////
//pop & SP-=1
@SP
A=M-1
D=M
@SP
M=M-1
//sub
@SP
A=M-1
D=M-D
@SP
A=M-1
M=D
//// PUSH STATIC 8 ////
//get value from variable StaticTest.8
@StaticTest.8
D=M
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
