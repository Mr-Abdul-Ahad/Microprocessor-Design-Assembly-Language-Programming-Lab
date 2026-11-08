;Enter Higher Case :R
;This is your lower case : r

.model small
.stack 100h 
.data  

higher db 13,10, "Enter Higher Case : $"
lower db 13,10, "This is your Lower Case : $"

.code

main proc
    mov ax, @data
    mov ds,  ax
    
    ;higher string print 
    lea dx, higher
    mov ah,9h
    int 21h  
    
    ;higher user input nibo vaya
    mov ah, 1h ;user input
    int 21h ;interrupt
    ;al register e jay user input nile
    ;base change hocche jehetu ascii value tai al theke bl 
    mov bl, al
    mov ah, 2h  ;decimal e nei nai asciii te rakhsi tai mov ah,2 input er ascciii
    
    ;lower case er lekha print 
    lea dx, lower
    mov ah,9h
    int 21h
      
    ;lower case e convert korbo
    add bl, 32 ;bl =r boro theke choto hoise
    mov dl, bl ;dl =r
    mov ah,2h ;character print korar jnno  output er ascii
    int 21h
    
    ;code e exit dekhaite chaile 
    jmp exit    
    
    
    
    exit :
    mov ah,4ch
    int 21h
    
    main endp
end main
