//// PUSH CONSTANT 3030 ////
//set 3030
@3030
D=A
//update 3030 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// POP POINTER 0 ////
//get value from stack
@SP
A=M-1
D=M
//SP-=1
@SP
M=M-1
//set value to THIS(POINTER 0) OR THAT(POINTER 1)
@THIS
A=A
M=D
//// PUSH CONSTANT 3040 ////
//set 3040
@3040
D=A
//update 3040 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// POP POINTER 1 ////
//get value from stack
@SP
A=M-1
D=M
//SP-=1
@SP
M=M-1
//set value to THIS(POINTER 0) OR THAT(POINTER 1)
@THIS
A=A+1
M=D
//// PUSH CONSTANT 32 ////
//set 32
@32
D=A
//update 32 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// POP THIS 2 ////
//change THIS[i] TO THIS[i+2]
@2
D=A
@THIS
M=M+D
//get value from stack
@SP
A=M-1
D=M
//SP-=1
@SP
M=M-1
//put local[LCL+2] value
@THIS
A=M
M=D
//change THIS[i+2] TO THIS[i]
@2
D=A
@THIS
M=M-D
//// PUSH CONSTANT 46 ////
//set 46
@46
D=A
//update 46 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// POP THAT 6 ////
//change THAT[i] TO THAT[i+6]
@6
D=A
@THAT
M=M+D
//get value from stack
@SP
A=M-1
D=M
//SP-=1
@SP
M=M-1
//put local[LCL+6] value
@THAT
A=M
M=D
//change THAT[i+6] TO THAT[i]
@6
D=A
@THAT
M=M-D
//// PUSH POINTER 0 ////
//get value from THIS(POINTER 0) OR THAT(POINTER 1)
@THIS
A=A
D=M
//update 0 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH POINTER 1 ////
//get value from THIS(POINTER 0) OR THAT(POINTER 1)
@THIS
A=A+1
D=M
//update 1 & SP+=1
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
//// PUSH THIS 2 ////
//change THIS[i] TO THIS[i+2]
@2
D=A
@THIS
M=M+D
A=M
D=M
//update 2 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change THIS[i+2] TO THIS[i]
@2
D=A
@THIS
M=M-D
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
//// PUSH THAT 6 ////
//change THAT[i] TO THAT[i+6]
@6
D=A
@THAT
M=M+D
A=M
D=M
//update 6 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change THAT[i+6] TO THAT[i]
@6
D=A
@THAT
M=M-D
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
