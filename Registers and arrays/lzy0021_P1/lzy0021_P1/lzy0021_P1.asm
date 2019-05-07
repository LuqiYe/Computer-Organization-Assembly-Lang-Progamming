.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
input byte 1,2,3,4,5,6,7,8
shift byte 2

.code
	main proc
		mov eax,0
		mov ebx,0
		mov ecx,0
		mov edx,0

		mov ecx,lengthof input
		mov esi,offset input
		mov al,shift

Lop:
	add [esi],al
	add esi, type input
	loop lop

		mov eax,0
		mov ebx,0
		mov ecx,0
		mov edx,0
		
		mov esi, offset input
		mov ax,word ptr[esi]
		xchg al,ah

		mov bx,word ptr[esi+2]
		xchg bl,bh

		mov cx,word ptr[esi+4]
		xchg cl,ch

		mov dx,word ptr [esi+6]
		xchg dl,dh





		invoke ExitProcess,0
	main endp
end main