.model small 
.stack 100h
.data     
       num db 56 dup("$")
.code    
main proc
   mov ax,@data
   mov ds,ax    
                      
      mov ah,10
      lea dx,num
      int 21h
      mov ah,9 
      lea dx,num+2
      int 21h     
      
          
   mov ah,4ch
   int 21h
   
  main endp
end main          