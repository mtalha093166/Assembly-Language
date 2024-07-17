.model small
.stack 100h
.data
    arr db 6,8,3,7,8
    arr1 dw 10 dup(10)
    str db 'minum number:$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, 0
    mov cx, 5
    mov bl, [si]
     
again:
    inc si
    cmp bl, [si]
    jg exit     
   
    loop again  
    jmp exit1

exit:
    mov bl, [si]
    dec cx
     
    cmp cx,0
    jne again 
    
exit1:
    lea dx, str
    mov ah, 09h
    int 21h

   
    mov dl, bl  
     add dl, 48
    mov ah, 02h
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main