.model small
.stack 100h
.data
     msg1 db 'Enter paragraph:$'
     msg3 db 0dh,0ah,'Total words:$'
     msg2 db 0dh,0ah,'tota characters:$'
     msg4 db 0dh,0ah,'Total sentences:$'
     char_count dw 0
     words_count dw 0
     sent_count dw 0                      
                      
.code
 main proc
    mov ax,@data
    mov ds,ax 
    
         mov ah,09h
         lea dx,msg1
         int 21h  
           
        
         again:
         
         mov ah,01h
         int 21h
         cmp al,13
         je exit
         inc char_count
         cmp al,' '
         je lab1
         cmp al,'.'
         je lab2
         
         jmp again
         
         lab1:
         
         inc words_count
         jmp again
         
         lab2:
         
         inc sent_count
         inc words_count
         jmp again
         
         exit: 
        
         mov ax,char_count
         mov bx,10
         mov cx,0 
         
             exit1:
             mov dx,0
             div bx 
             add dx,48
             push dx
             inc cx
             cmp ax,0
             jne exit1 
             
         mov ah,09h
         lea dx,msg2
         int 21h
         
         exit2:
         pop dx
         mov ah,02h
         int 21h
         loop exit2
         
           mov ax,words_count
             
              exit3:
             mov dx,0
             div bx 
             add dx,48
             push dx
             inc cx
             cmp ax,0
             jne exit3 
             
         mov ah,09h
         lea dx,msg3
         int 21h
         
         exit4:
         pop dx
         mov ah,02h
         int 21h
         loop exit4  
         
         mov ax,sent_count
               
         exit5:
             mov dx,0
             div bx 
             add dx,48
             push dx
             inc cx
             cmp ax,0
             jne exit5 
             
         mov ah,09h
         lea dx,msg4
         int 21h
         
         exit6:
         pop dx
         mov ah,02h
         int 21h
         loop exit6       
         
   mov ah,4ch
   int 21h
     
     main endp
 end main