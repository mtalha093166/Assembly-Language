.model small
.stack 100h
.data

src db 'Talha$'
des db 50 dup('$')
msg db 'Copy array:$'

.code

main proc
     mov ax,@data
     mov ds,ax
     mov es,ax
       
         mov cx,0
         mov si,offset src
         again:
         cmp [si],'$'
         je exit
         inc cx
         inc si
         jmp again
         
         exit:
           
         mov si,offset src
         mov di,offset des+      
         std
         lab1:  
         mov al,[si]
         stosb
         inc si
         loop lab1
         
         lea dx,des
         mov ah,09h
         int 21h
         
     mov ah,4ch
     int 21h
     main endp
end main