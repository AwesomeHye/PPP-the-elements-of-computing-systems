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
//// PUSH CONSTANT 4000 ////
//set 4000
@4000
D=A
//update 4000 & SP+=1
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
//// PUSH CONSTANT 5000 ////
//set 5000
@5000
D=A
//update 5000 & SP+=1
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
//// CALL Sys.main 0 ////
//1.push Sys.main$return-address_0
@Sys.main$return-address_0
D=A
//load Sys.main$return-address_0 & SP+=1
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
//8.goto Sys.main
@Sys.main
0;JMP
(Sys.main$return-address_0)
//// POP TEMP 1 ////
//set R[13] to temp address. R[13] = 5+1
@1
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
//put temp 1
@R13
A=M
M=D
//// LABEL LOOP ////
(Sys.init$LOOP)
//// GOTO LOOP ////
@Sys.init$LOOP
0;JMP
//// FUNCTION Sys.main 5 ////
(Sys.main)
@0
D=A
//initialize local variable size to 0
(Sys.main$LOOP)
@5
D=A-D
@Sys.main$END
D;JEQ
//get LCL index
@5
D=A-D
@LCL
A=M+D
M=0
//i+=1
D=D+1
@Sys.main$LOOP
0;JMP
(Sys.main$END)
//// PUSH CONSTANT 4001 ////
//set 4001
@4001
D=A
//update 4001 & SP+=1
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
//// PUSH CONSTANT 5001 ////
//set 5001
@5001
D=A
//update 5001 & SP+=1
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
//// PUSH CONSTANT 200 ////
//set 200
@200
D=A
//update 200 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// POP LOCAL 1 ////
//change LCL[i] TO LCL[i+1]
@1
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
//put local[LCL+1] value
@LCL
A=M
M=D
//change LCL[i+1] TO LCL[i]
@1
D=A
@LCL
M=M-D
//// PUSH CONSTANT 40 ////
//set 40
@40
D=A
//update 40 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// POP LOCAL 2 ////
//change LCL[i] TO LCL[i+2]
@2
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
//put local[LCL+2] value
@LCL
A=M
M=D
//change LCL[i+2] TO LCL[i]
@2
D=A
@LCL
M=M-D
//// PUSH CONSTANT 6 ////
//set 6
@6
D=A
//update 6 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// POP LOCAL 3 ////
//change LCL[i] TO LCL[i+3]
@3
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
//put local[LCL+3] value
@LCL
A=M
M=D
//change LCL[i+3] TO LCL[i]
@3
D=A
@LCL
M=M-D
//// PUSH CONSTANT 123 ////
//set 123
@123
D=A
//update 123 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// CALL Sys.add12 1 ////
//1.push Sys.add12$return-address_1
@Sys.add12$return-address_1
D=A
//load Sys.add12$return-address_1 & SP+=1
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
//8.goto Sys.add12
@Sys.add12
0;JMP
(Sys.add12$return-address_1)
//// POP TEMP 0 ////
//set R[13] to temp address. R[13] = 5+0
@0
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
//put temp 0
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
//// PUSH LOCAL 2 ////
//change LCL[i] TO LCL[i+2]
@2
D=A
@LCL
M=M+D
A=M
D=M
//update 2 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change LCL[i+2] TO LCL[i]
@2
D=A
@LCL
M=M-D
//// PUSH LOCAL 3 ////
//change LCL[i] TO LCL[i+3]
@3
D=A
@LCL
M=M+D
A=M
D=M
//update 3 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change LCL[i+3] TO LCL[i]
@3
D=A
@LCL
M=M-D
//// PUSH LOCAL 4 ////
//change LCL[i] TO LCL[i+4]
@4
D=A
@LCL
M=M+D
A=M
D=M
//update 4 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//change LCL[i+4] TO LCL[i]
@4
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
//// FUNCTION Sys.add12 0 ////
(Sys.add12)
@0
D=A
//initialize local variable size to 0
(Sys.add12$LOOP)
@0
D=A-D
@Sys.add12$END
D;JEQ
//get LCL index
@0
D=A-D
@LCL
A=M+D
M=0
//i+=1
D=D+1
@Sys.add12$LOOP
0;JMP
(Sys.add12$END)
//// PUSH CONSTANT 4002 ////
//set 4002
@4002
D=A
//update 4002 & SP+=1
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
//// PUSH CONSTANT 5002 ////
//set 5002
@5002
D=A
//update 5002 & SP+=1
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
//// PUSH CONSTANT 12 ////
//set 12
@12
D=A
//update 12 & SP+=1
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
