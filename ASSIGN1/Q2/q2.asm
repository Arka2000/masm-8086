.model SMALL
.stack 100H

.data 
msg1 db "Enter an Uppercase: $"
msg2 db 10d, 13d, "The Lowercase is: $"

.code 

main proc
mov ax, @DATA 
mov ds, ax 

mov ah, 09h ; print preinput message
lea dx, msg1
int 21h

mov ah, 01h 
int 21h ; take intput


mov ah, 09h ; print preoutput message
lea dx, msg2
int 21h

mov dl, al ; add 32 to ascii conversion
add dl, 32

mov ah, 02h ; print lowercase
int 21h

mov ah, 4ch
int 21h

main endp
end main