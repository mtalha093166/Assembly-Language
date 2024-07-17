;Wrong Program
.model small 
.stack 100h
.data     
       msg db 'Enter 1st number:$'
       msg1 db 'Enter 2nd number:$'
       num1   dw ?
       num2   dw ? 
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
              mov bx,10
              push ax
              agian: 
              mov ah,01h
              int 21h   
              cmp al,13
              je exit
              sub al,48
              mov ah,0
              mov num,ax
              pop ax
              mov dx,0
              mul  bx
              add ax,num
              push ax
              jmp again
              
              
              
              exit:
              mov ah,01h
              int 21h   
              cmp al,13
              je exit
              sub al,48
              mov ah,0
              mov num,ax
              pop ax
              mov dx,0
              mul  bx
              add ax,num
              push ax
              jmp again
              
              
              
              
              
              
       mov ah,09h
       mov dx,offset msg            
          int 21h


mov ah,4ch
   int 21h
   
   main endp
   end main