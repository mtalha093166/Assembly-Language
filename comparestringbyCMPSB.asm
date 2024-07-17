.model small
.stack 100h
.data
src db 'Talha$'
des db 'Hello$'    
msg db 'Not Equal$'
msg1 db 'Equal$'
.code
main proc
     mov ax,@data
     mov ds,ax
     mov es,ax
        
        mov si,offset src
        mov di,offset des
        mov cx,5
        cld
        rep cmpsb
        je lab1
        
        lea dx,msg
        mov ah,09h
        int 21h
        
        jmp exit 
         
        lab1:
         
        lea dx,msg1
        mov ah,09h
        int 21h 
        
        exit:
        
     mov ah,4ch
     int 21h
     main endp
end main