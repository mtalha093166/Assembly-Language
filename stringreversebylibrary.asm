.model small
.stack 100h
.data

src db 'Hello$'
des db 50 dup('$')
msg db 'Copy reverse string:$'

.code

main proc
     mov ax,@data
     mov ds,ax
     mov es,ax
        
        mov  cx,5
        
        mov si,offset src+4
        mov di,offset des
        std 
        again:    
        movsb
        add di,2
        
        
        loop again
        
        lea dx,msg
        mov ah,09h
        int 21h   
        
        lea dx,des
        mov ah,09h
        int 21h
        
     mov ah,4ch
     int 21h
     main endp
end main