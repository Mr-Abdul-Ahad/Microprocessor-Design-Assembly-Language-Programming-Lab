#Task 1

.model small
.stack 100h
.data

msg1 db "Enter Dividend: $"
msg2 db 13,10,"Enter Divisor: $"
msg3 db 13,10,"Your Quotient is: $"
msg4 db 13,10,"Your Remainder is: $"
msg5 db 13,10,"Undefined! $"

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Take dividend input
    lea dx, msg1
    mov ah, 9h
    int 21h

    mov ah, 1h
    int 21h
    sub al, '0'
    mov bl, al

    ; Take divisor input
    lea dx, msg2
    mov ah, 9h
    int 21h

    mov ah, 1h
    int 21h
    sub al, '0'
    mov bh, al

    ; Check divisor is zero or not
    cmp bh, 0
    je undefined

    ; Perform division
    mov al, bl
    mov ah, 0
    div bh

    ; Save quotient and remainder
    mov cl, al
    mov ch, ah

    ; Print quotient
    lea dx, msg3
    mov ah, 9h
    int 21h

    mov dl, cl
    add dl, '0'
    mov ah, 2h
    int 21h

    ; Print remainder
    lea dx, msg4
    mov ah, 9h
    int 21h

    mov dl, ch
    add dl, '0'
    mov ah, 2h
    int 21h

    jmp exit

undefined:
    lea dx, msg5
    mov ah, 9h
    int 21h

exit:
    mov ah, 4ch
    int 21h

main endp
end main