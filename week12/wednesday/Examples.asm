comment \
	
CIS130

\

.386
.model flat,stdcall
.stack 4096
.data

array DWORD 1,20,3,40,5
result DWORD ?


ExitProcess proto,dwExitCode:dword

.code
main proc

	comment \

		int sum = 0;
		for (int i = 0; i < array.length; i++) {
			if (array[i] > 10) {
				sum += array[i];
			}
			
		}
		eax = sum;

		
	\

	xor eax, eax				; accumulator
	mov ecx, LENGTHOF array		; ecx = array.length
	mov esi, 0					; i = 0;

ARR_SUM_LOOP_START:
	
								; we don't always add
								; we only add for a specific condition
								; if (array[i] > 10)
	CMP array[esi * TYPE array], 10
	
	JBE ADD_IF_ARRY_ELEMENT_SMALLER_THAN_TEN

ADD_IF_ARRY_ELEMENT_GREATER_THAN_TEN:
	add eax, array[esi * TYPE array]	; this line needs to be skipped sometimes

ADD_IF_ARRY_ELEMENT_SMALLER_THAN_TEN:
	inc ESI						; i++

	LOOP ARR_SUM_LOOP_START		; LOOP (if ECX != 0, go back to label)








	call function

	; when i call betterFunction
	; i need to know what that function
	; expects me to do before i call it
	mov ECX, LENGTHOF array
	mov ESI, OFFSET array

	call functionBetter
	; when functionBetter is called
	; in this context.. i know what's going on with
	; eax, ebx, ecx, etc...
	; but when i come back... ebx might have been modified!

	mov result, eax

	invoke ExitProcess,0
main endp

; -----------------------------------------
function PROC
; this function will sum all the elements
; in an array
; receives: nothing
; returns: nothing
; requires: nothing
; note: this is bad!  not very reusable
; -----------------------------------------
	; array of DWORD
	mov ecx, LENGTHOF array
	mov eax, 0				; accumulator 32 bit
	mov ebx, 0				; counter

LOOP_START:
	add eax, array[ebx * TYPE array]
	inc ebx
	LOOP LOOP_START

	mov result, eax
	
	RET
function ENDP


; -----------------------------------------
functionBetter PROC
; this function will sum all the elements
; in an array
; receives: ESI holds address to DWORD array
; returns: eax = sum of all elements
; requires: nothing
; note: this is better - more reusable!
;		no references to data labels
; -----------------------------------------
	; array of DWORD
	mov eax, 0				; accumulator 32 bit
	mov ebx, 0				; counter

LOOP_START:
	add eax, [esi + ebx * TYPE array]
	inc ebx
	LOOP LOOP_START

	mov result, eax
	
	RET
functionBetter ENDP


; -----------------------------------------
functionBetterer PROC
; this function will sum all the elements
; in an array
; receives: ESI holds address to DWORD array
; returns: eax = sum of all elements
; requires: nothing
; note: this is an improved better
; -----------------------------------------

	; any registers that will be affected in here
	; that's not documented in returns
	; should be pushed, then popped at the end
	push ebx
	push ecx

	; array of DWORD
	mov eax, 0				; accumulator 32 bit
	mov ebx, 0				; counter

LOOP_START:
	add eax, [esi + ebx * TYPE array]
	inc ebx
	LOOP LOOP_START

	mov result, eax
	


	pop ecx
	pop ebx

	RET
functionBetterer ENDP



; -----------------------------------------
functionBest PROC uses ebx ecx
; this function will sum all the elements
; in an array
; receives: ESI holds address to DWORD array
; returns: eax = sum of all elements
; requires: nothing
; note: this is "our" best version
;		using the uses operator to
;		push/pop all affected registers
; -----------------------------------------

	; array of DWORD
	mov eax, 0				; accumulator 32 bit
	mov ebx, 0				; counter

LOOP_START:
	add eax, [esi + ebx * TYPE array]
	inc ebx
	LOOP LOOP_START

	mov result, eax

	RET
functionBest ENDP





end main
