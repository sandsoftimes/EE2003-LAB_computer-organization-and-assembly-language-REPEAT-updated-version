[org 0x0100]

jmp start

message:     db   'p200101'  
length:      dw   7

setcursor:
    mov  ax, 0003h    
    int  10h

    mov  dx, 0C23h    
    mov  bh, 0        
    mov  ah, 02h      
    int  10h

    mov  cx, 10      
    mov  bx, 002Fh    
    mov  ax, 0941h    
    int  10h

       
    int  16h         
    ret

clrscr:     
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 0

    nextloc:
        mov  word [es:di], 0x720
        add  di, 2
        cmp  di, 1920
        jne  nextloc

    pop  di 
    pop  ax
    pop  es
    ret

clrscr2:     
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax	
    mov  di, 1920

    nextloc2:
        mov  word [es:di], 0xD020
        add  di, 2
        cmp  di, 4000
        jne  nextloc2

    pop  di 
    pop  ax
    pop  es
    ret

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
    mov di, 1990           


    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, 0x07

    nextchar: 
        mov al, [si]
        mov [es:di], ax 
        add di, 2 
        add si, 1 
        
        loop nextchar 


    pop di 
    pop si 
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 4 
printnum: 
    

  push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 320

    next1:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 322
        jne  next1

    pop  di 
    pop  ax
    pop  es
    ret

printnum2: 
    

  push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 480

    next2:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 484
        jne  next2

    pop  di 
    pop  ax
    pop  es
    ret
printnum3: 
    

  push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 640

    nextloc3:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 646
        jne  nextloc3

    pop  di 
    pop  ax
    pop  es
    ret
printnum4: 
    

  push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 800

    nextloc4:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 808
        jne  nextloc4

    pop  di 
    pop  ax
    pop  es
    ret
printnum5: 
    

  push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 960

    nextloc5:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 970
        jne  nextloc5

    pop  di 
    pop  ax
    pop  es
    ret

printnum6: 
    

  push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 1120

    nextloc6:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 1128
        jne  nextloc6

    pop  di 
    pop  ax
    pop  es
    ret
printnum7: 
    

  push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 1280

    nextloc7:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 1286
        jne  nextloc7

    pop  di 
    pop  ax
    pop  es
    ret

printnum8: 
    

  push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 1440

    nextloc8:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 1444
        jne  nextloc8

    pop  di 
    pop  ax
    pop  es
    ret
printnum9: 
    

  push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 1600

    nextloc9:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 1602
        jne  nextloc9

    pop  di 
    pop  ax
    pop  es
    ret

start: 

 call setcursor
    call clrscr 
	call clrscr2
    mov ax, message 
    push ax 
    push word [length]
    call printstr 
	
call printnum
    call printnum2
call printnum3
call printnum4
call printnum5
call printnum6
call printnum7
call printnum8
call printnum9

    ; wait for keypress 
    mov ah, 0x1        ; input char is 0x1 in ah 
    int 0x21 

    mov ax, 0x4c00 
    int 0x21