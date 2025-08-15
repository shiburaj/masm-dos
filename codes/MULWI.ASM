.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB 'Enter first number: $'
    msg2 DB 0DH,0AH,'Enter second number: $'
    msg3 DB 0DH,0AH,'Result: $'
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
    SUB AL, 30H     ; Convert ASCII to number
    MOV BL, AL

    ; Second number
    MOV AH, 09H
    LEA DX, msg2
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV CL, AL

    ; Multiply BL × CL
    MOV AL, BL
    MUL CL          ; AL × CL → AX
    MOV result, AL

    ; Show message
    MOV AH, 09H
    LEA DX, msg3
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
