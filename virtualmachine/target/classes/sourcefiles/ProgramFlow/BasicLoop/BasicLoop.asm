//// PUSH CONSTANT 0 ////
//set 0
@0
D=A
//update 0 & SP+=1
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
//// LABEL LOOP_START ////
(null$LOOP_START)
//// PUSH ARGUMENT 0 ////
//change ARG[i] TO ARG[i+0]
@0
D=A
@ARG
M=M+D
A=M
D=M
//update 0 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change ARG[i+0] TO ARG[i]
@0
D=A
@ARG
M=M-D
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
//// PUSH ARGUMENT 0 ////
//change ARG[i] TO ARG[i+0]
@0
D=A
@ARG
M=M+D
A=M
D=M
//update 0 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change ARG[i+0] TO ARG[i]
@0
D=A
@ARG
M=M-D
//// PUSH CONSTANT 1 ////
//set 1
@1
D=A
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
//// POP ARGUMENT 0 ////
//change ARG[i] TO ARG[i+0]
@0
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
//put local[LCL+0] value
@ARG
A=M
M=D
//change ARG[i+0] TO ARG[i]
@0
D=A
@ARG
M=M-D
//// PUSH ARGUMENT 0 ////
//change ARG[i] TO ARG[i+0]
@0
D=A
@ARG
M=M+D
A=M
D=M
//update 0 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change ARG[i+0] TO ARG[i]
@0
D=A
@ARG
M=M-D
//// IF-GOTO LOOP_START ////
//get value from stack
@SP
A=M-1
D=M
//pop
@SP
M=M-1
//goto null$LOOP_START if value is not zero
@null$LOOP_START
D;JNE
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
