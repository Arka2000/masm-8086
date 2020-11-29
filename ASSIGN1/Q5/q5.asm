.model small
.stack 100h

.data
PRINTSTR db "Display a Terminating Message.", 10, 13, "$"
GOODBYE db "GOOD BYE!!!$"
interrupt macro inttype ; creating interrupt
    mov ah, inttype
    int 21h
endm

display macro msg ; print string
    mov ah, 09h
    lea dx, msg
    int 21h
endm

.code 
main proc
    mov ax, @data 
    mov ds, ax

    display PRINTSTR 
    interrupt 01h 
    display GOODBYE ; print terminating message

    interrupt 4ch; exitting program

main endp
end main