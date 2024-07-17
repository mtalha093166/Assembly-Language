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
         mov cx,5
         mov si,offset src
         mov di,offset des
         cld 
         again:
         lodsb
         mov [di],al
         inc di
         loop again
         
         lea dx,des
         mov ah,09h
         int 21h
         
     mov ah,4ch
     int 21h
     main endp
end main