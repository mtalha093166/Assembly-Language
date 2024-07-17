.model small
.stack 100h
.code
      msg db 'My first assembly language program$'
.data
   main proc
    mov ax,@data
    mov ds,ax           
              mov dx,offset msg
              mov ah,09h
              int 21h 
        
        
    mov ah,4ch
    int 21h
    
    main endp
end main