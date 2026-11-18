comment \
	
CIS130

\

.386
.model flat,stdcall
.stack 4096
.data

val1 DWORD 5

ExitProcess proto,dwExitCode:dword

.code
main proc

; while loop
comment \
	while( ebx <= val1)
	{
		ebx = ebx + 5;
		val1 = val1 - 1
	}
\

; option 2

WHILE_START2:
	CMP ebx, val1
	JBE ACTUAL_WORK
	JMP next3
ACTUAL_WORK:
	add ebx, 5
	sub val1, 1
	JMP WHILE_START2

; option 1

WHILE_START:
	CMP ebx, val1
	JA next3
	add ebx, 5
	sub val1, 1
	JMP WHILE_START

next3:


comment \
	if (al > bl) OR (bl > cl)
	  X = 1;
\

	cmp al,bl	; is AL > BL?
	ja  L1	; yes
	cmp bl,cl	; no: is BL > CL?
	jbe next2	; no: skip next statement
L1:	mov X,1	; set X to 1
next2:



comment \
	if( ebx <= ecx && ecx > edx )
	{
	  eax = 5;
	  edx = 6;
	}
	... whatever is here is the next label
\
	mov ebx, 1
	mov ecx, 6
	mov edx, 8

	; if ebx > ecx
	CMP ebx, ecx
	JA next

	; if ecx <= edx
	CMP ecx, edx
	JBE next

	; some code that executes if both
	; my conditions are true
	mov eax, 5
	mov edx, 6

next:

	invoke ExitProcess,0


main endp
end main
