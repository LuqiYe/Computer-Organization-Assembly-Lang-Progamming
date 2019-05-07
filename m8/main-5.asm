; template to start a new project 
; 12/29/2017 Saad Biaz
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	prompt1 byte "Please enter a 64 bit in hexadecimal (8 bytes)",0
	prompt2 byte "Please enter a 64 bit in hexadecimal (8 bytes)",0
	prompt3 byte "Please enter a 64 bit in hexadecimal (8 bytes)",0
	prompt4 byte "Please enter a 64 bit in hexadecimal (8 bytes)",0
	prompt5 byte "Please enter a 32 bit in hexadecimal (4 bytes)",0
.code
main proc
	; Start writing your code for your assignment
	call exercise1
	call exercise2
	call exercise3
	invoke ExitProcess,0
main endp

exercise1 proc
	mov edx,offset prompt1
	call WriteString       ;Prompts the user with the message
	call ReadHex
	mov ebx,eax
	shl ebx,4              ;shift # to left for 4 
	call ReadHex
	mov ecx,eax
	add ecx,ebx             ;get the # N1
	mov edx,offset prompt2
	call WriteString        ;Prompts the user with the message
	call ReadHex
	mov ebx,eax
	shl ebx,4              ;shift # to left for 4 
	call ReadHex
	mov edx,eax
	add edx,ebx             ;get the # N2
	add ecx,edx        ; S=n1+n2
	call WriteHex

ret
exercise1 endp

;exercise 2
exercise2 proc
	mov edx,offset prompt3
	call WriteString       ;Prompts the user with the message
	call ReadHex
	mov ebx,eax
	shl ebx,4              ;shift # to left for 4 
	call ReadHex
	mov ecx,eax
	add ecx,ebx             ;get the # N1
	mov edx,offset prompt4
	call WriteString        ;Prompts the user with the message
	call ReadHex
	mov ebx,eax
	shl ebx,4              ;shift # to left for 4 
	call ReadHex
	mov edx,eax
	add edx,ebx             ;get the # N2

	mov ebx,ecx           ;save N1 in ebx
    ;no idea for N1*N2

ret
exercise2 endp

;exercise3
exercise3 proc
	mov edx,offset prompt5
	call WriteString        ;Prompts the user with the message


ret
exercise3 endp
end main