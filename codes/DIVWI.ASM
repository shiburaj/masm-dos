.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB 'Enter dividend: $'
    msg2 DB 0DH,0AH,'Enter divisor: $'
    msgQ DB 0DH,0AH,'Quotient: $'
    msgR DB 0DH,0AH,'Remainder: $'
    quotient DB ?
    remainder DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Ask for dividend
    MOV AH, 09H
    LEA DX, msg1
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H     ; Convert ASCII to number
    MOV BL, AL      ; Store dividend

    ; Ask for divisor
    MOV AH, 09H
    LEA DX, msg2
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV CL, AL      ; Store divisor

    ; Perform division
    MOV AL, BL      ; Dividend
    MOV AH, 0       ; Clear AH for 8-bit division
    DIV CL          ; AL / CL → AL = quotient, AH = remainder

    MOV quotient, AL
    MOV remainder, AH

    ; Show quotient
    MOV AH, 09H
    LEA DX, msgQ
    INT 21H

    MOV AL, quotient
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Show remainder
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
