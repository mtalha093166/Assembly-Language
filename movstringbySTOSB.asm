.model small
.stack 100h
.data

src db 'Hello Pakistan:$'
des db 50 dup('$')
msg db 0dh,0ah,'Copy array:$'

.code

main proc
     mov ax,@data
     mov ds,ax
     mov es,ax  
           
     mov cx,4
     mov si,offset src
     mov di,offset des
            cld
            again:
             mov al,src[si]
             
             STOSB 
             loop again
               
             mov di,offset des
             mov ah,09h
             int 21h
        
     mov ah,4ch
     int 21h
     main endp
end main