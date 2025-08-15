.MODEL SMALL
.STACK 100H
.DATA
    num1 DB 4
    num2 DB 3
    msg  DB 'Result: $'
    result DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Multiply num1 * num2
    MOV AL, num1   ; First number
    MOV BL, num2   ; Second number
    MUL BL         ; AL × BL → AX (low in AL, high in AH)
    MOV result, AL ; Store result (only low byte for small numbers)

    ; Show message
    MOV AH, 09H
    LEA DX, msg
    INT 21H

    ; Convert to ASCII and print
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
