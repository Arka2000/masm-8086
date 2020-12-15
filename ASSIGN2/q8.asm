include header.asm
.model small
.stack 100h

.data 

msggcd db "The GCD: $"
msglcm db "The LCM: $"
msg db "Enter the number in decimal: $"
gcdn dw ?
lcmn dw ?
num1 dw ?
num2 dw ?
num3 dw ?

.code 
main proc 

mov ax, @data
mov ds, ax 

display msg
sixteenBitIPDec bx 
mov num1, bx
new_line

display msg
sixteenBitIPDec bx  
new_line
mov num2, bx

display msg 
sixteenBitIPDec bx 
mov num3, bx
new_line

mov ax, num1
mov bx, num2
call gcd
call lcm

mov ax, lcmn
mov bx, num3
call gcd
call lcm 


mov bx, lcmn
display msglcm
sixteenBitOPDec bx
new_line
display msggcd
mov bx, gcdn
sixteenBitOPDec bx  
exitprog 

;procedure to find gcd of two numbers
gcd proc
; input: bx,ax
; output: gcd
push ax
push bx

; Assumption: ax is greater than bx
up: 
	cmp ax,bx        ;compare the two numbers.
	je exit          ;if equal, go to exit label.
	jb excg          ;if first number is below than second,
				;go to excg label.
up1: 
	mov dx,0h       ;initialize the dx.
	div bx          ;divide the first number by second number.
	cmp dx,0        ;compare remainder is zero or not.
	je exit         ;if zero, jump to exit label.
	mov ax,dx       ;if non-zero, move remainder to ax.
	jmp up
					;jump to up label.
excg:
	xchg ax,bx     ;exchange the remainder and quotient.
	jmp up1        ;jump to up1.
exit:
	mov gcdn,bx     ;store the result in gcd.
	pop bx
	pop ax
	ret

gcd endp

lcm proc
; input: bx,ax
	mul bx	;product of numbers
	; int 3
	div gcdn	;by gcd of numbers
	mov lcmn, ax
	ret
lcm endp

main endp
end main 