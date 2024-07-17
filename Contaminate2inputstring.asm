.model small 
.stack 100h
.data
    str db 50 dup ('$')
    str1 db 50 dup('$') 
    str2 db 100 dup('$')  
    msg db 'Enter 1st string:$' 
    msg1 db 0dh,0ah,'Enter 2nd string:$' 
    msg2 db 0dh,0ah,'Contminated string:$' 
    
.code

main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
        
    lea dx,msg
    mov ah,09h
    int 21h   
    
    mov si,0
    lab1:
    
    mov ah,01h
    int 21h
    cmp al,13
    je again
    mov str[si],al
    inc si
    jmp lab1

    again:  
    
    lea dx,msg1
    mov ah,09h
    int 21h
     
    mov si,0
    lab2:
    
    mov ah,01h
    int 21h
    cmp al,13
    je again10
    mov str1[si],al
    inc si
    jmp lab2    
    
    again10:
      mov si,0   
      mov di,0
      
      again1:
    cmp str[si],'$'
    je exit
    mov bl,str[si]
    mov str2[di],bl
    inc si 
    inc di
    jmp again1
    
    exit:     
       mov si,0
       again2:
     
      cmp str1[si],'$'
      je exit1 
    
    mov bl,str1[si]
    mov str2[di],bl
    inc si
    inc di 
    jmp again2
    
     exit1:
     
    lea dx,msg2
    mov ah,09h
    int 21h
    
    lea dx,str2
    mov ah,09h
    int 21h 
   
   mov ah,4ch
   int 21h 
    
    main endp
end main
