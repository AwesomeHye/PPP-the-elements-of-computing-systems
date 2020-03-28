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
//// PUSH CONSTANT 8 ////
//set 8
@8
D=A
//update 8 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// CALL Class1.set 2 ////
//1.push Class1.set$return-address_0
@Class1.set$return-address_0
D=A
//load Class1.set$return-address_0 & SP+=1
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
@2
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
//8.goto Class1.set
@Class1.set
0;JMP
(Class1.set$return-address_0)
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
//// PUSH CONSTANT 23 ////
//set 23
@23
D=A
//update 23 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 15 ////
//set 15
@15
D=A
//update 15 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// CALL Class2.set 2 ////
//1.push Class2.set$return-address_1
@Class2.set$return-address_1
D=A
//load Class2.set$return-address_1 & SP+=1
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
@2
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
//8.goto Class2.set
@Class2.set
0;JMP
(Class2.set$return-address_1)
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
//// CALL Class1.get 0 ////
//1.push Class1.get$return-address_2
@Class1.get$return-address_2
D=A
//load Class1.get$return-address_2 & SP+=1
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
//8.goto Class1.get
@Class1.get
0;JMP
(Class1.get$return-address_2)
//// CALL Class2.get 0 ////
//1.push Class2.get$return-address_3
@Class2.get$return-address_3
D=A
//load Class2.get$return-address_3 & SP+=1
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
//8.goto Class2.get
@Class2.get
0;JMP
(Class2.get$return-address_3)
//// LABEL WHILE ////
(Sys.init$WHILE)
//// GOTO WHILE ////
@Sys.init$WHILE
0;JMP
//// FUNCTION Class1.set 0 ////
(Class1.set)
@0
D=A
//initialize local variable size to 0
(Class1.set$LOOP)
@0
D=A-D
@Class1.set$END
D;JEQ
//get LCL index
@0
D=A-D
@LCL
A=M+D
M=0
//i+=1
D=D+1
@Class1.set$LOOP
0;JMP
(Class1.set$END)
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
//// POP STATIC 0 ////
//get value from stack
@SP
A=M-1
D=M
//SP-=1
@SP
M=M-1
//set value to variable Class1.0
@Class1.0
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
//// POP STATIC 1 ////
//get value from stack
@SP
A=M-1
D=M
//SP-=1
@SP
M=M-1
//set value to variable Class1.1
@Class1.1
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
//// FUNCTION Class1.get 0 ////
(Class1.get)
@0
D=A
//initialize local variable size to 0
(Class1.get$LOOP)
@0
D=A-D
@Class1.get$END
D;JEQ
//get LCL index
@0
D=A-D
@LCL
A=M+D
M=0
//i+=1
D=D+1
@Class1.get$LOOP
0;JMP
(Class1.get$END)
//// PUSH STATIC 0 ////
//get value from variable Class1.0
@Class1.0
D=M
//update 0 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH STATIC 1 ////
//get value from variable Class1.1
@Class1.1
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
//// FUNCTION Class2.set 0 ////
(Class2.set)
@0
D=A
//initialize local variable size to 0
(Class2.set$LOOP)
@0
D=A-D
@Class2.set$END
D;JEQ
//get LCL index
@0
D=A-D
@LCL
A=M+D
M=0
//i+=1
D=D+1
@Class2.set$LOOP
0;JMP
(Class2.set$END)
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
//// POP STATIC 0 ////
//get value from stack
@SP
A=M-1
D=M
//SP-=1
@SP
M=M-1
//set value to variable Class2.0
@Class2.0
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
//// POP STATIC 1 ////
//get value from stack
@SP
A=M-1
D=M
//SP-=1
@SP
M=M-1
//set value to variable Class2.1
@Class2.1
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
//// FUNCTION Class2.get 0 ////
(Class2.get)
@0
D=A
//initialize local variable size to 0
(Class2.get$LOOP)
@0
D=A-D
@Class2.get$END
D;JEQ
//get LCL index
@0
D=A-D
@LCL
A=M+D
M=0
//i+=1
D=D+1
@Class2.get$LOOP
0;JMP
(Class2.get$END)
//// PUSH STATIC 0 ////
//get value from variable Class2.0
@Class2.0
D=M
//update 0 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH STATIC 1 ////
//get value from variable Class2.1
@Class2.1
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
