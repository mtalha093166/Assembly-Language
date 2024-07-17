.model small
.stack 100h
.data
   msg1 db 'Eneter string:$'
   msg2 db 0dh,0ah,'Total characters:$'
   str db 50 dup('$')
   char dw 0
.code

main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,09h
    int 21h    
   
        mov si,offset str
    again:  
    
       mov ah,01h
       int 21h
       cmp al,13
       je exit
       mov [si],al
       inc char
       jmp again
       
   exit:         
    lea dx,msg2
    mov ah,09h
    int 21h    
   
       mov ax,char
       mov cx,0
       mov bx,10
        
        lab1:
            mov  dx,0
            div bx 
            add dx,48
            push dx
            inc cx
            cmp ax,0
            jne lab1
            
        lab2:
            pop dx
            mov ah,02h
            int 21h
            loop lab2
                
       mov ah,4ch
       int 21h
       
   main endp

end main
       