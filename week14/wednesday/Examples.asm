comment \
	
CIS130

\

.386
.model flat,stdcall
.stack 4096
.data

x WORD 65535	; <- largest unsigned value WORD can hold
z DWORD ?
z2 WORD ?
z3 SDWORD ?

x2 SWORD -9


ExitProcess proto,dwExitCode:dword

.code
main proc

	; z = x * 20 (x -> 16 bits/WORD, z -> 32 bits/DWORD)
	; first step is to put in data into the implied operand
	; in this case, since we're doing 16 bit
	; implied multiplicand (1st operator) is AX (16 bits)
	; product (or result) goes into DX:AX

	mov ax, 20
	MUL x		; ax * x

	; result is now in dx:ax
	; I need to move this into z
	; z is 32 bits

	mov WORD PTR z, ax
	mov WORD PTR z+2, dx

	; much more commonly
	; we'd want to save the result into the same size
	; variable
	mov z2, ax	; this is fine as long as CY = 0

	; ######### DIV EXAMPLES #########
	; unsigned
	; z = x / 20
	; z is 32 bits
	; x is 16 bits
	mov ax, x
	mov bx, 20
	div bx
	; then result goes into
	; ax and dx
	movzx ebx, ax   ; <- zero extend, because z is 32 bits and ax is 16 bits
	mov z, ebx  	
	

	; signed
	; z3 = x2 / 20
	; x2 is a signed WORD
	; z3 is 32 bit

	; because x2 is a signed word
	; i need to make sure that
	; this value goes into AX
	; but... DX also needs to have
	; the correct sign extension

	mov ax, x2


	; convert 16 to 32
	; aka convert WORD TO DWORD
	CWD
	; this makes sure that 
	; DX is sign extending from AX

	; division is going to be IDIV for signed

	mov bx, 20
	IDIV bx
	
	movsx ebx, ax	; <--- move the quotient into ebx and SIGN extend
	mov z3, ebx


	invoke ExitProcess,0
main endp
end main
