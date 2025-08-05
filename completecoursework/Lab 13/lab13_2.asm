org 100h

jmp start

data : db 'I love Pakistan '
msg1end:

clr:

mov ah ,06h
xor al,al
xor cx,cx
;mov dx ,192Ah  ;dh = row , dl = col
mov dh , 25
mov dl , 40
mov bh ,07h
int 10h

ret

sideborder:
mov ah ,06h
xor al, al
xor cx,cx
mov dh ,25
mov dl ,01
mov bh,05fh
int 10h

ret


sideborder2:
mov ah ,06h
xor al, al
xor cx,cx
mov ch ,0
 mov cl ,78
mov dh ,24
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
mov ch ,24
mov cl ,0
mov dh ,25
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



printstr:
mov cx, msg1end - data
mov al ,1
mov bh , 0
 mov bl,07
mov dh,11
mov dl,32
push cs
pop es
mov bp ,data
mov ah ,13h
int 10h

ret

printchr2:

mov cx, 1
mov bx ,0007h
mov ah ,09h
mov al ,65
int 10h

ret
printchr3:

mov cx, 1
mov bx ,0007h
mov ah ,09h
mov al ,72
int 10h

ret

printchr4:

mov cx, 1
mov bx ,0007h
mov ah ,09h
mov al ,65
int 10h

ret

printchr5:

mov cx, 1
mov bx ,0007h
mov ah ,09h
mov al ,68
int 10h

ret


start:
call clr
call sideborder
call sideborder2
call sideborder3
call sideborder4
call sideborder5
call printstr
mov ah ,0x1
int 21h

mov ax ,0x4c00
int 21h

	
	
