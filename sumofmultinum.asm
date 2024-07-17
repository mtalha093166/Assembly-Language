.model small
.stack 100h
.data
      msg db '1 num:$'
      msg1 db 0dh,0ah,'2 number:$' 
      msg2 db 0dh,0ah,'sum:$'
      num dw ?
      num1 dw 7
.code
main proc
    mov ax,@data
    mov ds,ax
           lea dx,msg
           mov ah,09h
           int 21h
           
           
           mov ax,0
           mov bx,10
           
           push ax
           
           again:
           
           mov ah,01h
           int 21h
           cmp al,13
           je again1
           sub al,48
           mov ah,0
           mov num,ax
           pop ax
           mov dx,0
           mul bx
           add ax,num
           push ax
           jmp again
           
           
           again1:
           pop ax
           mov num,ax
            
           lea dx,msg1
           mov ah,09h
           int 21h
           
           mov ax,0
           mov bx,10
           
           push ax
           lab1:
           
           mov ah,01h
           int 21h
           cmp al,13
           je exit
           sub al,48
           mov ah,0
           mov num1,ax
           pop ax
           mov dx,0
           mul bx
           add ax,num1
           push ax
           jmp lab1
           
           exit:
           pop ax
           mov num1,ax
           add ax,num
                       
           
                                   
           mov bx,10
           mov cx,0
           
           lab2:
           
           mov dx,0
           div bx
           push dx
           inc cx
           cmp ax,0
           jne lab2
           
           lea dx,msg2
           mov ah,09h
           int 21h
           
           lab3:
           pop dx
           add dx,48
           mov ah,02
           int 21h
           loop lab3
           
           jmp exit1
           
           
    exit1:
           
           
    mov ah,4ch
    int 21h
    
    main endp
end main
