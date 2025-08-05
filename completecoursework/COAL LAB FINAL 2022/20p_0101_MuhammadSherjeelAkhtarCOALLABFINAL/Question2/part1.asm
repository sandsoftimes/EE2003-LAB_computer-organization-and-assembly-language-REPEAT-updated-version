[org 0x0100]

jmp start

data : dw 3

odd : dw 0

even : dw 0

message:     db   'Ys Even Number And Not Prime'

message2:     db  'Ys Odd Number And Prime Also' 

length : dw   31

primecheck : dw 0


clrscr:     
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 0

    nextloc:
        mov  word [es:di], 0x0720
        add  di, 2
        cmp  di, 4000
        jne  nextloc

    pop  di 
    pop  ax
    pop  es
    ret

 
odd_even :
    push bp 
    mov  bp, sp          
    push ax   
    push bx 
    

    mov ax ,[bp+4]
    mov bx,ax
    shr ax,1

    jc isodd

    mov word[even],bx

    jmp terminate 

        
isodd :
    mov word[odd],bx

terminate :
    pop bx
    pop ax
    mov sp,bp
    pop bp

    ret 2 


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
        mov dh, 0x20     
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

printstr:
    push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 

    mov ax, 0xb800 
    mov es, ax 
    mov di, 4              


    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, 0x70 

    nextchar: 
        mov al, [si]
        mov [es:di], ax 
        add di, 2 
        add si, 1 
        
        ; dec cx 
        ; jnz nextchar     

        ; alternatively 
        loop nextchar 


    pop di 
    pop si 
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 4 


prime:
    push bp 
    mov  bp, sp          
    push ax   
    push bx
    push cx

    mov ax,[bp+4]
    mov cx,ax

    mov bx,2

    div bx 

    cmp dl,0
    jne itsnotprime

     mov word[primecheck],1

    jmp terminate

itsnotprime :
     mov word[primecheck],0

     pop cx 
     pop bx
     pop ax
     mov sp,bp
     pop bp 

     ret 2


start :
 

    mov ax , [data]
    push ax 

    call odd_even

    call clrscr
    mov ax, [data]
    push ax 
    call printnum

    

    cmp word[odd],0
    jne printmessage2

    mov ax, message
    push ax 
    push word [length]
    call printstr 

    jmp end

printmessage2:

    mov ax, message2 
    push ax 
    push word [length]
    call printstr 

end:
     mov  ah, 0x1        
    int 0x21 




    mov ax, 0x4c00
    int 0x21