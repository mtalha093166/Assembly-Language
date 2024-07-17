.model small
.stack 100h
.data    
     msg  db 'Enetr a paragraph:$'
     msg1 db 0dh,0ah,'Total characters:$'  
     msg2 db 0dh,0ah,'Total words:$'
     msg3 db 0dh,0ah,'Total sentences:$'
     
    char_count dw 0
    words_count dw 0 
    sent_count dw 0  
     
.code
main proc
    mov ax,@data
    mov ds,ax
                lea dx,msg
                mov ah,09h
                int 21h
               again:
                 
                mov ah,01h
                int 21h
                cmp al,13 
                je exit
                inc char_count
                cmp al,32
                je lab1 
                cmp al,'.'
                je lab2
             
         lab1:
              inc words_count
              jmp again 
              
         lab2:
         inc words_count
         inc sent_count
             jmp again 
              
               exit:
               
                mov ax,sent_count
                mov bx,10  
                mov cx,0 
                
               lab3:
               
                mov dx,0
                div bx
                push dx 
                inc cx
                cmp ax,0
                jne lab3
                lea dx,msg3
                mov ah,09h
                int 21h
                
               lab4:
               
               pop dx
               add dx,48
               mov ah,02h
               int 21h
               loop lab4
             
              
        mov ah,4ch
        int 21h
        
        main endp
end main