.model small
.stack 100h
.data 
   msg db 'Enter array: $'
   msg1 db 0dh,0ah,'Array in asscending order: $'
   msg2 db 'Array in descending order: $'
   arr db 5 dup(?) 

.code

  main proc
    mov ax,@data
    mov ds,ax
                  
    lea dx,msg
    mov ah,09h
    int 21h
    
    mov cx,5
    mov bx,offset arr                  
    
    input:
    mov ah,01h
    int 21h  
    sub al,48
    mov [bx],al
    inc bx
    loop input
    
    
    mov cx,5
    dec  cx
    
    OuterLoop:
    mov bx,cx
    mov si,0
    compLoop:
    mov al,arr[si]
   mov dl,arr[si+1]
   cmp al,dl
   
    jc Noswap:   
   
    mov arr[si],dl
    mov arr[si+1],al
   
    noswap:
    
    inc si
    dec bx
    
    jnz comploop
    
   loop OuterLoop
    
     
    lea dx,msg1
    mov ah,09h
    int 21h
    
    mov bx,offset arr
    mov cx,5
   
    lab1:
   mov dl,[bx]
   add dl,48
    mov ah,02h
    int 21h
    
    mov dl,32
    mov ah,02h
    int 21h
   
    inc bx
   loop lab1
     
            
   mov ah,4ch
    int 21h
    
 main endp
  end main
