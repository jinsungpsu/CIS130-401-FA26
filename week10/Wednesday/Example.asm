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


bPtrExample BYTE 11h
wPtrExample WORD 2233h
dwPtrExample DWORD 44556677h





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

Rval SDWORD 1
Xval SDWORD 2
Yval SDWORD 3
Zval SDWORD 4

ExitProcess proto,dwExitCode:dword

.code
main proc


	; TYPE example
	mov ax, wArray+(TYPE wArray*3)
	add ax, wArray+(TYPE wArray*4)

	; ptr examples
	; this doesn't work
	; bPtrExampls is a BYTE, 8 bits
	; eax is 32 bits
	; mov eax, bPtrExample
	mov eax, DWORD PTR bPtrExample
	; this doesn't actually make a whole lot of sense
	; you're going past that variable's data into the unknown
	

	; what does make more sense is accessing part of a larger variable
	; take something big and put it something smaller
	; similar to explicit casting in higher level languages
	; mov ax, dwPtrExample <- this doesn't work
	; can't put a dword into 16 bit register

	mov ax, WORD PTR dwPtrExample

	; let's move just 
	mov ax, WORD PTR dwPtrExample + 2

	mov eax, OFFSET bArray ; bArray is an array of BYTE
					; but... all addresses are 32 bits

	mov ebx, OFFSET wArray

	mov ecx, OFFSET dwArray

	mov eax, NUM_BYTES_IN_VAR_GRADES

	mov eax, 1
	inc eax
	dec eax
	sub eax, 1

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

	; let's add the 4th and 5th item
	mov ax, wArray+(2*3)
	add ax, wArray+(2*4)

	mov al, bArray - 1

	; 	Rval = Xval - (-Yval + Zval)

	mov eax, Yval
	neg eax
	add eax, Zval
	mov ebx, Xval
	sub ebx, eax
	mov Rval, ebx

	; this is technically wrong
	; we are changing the values of some variables
	; we negated the final value of Yval
	; we also changed the value of Xval
	; ultimately, we did calculate Rval correctly, but
	; made a lot of unintentional changes

	comment \
	neg Yval
	mov eax, Yval
	add eax, Zval

	sub Xval, eax
	mov eax, Xval
	mov Rval, eax
	\


	invoke ExitProcess,0
main endp
end main
