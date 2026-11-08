;Enter Higher Case :R
;This is your lower case : r

.model small
.stack 100h 
.data  

higher db "Enter Higher Case : $"
lower db 13,10, "This is your Lower Case : $"

.code

main proc
    mov ax, @data
    mov ds,  ax
    
    exait:
    mov ah,4ch
    int 21h
    
    main endp
end main