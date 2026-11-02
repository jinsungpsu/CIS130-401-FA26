comment \
	
CIS130

\

.386
.model flat,stdcall
.stack 4096
.data

array TBYTE 1000h,2000h,3000h

intarray WORD 100h,200h,300h,400h

ExitProcess proto,dwExitCode:dword

.code
main proc

	; sum an array using a loop... finally!
	mov edi,OFFSET intarray	; address of intarray
	mov ecx,LENGTHOF intarray	; loop counter
	mov ax,0	; zero the accumulator
	xor ax, ax

L1:
	add ax,[edi]	; add an integer
	add edi,TYPE intarray	; point to next integer
	loop L1	; repeat until ECX = 0

	mov ecx, 1			; <-- how many times to loop

instruction01a:
	mov esi,OFFSET array
instruction02a: 
	mov eax,[esi]
	JMP instruction04a
	
instruction03a: 
	add esi, TYPE array
	
instruction04a: 
	add ax,[esi]
instruction05a: 
	add esi, TYPE array
	add ax,[esi]
		
	LOOP instruction01a			; when it reaches this line of code
								; it will ALWAYS do 2 things
								; ecx--
								; if (ecx != 0) jmp to label
								; in this case
								; JMP instruction01a

	invoke ExitProcess,0
main endp
end main

comment \
	a counting loop
	for (int i = 0; i < 5; i++) {

	}

\
