.model small
.stack 100h
.data
   msg1 db 'enter string:$'
   msg2 db 0dh,0ah,'string:$'
   str db 50 dup('$')
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
       cmp al,' '
       je again1 
       cmp al,'.'
       je again2
      sub al,32
      mov [si],al
       inc si
       jmp again
    
    again1:
       mov [si],al
       inc si
       jmp again
       
    again2:
       mov [si],al
       inc si
       jmp again   
    exit:
       lea dx,msg2
       mov ah,09h
       int 21h
        
       lea dx,str
       mov ah,09h
       int 21h   
       
       
       mov ah,4ch
       int 21h
       
   main endp

end main
       
