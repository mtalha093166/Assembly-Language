.model small 
.stack 100h
.data     
       msg db 'Enter string:$'
       msg1 db 0dh,0ah,'String in reverse order:$'
       str db 50 dup('$') 

.code    
main proc
   mov ax,@data
   mov ds,ax    
             
                 mov ah,09h
                 mov dx,offset msg            
                 int 21h
                  mov cx,0
                 mov si,offset str
              again:
                 mov ah,01h
                 int 21h
                 cmp al,13
                 je exit
                 mov [si],al
                 inc si
                 inc cx
                 jmp again
                 
                   
                exit:
                 mov ah,09h
                 mov dx,offset msg1            
                 int 21h           
                 
                 lab1:
                 dec si
                 mov dl,[si]
                 mov ah,02h
                 int 21h  
                 
                 loop lab1
                  
          
  mov ah,4ch
   int 21h
   
   main endp
   end main          