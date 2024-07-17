.model small
.stack 100h
.data 
  msg db 'Capital letter: $' 
  msg1 db 0dh,0ah,'Lower letter: $'
.code

main proc
      mov ax,@data
      mov ds,ax
      
      mov ah,09h
      lea dx,msg
      int 21h 
       
      mov ah,01h
      int 21h
      mov bl,al       
      mov ah,09h
      lea dx,msg1
      int 21h 
       
             mov ah,02h
             mov dl,bl
             add dl,32
             int 21h
             
mov ah, 4ch
int 21h
main endp
end main