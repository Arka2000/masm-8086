include header.asm
.model small
.stack 100h

.data 
oldFile db "text.txt",0
newFile db "rename.txt",0
.code

main proc

mov ax, @data
mov ds, ax 
mov es, ax

lea dx, oldFile
lea di, newFile

mov ah, 56h
int 21h

exitprog

main endp
end main
