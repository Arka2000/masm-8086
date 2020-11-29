.model SMALL
.stack 100H

.data 
msg1 db "Enter an Character: $"
msg2 db 10d, 13d, "The Character is: $"

.code 

main proc
mov ax, @DATA 
mov ds, ax 

mov ah, 09h ; print preinput message
lea dx, msg1
int 21h

mov ah, 01h; take input
int 21h


mov ah, 09h ; print postinput message
lea dx, msg2
int 21h

mov dl, al

mov ah, 02h ; print output
int 21h

mov ah, 4ch
int 21h

main endp
end main