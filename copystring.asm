.model small 
.stack 100h
.data
   str1 db 'Helo$'
   str2 db 50 dup('$')
   
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov si,0
          
        again:
           cmp str1[si],'$'
           je exit
           mov bl,str1[si]
           mov str2[si],bl
           inc si
           jmp  again
           
        exit:
           
          lea dx,str2
          mov ah,02h
          int 21h
          
       mov ah,4ch
       int 21h
       
    main endp
end main
        