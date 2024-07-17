.model small
.stack 100h 
.data
    msg db 'Enter array:$'
    msg1 db 0dh,0ah,'maxmimum:$'
    arr db 10 dup(0)  
    
.code
main proc
    mov ax,@data
    mov ds,ax

     lea dx,msg
     mov ah,09h
     int 21h         
     
     mov cx,10
     mov si,offset arr
    again:
    
    mov ah,01h
    int 21h       
    sub al,48
    mov arr[si],al
    inc si
    loop again
     
     mov si,offset arr
     mov bl,arr[si]    
     mov cx,10
    lab1:   
     cmp bl,arr[si]
     jle lab2
     resume:
     inc si
     loop lab1
      
     lea dx,msg1
     mov ah,09h
     int 21h 
      
     mov dl,bl
     add dl,48
     mov ah,02h
     int 21h  
     
     jmp exit
     
     lab2:
     mov bl,arr[si]
     jmp resume 
     

     exit:
    
    mov ah,4ch
    int 21h
    
    main endm
end main
