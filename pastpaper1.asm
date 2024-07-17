.model small
.stack 100h
.data
arr db  ?,?,?,?,?
msg db 'enter array:$'
msg1 db 0dh,0ah,'largest number:$'
msg2 db 0dh,0ah,'minimum numbber:$'
msg3 db 'invalid number:$'
num db ?
num1 db ?
.code
main proc
     mov ax,@data
     mov ds,ax
        
        lea dx,msg
        mov ah,09h
        int 21h
        
        mov si,offset arr
        mov cx,5
    again:
        mov ah,01h
        int 21h
        cmp al,48
        jl error  
        sub al,48
        mov [si],al
        inc si
    loop again
        
        mov si,offset arr  
        mov cx,5
        mov bl,[si]
        mov al,[si]
        lab1:
        cmp bl,[si]
        jle less
        mov bl,[si]
        less:
        cmp al,[si]
        jge greater
        mov al,[si]
        greater:
        inc si
        loop lab1
        jmp last
        
        last: 
         
        lea dx,msg2
        mov ah,09h
        int 21h
        
        mov dl,bl  
        add dl,48
        mov ah,02h
        int 21h
        
        lea dx,msg1
        mov ah,09h
        int 21h
        
        mov dl,al  
        add dl,48
        mov ah,02h
        int 21h
        
        jmp exit
        
     error:
     lea dx,msg3
     mov ah,09h
     int 21h
     
     exit:
        
     mov ah,4ch
     int 21h
     main endp
end main
