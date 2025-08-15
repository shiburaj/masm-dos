.MODEL SMALL
.STACK 100H
.DATA
    num DB 5       ; 0101 in binary
    result DB ?

    msg DB 'Result of NOT: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Perform NOT
    MOV AL, num
    NOT AL
    MOV result, AL

    ; Display message
    MOV AH, 09H
    LEA DX, msg
    INT 21H

    ; Convert low nibble to ASCII (0-15)
    AND AL, 0FH      ; Keep only last 4 bits for single-digit display
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
