.model small
.stack 100h
.data 
     
     num dw 2
     num1 dw 3
     msg db 'Sum:$'
     sum dw ?
.code

main proc
     mov ax,@data
     mov ds,ax
     mov es,ax
        
       mov ax,num
       mov bx,num1
        push ax
        push bx
       call disp  
       pop ax
        
        mov bx,10
        mov cx,0
        
        again:
        mov dx,0
        div bx
        add dx,48
        push dx
        inc cx
        cmp ax,0
        jne again
        
        lea dx,msg
        mov ah,09h
        int 21h
        
        lab1:
        pop dx
        mov ah,02h
        int 21h
        loop lab1
        
     mov ah,4ch
     int 21h
     main endp   
    
     disp proc near
          pop bx
          pop ax
          add ax,bx
          push ax
          ret 
          disp endp
end main
