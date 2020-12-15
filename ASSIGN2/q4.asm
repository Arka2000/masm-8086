include header.asm
.model small
.stack 100h

.data
    msg1 db "The multiplication product:>> $"
    numA dw 2521H
            dw 3206H
    numB dw 0A26H
            dw 6400H
    result   dw 0, 0, 0, 0

.code
main proc
        mov ax,@data
        mov ds,ax

        display msg1

        mov ax,numA
        mul numB
        mov result,ax
        mov result+2,dx

        mov ax,numA+2
        mul numB
        add result+2,ax
        adc result+4,dx
        adc result+6, 0

        mov ax,numA
        mul numB+2
        add result+2,ax
        adc result+4,dx
        adc result+6, 0

        mov ax,numA+2
        mul numB+2
        add result+4,ax
        adc result+6,dx

        mov dx, result+6
        print2digitHEX dh
        print2digitHEX dl
        mov dx, result+4
        print2digitHEX dh
        print2digitHEX dl
        mov dx, result+2
        print2digitHEX dh
        print2digitHEX dl

        mov dx, result+0
        print2digitHEX dh
        print2digitHEX dl


        mov ah, 4ch
        int 21h
main endp
end main