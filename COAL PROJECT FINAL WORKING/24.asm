org 100h

jmp start

amount: dw 0

count: db  0

 num:db 0                       
trk: dw 0
bke: dw 0
c: db 0
b: db 0
cyc: db 0 

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

msgg1 db 10,' Key Entered : $'






 

msg1 db ' Parking Is Full $'
msg2 db ' Sorry but You have Entered a Wrong Input $'


msg7 db 10,' the total amount is = $'
msg8 db 10,' the total numbers of vehicles parked = $'
msg9 db 10,' the total number of Motor Bike parked = $'
msg10 db 10,' the total number of cars parked = $'
msg11 db 10,' the total number of buses parked = $'
msg12 db 10,' Record deleted successfully ***** $'
msg13 db 10,' the total number of Cycle parked = $' 
msg14 db 10,' the total number of Truck parked = $'
msg15 db 10,' Bike is Successfully  removed from you parking  $'
msg16 db 10,' Car is Successfully  removed from you parking $'
msg17 db 10, ' Bus is Successfully  removed from you parking $ ' 
msg18 db 10,' Cycle is Successfully  removed from you parking $'
msg19 db 10,' Truck is Successfully  removed from you parking $'
msg20 db 10,' Bike Charges are: $'
msg21 db 10,' Car Charges are: $'  
msg22 db 10, ' Bus Charges are: $'
msg23 db 10, ' Cycle Charges are: $'
msg24 db 10, ' Truck Charges are: $'
msg25 db 10, ' You Have Exited the Program $'


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


set:
mov al ,03h
mov ah, 00h
int 10h

ret

setcursor:

mov dh ,24
mov dl ,0
mov bh, 0
mov ah ,02h
int 10h

ret

endd:
mov dx,10
mov ah,2
int 21h
mov dx,msgg1
mov ah,9
int 21h
mov dl,'Q'
mov ah,2
int 21h
mov dx,msg25
mov ah,9
int 21h
mov ax ,0x4c00
int 21h

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

call setcursor

inputt:

mov ah,8h
int 21h


 ;now compare
mov bl,al 
mov ah,0

cmp bx,'1'
je bike                  
cmp bx,'2'
je car
cmp bx,'3'
je bus  
cmp bx,'4'
je cycle11
cmp bx,'5'
je truck
cmp bx,'6'
je rec  
cmp bx,'7'
je delB 
cmp bx,'8'
je delC
cmp bx,'9'
je delBs 
cmp bx,'a'
je delCy
cmp bx,'b'
je delTr
cmp bx,'c'
je del
cmp bx,'q'
je endd

mov dx,msg2
mov ah,9
int 21h

jmp main_menu 


delB:                                                       
call delbike  



delC:                                                       
call delcar    


delBs:                                                       
call delbus  


delCy:                                                       
call delCycle 


delTr:                                                       
call delTruck 


bike:
call bikeMo   


truck:
call trrk


car:
call caar
  
cycle11:
call cyycle                               


rec:
call recrd


del:
call delt


bus:
call buss

delCycle :
mov cl,[cyc]
cmp cl,0
je hy
dec cl
mov [cyc],cl
xor cx,cx

mov ax,30
sub [amount],ax
mov dl,[count]
dec dl
mov [count],dl
xor ax,ax
xor dx,dx
hy:
mov dx, msgg1                                            
mov ah,9
int 21h
mov dl,'A'
mov ah,2
int 21h
mov dx, msg18                                                
mov ah,9
int 21h

mov dx, 10                                             
mov ah,2
int 21h

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h


jmp inputt 

   
   
   


delTruck:
mov cl,[trk]
cmp cl,0
je hy1
dec cl
mov [trk],cl

mov ax,450
sub [amount],ax
mov dl,[count]
sub dl,4
mov [count],dl
xor ax,ax
xor cx,cx
xor dx,dx
hy1:
mov dx,msgg1                                             
mov ah,9
int 21h
mov dl,'B'
mov ah,2
int 21h
mov dx,msg19                                                
mov ah,9
int 21h

mov dx, 10                                             
mov ah,2
int 21h
      

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h


jmp inputt
  
  
  
  
  
     
delcar:
mov cl,[c]
cmp cl,0
je hy2
dec cl
mov [c],cl
mov ax, 200
sub [amount],ax
mov dl,[count]
sub dl,2
mov [count],dl
xor dx,dx
hy2:
mov dx,msgg1                                   
mov ah,9
int 21h
mov dl,'8'
mov ah,2
int 21h
mov dx,msg16                                   
mov ah,9
int 21h

mov dx, 10                                             
mov ah,2
int 21h

         
xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h         
xor ax,ax
jmp inputt 


    
     
 
delbike :
mov cl,[bke]
cmp cl,0
je hy3
dec cl
mov [bke],cl

mov ax, 60
sub [amount],ax
mov dl,[count]
dec dl
mov [count],dl
hy3:
mov dx,msgg1                                   
mov ah,9
int 21h
mov al,'7'
mov dl,al
mov ah,2
int 21h
mov dx,msg15                                    
mov ah,9
int 21h

mov dx, 10                                             
mov ah,2
int 21h
 

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h

xor ax,ax

jmp inputt 




delbus :
mov cl,[b]
cmp cl,0
je hy4
dec cl
mov [b],cl

mov ax , 350
sub [amount],ax
mov dl,[count]
sub dl,3
mov [count],dl
hy4:
mov dx,msgg1                                  
mov ah,9                                         
int 21h
mov dl,'9'

mov ah,2
int 21h
mov dx,msg17                                    
mov ah,9                                         
int 21h

 mov dx, 10                                             
mov ah,2
int 21h


xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h

xor ax,ax
jmp inputt


     
     

trrk :
mov dl,4
add [count],dl
mov al, 12
cmp [count],al
jle trk1
mov dx, msg1
mov ah,9
int 21h
mov dx,4
sub [count],dx
jmp inputt


trk1:
mov dx,10
	mov ah,2
	int 21h
   
mov dx,msgg1        
mov ah,9
int 21h
mov dl,al
add dl,2Bh     
mov ah,2
int 21h
mov dx,msg24        
mov ah,9
int 21h

mov ax,450
add [amount], ax
mov dx,0 ; remainder is 0
mov bx,10                                             
mov cx,0
lopp11:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
        jne lopp11
   
lopp33:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop lopp33
mov dx,10
	mov ah,2
	int 21h

mov cx,1
add [trk],cx

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h                                                  

xor dx,dx
xor cx,cx

jmp inputt 
 
 
 
 
 
 

bikeMo :
mov dl ,1
add [count],dl
mov al, 12
cmp [count],al
jle bike1
mov dx,msg1
mov ah,9
int 21h
mov dx ,1
sub [count],dx
jmp inputt


bike1:

mov dx,msgg1        
mov ah,9
int 21h
mov dl,al
add dl, 25h       
mov ah,2
int 21h
mov dx,msg20        
mov ah,9
int 21h

mov ax,60
add [amount], ax
mov dx,0 ; remainder is 0
mov bx,10 
mov cx,0
l2:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
        jne l2
   
l3:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l3
mov dx,10
	mov ah,2
	int 21h



mov cx,1
add [bke],cx
;inc cx

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h                                                   

xor dx,dx
xor cx,cx

jmp inputt



caar :
 mov dl,2
add [count],dl
mov al, 12
cmp [count],al
jle car1
mov dx, msg1
mov ah,9
int 21h
 mov dx,2
sub [count],dx
jmp inputt


car1:

mov dx,msgg1        
mov ah,9
int 21h 
mov dl,al
add dl, 26h       
mov ah,2
int 21h
mov dx,msg21        
mov ah,9
int 21h

mov ax,200
add [amount], ax
mov dx,0
mov bx,10
mov cx,0
l22:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne l22
   
l33:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l33
mov dx,10
	mov ah,2
	int 21h

mov cx,1
add  [c],cx        

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h
xor dx,dx
xor cx,cx

jmp inputt


cyycle :
mov dl,1
add [count],dl
mov al,12
cmp [count],al
jle cyc1
mov dx, msg1                   ;update it
mov ah,9
int 21h
mov dx,1
sub [count],dx
xor ax,ax
jmp inputt


cyc1: 


mov dx, msgg1        
mov ah,9
int 21h 
mov dl,al
add dl, 28h       
mov ah,2
int 21h 
mov dx, msg23        
mov ah,9
int 21h

mov ax,30
add [amount], ax
mov dx,0
mov bx,10
mov cx,0
lopp2:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne lopp2
   
lopp3:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop lopp3
mov dx,10
	mov ah,2
	int 21h

mov cx,1
add [cyc],cx
      

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h
xor dx,dx
xor cx,cx
jmp inputt





buss :
mov dl,3
add [count],dl
mov al, 12
cmp [count],al
jle bus1
mov dx, msg1
mov ah,9
int 21h
mov dx,3
sub [count],dx
xor ax,ax
jmp inputt


bus1:


mov dx,msgg1        
mov ah,9
int 21h 
mov dl,al
add dl, 27h       
mov ah,2
int 21h
mov dx,msg22        
mov ah,9
int 21h

mov ax,350
add [amount], ax
mov dx,0
mov bx,10
mov cx,0
lop2:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne lop2
   
lop3:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop lop3
mov dx,10
	mov ah,2
	int 21h

mov cx,1
add [b],cx

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h

xor dx,dx
xor cx,cx

jmp inputt

divide:
AAM

ret

recrd:
mov dx,msgg1
mov ah,9
int 21h

mov dl,'6'
mov ah,2
int 21h

mov dx,msg7
mov ah,9
int 21h



mov ax, [amount]

mov dx,0
mov bx,10
mov cx,0
totalpush:
        div bx
        push dx
        mov dx,0
     
        inc cx
        cmp ax,0
       jne totalpush
   
totalprint:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop totalprint

mov dx,msg8
mov ah,9
int 21h

mov al,[count]
call divide
xor dx,dx
mov [num],al
mov dl,ah
add dl,48
mov ah,2
int 21h
xor dx,dx
mov al,[num]
mov dl,al
add dl,48
mov ah,2
int 21h


mov dx, msg9
mov ah,9
int 21h

mov dx,[bke]
add dx,0x30
mov ah,2
int 21h




mov dx, msg10
mov ah,9
int 21h


mov dl,[c]
add dx,0x30
mov ah,2
int 21h



mov dx, msg11
mov ah,9
int 21h

mov dl,[b]
add dx,0x30
mov ah,2
int 21h

 

mov dx, msg13
mov ah,9
int 21h

mov dl,[cyc]
add dx,0x30
mov ah,2
int 21h


mov dx,msg14
mov ah,9
int 21h

mov dx,[trk]
add dx,0x30
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h
        
jmp inputt





delt:
xor bx,bx
mov [bke],bx
mov [c],bx
mov [b],bx
mov [trk],bx
mov [cyc],bx
mov [amount],bx
mov ax,0
sub [amount],ax
mov [count],bx
mov dx,msgg1
mov ah,9
int 21h
mov dx,'C'
mov ah,2
int 21h
mov dx,msg12
mov ah,9
int 21h

mov dx, 10                                             
mov ah,2
int 21h


xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h





jmp inputt



ret


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