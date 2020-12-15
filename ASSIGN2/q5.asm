include header.asm
.model small
.stack 100h

.data 
inp1 db "Enter 4 digit Number >> $"
inp2 db "Enter 2 digit Number >> $"
rem db "Remainder >> $"
quo db "Quotient >> $"
num dw ?
.code

main proc
mov ax, @data 
mov ds, ax 

display inp1

sixteenBitIPDec dx, loop1
mov num, dx
new_line
display inp2
twodigitNumIP bl
new_line
mov ax, num
div bl

display rem
;remainder at ah
print2digit ah
new_line
; int 3   
display quo
; new_line
;quotient al
print2digit al
; mov al, 79

exitprog
main endp
end main