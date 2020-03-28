//// FUNCTION SimpleFunction.test 2 ////
(SimpleFunction.test)
@0
D=A
//initialize local variable size to 0
(SimpleFunction.test$LOOP)
@2
D=A-D
@SimpleFunction.test$END
D;JEQ
//get LCL index
@2
D=A-D
@LCL
A=M+D
M=0
//i+=1
D=D+1
@SimpleFunction.test$LOOP
0;JMP
(SimpleFunction.test$END)
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
//// PUSH LOCAL 1 ////
//change LCL[i] TO LCL[i+1]
@1
D=A
@LCL
M=M+D
A=M
D=M
//update 1 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change LCL[i+1] TO LCL[i]
@1
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
//// not ////
//update 
@SP
A=M-1
D=!M
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
//// RETURN ////
//FRAME=LCL
@LCL
D=M
@FRAME
M=D
//RET=*(FRAME-5)
@5
D=A
@FRAME
A=M-D
D=M
@RET
M=D
//*ARG=pop()
//get value from stack
@SP
A=M-1
D=M
@SP
M=M-1
//load value to @ARG
@ARG
A=M
M=D
//SP=ARG+1
@ARG
D=M+1
@SP
M=D
//THAT=*(FRAME-1)
@FRAME
A=M-1
D=M
@THAT
M=D
//THIS=*(FRAME-2)
@2
D=A
@FRAME
A=M-D
D=M
@THIS
M=D
//ARG=*(FRAME-3)
@3
D=A
@FRAME
A=M-D
D=M
@ARG
M=D
//LCL=*(FRAME-4)
@4
D=A
@FRAME
A=M-D
D=M
@LCL
M=D
//goto RET 
@RET
A=M
0;JMP
