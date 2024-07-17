.model small
.stack 100h
.data                 
     msg db ' Enter character:$'
     msg1 db 0dh,0ah,' Enter string:$'
     msg2 db 0dh,0ah,' Found:$'
     msg3 db 0dh,0ah,' Not found:$'
     str db 50 dup('$')
     char db ?
     num  dw 0
.code
main proc
    mov ax,@data
    mov ds,ax
            
           lea dx,msg
           mov ah,09h
           int 21h   
           
           mov ah,01h
           int 21h
           mov char,al  
           
           lea dx,msg1
           mov ah,09h
           int 21h   
           
           mov si,offset str
           
           again:
           
              mov ah,01h
              int 21h
              cmp al,13
              je exit    
              cmp al,char
              je again2
              mov [si],al
              inc si
              jmp again  
           again2:
             inc num
             jmp again
             
           exit:
             cmp num,0
             jne exit2
             lea dx,msg3
             mov ah,09h
             int 21h 
             jmp exit3
             
           exit2:
              lea dx,msg2
             mov ah,09h
             int 21h 
             
           exit3:
             
         mov ah,4ch
         int 21h
         
    main endp
end main