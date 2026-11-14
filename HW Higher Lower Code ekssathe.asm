.model small
.stack 100h
.data

higher db 13,10,"Enter Higher Case : $"
lower db 13,10,"This is your Lower Case : $"

loweri db 13,10,13,10,"Enter Lower Case : $"
higheri db 13,10,"This is your Higher Case : $"

.code
main proc
    mov ax,@data
    mov ds,ax

    ;higher string print
    lea dx,higher
    mov ah,9h
    int 21h
    ;higher ooperation 
    mov ah,1h ;;;;user input nilam 
    int 21h

    mov bl,al

    ; lower case er lekha print 
    lea dx,lower
    mov ah,9h
    int 21h
    ;lower er operatioon 
    add bl,32
    mov dl,bl
    mov ah,2h
    int 21h


    ; Lowercase er lekha ssstring pprint
    lea dx,loweri
    mov ah,9h
    int 21h
    ;;lower er operation ar usser input neewa 
    mov ah,1h
    int 21h

    mov bl,al

    ;higher er lekha print
    lea dx,higheri
    mov ah,9h
    int 21h

    sub bl,32
    mov dl,bl
    mov ah,2h
    int 21h

    jmp exit
    
    exit :
    mov ah,4ch
    int 21h

main endp
end main