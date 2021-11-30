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


(LOOP)
	@24575
	D=A
	@address
	M=D

	@KBD
	D=M

	@BLACK
	D;JGT

	@WHITE
	D;JMP

	@LOOP
	0;JMP

(BLACK)
	@address
	A=M
	M=-1

	@address
	M=M-1

	@SCREEN
	D=A
	
	@address
	D=M-D

	@LOOP
	D;JLT

	@BLACK
	0;JMP

(WHITE)
	@address
	A=M
	M=0

	@address
	M=M-1

	@SCREEN
	D=A
	
	@address
	D=M-D

	@LOOP
	D;JLT

	@WHITE
	0;JMP		