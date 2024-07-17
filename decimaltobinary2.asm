.model small
.stack 100h
.data    
     msg  db 'number in bainary:$'
     num dw 22
     
.code
main proc
    mov ax,@data
    mov ds,ax
                lea dx,msg
                mov ah,09h
                int 21h
               mov ax,num 
               mov bx,2
               mov cx,0
               again:
               mov dx,0
               div bx 
               
               push dx
               inc cx
               cmp ax,0
               jne again
               
               again1:
               pop dx
               add dx,48
               mov ah,02h
               int 21h
               loop again1 
                
        mov ah,4ch
        int 21h
        
        main endp
end main                