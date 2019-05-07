; template to start a new project 
; 12/29/2017 Saad Biaz
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
prompt byte "Pleasse enter a sentence: ",0
prompt2 byte "Pleasse enter the number of characters to delete (in hexadecimal: ",0
n dword ?
prompt3 byte "Pleasse enter the position from where to start deleting (in hexadecimal: ",0
p dword ?
S byte 256 dup(0)
nFromS byte 256 dup(0)
reset byte 256 dup(0)
byteCount Dword ?
promptS1 byte "Pleases enter a sentence S1 to insert:",0
S1 byte 256 dup(0)
s1ByteCount dword ?
promptS2 byte "Please enter the position S2 in which to insert: "
S2 byte 256 dup(0)
s2ByteCount dword ?
p2 dword ?
.code
main proc
	; Start writing your code for your assignment
	Call exercise1
	Call erercise2
	invoke ExitProcess,0
main endp

;exercise 1
exercise1 proc
	push edx
	push ecx
	push eax
	push esi
	push edi
	mov edx,offset prompt
	Call WriteString     ; prompt the user with the message: please enter s sentence
	mov edx,offset S
	mov ecx,sizeof S
	call ReadString    ;input string S
	mov byteCount,eax
	mov edx,offset prompt2
	Call WriteString    ;prompt the user with the message:Pleasse enter the number of characters to delete in heaxdecimal:
	Call ReadHex
	mov n,eax     ;reads the #n
	mov edx,offset prompt3
	Call WriteString   ;prompt the user with the message:prompt the user with the message:
	Call ReadHex
	mov p,eax      ;reads the #p

	cld                    ;delete n characters from p in S
	mov esi,offset S
	mov edi,offset nFromS
	dec p
	mov ecx,p
	rep movsb
	add esi,n
	mov ecx,byteCount
	sub ecx,p
	sub ecx,n
	rep movsb
	mov esi,offset reset
	mov edi,offset S    ;new S
	mov ecx,byteCount
	rep movsb
	mov esi,offset nFromS
	mov edi,offset S
	mov ecx,byteCount
	sub ecx,n
	rep movsb
	mov edx,offset S
	Call WriteString     ;diaplays S
	pop edi
	pop esi
	pop eax
	pop ecx
	pop edx
	ret
exercise1 endp

;erercise2
erercise2 proc

	mov edx,offset promptS1   
	call WriteString              ;get the" Pleases enter a sentence S1 to insert:"
	mov edx,offset S1
	mov ecx,offset S1
	call ReadString
	mov s1ByteCount,eax            ;read S1
	mov edx,offset promptS2  
	call WriteString              ; "Please enter the position S2 in which to insert: "
	mov edx,offset S2
	mov ecx,offset S2
	call ReadString
	mov s2ByteCount,eax              ;readS2
	call ReadHex               
	mov p2,eax                    ;read p

	ret



erercise2 endp





end main