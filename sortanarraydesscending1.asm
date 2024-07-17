.data
     num db 2, 4, 8, 5, 9, 3
     count dw 6
.code
     main proc 
          mov ax, @data
          mov ds, ax
          
          mov cx, count
          dec cx 
          
    outerloop:  
          mov bx, cx
          mov SI, 0
    innerloop:
          mov al, [num + SI]    
          mov dl, [num + SI + 1]
          cmp al, dl
          jnc noswap
     ;else
          mov [num + SI + 1], al
          mov [num + SI], dl
        
       noswap:
          inc SI
          dec bx
       jnz innerloop
       
       loop outerloop
       
         mov SI, offset num
         mov cx, 6
         
      print:
          mov dl, [SI]
          add dl, 48
          mov ah, 02h
          int 21h
          inc SI
          dec cx
      jnz print
      
      
      mov ah, 4ch
      int 21h
      main endp
     end main
       
           
          