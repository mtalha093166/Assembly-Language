.model small
.stack 100h
.data
   msg1 db 'enter Characters:$'
   msg2 db 0dh,0ah,'Total vowels:$'
   msg3 db 0dh,0ah,'Total Constant:$'   
   msg4 db 0dh,0ah,'Invalid:$'  
   count_vowel db 0
   count_const db 0
.code

main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,09h
    int 21h
    
    mov cx,9
    again:
       mov ah,01h
       int 21h
       cmp cx,0
       je exit
       cmp al,'a'
       jb invalid
       cmp al,'z'
       ja invalid
       cmp al,'a'
       je inc_vowel
       cmp al,'e'
       je inc_vowel
       cmp al,'i'
       je inc_vowel
       cmp al,'o'
       je inc_vowel
       cmp al,'u'
       je inc_vowel
       inc count_const 
       dec cx
       jmp again
       jmp exit
       
       inc_vowel:
       inc count_vowel
       dec cx
       jmp again 
    
    exit:
       lea dx,msg2
       mov ah,09h
       int 21h
        
       mov dl,count_vowel
       add dl,48 
       mov ah,02h
       int 21h
       
       lea dx,msg3
       mov ah,09h
       int 21h
        
       mov dl,count_const 
       add dl,48
       mov ah,02h
       int 21h     
       
       
       mov ah,4ch
       int 21h
       
       invalid:
       
       lea dx,msg4
       mov ah,09h
       int 21h
       mov ah,4ch
       int 21h
       
   main endp

end main
       