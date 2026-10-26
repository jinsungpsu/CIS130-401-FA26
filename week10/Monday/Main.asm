comment \
	
CIS130
Week 10!

include your name!!!!

int x, y=1, z=2;
x = y+z

\

.386
.model flat,stdcall
.stack 4096
.data

bArray BYTE 1,2,3,4,5
wArray WORD 11,22,33,44,55
dwArray DWORD 10,20,30,40,50

NUM_STUDENTS = 7	; <--- NOT A VARIABLE!! aka named location
					; <--- it's a symbolic constant


grades DWORD NUM_STUDENTS DUP(?)

; bigVar TBYTE ?			; <-- this would cause the symbolic constant below to be +10

NUM_BYTES_IN_VAR_GRADES = $ - grades	; careful when using $ location counter... it must be done at exactly the right spot

attendance DWORD NUM_STUDENTS DUP(?)


x DWORD ?
y DWORD 1
z DWORD 2

message DWORD 12345678h

array BYTE 1,2,3
	  BYTE 4,5,6

ExitProcess proto,dwExitCode:dword

.code
main proc

	mov eax, NUM_BYTES_IN_VAR_GRADES

	;asdasdfasdf
	mov		eax, y		
	
	;asdfasdfsadf
	add		eax, z		
	
	;asdfasdfsadf
	mov		x, eax		

	NUM_STUDENTS = 100

	; ###########################################
	; ###########################################
	; ###########################################
	; ###########################################
	; ###########################################
	; ###########################################
	; ###########################################

	; starting chapter 4 kip irvine stuff


	comment \
		int x = 5;
		float y = 10.5;

		cout << (float)x + y;
	\

	; mov eax, bx	; <- doesn't work, operand sizes must match

	movzx eax, bx	; <- zero extension
 
	comment \
		swapping stuff
		int x = 5;
		int y = 10;

		int temp;

		temp = x;
		x = y;
		y = temp;

		// yay this is easier in assembly
		// xchg
		bArray BYTE 1,2,3,4,5
		wArray WORD 11,22,33,44,55
		dwArray DWORD 10,20,30,40,50
	\

	; couple of examples, ade the last 2 elements of each array
	; bArray, result should be 9
	; wArray, result should be 99
	; dwArray, result should be 90

	; where is 4th and 5th items in BYTE array???
	; bArray is address to first item
	; bArray + 1 is address to 2nd item
	; bArray + 2 = 3rd
	; bArray + 3 = 4th
	; bArray + 4 = 5th
	; where is 4th and 5th items in WORD array???
	; where is 4th and 5th items in DWORD array???

	mov al, bArray+3		; al = bArray[3]
	add al, bArray+4		; al += bArray[4]

	; for word, which is 16 bits each.. aka 2 BYTES
	; where is 1st item?
	; wArray is first item		=> wArray + (2*0) => wArray[0]
	; wArray+2 is second item	=> wArray + (2*1) => wArray[1]
	; wArray+4 is third item	=> wArray + (2*2) => wArray[2]
	; wArray+6 is 4th			=> wArray + (2*3) => wArray[3]
	; wArray+8 is 5th			=> wArray + (2*4) => wArray[4]

	invoke ExitProcess,0
main endp
end main
