[org 0x0100]

jmp start 

multiplicand: dw 0xc8
multiplier: db 0x32 
result: dw 0 

start: 

mov cl,8 
mov dl,[multiplier]

    checkbit: 
        shr dl,1 
        jnc skip

            mov al,[multiplicand]
            add byte[result],al
            mov al,[multiplicand+1]
            adc byte[result+1],al 

            skip:
                shl byte[multiplicand],1
                rcl byte[multiplicand+1],1 

                dec cl 
                jnz checkbit

;exit syscall 
mov ax,0x4c00 
int 0x21 