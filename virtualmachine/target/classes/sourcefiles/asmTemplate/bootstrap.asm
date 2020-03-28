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

