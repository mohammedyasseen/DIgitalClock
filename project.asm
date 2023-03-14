org 100h
		

.MODEL SMALL

.DATA

.CODE 

setc macro x,y
    
    mov dh, x
	mov dl, y
	mov bh, 0h
	mov ah, 2h
	int 10h
endm    

cls macro 2  
    
	setc 12h,0fh 
	
		mov dx, offset msg8
		mov ah, 9
		int 21h 
		
setc 14h,0eh  
	
mov dx, offset msg6
		mov ah, 9
		int 21h  

setc 16h,0eh 
	
  mov dx, offset msg7
		mov ah, 9
		int 21h 
		endm
    
		
MOV AX,@DATA
mov al, 13h
	mov ah, 0
	int 10h 
	
	
	 
clock:

setc 0ch,10h

 





MOV AH,2CH    

INT 21H

MOV AL,CH    

AAM

MOV BX,AX

MOV DL,BH      

ADD DL,30H     

MOV AH,02H         

INT 21H

MOV DL,BL       

ADD DL,30H      

MOV AH,02H     

INT 21H

 

MOV DL,':'

MOV AH,02H    

INT 21H






MOV AH,2CH    

INT 21H
    
MOV AL,CL

AAM

MOV BX,AX

MOV DL,BH      

ADD DL,30H     

MOV AH,02H     

INT 21H

MOV DL,BL       

ADD DL,30H    

MOV AH,02H     

INT 21H

 

MOV DL,':'   

MOV AH,02H

INT 21H

 





MOV AH,2CH    

INT 21H

MOV AL,DH     

AAM

MOV BX,AX

MOV DL,BH     

ADD DL,30H     

MOV AH,02H    

INT 21H

MOV DL,BL      

ADD DL,30H      

MOV AH,02H     

INT 21H  

setc 10H,06H    
	
	mov dx, offset msg
		mov ah, 9
		int 21h 
		


 

MOV AH, 0x01
INT 0x16
JZ clock     
MOV AH, 0x00
INT 0x16     
CMP AL, "r"
JNE clock 
  



 set:

 



	setc 12H,0fH
	
		mov dx, offset msg1
		mov ah, 9
		int 21h
	 

		
		
setc 0ch,10h
			
mov ah,00H
int 16h 

mov [105h],al
cmp [105h],33H
jnc err
cmp [105h],32H

jnc test1:

cmp [105h],30H 

jc err

mov ah,00
int 16h 

mov [104H],al
cmp [104h],3AH
jnc err 

cmp [104h],30H 

jc err

jmp cont  

test1:
mov ah,00
int 16h
mov [104H],al
cmp [104h],34H
jnc err  
cmp [104h],30H 

jc err

cont:

mov ah,02H
mov dl,[105h]
int 21H   

mov ah,02h
mov dl,[104H]
int 21H
 
mov dl,':'
int 21H  

setc 14h,0eh  
	
mov dx, offset msg2
		mov ah, 9
		int 21h   
		
	setc 0ch,13h 
	
mov ah,00H
int 16h  

mov [103h],al
cmp [103h,36H
jnc err 

cmp [103h],30H 
       
jc err 

mov ah,00
int 16h
 
mov [102h],al
cmp [102h],3AH
jnc err  

cmp [102h],30H 

jc err

mov ah,02H
mov dl,[103h]
int 21H

mov ah,02h
mov dl,[102h]
int 21H
 
mov dl,':'
int 21H 
 
setc 16h,0eh 
	
  mov dx, offset msg3
		mov ah, 9
		int 21h 
		mov dh, 0ch
	mov dl, 16h
	mov bh, 0h
	mov ah, 2h
	int 10h
		
mov ah,00H
int 16h 

mov [101h],al
cmp [101h,36H
jnc err  

cmp [101h],30H 

jc err

mov ah,00
int 16h 

mov [100H],al
 cmp [100h,3AH
jnc err  

cmp [100h],30H 

jc err

mov ah,02H
mov dl,[101h]
int 21H

mov ah,02h
mov dl,[100h]
int 21H      



	setc 12h,0fh 
	
		mov dx, offset msg8
		mov ah, 9
		int 21h 
		
setc 14h,0eh  
	
mov dx, offset msg6
		mov ah, 9
		int 21h  

setc 16h,0eh 
	
  mov dx, offset msg7
		mov ah, 9
		int 21h 

    


sec: 

MOV     CX, 0FH
MOV     DX, 4240H
MOV     AH, 86H
INT     15H 

setc 0ch,17h  
	
 inc [100h]
cmp [100h],3AH

je sec1

mov dl,[100h] 
mov ah, 02h
int 21h

MOV AH, 0x01
INT 0x16
JZ sec     
MOV AH, 0x00
INT 0x16    
CMP AL, "r" 

je set
 


jne sec

sec1:
  
setc 0ch,17h 
		mov ah , 02h
	mov [100h],30h
	mov dl,[100h]
int 21h
  
	    
setc 0ch,16h
	   
	     inc [101h]
cmp [101h],36H 

je min

mov dl,[101h]
mov ah, 02h
int 21h 



jne sec 

min:

setc 0ch,16h  
	
		mov ah , 02h
	mov [101h],30h
	mov dl,[101h]
int 21h      

setc 0ch,14h  
	
	inc [102h]
cmp [102h],3AH 

je min1:

mov dl,[102h]
mov ah, 02h
int 21h

jne sec

min1:

setc 0ch,14h 
		mov ah , 02h
	mov [102h],30h
	mov dl,[102h]
int 21h
  
	    
setc 0ch,13h
	   
	     inc [103h]
cmp [103h],36H 

je hour

mov dl,[103h]
mov ah, 02h
int 21h 



jne sec 

hour:

setc 0ch,13h 
	
		mov ah , 02h
	mov [102h],30h
	mov dl,[102h]
int 21h 

cmp [105H],32H

je there

inc [104h]
cmp [104H],3AH

setc 0ch,11h 

je hour1


mov dl,[104h]
mov ah, 02h
int 21h

jne sec

hour1:
 
setc 0ch,11h 
		mov ah , 02h
	mov [104h],30h
	mov dl,[104h]
int 21h  

setc 0ch,10h
	   
	     inc [105h]  
mov dl,[105h]
mov ah, 02h
int 21h
 

jmp sec 


there: 

setc 0ch,11h 

inc [104h]
cmp [104h],34h 

je reset
 

mov dl,[104h]
mov ah, 02h
int 21h 

jne sec

reset: 

setc 0ch,11h 
		mov ah , 02h
	mov [104h],30h
	mov dl,[104h]
int 21h

setc 0ch,10h 
		mov ah , 02h
	mov [105h],30h
	mov dl,[105h]
int 21h

jmp sec

err:    
cls 2

setc 14h,0eh

  mov dx, offset msg4
		mov ah, 9
		int 21h
		MOV     CX, 0FH
MOV     DX, 4240H
MOV     AH, 86H
INT     15H 
		cls 2
		 jmp set


ret  
msg db "Press 'r' to reset the clock $" 
msg1 db "enter hours $"
msg2 db "enter minutes $" 
msg3 db "enter seconds $"
msg4 db " wrong input! $" 
msg6 db "                             $"
msg7 db "                             $"
msg8 db "                             $" 
