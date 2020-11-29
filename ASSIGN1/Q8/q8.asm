.model small
.stack 100h

.data 
array db 3,2,5,9,6,3,4
len dw $-array
msg1 db "The smallest value: $"
msg2 db "The greatest value: $"

display macro msg
    mov ah, 09h
    lea dx, msg
    int 21h
endm

.code 

main proc
mov ax, @data
mov ds, ax

mov si, offset array ; initialize source index with inital address of array
mov cx, len       ; array length
mov bh, [si] ; contains minimum
mov bl, [si] ; contains maximum

loop1:      cmp [si], bh
            jle updatemin
maxcheck:   cmp bl, [si]
            jle updatemax
resume:     inc si
            loop loop1

add bh, 48 ; to convert to ascii
add bl, 48 ; ascii

display msg1 ; display maximum message and print maximum
mov ah, 02h
mov dl, bh
int 21h

mov dl, 10 ; to print a newline
int 21h

display msg2 ; display minimum message and print minimum
mov ah, 02h
mov dl, bl
int 21h

mov ah, 4ch
int 21h

updatemin: mov bh, [si]
            jmp maxcheck
updatemax: mov bl, [si]
            jmp resume

main endp
end main