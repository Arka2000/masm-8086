.model SMALL

.stack 100H

.data

nameP DB "Name: Bisakh Mondal", 10, 13, "$"
titleP DB "Title: Question 1 (Print name and Title)$"

.code   
main proc
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H ; output a string
    LEA DX, nameP ; print name

    INT 21H
    LEA DX, titleP ; print title
    INT 21H

    MOV AH, 4CH ; for terminating the program
    INT 21H

main endp
end main