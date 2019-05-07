; template to start a new project 
; 12/29/2017 Saad Biaz
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	myString BYTE "Hello World",0dh,0ah
	
.code
main proc
	mov	edx,OFFSET myString
	call WriteString
	; Start writing your code for your assignment
		; Start writing your code for your assignment
; Exercise 1
DigitValue2ASCII proc
	mov al,0ch  ; test variable
	mov bl,0ah  
	cmp al,bl   ;compare al and bl to indtify al
	jae L1      ;if al >= Ah,jump to L1
	mov dl,al   ;if al = 0 to 9, get ASCII code
	add dl,30h
	jmp L2
L1: mov dl,al   ; if al between Ah to Fh, get ASCII code
	add dl,37h
L2:
DigitValue2ASCII endp


;Exercise 2
WriteHexByte proc
	mov al,0e7h  ;test variable
	mov dl,al
	AND dl,0F0h
	shr dl,4     ;shift right,in there dl=0eh
	mov bl,0ah
	cmp dl,bl     ;compare it to identify dl is in 0~9 or A~F
	jae L3        ;if dl >= Ah,jump to L3
	add dl,30h    
	mov al, dl    ; if dl < Ah, get ASCII code,value store in al
	jmp L4
L3: add dl,37h    
	mov al,dl     ;if dl >= Ah, get ASCII code,value store in al
L4:
	call WriteChar

	mov al,0e7h  ;test variable
	mov dl,al
	AND dl,00Fh
	mov bl,0ah
	cmp dl,bl     ;compare it to identify dl is in 0~9 or A~F
	jae L3        ;if dl >= Ah,jump to L5
	add dl,30h    
	mov al, dl    ; if dl < Ah, get ASCII code,value store in al
	jmp L6
L5: add dl,37h    
	mov al,dl     ;if dl >= Ah, get ASCII code,value store in al
L6:
	call WriteChar

	mov al,'h'
	call WriteChar ; display h
	mov al,0Ah
	call WriteChar  ; line feed
	mov al,0Dh
	call WriteChar   ; carriage return
	WriteHexByte endp


;Exercise 3
ASCII2DigitValue proc
.data
char BYTE ?
.code
	call ReadChar ;test variable
	mov char,al
	mov bl,03Ah
	cmp al,bl
	jae L7     ;if al >=bl,jump to L7
	mov dl,al
	AND dl,00Fh  ; value store in DL when bl < 3Ah
	jmp L8
L7: mov dl,al
	AND dl,00Fh
	add dl,040h   ;value store in DL When bl>= 3A
L8:
ASCII2DigitValue endp


;Exercise 4
ReadHexByte proc
mov bl,41h
.data
char1 BYTE ?
.code
	call ReadChar
	mov char1,al
	cmp al,bl
	jae L9
	sub al,30h
	jmp L10
L9: sub al,37h
L10:

.data
char2 BYTE ?
.code
	call ReadChar
	mov char2,al
	cmp al,bl
	jae L11
	sub al,30h
	jmp L12
L11: sub al,37h
L12: shl dl,4
     or al,dl

ReadHexByte endp




;Exercise 5
SumFirstN proc
	mov al,003Eh ;test variable
	mov dx,0000h
	mov ecx,003Eh
Jolie: ADD dx,1
	   ADD dx,dx
	   LOOP Jolie
Done:
SumFirstN endp


;Exercise 6 
call ReadHexByte
call SumFirstN
	mov ebx,0000h    
	mov ecx,0  ;input the N for the eax
S: ADD eax,1
	   ADD eax,eax
	   LOOP S
N:





	invoke ExitProcess,0
main endp
end main