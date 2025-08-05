org 100h

jmp start

data : db 'Entered  Number Is 1: '
msg1end:



data3 : db '1 Represent Enter '
msg3end:

data4 : db '1'
msg4end:

data6 : db 'Lower Case Is a '
msg6end:

data7 : db 'Lower Case Is b '
msg7end:

data8 : db 'Lower Case Is c '
msg8end:

data9 : db 'Lower Case Is d '
msg9end:
num:dw 0

clr:

mov ah ,06h
xor al,al
xor cx,cx
;mov dx ,192Ah  ;dh = row , dl = col
mov dh , 25
mov dl , 80
mov bh ,07h
int 10h

ret

sideborder:
mov ah ,06h
xor al, al
xor cx,cx
mov dh ,23
mov dl ,01
mov bh,0x05f
int 10h

ret


sideborder2:
mov ah ,06h
xor al, al
xor cx,cx
mov ch ,0
 mov cl ,78
mov dh ,23
mov dl ,79
mov bh,05fh
int 10h

ret


sideborder3:
mov ah ,06h
xor al, al
xor cx,cx

mov dh ,0
mov dl ,80
mov bh,05fh
int 10h

ret



sideborder4:
mov ah ,06h
xor al, al
xor cx,cx
mov ch ,23
mov cl ,0
mov dh ,23
mov dl ,80
mov bh,05fh
int 10h

ret


sideborder5:
mov ah ,06h
xor al, al
xor cx,cx
mov ch ,9
mov cl ,25
mov dh ,13
mov dl ,57
mov bh,0dfh
int 10h

ret

sidebordercentreright:
mov ah ,06h
xor al, al
xor cx,cx
mov ch ,2
mov cl ,53  
mov dh ,10
mov dl ,77
mov bh,07fh
int 10h

ret


sidebordercentremid:
mov ah ,06h
xor al, al
xor cx,cx
mov ch ,8
mov cl ,27
mov dh ,17
mov dl ,52
mov bh,07fh
int 10h

ret

sidebordercentreleft:
mov ah ,06h
xor al, al
xor cx,cx
mov ch ,15
mov cl ,2
mov dh ,24
mov dl ,26
mov bh,07fh
int 10h

ret


set:
mov al ,03h
mov ah, 00h
int 10h

ret

setcursor:

mov dh ,13
mov dl ,35
mov bh, 0
mov ah ,02h
int 10h

ret
setcursor2:

mov dh ,13
mov dl ,36
mov bh, 0
mov ah ,02h
int 10h

ret
setcursor3:

mov dh ,13
mov dl ,37
mov bh, 0
mov ah ,02h
int 10h

ret
setcursor4:

mov dh ,13
mov dl ,38
mov bh, 0
mov ah ,02h
int 10h

ret
setcursor5:

mov dh ,13
mov dl ,39
mov bh, 0
mov ah ,02h
int 10h

ret

setcursorAB:

mov dh ,22
mov dl ,0
mov bh, 0
mov ah ,02h
int 10h

ret

setcursorAB1:

mov dh ,23
mov dl ,2
mov bh, 0
mov ah ,02h
int 10h

ret

setcursorAB2:

mov dh ,0
mov dl ,2
mov bh, 0
mov ah ,02h
int 10h

ret



printstr:
mov cx, msg3end - data3
mov al ,1
mov bh ,0
mov bl,07h
mov dh,0   
mov dl,1
push cs
pop es
mov bp ,data3
mov ah ,13h
int 10h

ret

printstrnew2:
mov cx, msg1end - data
mov al ,1
mov bh ,0
mov bl,07h
mov dh,5   
mov dl,1
push cs
pop es
mov bp ,data
mov ah ,13h
int 10h

ret


printstrhello1:
    mov cx,msg6end-data6
    mov al,1 
    mov bh,0  
    mov bl,07  
    mov dh,2   
    mov dl,13   
    push cs 
    pop es 
    mov bp,data6 
    mov ah,13h  
    int 10h 
ret
printstrhello2:
    mov cx,msg7end-data7
    mov al,1 
    mov bh,0  
    mov bl,07  
    mov dh,6   
    mov dl,13   
    push cs 
    pop es 
    mov bp,data7 
    mov ah,13h  
    int 10h 
ret

printstrhello3:
    mov cx,msg8end-data8
    mov al,1 
    mov bh,0  
    mov bl,07  
    mov dh,7  
    mov dl,13   
    push cs 
    pop es 
    mov bp,data8
    mov ah,13h  
    int 10h 
ret


printstrhello4:
    mov cx,msg9end-data9
    mov al,1 
    mov bh,0  
    mov bl,07  
    mov dh,8   
    mov dl,13   
    push cs 
    pop es 
    mov bp,data9
    mov ah,13h  
    int 10h 
ret

start:
call clr
;call sidebordercentremid
;call sidebordercentreleft
;call sidebordercentreright
call printstrnew2
call printstr
call printstrhello1
call printstrhello2
call printstrhello3
call printstrhello4
;call printstrnew2
mov ax,1
cmp ax,1
mov ah,0x1
int 0x21
je terminate
;call printstrleft
;call printstrright

terminate:
mov ax ,0x4c00
int 21h

	
	