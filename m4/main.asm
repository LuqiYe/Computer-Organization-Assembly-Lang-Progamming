; template to start a new project 
; 12/29/2017 Saad Biaz
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	myString1 BYTE "h",0dh,0ah
	myString2 BYTE " ",0dh,0ah
.code
main proc
	
	; Start writing your code for your assignment
	; Exercise 1
	mov al,06h; Text variable
	mov dl,30h 
	add dl,al ;ASCII code between 30h to 39h (0-9)
	mov al, dl ;put ASCII in al
	call WriteChar ;displays al
	mov	edx,OFFSET myString2
	call WriteString


	;Exercise 2
	mov al,57h ;Test variable
	mov dh, al
	AND dh,0F0h ;get the significant nibble, zero out
	shr dh,4 ;shift right
	add dh,30h ;add 30h to get ASCII code
	mov al,dh
	call WriteChar
	mov	edx,OFFSET myString2
	call WriteString ;get the 5

	mov al,57h ;Test variable
	mov dl,al
	AND dl,0Fh ;get the least significant nibble
	add dl,30h ;add 30h to get ASCII code
	mov al,dl
	call WriteChar
	mov	edx,OFFSET myString2
	call WriteString ;get the 7

	mov al,68h
	call WriteChar
	mov	edx,OFFSET myString2
	call WriteString  ;get the h

	mov al, 0Ah
	call WriteChar
	mov	edx,OFFSET myString2
	call WriteString ;get the "line feed"

	mov al,0Dh
	call WriteChar
	mov	edx,OFFSET myString2
	call WriteString ;get the "carrage"


	;Exercise 3
	.data
	char BYTE ?
	.code
	call ReadChar
	mov char,al ;user will enter a number
	AND al,0Fh ;get the value that user entered
	mov dl,al ;the value will store in the DL

	;Exercise 4
	.data
	char2 BYTE ?
	.code
	call ReadChar
	mov char,cl ;user will input the first value
	shl cl,4 ;shift to the left to get most significant nibble

	.data
	char3 BYTE ?
	.code
	call ReadChar
	mov char,bl ;user will input the second value
	AND bl,0Fh ;get the least significant nibble

	add cl,bl ;the whole value
	mov al,cl ;the whole will store in the al
	call WriteChar ;displays al
	mov	edx,OFFSET myString2
	call WriteString

	invoke ExitProcess,0
main endp
end main