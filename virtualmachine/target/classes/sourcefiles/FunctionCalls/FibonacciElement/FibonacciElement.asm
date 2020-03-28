//// BOOTSTRAP ////
//1.SP=256
@256
D=A
@SP
M=D
//2.call Sys.init 0
//1.push return-address
@return-address
D=A
//load return-address & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//2.push LCL
@LCL
D=M
//load LCL & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//3.push ARG
@ARG
D=M
//load ARG & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//4.push THIS
@THIS
D=M
//load THIS & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//5.push THAT
@THAT
D=M
//load THAT & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//6.ARG=SP-n-5
@SP
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
//7.LCL=SP
@SP
D=M
@LCL
M=D
//8.goto Sys.init
@Sys.init
0;JMP
(return-address)

//// FUNCTION Sys.init 0 ////
(Sys.init)
@0
D=A
//initialize local variable size to 0
(Sys.init$LOOP)
@0
D=A-D
@Sys.init$END
D;JEQ
//get LCL index
@0
D=A-D
@LCL
A=M+D
M=0
//i+=1
D=D+1
@Sys.init$LOOP
0;JMP
(Sys.init$END)
//// PUSH CONSTANT 4 ////
//set 4
@4
D=A
//update 4 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// CALL Main.fibonacci 1 ////
//1.push Main.fibonacci$return-address_0
@Main.fibonacci$return-address_0
D=A
//load Main.fibonacci$return-address_0 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//2.push LCL
@LCL
D=M
//load LCL & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//3.push ARG
@ARG
D=M
//load ARG & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//4.push THIS
@THIS
D=M
//load THIS & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//5.push THAT
@THAT
D=M
//load THAT & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//6.ARG=SP-n-5
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
//7.LCL=SP
@SP
D=M
@LCL
M=D
//8.goto Main.fibonacci
@Main.fibonacci
0;JMP
(Main.fibonacci$return-address_0)
//// LABEL WHILE ////
(Sys.init$WHILE)
//// GOTO WHILE ////
@Sys.init$WHILE
0;JMP
//// FUNCTION Main.fibonacci 0 ////
(Main.fibonacci)
@0
D=A
//initialize local variable size to 0
(Main.fibonacci$LOOP)
@0
D=A-D
@Main.fibonacci$END
D;JEQ
//get LCL index
@0
D=A-D
@LCL
A=M+D
M=0
//i+=1
D=D+1
@Main.fibonacci$LOOP
0;JMP
(Main.fibonacci$END)
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
//// lt ////
//pop & SP-=1
@SP
A=M-1
D=M
@SP
M=M-1
//D=a-b
@SP
A=M-1
D=M-D
//if D < 0, goto Main.fibonacci$TRUE_0
@Main.fibonacci$TRUE_0
D;JLT
//FALSE, set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
@Main.fibonacci$END_0
0;JMP
//TRUE, set -1(0xFFFF)
(Main.fibonacci$TRUE_0)
D=-1
//update -1
@SP
A=M-1
M=D
(Main.fibonacci$END_0)
//// IF-GOTO IF_TRUE ////
//get value from stack
@SP
A=M-1
D=M
//pop
@SP
M=M-1
//goto Main.fibonacci$IF_TRUE if value is not zero
@Main.fibonacci$IF_TRUE
D;JNE
//// GOTO IF_FALSE ////
@Main.fibonacci$IF_FALSE
0;JMP
//// LABEL IF_TRUE ////
(Main.fibonacci$IF_TRUE)
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
//// LABEL IF_FALSE ////
(Main.fibonacci$IF_FALSE)
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
//// CALL Main.fibonacci 1 ////
//1.push Main.fibonacci$return-address_1
@Main.fibonacci$return-address_1
D=A
//load Main.fibonacci$return-address_1 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//2.push LCL
@LCL
D=M
//load LCL & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//3.push ARG
@ARG
D=M
//load ARG & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//4.push THIS
@THIS
D=M
//load THIS & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//5.push THAT
@THAT
D=M
//load THAT & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//6.ARG=SP-n-5
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
//7.LCL=SP
@SP
D=M
@LCL
M=D
//8.goto Main.fibonacci
@Main.fibonacci
0;JMP
(Main.fibonacci$return-address_1)
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
//// CALL Main.fibonacci 1 ////
//1.push Main.fibonacci$return-address_2
@Main.fibonacci$return-address_2
D=A
//load Main.fibonacci$return-address_2 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//2.push LCL
@LCL
D=M
//load LCL & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//3.push ARG
@ARG
D=M
//load ARG & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//4.push THIS
@THIS
D=M
//load THIS & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//5.push THAT
@THAT
D=M
//load THAT & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//6.ARG=SP-n-5
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
//7.LCL=SP
@SP
D=M
@LCL
M=D
//8.goto Main.fibonacci
@Main.fibonacci
0;JMP
(Main.fibonacci$return-address_2)
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
