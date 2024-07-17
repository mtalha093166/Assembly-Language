.model small 
.stack 100h
.data     
       msg db 'Enter 1st number:$'
       
       num  dw ? 
newline macro
    mov dl,0dh
    mov ah,02h
    int 21h
    mov dl,0ah
    mov ah,02h
    int 21h    
    nwline endm
.code    
main proc
   mov ax,@data
   mov ds,ax  
            mov ax,0
            push ax
            
            lab1:
              mov bx,10
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
              jmp lab1
              
              
              exit:
          pop ax
          mov bx,2
          mov cx,0
          
          again:
          
          mov dx,0
          div bx
          push dx
          inc cx
          cmp ax,0
          jne again
          
          again1:
          pop dx
          add dx,48
          mov ah,02h
          int 21h
          loop again1
   
   
   
   mov ah,4ch
   int 21h
   
   main endp
   end main