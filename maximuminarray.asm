.model small
.stack 100h
.data
    arr db 6,8,4,5,8
    str db 'largest number:$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, 0
    mov cx, 5
 
    mov bl, [si]
        
        again:
        cmp bl,[si]
        jle update 
        resume:
        inc si
        loop again
        
        add bl,48
        mov dl,bl
        mov ah,02h
        int 21h
            jmp exit
        
        update:
           
           mov bl,[si]
           jmp resume
    
    
      exit:
    
    mov ah, 4ch
    int 21h

main endp
end main