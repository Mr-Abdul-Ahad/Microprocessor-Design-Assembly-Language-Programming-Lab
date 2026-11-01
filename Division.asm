;ah string print korte chai taile =9h, ah =1h(userinput) ,ah =2h(output)
;ah =4ch (exit) 


;TAsks
;home works (1, user input)
;multiplicand =4
;multiplier =2
;product =8   

;home works (2,m user input)
;dividend=9 | 9
;divisor =5 |0
;quotient =1 |Undefined
;remainder =4


.model small
.stack 100h
.data  
dividend db "Enter Dividend : $"
divisor db 13,10, "Enter divisor: $"
quotient db 13,10, "This is your quotient: $"
remainder db 13,10, "Your remainder : $"
error db 13,10, "Undefine! $"

.code

main proc
    mov ax, @data
    mov ds , ax
    
    ;case insensitive,indentation  not mind 
    ;asciii, pattern joid na bujhai taile mind korbe   
    
    
    
    ;str print, load effective address
    lea dx,dividend ;str load
    mov ah,9h ;str print
    int 21h ;interrupt/ pause  
    
    ;dividend user input
    mov ah, 1 ;user input eita fixed 
    int 21h ;interrupt
    ;user input nile by default al register e jay  
    ;ascii promotion hole add ar demotion hole sub 
    sub al,30h ;decimal convert
    mov bl,al ;bl= dividend    free korte hole mov use korbo
    
    ;str print, load effective address
    lea dx,divisor ;str load
    mov ah,9h ;str print
    int 21h ;interrupt/ pause   
    
    ;divisor user input
    mov ah, 1 ;user input eita fixed 
    int 21h ;interrupt
    ;user input nile by default al register e jay  
    ;ascii promotion hole add ar demotion hole sub 
    sub al,48 ;decimal convert
    mov bh,al ;bh=divisor
    
    ;corner case
    cmp bh,0 ;divisor ki 0 hobe naki eita check korbo  bh manei divisor 
    je undefine ;jump if equal 
    
    
    ;quotient er msg print 
    lea dx,quotient ;str load
    mov ah,9h ;str print
    int 21h ;interrupt/ pause     
    
    ;else 
    mov al ,bl ;result store korar jnno /quotient store  
    xor ah, ah ; ah = remainder = memory clear
    div bh;divisor  
    mov dl ,al ;al = quotient 
    add dl,'0' ;asciii convert
    mov ah, 2h ;char print 
    int 21h
    jmp exit 
    
    
    undefine: ;segment
    lea dx,error ;str load
    mov ah,9h ;str print
    int 21h ;interrupt/ pause  
    
    
    exit:
    mov ah, 4ch  ;ah =4c
    int 21h
    
    main endp
end main
