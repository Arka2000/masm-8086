.model small
.stack 100h

.data 
msgi1 db "Enter first number: $"
msgi2 db "Enter second number: $"
msg1 db "Second number is less than the First$"
msg2 db "First number is less than the Second$"
msg3 db "Both are equal$"

display macro msg ; macro for print message
    mov ah, 09h
    lea dx, msg
    int 21h
endm

interrupt macro inttype ; for creating interrupt
    mov ah, inttype
    int 21h
endm

.code 

main proc
mov ax, @data 
mov ds, ax

display msgi1 ; print input message
interrupt 01h ; take first input

mov bl, al

mov dl, 10 ; print newline
interrupt 02h 

display msgi2; print second input
interrupt 01h ; take second input
mov bh, al 

mov dl, 10 ; print newline
interrupt 02h


cmp bl, bh ; comapre the content
jz equal ; both are equal
jle second_greater ; second one is greater
jmp first_greater ; first one is greater

done: interrupt 4ch ; exit program

equal: display msg3
        jmp done

second_greater: display msg2
                jmp done

first_greater: display msg1
                jmp done

main endp
end main