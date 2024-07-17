.model small
.stack 100h
.data
    arr db 6,8,4,5,8
    msg db 0dh,0ah,'Found$'
    msg2 db 0dh,0ah,'Not found$'
    num db ?

.code
main proc
    mov ax, @data
    mov ds, ax  
    
    mov ah,01h
    int 21h
    mov bl,al 
    

    mov si, 0
    mov cx, 5
 
        
        again:
        cmp bl,[si]
        je exit 
        inc si
        loop again    
        
        lea dx,msg2
        mov ah,09h
        int 21h
        jmp  exit1
    
      exit: 
        
        lea dx,msg
        mov ah,09h
        int 21h
      
      exit1:    
          
    mov ah, 4ch
    int 21h

main endp
end main
