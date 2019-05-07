; template to start a new project 
; 12/29/2017 Saad Biaz
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
prompt1 byte "enter in hexadecimal a 32 bit number n (assumed less than 256)",0
prompt2 byte "enter n 32-bit numbers",0
n dword ?
A dword 256 dup(0)
count dword 0
temp dword ?

prompt3 byte "Please enter a sentence S1 to search",0
prompt4 byte "Please enter a sentence S2 in which to search S1",0
S1 byte 256 dup(0)
S2 byte 256 dup(0)
bytecount1 dword ?
bytecount2 dword ?

.code
main proc
call exercise1
call exercise2
	invoke ExitProcess,0
main endp

;exercise 1
exercise1 proc
	push edx
	push ecx
	push eax
	push ebx
	push esi
	push edi

	mov edx,offset prompt1 ;display the message
	call WriteString
	call readhex
	mov n,eax
	mov edx,offset prompt2 ;display the message
	call WriteString
	mov ecx,n
	mov esi,offset A
myloop1:
	call readhex
	mov [esi],eax
	add esi,4
loop myloop1
	mov esi,offset A
	mov edi,offset A
	mov ecx,n
	sub ecx,1
myloop2:
	push ecx
	mov eax,[esi]
	mov ecx,n
	sub ecx,count
	sub ecx,1
	add edi,4
	push edi
myloop3:
	mov ebx,[edi]
	cmp eax,ebx
	ja j1
	jmp j2
j1:
	mov temp,eax
	mov eax,ebx
	mov [esi],eax
	mov ebx,temp
	mov [edi],ebx
j2:
	add edi,4
loop myloop3
call writehex  ;display the array A
	pop edi
	pop ecx
	add esi,4
	add count,1
loop myloop2
	mov eax,ebx
	call writehex   ;display the last part

	pop edi
	pop esi
	pop ebx
	pop eax
	pop ecx
	pop edx
	ret
exercise1 endp


exercise2 proc
	mov edx,offset prompt3 ;display the message
	call WriteString
	mov edx,offset S1
	mov ecx,sizeof S1
	call ReadString
	mov bytecount1,eax
	mov edx,offset prompt4 ;display the message
	call WriteString
	mov edx,offset S2
	mov ecx,sizeof S2
	call ReadString
	mov bytecount2,eax

ret
exercise2 endp
end main