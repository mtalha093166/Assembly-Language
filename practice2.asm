.model small
.stack 100h
.data 
   msg1 db 0dh,0ah,'Array in asscending order: $'
   
   arr db 5,4,5,6 

.code

  main proc
    mov ax,@data
    mov ds,ax
      
      mov cx,4
      dec cx
      
      outer:
      mov bx,cx
      mov si,0
      inner:
      mov al,[si]
      mov dl,[si+1]
      cmp al,dl
      jc noswap
      mov [si],dl
      mov [si+1],al
      inc si
       dec bx
       jnz inner
       loop outer
       jmp last
       
       noswap:
       inc si
       dec bx
       jmp inner
       
       last:
       mov si,0
       mov cx,4
       again:
       mov dl,[si]
       add dl,48     
       inc si
       mov ah,02h
       int 21h
       loop again
          
    mov ah,4ch
    int 21h
    
    main endp
  end main