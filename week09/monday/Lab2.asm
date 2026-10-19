comment 🙂
adfgadl;kjfa;lkjfda
asdl;fkjasd;lf
asdf;lkjasd;lfka
f;alskjdf;laskdjf
as;ldfkjasd;f
🙂

; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
.data
num dword 12
x dword 5

count BYTE 100
wVal  WORD 2
result DWORD ?
array WORD 1,2,3,4,5


ExitProcess proto,dwExitCode:dword

.code
main proc

	mov ax, array+2	; + 1 for byte
					; + 2 for word
					; + 4 for dword
	; add array, array+2, array+4, array+6, array+8
	; this doesn't work

	comment \
		int array[] = {1,2,3,4,5};
		int sum = array[0] + array[1] + ...;

		instead

		int sum;
		// use registers as temp work spaces
		// let's pretend we have a variable
		// called eax (or ax or ah or al depending size)

		// we have to keep juggling things...

		eax = array[0];
		eax += array[1];
		eax += array[2];
		eax += array[3];
		eax += array[4];

		sum = eax;

	\

	mov bl,count
	mov ax,wVal
	mov count,al

	mov eax, offset count



	mov	eax, num				; comment
	mov ebx,10					; comment
	add	eax,ebx	

	invoke ExitProcess,0
main endp
end main
