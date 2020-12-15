include header.asm
.model small
.stack 100h

.data 
arr db 20 dup(0)
msgsz db 10, 13, "Enter size of the array: $"
msgsch db 10, 13, "Enter number to be searched: $"
msgf db 10, 13, "FOUND AT POSITION $ "
msgnf db 10, 13, "NOT FOUND$"
se db 0
count dw 0

.code 
main proc 

mov ax, @data
mov ds, ax 

display msgsz 
twodigitNumIP bl 
new_line
xor bh, bh
mov count, bx
mov cx, bx
mov bx, 0

fillarr:    push bx 
            twodigitNumIP bl  
            space
            mov dl, bl
            pop bx 
            mov arr[bx], dl
            inc bx
            
            loop fillarr

display msgsch
twodigitNumIP bl
mov dl, bl 
new_line

; Linear Search

mov cx, count

mov bx, 0
; int 3
checkarr: cmp dl, arr[bx]
          je found 
          inc bx
          loop checkarr

display msgnf
jmp needexit

found: display msgf
print2digit bl 

needexit: exitprog

main endp
end main 