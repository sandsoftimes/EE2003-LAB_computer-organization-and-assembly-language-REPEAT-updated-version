org  [0x0100]

jmp start 

clr:
mov ah,06h
xor al,al 
mov ch,0 
mov cl,0 
mov dh,25 
mov dl,40
mov bh,07h
int 10h
ret

start:

call clr 