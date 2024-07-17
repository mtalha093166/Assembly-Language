.model small
.stack 100h
.data 
   msg db 'Enter number: $'
   msg1 db 0dh,0ah,'Factorial: $'
   num dw ?

.code

  main proc
    mov ax,@data
    mov ds,ax
                  
    lea dx,msg
    mov ah,09h
    int 21h
        
        mov ax,0
        push ax
        mov bx,10
        
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
        mov bx,ax
        dec bx ;mov ax,1
        lab1:
        mov dx,0
        mul bx
        dec bx
        cmp bx,0
        jne lab1
        
        mov bx,10
        mov cx,0
        lab2:
        mov dx,0
        div bx
        push dx
        inc cx
        cmp ax,0
        jne lab2
        
    lea dx,msg
    mov ah,09h
    int 21h
    
        lab3:
        pop dx   
        add dx,48
        mov ah,02h
        int 21h
        loop lab3
        
    mov ah,4ch
    int 21h
    
 main endp
  end main
