.model small
.stack 100h
.data            
       msg1 db ' sum: $'
       num dw 34
       num1 dw 56

.code

main proc
    mov ax,@data
    mov ds,ax  
         
            mov ax,num
            add ax,num1
            mov bx,10
            mov cx,0
            
            lab1:
               mov dx,0
               div bx 
               add dx,48
               push dx   
               inc cx
               cmp ax,0
               jne lab1
               
               lea dx,msg1
               mov ah,09h
               int 21h
               
            lab2:
               pop dx
               mov ah,02h
               int 21h
               loop lab2         
          
    mov ah,4ch
    int 21h
    
    main endp
end main