.model small 
.stack 100h
.data        
       fn db 'Myfile.txt',0
       fh dw ?
       msg db 'Entre data:$'
       str db 100 dup('$')
       msg1 db 'string:$'
       des db 50 dup('$')
.code
main proc
         mov ax,@data
         mov ds,ax
         
         ;write
         mov ah,3ch
         lea dx,fn
         mov cl,0
         int 21h
         jc error
         
         mov fh,ax
         
         lea dx,str
         mov ah,09h
         int 21h
         
         mov cx,0
         mov si,0
         again:
         mov ah,01h
         int 21h
         cmp al,13
         je exit
         mov str[si],al
         inc si
         inc cx
         jmp again
         
         exit:
          
          mov ah,40h
          mov bx,fh
          lea dx,fn
          int 21h
          jc error
          
         error:
         
         mov ah,4ch
         int 21h
         
         main endp
end main
         