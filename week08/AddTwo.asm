; Jin An
; CIS130 Lab 1

.386
.model flat,stdcall
.stack 4096

.data
; all this stuff ends up being in memory (RAM)
; so the names/identifiers
; they're actually LABELS (
; for a memory location


; int num = 12;
; label = "num"
; 12 is a constant or literal
; dword is kind of like a type
; sort of like int
; you may have seen it in your calculator
; it's a 32 bit value


num dword 4*12+1*9		; this is NOT an instruction
						; this is data definitions
						; aka - the program, once assembled
						; does not do any multiplication or
						; addition here
						; this is an integer expression
num2 dword 10101011010b
num3 dword 0abh
num4 dword 1234123h
num5 dword 1234157o

; strings and chars
; a char is just an 8 bit number

grade byte 'a'
grade2 byte "A"
message byte 'hi'	; there's no syntax to tell this is an array
message2 byte "bye"	; strings are arrays of chars
					; so it's similar to
					; char message[] = {'h', 'i'};
					; char message2[] = {'b', 'y', 'e'};

;addr byte '1 main street'	; can't do this
							; bc addr is a reserved keyword


val1 dword 5
;VAL1 dword 10				; assembly is not case sensitive so this is error

ExitProcess proto,dwExitCode:dword

.code						; <--- actual instructions in this section
main proc
PART1:	mov eax, 5				; nmemonic
							; instruction operation
							; MOV
							; still not case sensitive


	mov	eax, num            ; this line does blah
	; mov (no E in the nmemonic!!!)
	; similar to = (assignment operator)
	; ---> eax = num
	


	mov ebx,10				; this line does blah
	add	eax,ebx				; this line does blah
	; we are used to seeing a = b + c
	; but here...we have an implied destination
	; a += b aka a = a + b
	; so.. logically, first operand can't be a constant
	; 1 = 1 + b
	; ADD cannot use two memory address
	; destination must be memory/register
	; what is a register?
	; they're kind of like... permanent variables
	; we'll be using "general purpose registers"
	; eax, ebx, ecx, edx <- general purpose
	; these are all 32 bits or DWORD
	; when adding, operand sizes MUST match


	add eax, num

	invoke ExitProcess,0
main endp
end main
