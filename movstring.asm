.model small
.stack 100h
.data 

   str db 'Hello Pakistan$'
   msg db 'Copy string: $'
   
   str1 db 50 dup('$')
   
.code 

main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
                
       cld         
       mov cx,14
       mov si,offset str
       mov di,offset str1
       
       rep movsb
       
       lea dx,msg
       mov ah,09h
       int 21h
        
       
       lea dx,str1
       mov ah,09h
       int 21h
        
    mov ah,4ch
    int 21h
    
    main endp
end main