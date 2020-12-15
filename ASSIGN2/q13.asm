include header.asm
.model small
.stack 100h

.data 
msdate db "Current Date (DD/MM/YYYY): $"
mstime db "Current Time (HH:MM:SS): $"
printnums macro msg ; macro to print character in ascii
    push dx
    push ax
    mov dl, msg
    add dl, 48
    mov ah, 02h
    int 21h
    pop ax
    pop dx
endm

print2digits macro reg
    push dx
    push ax
    mov al, reg
    mov dl, 16
    xor ah, ah
    div dl
    printnums al
    printnums ah
    pop ax
    pop dx
endm

.code

main proc

mov ax, @data
mov ds, ax 

display msdate
mov ah, 04h
int 1ah
; int 3
print2digits dl
colon
print2digits dh
colon
print2digits ch
print2digits cl
new_line
display mstime

mov ah, 02h
int 1ah

print2digits ch
colon
print2digits cl
colon
print2digits dh
exitprog



main endp
end main