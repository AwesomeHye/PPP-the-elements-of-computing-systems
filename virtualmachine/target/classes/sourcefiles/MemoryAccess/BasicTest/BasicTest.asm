//// PUSH CONSTANT 10 ////
//set 10
@10
D=A
//update 10 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// POP LOCAL 0 ////
//change LCL[i] TO LCL[i+0]
@0
D=A
@LCL
M=M+D
//get value from stack
@SP
A=M-1
D=M
//SP-=1
@SP
M=M-1
//put local[LCL+0] value
@LCL
A=M
M=D
//change LCL[i+0] TO LCL[i]
@0
D=A
@LCL
M=M-D
//// PUSH CONSTANT 21 ////
//set 21
@21
D=A
//update 21 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 22 ////
//set 22
@22
D=A
//update 22 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// POP ARGUMENT 2 ////
//change ARG[i] TO ARG[i+2]
@2
D=A
@ARG
M=M+D
//get value from stack
@SP
A=M-1
D=M
//SP-=1
@SP
M=M-1
//put local[LCL+2] value
@ARG
A=M
M=D
//change ARG[i+2] TO ARG[i]
@2
D=A
@ARG
M=M-D
//// POP ARGUMENT 1 ////
//change ARG[i] TO ARG[i+1]
@1
D=A
@ARG
M=M+D
//get value from stack
@SP
A=M-1
D=M
//SP-=1
@SP
M=M-1
//put local[LCL+1] value
@ARG
A=M
M=D
//change ARG[i+1] TO ARG[i]
@1
D=A
@ARG
M=M-D
//// PUSH CONSTANT 36 ////
//set 36
@36
D=A
//update 36 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// POP THIS 6 ////
//change THIS[i] TO THIS[i+6]
@6
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
//put local[LCL+6] value
@THIS
A=M
M=D
//change THIS[i+6] TO THIS[i]
@6
D=A
@THIS
M=M-D
//// PUSH CONSTANT 42 ////
//set 42
@42
D=A
//update 42 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 45 ////
//set 45
@45
D=A
//update 45 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// POP THAT 5 ////
//change THAT[i] TO THAT[i+5]
@5
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
//put local[LCL+5] value
@THAT
A=M
M=D
//change THAT[i+5] TO THAT[i]
@5
D=A
@THAT
M=M-D
//// POP THAT 2 ////
//change THAT[i] TO THAT[i+2]
@2
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
//put local[LCL+2] value
@THAT
A=M
M=D
//change THAT[i+2] TO THAT[i]
@2
D=A
@THAT
M=M-D
//// PUSH CONSTANT 510 ////
//set 510
@510
D=A
//update 510 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// POP TEMP 6 ////
//set R[13] to temp address. R[13] = 5+6
@6
D=A
@R5
D=D+A
@R13
M=D
//get value from stack
@SP
A=M-1
D=M
//SP-=1
@SP
M=M-1
//put temp 6
@R13
A=M
M=D
//// PUSH LOCAL 0 ////
//change LCL[i] TO LCL[i+0]
@0
D=A
@LCL
M=M+D
A=M
D=M
//update 0 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change LCL[i+0] TO LCL[i]
@0
D=A
@LCL
M=M-D
//// PUSH THAT 5 ////
//change THAT[i] TO THAT[i+5]
@5
D=A
@THAT
M=M+D
A=M
D=M
//update 5 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change THAT[i+5] TO THAT[i]
@5
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
//// PUSH ARGUMENT 1 ////
//change ARG[i] TO ARG[i+1]
@1
D=A
@ARG
M=M+D
A=M
D=M
//update 1 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change ARG[i+1] TO ARG[i]
@1
D=A
@ARG
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
//// PUSH THIS 6 ////
//change THIS[i] TO THIS[i+6]
@6
D=A
@THIS
M=M+D
A=M
D=M
//update 6 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change THIS[i+6] TO THIS[i]
@6
D=A
@THIS
M=M-D
//// PUSH THIS 6 ////
//change THIS[i] TO THIS[i+6]
@6
D=A
@THIS
M=M+D
A=M
D=M
//update 6 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change THIS[i+6] TO THIS[i]
@6
D=A
@THIS
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
//// PUSH TEMP 6 ////
//get temp address
@6
D=A
@R5
A=D+A
D=M
//update 6 & SP+=1
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
