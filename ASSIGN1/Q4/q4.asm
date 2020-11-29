.model small 
.386
.stack 100h

.data 
array db 3, 4, 1, 7, 8, 6, 9 ; len 7
len dw $-array

sminmsg db "The Second Smallest: $"
minmsg db "The Smallest: $"
smaxmsg db "The Second Largest: $"
maxmsg db "The Largest: $"
newline db 10, 13, "$"
MAX db ?
SMAX db ?
MIN db ?
SMIN db ?

printchar macro msg ; macro to print character in ascii
    mov dl, msg
    add dl, 48
    mov ah, 02h
    int 21h
endm

display macro msg ; print string
    mov ah, 09h
    lea dx, msg
    int 21h
endm

interrupt macro inttype ; creating interrupt
    mov ah, inttype
    int 21h
endm

.code 

main proc

mov ax, @data 
mov ds, ax

mov si, offset array
mov cx, len

mov dh, [si] ; max
mov dl, [si] ; second max
mov bh, [si] ; min
mov bl, [si] ; second min

loop1:  cmp dh, [si]
        jle gotMAX
CSMAX:  cmp dl, [si]
        jle gotSecMAX
CMIN:   cmp [si], bh
        jle gotMIN
CSMIN:  cmp [si], bl
        jle gotSecMIN
done:   inc si
        loop loop1

mov MAX, dh
mov SMAX, dl
mov MIN, bh
mov SMIN, bl

display maxmsg ; print MAX
printchar MAX
display newline

display smaxmsg ; print Second max
printchar SMAX
display newline

display minmsg ; print min
printchar MIN
display newline

display sminmsg ; print second min
printchar SMIN

interrupt 4ch

gotMAX: mov dl, dh
        mov dh, [si]
        jmp CMIN

gotMIN: mov bl, bh
        mov bh, [si]
        jmp done

gotSecMIN: mov bl, [si]
            jmp done

gotSecMAX: mov dl, [si]
            jmp CMIN

main endp
end main
