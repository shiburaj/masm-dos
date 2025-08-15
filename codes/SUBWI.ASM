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

    ; Ask for first number
    MOV AH, 09H
    LEA DX, msg1
    INT 21H

    MOV AH, 01H     ; Read char from keyboard
    INT 21H
    SUB AL, 30H     ; Convert ASCII to number
    MOV BL, AL      ; Store first number

    ; Ask for second number
    MOV AH, 09H
    LEA DX, msg2
    INT 21H

    MOV AH, 01H     ; Read char
    INT 21H
    SUB AL, 30H     ; Convert to number
    MOV CL, AL      ; Store second number

    ; Perform subtraction
    MOV AL, BL
    SUB AL, CL
    MOV result, AL

    ; Show result
    MOV AH, 09H
    LEA DX, msg3
    INT 21H

    MOV AL, result
    ADD AL, 30H     ; Convert number to ASCII
    MOV DL, AL
    MOV AH, 02H     ; Display char
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
