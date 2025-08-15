.MODEL SMALL
.STACK 100H
.DATA
    num1 DB 8       ; Dividend
    num2 DB 2       ; Divisor
    msgQ DB 'Quotient: $'
    msgR DB 0DH,0AH,'Remainder: $'
    quotient DB ?
    remainder DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; AL = dividend, BL = divisor
    MOV AL, num1
    MOV BL, num2
    MOV AH, 0       ; Clear AH for 8-bit division
    DIV BL          ; AL / BL → quotient in AL, remainder in AH

    MOV quotient, AL
    MOV remainder, AH

    ; Display quotient
    MOV AH, 09H
    LEA DX, msgQ
    INT 21H

    MOV AL, quotient
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Display remainder
    MOV AH, 09H
    LEA DX, msgR
    INT 21H

    MOV AL, remainder
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
