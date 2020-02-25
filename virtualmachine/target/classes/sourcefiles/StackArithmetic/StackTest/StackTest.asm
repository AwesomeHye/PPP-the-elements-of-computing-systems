//// PUSH CONSTANT 17 ////
//set 17
@17
D=A
//update 17 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 17 ////
//set 17
@17
D=A
//update 17 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// eq ////
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
//if D == 0, TRUE. GOTO line+=18
@31
D;JEQ
//FALSE 
//set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
//GOTO line+=23
@35
0;JMP
//line 31. TRUE
//set -1(0xFFFF)
D=-1
//update -1
@SP
A=M-1
M=D
//// PUSH CONSTANT 17 ////
//set 17
@17
D=A
//update 17 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 16 ////
//set 16
@16
D=A
//update 16 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// eq ////
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
//if D == 0, TRUE. GOTO line+=18
@66
D;JEQ
//FALSE 
//set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
//GOTO line+=23
@70
0;JMP
//line 66. TRUE
//set -1(0xFFFF)
D=-1
//update -1
@SP
A=M-1
M=D
//// PUSH CONSTANT 16 ////
//set 16
@16
D=A
//update 16 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 17 ////
//set 17
@17
D=A
//update 17 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// eq ////
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
//if D == 0, TRUE. GOTO line+=18
@101
D;JEQ
//FALSE 
//set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
//GOTO line+=23
@105
0;JMP
//line 101. TRUE
//set -1(0xFFFF)
D=-1
//update -1
@SP
A=M-1
M=D
//// PUSH CONSTANT 892 ////
//set 892
@892
D=A
//update 892 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 891 ////
//set 891
@891
D=A
//update 891 & SP+=1
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
//if D < 0, TRUE. GOTO line+=18
@136
D;JLT
//FALSE 
//set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
//GOTO line+=23
@140
0;JMP
//line 136. TRUE
//set -1(0xFFFF)
D=-1
//update -1
@SP
A=M-1
M=D
//// PUSH CONSTANT 891 ////
//set 891
@891
D=A
//update 891 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 892 ////
//set 892
@892
D=A
//update 892 & SP+=1
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
//if D < 0, TRUE. GOTO line+=18
@171
D;JLT
//FALSE 
//set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
//GOTO line+=23
@175
0;JMP
//line 171. TRUE
//set -1(0xFFFF)
D=-1
//update -1
@SP
A=M-1
M=D
//// PUSH CONSTANT 891 ////
//set 891
@891
D=A
//update 891 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 891 ////
//set 891
@891
D=A
//update 891 & SP+=1
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
//if D < 0, TRUE. GOTO line+=18
@206
D;JLT
//FALSE 
//set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
//GOTO line+=23
@210
0;JMP
//line 206. TRUE
//set -1(0xFFFF)
D=-1
//update -1
@SP
A=M-1
M=D
//// PUSH CONSTANT 32767 ////
//set 32767
@32767
D=A
//update 32767 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 32766 ////
//set 32766
@32766
D=A
//update 32766 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// gt ////
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
//if D > 0, TRUE. GOTO line+=18
@241
D;JGT
//FALSE 
//set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
//GOTO line+=23
@245
0;JMP
//line 241. TRUE
//set -1(0xFFFF)
D=-1
//update -1
@SP
A=M-1
M=D
//// PUSH CONSTANT 32766 ////
//set 32766
@32766
D=A
//update 32766 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 32767 ////
//set 32767
@32767
D=A
//update 32767 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// gt ////
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
//if D > 0, TRUE. GOTO line+=18
@276
D;JGT
//FALSE 
//set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
//GOTO line+=23
@280
0;JMP
//line 276. TRUE
//set -1(0xFFFF)
D=-1
//update -1
@SP
A=M-1
M=D
//// PUSH CONSTANT 32766 ////
//set 32766
@32766
D=A
//update 32766 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 32766 ////
//set 32766
@32766
D=A
//update 32766 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// gt ////
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
//if D > 0, TRUE. GOTO line+=18
@311
D;JGT
//FALSE 
//set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
//GOTO line+=23
@315
0;JMP
//line 311. TRUE
//set -1(0xFFFF)
D=-1
//update -1
@SP
A=M-1
M=D
//// PUSH CONSTANT 57 ////
//set 57
@57
D=A
//update 57 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 31 ////
//set 31
@31
D=A
//update 31 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// PUSH CONSTANT 53 ////
//set 53
@53
D=A
//update 53 & SP+=1
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
//// PUSH CONSTANT 112 ////
//set 112
@112
D=A
//update 112 & SP+=1
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
//// neg ////
//update 
@SP
A=M-1
D=-M
M=D
//// AND ////
//pop & SP-=1
@SP
A=M-1
D=M
@SP
M=M-1
//and
@SP
A=M-1
D=M&D
@SP
A=M-1
M=D
//// PUSH CONSTANT 82 ////
//set 82
@82
D=A
//update 82 & SP+=1
@SP
A=M
M=D
@SP
M=M+1
//// OR ////
//pop & SP-=1
@SP
A=M-1
D=M
@SP
M=M-1
//sub
@SP
A=M-1
D=M|D
@SP
A=M-1
M=D
//// not ////
//update 
@SP
A=M-1
D=!M
M=D
