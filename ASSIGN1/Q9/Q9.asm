.model small
.stack 100h

.data 
quitmsg db "Ready to quit? (y/n) $"
inloop db "In loop", 10, 13, "$"
outloop db "Sucessfully exited", 10, 13, "$"
.code 

main proc

mov ax, @DATA 
mov ds, ax
;creating a loop
reloop: mov ah, 09h
lea dx, inloop ; print inloop message
int 21h

lea dx, quitmsg; asking if user wants to quit
int 21h

mov ah , 01h ; taking input
int 21h
mov dh, al

mov dl, 10 ; print newline
mov ah, 02h
int 21h

cmp dh, 'y' ; checking if it is 'y' or 'Y'
jz exitloop
cmp dh, 'Y'
jz exitloop

jmp reloop ; if not reloop

exitloop: mov ah, 09h
lea dx, outloop ; print when exited from loop
int 21h

mov ah, 4ch; exit program
int 21h

main endp
end main

