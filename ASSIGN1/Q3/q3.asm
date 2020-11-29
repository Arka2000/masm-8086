.model small
.stack 100h

.data 

num1 db 1Ah
num2 db 42h

interrupt macro inttype
    mov ah, inttype
    int 21h
endm

.code 

main proc

mov ax, @data 
mov ds, ax

mov al, num1
add al, num2 ;performing addition

mov bl, al ; moving sum to lower register of bx
mov bh, 0 ; making upper byte 0
mov cl, 4 ; making it 4 for shift operation

shl bx, cl; shift bx to 4 bit left, so in bh the first bit of addition will be stored

mov dl, bh; first print the higher byte
add dl, 48 ; converting to char

cmp dl, 59 ; if it is > '9' -> then next char will be 'A' so adding 7
jle notchar
add dl, 7
interrupt 02h

secbyte: mov dl, bl; print the lower byte
shr dl, cl; but the lower byte is shifted left to 4 byte before
add dl, 48

cmp dl, 59; ; if it is > '9' -> then next char will be 'A' so adding 7
jle notchatsec
add dl, 7
interrupt 02h

done:
interrupt 4ch


notchar: interrupt 02h
        jmp secbyte
notchatsec: interrupt 02h
            jmp done
main endp

end main