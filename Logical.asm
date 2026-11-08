;Logical task (and , or ,xor)
;101b
;111b
;AND Result : 101b = '5'
;OR Result  : 111b = '7' bitwise operation 1 or 1 =1 
;XOR Result : 010b = 2 ='2'  

.model small
.stack 100h
.data  

andmsg db "AND Result: $"
ormsg db 13,10, "OR Result: $"
xormsg db 13,10, "XOR Result: $"

.code

main proc
    mov ax, @data
    mov ds, ax  
    ;and er msg print korlaam vaya
    lea dx, andmsg
    mov ah,9h ;string print 
    int 21h
    
    ;and er operation chalabo
    mov bl, 101b    ;bl =101b
    and bl, 111b    ;bl =101b and 111b =5
    mov dl,bl       ;dl =5
    add dl, 30h  ;ascii covert '5'
    mov ah, 2h  ;character print er command
    int 21h ;interrupt
    ;character layer input 0-9 ,output:0-9  
    
    ;or msg print 
    lea dx, ormsg
    mov ah,9h ;string print 
    int 21h 
    
    ;or er operation chalabo vaya
    mov bl, 101b    ;bl =101b
    or bl, 111b    ;bl =101b or 111b =111b =7
    mov dl, bl       ;dl =7
    add dl, 48  ;ascii covert '7'
    mov ah, 2h  ;character print er command
    int 21h ;interrupt
    
    ;xor msg print
    lea dx, xormsg
    mov ah,9h ;string print 
    int 21h
    
    ;xor er opreation chalabo vaya
    mov bl, 101b    ;bl =101b
    xor bl, 111b    ;bl =101b xor 111b =010b =2
    mov dl, bl       ;dl =2
    add dl, '0'  ;ascii covert '2'
    mov ah, 2h  ;character print er command
    int 21h ;interrupt
    
    exit :
    mov ah, 4ch
    int 21h
    
    main endp
end main
