.model small
.stack 100h
.data 
   msg db 'Enter first number: $'
   msg1 db 'Enter second number: $'
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
               
                        mov ah,01h
                        int 21h   
                        
                           sub ax,48
                        mov num,ax
                  
                     mov ah,01h
                        int 21h  
                        
                        sub ax,48
                        
                     add ax,num
                     add ax,48
                     
                     mov ah,02h
                     mov dx,ax
                     int 21h
    
    mov ah,4ch
    int 21h
    
 main endp
  end main