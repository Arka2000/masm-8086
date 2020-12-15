include header.asm
.model small
.stack 100h

.data 
inp1 db "Enter 4 digit Number >> $"
oupA db "The Addition output: >> $"
oupS db "The subtraction output: >> $"
A dw ?
B dw ?
.code 

main proc

mov ax, @data 
mov ds, ax 

display inp1
sixteenBitIPDec dx, loop1
mov A, dx
new_line
display inp1
sixteenBitipDec dx, loop2
mov B, dx
add dx, A
push dx
new_line
display oupA
pop dx
sixteenBitOPDec dx

new_line
display oupS

mov dx, A
sub dx, B
sixteenBitOPDec dx

; int 3
exitprog
; exitprog

main endp
end main
