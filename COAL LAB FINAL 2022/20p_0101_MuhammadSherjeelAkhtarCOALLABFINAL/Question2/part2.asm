[org 0x0100]

jmp start

num: dw 3,4,5,19,7,8,17
smallest: dw 0


printnum: 
    push bp 
    mov  bp, sp
    push es 
    push ax 
    push bx 
    push cx 
    push dx 
    push di 

  

    mov ax, [bp+4]   
    mov bx, 10       
    mov cx, 0       

    nextdigit: 
        mov dx, 0   
        div bx       
        add dl, 0x30 
        push dx      
        inc cx       
        cmp ax, 0    
        jnz nextdigit 

  

    mov ax, 0xb800 
    mov es, ax 

    mov di, 0 
    nextpos: 
        pop dx          
        mov dh, 0x04    
        mov [es:di], dx 
        add di, 2 
        loop nextpos    
       

    pop di 
    pop dx 
    pop cx 
    pop bx 
    pop ax 
    pop es
    pop bp 
    ret 2 


start:
    mov cx,8
    mov bx,0
    mov si,[num]
    mov [smallest],si
    interloop1:
        mov ax,[num+bx]
        cmp ax,[smallest]
        ja skip
            mov [smallest],ax 
            skip:
                add bx,2 
                dec cx
                jnz interloop1

mov ax,[smallest]
push ax 
call printnum
mov ax,0x4c00 
int 0x21 