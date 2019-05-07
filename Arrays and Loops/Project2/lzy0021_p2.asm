.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data 
input byte 5,0Ah,3,6,0Ch
output byte 100 dup(?)
shift dword 3
.code
	main proc
		mov eax, 0
		mov ebx, 0
		mov esi, 0
		mov ebx, lengthof input		;lengthof input		
		sub ebx, shift				;position lengthof (input-shift)
		mov ecx, shift
		L1:
			mov al, input[ebx]	     ;get character from the array
			mov output[esi], al		 ;store the character to the begining of the target		
			inc esi
			inc ebx					 
		loop L1



		mov esi, 0							
		mov ebx, shift
		mov ecx, lengthof input		 ;use input to counter	
		L2:
			mov al, input[esi]		 ;get character from the array
			mov output[ebx], al		 ;store the character to the begining of the target
			inc esi							
			inc ebx
		loop L2



		mov esi, 0
		mov ecx, 0
		mov ecx, lengthof output
		L3:
			mov al, output[esi]
			inc esi
		loop L3



		invoke ExitProcess,0
	main endp
end main