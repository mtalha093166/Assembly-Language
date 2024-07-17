.model small
.stack 100h 
.data    
      fname db  'File.txt',0
      fhandle dw ?
      msg db 'Enter data:$'
      msg1 db 0dh,0ah,'str:$'  
      buffer db 100 dup('$') 
      str db 50 dup('$')
.code
main proc
         mov ax,@data
         mov ds,ax
            
         ;New file create
          ;  mov ah,3ch 
           ; lea dx,fname
           ; mov cl,0
           ; int 21h
           ; jc error
           
           ;open a file 
            mov ah,3dh
            mov al,2
            lea dx,fname
            int 21h
            jc error
            
            mov fhandle,ax
             
             lea dx,msg
             mov ah,09h
             int 21h
              
             mov si,0
             mov cx,0
             
             again:
             mov ah,01h
             int 21h
             
             cmp al,13
             
             je exit
             
             mov buffer[si],al
             inc si
             inc cx
             
             jmp again
             
             exit:
              
            ;write text
             
             mov ah,40h
             mov bx,fhandle
             lea dx,buffer
             int 21h 
             jc error
             
             ;read test
             
             mov ah,3fh
             lea dx,str
             mov bx,fhandle
             mov cx,100
             int 21h
             jc error
             
             lea dx,msg1
             mov ah,09h
             int 21h
             
             lea dx,str
             mov ah,09h
             int 21h
             error:
             
             mov ah,3eh    ;close
             mov bx,fhandle
             int 21h
             
        mov ah,4ch
        int 21h
         main endp
end main