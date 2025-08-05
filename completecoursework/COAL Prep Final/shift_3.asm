[org 0x0100]

jmp start

multiplicand: db 13 
multiplier: db 5

result: db 0

start:
    mov cl, 4 
    mov bl,[multiplier]
    mov dl,[multiplicand]

    checkbit:
        shr bl,1 
        jnc skip

        add [result], dl
    
        skip:
            shl dl,1 
            dec cl 
            jnz checkbit

mov ax,0x4c00 
int 0x21 