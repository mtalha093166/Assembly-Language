.model small
.stack 100h
.data 
      arr1 db 5,4,3,2
     ; arr2 db 4,2,1,7
     ; arr3 db ?,?,?,?
      
.code

main proc
    mov ax,@data
    mov ds,ax
  ;  mov es,ax
       
       mov si,offset arr1
       mov cx,4
       mov bl,[si]
       again:
        cmp [si],bl
        jle again1
           resume:
           inc si
        loop again
        
        add bl,48 
        mov dl,bl
        mov ah,02h
        int 21h
        jmp exit
        
        again1:
           mov bl,[si]
           jmp resume           
    exit:              
        
    mov ah,4ch
    int 21h
    
    main endp
end main