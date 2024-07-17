.model small
.stack 100h
.data
     msg1 db 'Enter number:$'
     msg2 db 0dh,0ah,'Number is :$'
     num dw ?
     
newline macro
    mov dl,0dh
    mov ah,02h
    int 21h
    mov dl,0ah
    mov ah,02h
    int 21h   
    newline endm
.code
 main proc
    mov ax,@data
    mov ds,ax
         mov ah,09h
         lea dx,msg1
         int 21h
         
         
mov ax,0
         mov bx,10
         push ax
         
         again:
           mov ah,01h
           int 21h
           cmp al,13 
         
           je exit    
             sub al,48
           mov ah,0
           
           mov num,ax
           pop ax  
           mov dx,0
           mul bx
           add ax,num
           push ax
           jmp again
             
           exit:
           
           pop ax  
           
           mov bx,10
           mov cx,0
           
           lab1:
           mov dx,0
           div bx
           push dx
           inc cx
           cmp ax,0
           jne lab1 
           
           lea  dx,msg2
           mov ah,09h
           int 21h
           
           lab2:
           pop dx  
           add dx,48
           mov ah,02h
           int 21h
           loop lab2 
                  
              
           
            
          
    mov ah,4ch
    int 21h
     
     main endp
 end main      