include header.asm
.model small
.stack 100h

.data 
msg db "!!!Fibonacci Series!!!", 10, 13, "$"
numTimes db 10
.code

main proc

mov ax, @data
mov ds, ax 

display msg
mov cl, numTimes
mov bh, 0
mov bl, 01
loop1: push cx
       print2digit bh
       mov ch, bh
       add ch, bl
       mov bh, bl
       mov bl, ch
       pop cx 
       new_line
       loop loop1
exitprog
main endp
end main