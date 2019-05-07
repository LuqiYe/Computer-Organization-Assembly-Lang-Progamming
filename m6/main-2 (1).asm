; template to start a new project 
; 12/29/2017 Saad Biaz
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
char byte ?
prompt BYTE "Please enter a sentence: ",0
prompt1 BYTE "Please enter a character: ",0
prompt2 BYTE "Please enter the first sentence: ",0
prompt3 BYTE "Please enter the second sentence: ",0

S BYTE 256 DUP(0) 
S1 byte 256 dup(0)
S2 byte 256 dup(0)

byteCount DWORD ?
byteCount1 DWORD ?
byteCount2 DWORD ?
.code
main proc
call Exercise1
call Exercise2
call Exercise3
	invoke ExitProcess,0
main endp

;1111111111111111111111111111111111111
Exercise1 proc
	mov edx,OFFSET prompt
	call WriteString  ; prompts the user for the sentence :"please enter a sentence:"
	mov edx,OFFSET S
	mov ecx,SIZEOF S
	call ReadString    ;input the String
	mov byteCount,eax  ;number of characters
	call writedec      ;result in dec
	call writehex      ;result in hex
	call WriteString   ;displays the string S
	ret
Exercise1 endp


;222222222222222222222222222222222222
Exercise2 proc
	mov edx,OFFSET prompt
	call WriteString  ; prompts the user for the sentence :"please enter a sentence:"
	mov edx,OFFSET S
	mov ecx,SIZEOF S
	call ReadString    ;input the String S
	mov byteCount,eax  ;number of characters S
	mov edx,OFFSET prompt1
	call WriteString  ; prompts the user for the sentence :"please enter a character:"
	call ReadChar
	mov char,al    ;read a character c from the keyboard

	mov esi,offset S
	mov ecx,256
	mov edx,0         ; count the occurrences
myloop: cmp al,[esi]
		jnz keepgoing
		inc edx
keepgoing: inc esi
		   loop myloop
	mov eax,edx
	call WriteDec     ;result in dec
	ret
Exercise2 endp


;3333333333333333333333333333333333333
Exercise3 proc
	mov edx,OFFSET prompt2
	call WriteString  ; prompts the user for the sentence :"please enter the second sentence:"
	mov edx,OFFSET S1
	mov ecx,SIZEOF S1
	call ReadString    ;input the String S1
	mov byteCount1,eax  ;number of characters

	mov edx,OFFSET prompt3
	call WriteString  ; prompts the user for the sentence :"please enter the first sentence:"
	mov edx,OFFSET S2
	mov ecx,SIZEOF S2
	call ReadString    ;input the String S2
	mov byteCount2,eax  ;number of characters

	mov edx,OFFSET S
	mov ecx,SIZEOF S
	
	cld
	mov esi,offset S1   ; put S1 into S
	mov edi,offset S
	mov ecx,byteCount1
	rep movsb

	cld
	mov esi,offset S2   ; put S2 into S
	mov ecx,byteCount2 
	rep movsb

	mov edi,offset S
	mov edx,edi
	call WriteString   ;displays S
	add eax,byteCount1
	call writedec      ;result in dec
	call writehex      ;result in hex
	ret
Exercise3 endp






end main