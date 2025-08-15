.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB 'Enter first number: $'
    msg2 DB 0DH,0AH,'Enter second number: $'
    msg3 DB 0DH,0AH,'Result of OR: $'
    result DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; First number
    MOV AH, 09H
    LEA DX, msg1
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H     ; ASCII → number
    MOV BL, AL

    ; Second number
    MOV AH, 09H
    LEA DX, msg2
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV CL, AL

    ; Perform OR
    MOV AL, BL
    OR AL, CL
    MOV result, AL

    ; Show result
    MOV AH, 09H
    LEA DX, msg3
    INT 21H

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
