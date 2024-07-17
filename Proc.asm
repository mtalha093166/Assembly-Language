.model small
.stack 100h
.data
        msg db 'Talha$'
        msg1 db 'Talha$'
        msg2 db 'Talha$'
        msg3 db 'Talha$'
.code
main proc
     mov ax,@data
     mov ds,ax
         lea dx,msg
         mov ah,09h
         int 21h
         call newline
         lea dx,msg1
         mov ah,09h
         int 21h
          call newline
         lea dx,msg2
         mov ah,09h
         int 21h
             call newline
         lea dx,msg3
         mov ah,09h
         int 21h
         
         
     mov ah,4ch
     int 21h
     
     main endp
    newline proc
     mov dh,0dh
     mov ah,02h
     int 21h
     mov dh,0ah
     mov ah,02h
     int 21h
     
     newline endp
     ret
end main