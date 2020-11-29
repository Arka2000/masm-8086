.model SMALL
.stack 100H

.data 
msg1 db "The alphabets are: ", 10, 13, "$"

.code 

main proc

mov ax, @DATA 
mov ds, ax

mov ah, 09h
lea dx, msg1 ; print alphabets message
int 21h

mov cx, 26 ; initialize counter
mov dl, 'A' ; initializa with 'A'
mov ah, 02h

loop1:  int 21h ; print character
        add dl, 01h ; increment loop
        loop loop1 ; reloop

mov ah, 4ch ; exit program
int 21h

main endp
end main