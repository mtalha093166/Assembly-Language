.model small
.stack 100h
.data
     a dw ?
     b dw ?  
     msg db 'Enter two number whoso sum less than 20$'
     error_msg db 'Invalid input$'  
     sum dw ?
       
.code
main proc
     mov ax,@data
     mov ds,ax
    
     
     lea dx,msg
     mov ah,09h
     int 21h 
     
     mov ah,01h
     int 21h 
     sub al,48
     mov ah,0
     mov a,ax
     
     cmp a,0
     jl error
     cmp a,9
     jg error
       
     mov ah,01h
     int 21h 
     sub al,48
     mov ah,0
     mov b,ax
     
     cmp b,0
     jl error
     cmp b,9
     jg error
            
     mov ax,a
     add ax,b
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
     
     lab1:
     pop dx
     mov ah,02h
     int 21h
     loop lab1
      
     jmp exit
     error:
     
     lea dx,error_msg
     mov ah,09h
     int 21h
     
     exit: 
        
     mov ah,4ch
     int 21h
     main endp 
end main