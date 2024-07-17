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
        std 
        again:
        lodsb 
        mov dl,al
        mov ah,02h
        int 21h
        loop again
        
     mov ah,4ch
     int 21h
     main endp
end main