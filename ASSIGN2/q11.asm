include header.asm
.model small
.stack 100h

.data 
arr db 20 dup(0)
msgsz db 10, 13, "Enter size of the array: $"
msgend db 10, 13, "Sorted array: $"
stidx dw 0
minidx dw 0
count dw 0

.code 
main proc 

mov ax, @data
mov ds, ax 
mov es, ax

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

;selection sort
mov cx, count ; outer counter
dec cx
lea si, arr
mov di, si
Loop1:  mov bx, si
        mov ah, cl
        mov al, [si]
        inc si
Loop2:  cmp al, [si]
        jl skip
        mov al, [si]
        mov bx, si
skip:   inc si
        dec ah
        jnz Loop2
        ;swapping
        mov dl, [bx]
        xchg dl, [di]
        xchg dl, [bx]
        inc di
        mov si, di
        loop Loop1 

; ;insertion sort
; mov cx, 2
; Loop1Ins:       mov dx, cx
;                 dec dx ; number of comparision required
;                 mov si, dx
;                 mov ah, arr[si]
; Loop2Ins:       cmp arr[si-1], ah
;                 jle noNeedInLoop
;                 mov  di,  arr[si-1]
;                 mov arr[si], di
;                 dec si
;                 dec dx
;                 jnz Loop2Ins

; noNeedInLoop:   mov arr[si], ah
;                 inc cx
;                 cmp cx, count
;                 jl Loop1Ins

new_line
display msgend

mov cx, count
mov bx, 0
printloop: push bx
mov bl, arr[bx]
           print2digit bl
           pop bx 
           space
           inc bx
           loop printloop
exitprog       
main endp
end main 