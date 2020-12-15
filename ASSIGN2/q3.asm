include header.asm
.model small
.stack 100h

.data 
msg db "    :The even pairs of sum 100:     ", 10, 13,"$"
max db 100

print2digit macro reg
    push dx
    push ax
    mov dl, 10
    xor ah, ah
    mov al, reg
    div dl
    printnum al
    printnum ah
    pop ax
    pop dx
endm

.code 

main proc
mov ax, @data 
mov ds, ax 

display msg 

xor ah, ah
mov al, max
mov cl, 2
div cl
mov max, al

loop1: print2digit cl
       space
       mov bl, max
       add bl, bl
       sub bl, cl
       print2digit bl
       new_line
       add cl, 2
       push cx
       cmp cl, max
       jg breakloop
       pop cx
       jmp loop1

breakloop:
    exitprog

main endp
end main
      
