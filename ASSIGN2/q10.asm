include header.asm
.model small
.stack 100h

.data 
msg db "The primes: $"
limit db 100
stt db 2


checkprime macro reg
local runner,printprime, donecheck
push dx
push cx

mov dl, reg
mov cl, 2

runner: cmp cl, dl
        jge printprime
        mov ah, 0
        mov al, dl
        div cl
        add cl, 1
        cmp ah, 0
        ; int 3
        je donecheck 

        jmp runner

printprime: print2digit dl 
            space

donecheck:  pop cx
            pop dx
endm

.code

main proc

mov ax, @data
mov ds, ax 


display msg 
mov cl, limit
mov dl, stt

loopprime: checkprime dl
            cmp cl, dl
            je done
            add dl, 1
            jmp loopprime

; mov dl, 7
; checkprime dl
done: exitprog
main endp

end main
