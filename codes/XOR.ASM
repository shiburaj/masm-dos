.MODEL SMALL
.STACK 100H
.DATA
    num1 DB 5       ; 0101 in binary
    num2 DB 3       ; 0011 in binary
    result DB ?

    msg DB 'Result of XOR: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Perform XOR
    MOV AL, num1
    XOR AL, num2
    MOV result, AL

    ; Display message
    MOV AH, 09H
    LEA DX, msg
    INT 21H

    ; Convert to ASCII and display result
    MOV AL, result
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
