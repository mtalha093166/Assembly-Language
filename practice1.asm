.model small
.stack 100h
.data
    arr db 6,8,4,5,8
    str db 'largest number:$'

.code
main proc
    mov ax, @data
    mov ds, ax
        
        mov cx,5
        mov si,0
        mov bl,[si]
        
        resume:
        
        inc si
        cmp [si],bl
        jg update
        loop resume
        jmp  exit
        
        update:
        mov bl,[si]
        jmp resume 
        
        exit:
        add bl,48
        mov dl,bl
        mov ah,02h
        int 21h

mov ah,4ch
int 21h

main endp
end main