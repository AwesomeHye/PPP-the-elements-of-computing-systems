// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(INPUT) 
@KBD //keyboard input address (24576)
D=M //D=[input code]
@DOWN
D;JNE //if key down, GOTO DOWN
@UP
D;JEQ //if key up (=0), GOTO UP
(DOWN) //make black
@SCREEN //screen bit address (16384)
M=-1 //first line 16bit black
@i
M=0 //i=0
(LOOP_DOWN)
@i
D=M //D=i
@8192 //256(r) x 512 (c) = 16 bit x 8192
D=A-D //D=8192-i 
@INPUT 
D;JEQ //if D==0, GOTO INPUT (END OF LOOP)
@i
D=M //D=i
@SCREEN
A=A+D //A+=i (screen pixel address)
M=-1 //16bit pixel black
@i
M=M+1 //i+=1
@LOOP_DOWN
0;JMP //GOTO LOOP_DOWN
(UP) //make white
@i 
M=0 //i=0
(LOOP_UP)
@i
D=M //D=i
@8192 //256(r) x 512 (c) = 16 bit x 8192
D=A-D //D=8192-i
@INPUT 
D;JEQ //if D==0, GOTO INPUT (END OF LOOP)
@SCREEN
A=A+D //A+=(8192-i) (screen pixel address)
@INPUT
M;JEQ //if m==0, GOTO INPUT (because 0 means last index is already white.. is really need?)
M=0 //16bit pixel white
@i
M=M+1 //i+=1
@LOOP_UP
0;JMP //GOTO LOOP_UP