.MODEL SMALL
.STACK 100H
.DATA
    num1 DB 5      ; 0101 in binary
    num2 DB 3      ; 0011 in binary
    result DB ?

    msg DB 'Result of AND: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Perform AND
    MOV AL, num1
    AND AL, num2
    MOV result, AL

    ; Show message
    MOV AH, 09H
    LEA DX, msg
    INT 21H

    ; Convert to ASCII and display
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
