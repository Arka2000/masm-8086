include header.asm
.model small
.stack 100h

.data 
msg1 db "Enter Binary Digits: >> $"
msg2 db "The Decimal equivalent: >> $"
msg3 db "Enter Decimal 2 Digits: >> $"
msg4 db "The Binary equivalent: >> $"
digits db 8
.code
main proc

mov ax, @data
mov ds, ax 

display msg1
mov cl, digits
mov ah, 01h
xor bl, bl

;binary input
loopip: int 21h
        sub al, 48
        add bl, bl
        add bl, al
        loop loopip
; decimal 
new_line
display msg2
print2digit bl
new_line

display msg3
twodigitNumIP bl
new_line
display msg4

mov cl, digits
mov dl, 2
mov al, bl

loopop: xor ah, ah
        div dl
        push ax
        loop loopop

mov cl, digits

loopopprint:    pop ax
                printnum ah
                loop loopopprint

exitprog

main endp
end main




