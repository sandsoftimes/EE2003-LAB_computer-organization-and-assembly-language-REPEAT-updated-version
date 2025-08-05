[org 0x0100]
jmp start
data: dw 8,7
swapflag: db 0
swap:
    push ax ;
    mov ax, [bx+si]
    xchg ax, [bx+si+2]
    mov [bx+si],ax
    pop ax
    ret
bubblesort:
    ;handle stack issue for parameters-----------------------
    push bp
    mov bp,sp 
    push ax 
    push bx 
    push cx 
    push si 
    mov bx, [bp+6] ;address of data to sort 
    mov cx, [bp+4] ;no of elements to sort
    dec cx 
    shl cx, 1 
    mainloop:
        mov si, 0   ;use as array index 
        mov byte[swapflag], 0   ;reset swap flag for 
        innerloop:
            mov ax,[bx+si] 
            cmp ax,[bx+si+2] 
            jbe noswap 
                call swap ;another call here 
                mov byte[swapflag], 1
                noswap:
                add si,2 