.model small
.stack 100h
.data

andmsg db "AND Result: $"
ormsg db 13,10,"OR Result: $"
xormsg db 13,10, "XOR Result: $"
notmsg db 13,10,"NOT Result: $"

.code

main proc
    mov ax,@data
    mov ds,ax
    ;And msg print koorbo vaya
    lea dx,andmsg
    mov ah,9h
    int 21h
    
    ;and operationn chalaboo 
    mov bl,101b
    and bl,111b
    mov dl,bl
    add dl,30h
    mov ah,2h
    int 21h
     
    ;or er string print vaya
    lea dx,ormsg
    mov ah,9h
    int 21h
    ;or operation er kaj 
    mov bl,101b
    or bl,111b
    mov dl,bl
    add dl,30h
    mov ah,2h
    int 21h
    
    ;xormsg print vaya
    lea dx,xormsg
    mov ah,9h
    int 21h
    ;;xoor operatioon ta 
    mov bl,101b
    xor bl,111b 
    mov dl,bl
    add dl,30h
    mov ah,2h
    int 21h   
    ;not string priint 
    lea dx,notmsg
    mov ah,9h
    int 21h
    
    ;not er operation
    mov bl,0b
    mov dl,bl
    add dl,30h
    mov ah,2h
    int 21h 
    
    
    
    exit :
    mov ah,4ch
    int 21h
    main endp
end main
