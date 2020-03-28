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
//if D == 0, goto null$TRUE_0
@null$TRUE_0
D;JEQ
//FALSE, set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
@null$END_0
0;JMP
//TRUE, set -1(0xFFFF)
(null$TRUE_0)
D=-1
//update -1
@SP
A=M-1
M=D
(null$END_0)
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
//if D == 0, goto null$TRUE_1
@null$TRUE_1
D;JEQ
//FALSE, set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
@null$END_1
0;JMP
//TRUE, set -1(0xFFFF)
(null$TRUE_1)
D=-1
//update -1
@SP
A=M-1
M=D
(null$END_1)
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
//if D == 0, goto null$TRUE_2
@null$TRUE_2
D;JEQ
//FALSE, set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
@null$END_2
0;JMP
//TRUE, set -1(0xFFFF)
(null$TRUE_2)
D=-1
//update -1
@SP
A=M-1
M=D
(null$END_2)
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
//if D < 0, goto null$TRUE_3
@null$TRUE_3
D;JLT
//FALSE, set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
@null$END_3
0;JMP
//TRUE, set -1(0xFFFF)
(null$TRUE_3)
D=-1
//update -1
@SP
A=M-1
M=D
(null$END_3)
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
//if D < 0, goto null$TRUE_4
@null$TRUE_4
D;JLT
//FALSE, set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
@null$END_4
0;JMP
//TRUE, set -1(0xFFFF)
(null$TRUE_4)
D=-1
//update -1
@SP
A=M-1
M=D
(null$END_4)
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
//if D < 0, goto null$TRUE_5
@null$TRUE_5
D;JLT
//FALSE, set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
@null$END_5
0;JMP
//TRUE, set -1(0xFFFF)
(null$TRUE_5)
D=-1
//update -1
@SP
A=M-1
M=D
(null$END_5)
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
//if D > 0, goto null$TRUE_6
@null$TRUE_6
D;JGT
//FALSE, set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
@null$END_6
0;JMP
//TRUE, set -1(0xFFFF)
(null$TRUE_6)
D=-1
//update -1
@SP
A=M-1
M=D
(null$END_6)
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
//if D > 0, goto null$TRUE_7
@null$TRUE_7
D;JGT
//FALSE, set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
@null$END_7
0;JMP
//TRUE, set -1(0xFFFF)
(null$TRUE_7)
D=-1
//update -1
@SP
A=M-1
M=D
(null$END_7)
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
//if D > 0, goto null$TRUE_8
@null$TRUE_8
D;JGT
//FALSE, set 0
@0
D=A
//update 0
@SP
A=M-1
M=D
@null$END_8
0;JMP
//TRUE, set -1(0xFFFF)
(null$TRUE_8)
D=-1
//update -1
@SP
A=M-1
M=D
(null$END_8)
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
