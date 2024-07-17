.model small
.stack 100h  
.data
    msg db 'Firs Assembly language program$'


.code
main proc
    mov ax,@data
    mov ds,ax
       
       mov ah,09h
       mov dx,offset msg
       int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main