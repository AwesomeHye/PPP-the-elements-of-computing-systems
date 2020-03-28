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
//// POP THAT 0 ////
//change THAT[i] TO THAT[i+0]
@0
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
//put local[LCL+0] value
@THAT
A=M
M=D
//change THAT[i+0] TO THAT[i]
@0
D=A
@THAT
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
//// POP THAT 1 ////
//change THAT[i] TO THAT[i+1]
@1
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
//put local[LCL+1] value
@THAT
A=M
M=D
//change THAT[i+1] TO THAT[i]
@1
D=A
@THAT
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
//// PUSH CONSTANT 2 ////
//set 2
@2
D=A
//update 2 & SP+=1
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
//// LABEL MAIN_LOOP_START ////
(null$MAIN_LOOP_START)
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
//// IF-GOTO COMPUTE_ELEMENT ////
//get value from stack
@SP
A=M-1
D=M
//pop
@SP
M=M-1
//goto null$COMPUTE_ELEMENT if value is not zero
@null$COMPUTE_ELEMENT
D;JNE
//// GOTO END_PROGRAM ////
@null$END_PROGRAM
0;JMP
//// LABEL COMPUTE_ELEMENT ////
(null$COMPUTE_ELEMENT)
//// PUSH THAT 0 ////
//change THAT[i] TO THAT[i+0]
@0
D=A
@THAT
M=M+D
A=M
D=M
//update 0 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change THAT[i+0] TO THAT[i]
@0
D=A
@THAT
M=M-D
//// PUSH THAT 1 ////
//change THAT[i] TO THAT[i+1]
@1
D=A
@THAT
M=M+D
A=M
D=M
//update 1 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change THAT[i+1] TO THAT[i]
@1
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
//// GOTO MAIN_LOOP_START ////
@null$MAIN_LOOP_START
0;JMP
//// LABEL END_PROGRAM ////
(null$END_PROGRAM)
