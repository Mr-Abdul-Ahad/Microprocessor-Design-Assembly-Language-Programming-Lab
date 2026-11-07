#Task 2

.model small
.stack 100h
.data
msg1 db "Enter Multiplicand: $"
msg2 db 13,10,"Enter Multiplier: $"
msg3 db 13,10,"Your Product is: $"

.code
main proc
    mov ax, @data
    mov ds, ax

    ; First number input
    lea dx, msg1
    mov ah, 9h
    int 21h

    mov ah, 1h
    int 21h
    sub al, '0'
    mov bl, al

    ; Second number input
    lea dx, msg2
    mov ah, 9h
    int 21h

    mov ah, 1h
    int 21h
    sub al, '0'
    mov bh, al

    ; Multiplication
    mov al, bl
    mul bh

    ; Display result
    mov bl, al

    lea dx, msg3
    mov ah, 9h
    int 21h

    mov dl, bl
    add dl, '0'
    mov ah, 2h
    int 21h

    ; Program termination
    mov ah, 4ch
    int 21h

main endp
end main
