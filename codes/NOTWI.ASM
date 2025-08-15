.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB 'Enter a number: $'
    msg2 DB 0DH,0AH,'Result of NOT: $'
    num DB ?
    result DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Read number
    MOV AH, 09H
    LEA DX, msg1
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H       ; ASCII → number
    MOV num, AL

    ; Perform NOT
    MOV AL, num
    NOT AL
    MOV result, AL

    ; Display message
    MOV AH, 09H
    LEA DX, msg2
    INT 21H

    ; Convert low nibble to ASCII
    AND AL, 0FH       ; Keep only last 4 bits
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
