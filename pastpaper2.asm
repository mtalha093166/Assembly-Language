.model small
.stack 100h
.data
src db 'Hello World$'
des db 'ello$'
msg db 'Substring Found$'
msg1 db 'Substring Not Found$'
.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax

    mov si, offset src   ; Point SI to the source string
    mov di, offset des   ; Point DI to the substring

search_loop:
    mov al, [si]         ; Load byte from src
    mov bl, [di]         ; Load byte from des
    cmp al, 0            ; Check for end of source string
    je not_found         ; If end of src, substring not found
    cmp bl, 0            ; Check for end of substring
    je found             ; If end of des, substring found
    cmp al, bl           ; Compare bytes
    jne continue_search  ; If not equal, continue searching
    inc si               ; Move to next character in src
    inc di               ; Move to next character in des
    jmp search_loop      ; Continue searching

continue_search:
    inc si               ; Move to next character in src
    jmp search_loop      ; Continue searching

found:
    lea dx, msg          ; Display "Substring Found" message
    mov ah, 09h
    int 21h
    jmp exit_program

not_found:
    lea dx, msg1         ; Display "Substring Not Found" message
    mov ah, 09h
    int 21h

exit_program:
    mov ah, 4ch          ; Exit program
    int 21h

main endp
end main
