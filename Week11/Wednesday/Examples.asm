comment \
	
CIS130


	int x = 5;
	x++;
	int sum = sumNums(x, 5);
	cout << x;


\

.386
.model flat,stdcall
.stack 4096
.data

array DWORD 1,2,3,4,5,100 DUP(10)
result DWORD ?

ExitProcess proto,dwExitCode:dword

.code
main proc


	; #################################################
	; #################################################
	; #################################################
	; #################################################
	; #################################################
	; #################################################
	; #################################################

	; procedures
	; stacks
	; etc
	
	PUSH 1
	PUSH 2
	PUSH 3

	call uselessFunction






	; #################################################
	; #################################################
	; #################################################
	; #################################################
	; #################################################
	; #################################################
	; #################################################
	; #################################################
	; #################################################
	; #################################################


	comment \
		sum an array using a loop
		when using a loop
		make sure you put HOW MANY times
		you want to loop in ECX
	\

	; let's do a different version this
	; than then one in the slides/textbook
	; arr[0]

	; we need a counter
	; we can put this wherever... let's just do
	; edx (don't need this 32 bit register...)

	; this is gonna be like i (counter, increment)
	mov edx, 0
	xor edx, edx ; <- does same thing

	; need my accumulator
	; the "variable" that will store the sum
	; as I loop
	mov eax, 0

	; move the length of array into ecx
	mov ecx, LENGTHOF array

	; the things above are the thingst that only happen ONCE

LOOP_START:			; this is a labe for a specific instruction
	add eax, array[edx * TYPE array]
	; no different than doing
	; add eax, array + (edx * TYPE array)

	inc edx
	LOOP LOOP_START
	comment \
		gets converted to
		dec ecx
		; then a conditional jump
		; the condition being 
		; if (ecx != 0) then jump to label
		; JNZ label
		; it's not checking for a var or reg
		; it's just looking at the zero flag
		; based on some work that the ALU just performed
	\

	mov result, eax

	invoke ExitProcess,0
main endp

comment \
	other procedures in this file will go here
	after main
	
	but before end main

	name_of_procedure PROC

	.. stuff happens

	RET ; <------- don't forget!!!

	name_of_procedure ENDP

\

uselessFunction PROC
	
	mov ax, 1
	mov ecx, 100
L1:
	add ax, ax

	LOOP L1

	RET
uselessFunction ENDP


end main
