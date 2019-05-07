; Description: 
; This program has two objectives.  The first objective is to create a procedure that will take plaintext and an encryption key, use the Vigenère cipher, and encrypt the plaintext.
; The second objective is to create a procedure that will take cypher-text, an encryption key, use the Vigenère cipher, and decrypt the cypher-text. 
; Author:Luqi Ye
; Last modiﬁed date : 04 / 26 / 2019



INCLUDE Irvine32.inc                                ;use it to check the result
.386
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
    input byte "NEPPRB"                             ;Create a BYTE array with the label ‘input’.                  
    key byte "BAD"                                  ;Create a BYTE array with the label ‘key’.
    options byte 0                                  ;Create a BYTE variable named ‘options’.                                                    
	repeatkey byte lengthof input dup(0)            ;used to repeat key until the length is the same of input
    output byte lengthof input dup(0)               ;hold the result
    


.code
    main proc
        call KeyRepeat                              
		cmp options, 1                              ;compare options with 1
		je step1                                    ;when options is 1,go to step1(encrpyt)
	    call step2                                  ;when options is not 1, go to step2(Decrypt)
	    jmp ProcOutput                              ;jump to the output procedure
	step1:
        call Encrypt                                ;options is 1,call Encrpyt procedure
    ProcOutput:
		mov edx,offset output                       
	    call WriteString                            
		call Crlf                                   ;add newline to the string
        invoke ExitProcess, 0
    main endp




    KeyRepeat proc
        mov eax, lengthof key                       ;store the length of key
        mov ebx, lengthof repeatkey                 ;store the length of repeatkey

        mov esi, 0                                  ;record the index of key
        mov edi, 0                                  ;record the index of repeatkey
        
        LoopRepeat: 
            mov cl, key[esi]                        
            mov repeatkey[edi], cl                  ;store the value into repeatkey at index edi
            inc esi                                 
            inc edi                                
            cmp esi, eax                            ;compare the index of key with the length of key
            jl NotTail                              ;if the index is not the tail of key, continue loop
            mov esi, 0                              ;if the index is the tail of key, back to the front of key
            NotTail:
            cmp edi, ebx                            ;compare the index of repeatkey with the length of repeatkey
            jl LoopRepeat                           ;if it's not tail of the repeatkey, continue the loop 
        ret
    KeyRepeat endp




    Encrypt proc
        mov eax, 0                                  ;record the index of the input
        Loop1:
            mov cl, input[eax]                      ;input value = x
            mov dl, repeatkey[eax]                  ;key value = k
            add cl, dl                              ;get the value x+k,ebx = x+k
            sub cl, 65                              ;subtract with 'A', get the value tmp=x+k-'A'= cl
            cmp cl, 90                              ;compare tmp with 'Z'
            jle LessZ                               ;when tmp<='Z', store tmp in output at the index
            sub cl, 26                              ;when tmp>'Z', subtract it with 26, y=tmp-26
            LessZ:
            mov output[eax], cl                     ;store tmp in output at the index
            inc eax                                 
            cmp eax, lengthof input                 ;compare the index with the length of input
            jl Loop1                                ;if it's not the tail, continue the loop
        ret
    Encrypt endp




    step2 proc                                      ;Decrypt
        mov eax, 0                                  
        Loop2:
            mov cl, input[eax]                      ;input value = x
            mov dl, repeatkey[eax]                  ;key value = k
            add cl, 65                              ;get the value x+A, store in cl
            sub cl, dl                              ;subtract with k, get the value tmp=x+'A'-k
            cmp cl, 65                              
            jge moreThanZ                           ;if tmp>=A, store tmp in output at the index
            add cl, 26                              ;if tmp<A, add it with 26, y=tmp+26
            moreThanZ:
            mov output[eax], cl                     ;store tmp in output at the index
            inc eax                                 
            cmp eax, lengthof input                 ;compare the index with the length of input
            jl Loop2                                ;if it's not the tail, continue the loop
        ret
    step2 endp
end main