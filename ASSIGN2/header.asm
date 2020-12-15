display macro msg
    push dx
    push ax
    mov ah, 09h
    lea dx, msg
    int 21h
    pop ax
    pop dx
endm

exitprog macro
    mov ah, 4ch
    int 21h
endm

interrupt macro inttype ; for creating interrupt
    mov ah, inttype
    int 21h
endm

sixteenBitIPDec macro ext
local loopn 
    xor ext, ext
    mov cl, 4
    
loopn: mov ah, 1   
       int 21h
       sub al, 48
       push ax
       mov ax, 10
       mul ext
       mov ext, ax
       pop ax
       mov ah, 0
       add ext, ax
       loop loopn
endm

twodigitNumIP macro reg
    push dx
    mov ah, 1
    int 21h
    sub al, 48
    mov dl, 10
    xor ah, ah
    mul dl
    mov reg, al
    mov ah, 1
    int 21h
    sub al, 48
    add reg, al
    pop dx
endm

sixteenBitOPDec macro ext 
local loopn, loopn2
    push bx
    push cx

    mov cl, 4
loopn: mov ax, ext
       mov bl, 10
       div bl
       push ax
       mov ah, 0
       mov ext, ax
       loop loopn
    
    mov cl, 4
loopn2: pop ax
        printnum ah
        loop loopn2
    
    pop cx
    pop dx
endm


sixteenBitOPHEX macro ext, loopn, loopn2
    push bx
    push cx

    mov cl, 4
loopn: mov ax, ext
       mov bl, 16
       div bl
       push ax
       mov ah, 0
       mov ext, ax
       loop loopn
    
    mov cl, 4
loopn2: pop ax
        printnum ah
        loop loopn2
    
    pop cx
    pop dx
endm

printnum macro msg ; macro to print character in ascii
    push dx
    push ax
    mov dl, msg
    add dl, 48
    mov ah, 02h
    int 21h
    pop ax
    pop dx
endm


print2digit macro reg
    push dx
    push ax
    mov al, reg
    mov dl, 10
    xor ah, ah
    div dl
    printnum al
    printnum ah
    pop ax
    pop dx
endm

printnumHEX macro msg ; macro to print hex character in ascii
    local notchar
    push dx
    push ax
    mov dl, msg
    add dl, 48
    mov al, dl
    cmp al, '9' ; if it is > '9' -> then next char will be 'A' so adding 7
    jle notchar
    add dl, 7
    notchar: mov ah, 02h

    int 21h
    pop ax
    pop dx
endm

print2digitHEX macro reg
    push dx
    push ax
    mov al, reg
    mov dl, 16
    xor ah, ah
    div dl

    printnumHEX al
    printnumHEX ah

    pop ax
    pop dx
endm

;macro to print new line
new_line macro
    push ax
    push dx
	mov ah,02h
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h
    pop dx
    pop ax
endm

;macro to print space
space macro
    push ax
    push dx
	mov ah,02h
	mov dl,' '
	int 21h
    pop dx
    pop ax
endm

;macro to print colon
colon macro
    push ax
    push dx
	mov ah,02h
	mov dl,':'
	int 21h
    pop dx
    pop ax
endm
