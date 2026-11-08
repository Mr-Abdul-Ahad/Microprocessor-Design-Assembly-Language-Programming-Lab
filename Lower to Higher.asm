; Enter Lower Case : r
; This is your Higher Case : R

.model small
.stack 100h
.data

lower db 13,10, "Enter Lower Case : $"
higher db 13,10, "This is your Higher Case : $"

.code

main proc
    mov ax, @data
    mov ds, ax

    ; lower string print
    lea dx, lower
    mov ah, 9h
    int 21h

    ; LOwer user input nibo
    mov ah, 1h
    int 21h 
    ;al

    ; input AL register e ashbe
    mov bl, al

    ; higher case er lekha print
    lea dx, higher
    mov ah, 9h
    int 21h

    ; lower case theke higher case nibo tai subs
    sub bl, 32

    ; character print
    mov dl, bl
    mov ah, 2h
    int 21h

    ; program exit  korbo
    jmp exit

exit :
    mov ah, 4ch
    int 21h

main endp
end main