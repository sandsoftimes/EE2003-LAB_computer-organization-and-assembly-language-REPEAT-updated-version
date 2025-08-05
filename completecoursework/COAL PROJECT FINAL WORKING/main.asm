org 100h

jmp start



dataa : db 'Parking Management System '
msggend:


data : db 'Enter 1 if Motor Bike Parks'
msg1end:

data2 : db 'Enter 2 if Car Parks'
msg2end:

data3 : db 'Enter 3 if Bus Parks'
msg3end:

data4 : db 'Enter 4 if Cycle Parks'
msg4end:

data5 : db 'Enter 5 if Truck Parks'
msg5end:

data6 : db 'Enter 6 to Check all Your Previous records'
msg6end:

data7 : db 'Enter 7 to remove Bike from your Parking'
msg7end:
data8 : db 'Enter 8 to remove Car from your Parking '
msg8end:
data9 : db 'Enter 9 to remove Bus from your Parking '
msg9end:
data10 : db 'Enter A to remove Cycle from your Parking'
msg10end:
data11 : db 'Enter B to remove Truck from your Parking'
msg11end:
data12 : db 'Enter C to remove everything from your Parking'
msg12end:
data13 : db 'Press Q to exit'
msg13end:
data14 : db 'Note:In your Parking area maximum of 12 Vehicals will be parked at a time'
msg14end:





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


main_menu:

call printstring
call printstr
call printstr2
call printstr3
call printstr4
call printstr5
call printstr6
call printstr7
call printstr8
call printstr9
call printstr10
call printstr11
call printstr12
call printstr13
call printstr14




printstring:

xor cx,cx
mov cx, msggend - dataa
mov al ,1
mov bh , 0
 mov bl,0x5f
mov dh,0
mov dl,26
push cs
pop es
mov bp ,dataa
mov ah ,13h
int 10h

ret

printstr:
mov cx, msg1end - data
mov al ,1
mov bh , 0
 mov bl,07
mov dh,4
mov dl,0
push cs
pop es
mov bp ,data
mov ah ,13h
int 10h

ret

printstr2:
xor cx,cx
mov cx, msg2end - data2
mov al ,1
mov bh , 0
 mov bl,07
mov dh,5
mov dl,0
push cs
pop es
mov bp ,data2
mov ah ,13h
int 10h

ret

printstr3:
xor cx,cx
mov cx, msg3end - data3
mov al ,1
mov bh , 0
 mov bl,07
mov dh,6
mov dl,0
push cs
pop es
mov bp ,data3
mov ah ,13h
int 10h

ret

printstr4:
xor cx,cx
mov cx, msg4end - data4
mov al ,1
mov bh , 0
 mov bl,07
mov dh,7
mov dl,0
push cs
pop es
mov bp ,data4
mov ah ,13h
int 10h
ret

printstr5:
xor cx,cx
mov cx, msg5end - data5
mov al ,1
mov bh , 0
 mov bl,07
mov dh,8
mov dl,0
push cs
pop es
mov bp ,data5
mov ah ,13h
int 10h
ret

printstr6:
xor cx,cx
mov cx, msg6end - data6
mov al ,1
mov bh , 0
 mov bl,07
mov dh,9
mov dl,0
push cs
pop es
mov bp ,data6
mov ah ,13h
int 10h
ret

printstr7:

xor cx,cx
mov cx, msg7end - data7
mov al ,1
mov bh , 0
 mov bl,07
mov dh,10
mov dl,0
push cs
pop es
mov bp ,data7
mov ah ,13h
int 10h

ret

printstr8:

xor cx,cx
mov cx, msg8end - data8
mov al ,1
mov bh , 0
 mov bl,07
mov dh,11
mov dl,0
push cs
pop es
mov bp ,data8
mov ah ,13h
int 10h

ret

printstr9:

xor cx,cx
mov cx, msg9end - data9
mov al ,1
mov bh , 0
 mov bl,07
mov dh,12
mov dl,0
push cs
pop es
mov bp ,data9
mov ah ,13h
int 10h

ret


printstr10:

xor cx,cx
mov cx, msg10end - data10
mov al ,1
mov bh , 0
 mov bl,07
mov dh,13
mov dl,0
push cs
pop es
mov bp ,data10
mov ah ,13h
int 10h

ret


printstr11:

xor cx,cx
mov cx, msg11end - data11
mov al ,1
mov bh , 0
 mov bl,07
mov dh,14
mov dl,0
push cs
pop es
mov bp ,data11
mov ah ,13h
int 10h

ret

printstr12:

xor cx,cx
mov cx, msg12end - data12
mov al ,1
mov bh , 0
 mov bl,07
mov dh,15
mov dl,0
push cs
pop es
mov bp ,data12
mov ah ,13h
int 10h

ret


printstr13:

xor cx,cx
mov cx, msg13end - data13
mov al ,1
mov bh , 0
 mov bl,07
mov dh,16
mov dl,0
push cs
pop es
mov bp ,data13
mov ah ,13h
int 10h

ret

printstr14:

xor cx,cx
mov cx, msg14end - data14
mov al ,1
mov bh , 0
 mov bl,0x5f
mov dh,20
mov dl,2
push cs
pop es
mov bp ,data14
mov ah ,13h
int 10h

ret





start:
call clr

call main_menu



mov ah ,0x1
int 21h
end:
mov ax ,0x4c00
int 21h