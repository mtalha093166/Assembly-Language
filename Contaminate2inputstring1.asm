
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small 
.stack 100h
.data
    str db 50 dup ('$')
    str1 db 50 dup('$') 
    str2 db 100 dup('$')  
    msg db 'Enter 1st string:$' 
    src1 db 0dh,0ah,'1st string:$'
    src2 db 0dh,0ah,'2nd string:$'
    msg1 db 0dh,0ah,'Enter 2nd string:$' 
    msg2 db 0dh,0ah,'Contaminated string:$' 
    
.code

main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
        
    lea dx,msg
    mov ah,09h
    int 21h   
    
    mov si,0
    mov di,0
    lab1:
    
    mov ah,01h
    int 21h
    cmp al,13
    je again
    mov str[si],al
    mov str2[di],al
    inc si
    inc di
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
    mov str2[di],al
    inc si        
    inc di
    jmp lab2    
    
    again10:
    lea dx,src1
    mov ah,09h
    int 21h   
    
    lea dx,str
    mov ah,09h
    int 21h    
    
    lea dx,src2
    mov ah,09h
    int 21h   
    
    lea dx,str1
    mov ah,09h
    int 21h  
    
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


ret




