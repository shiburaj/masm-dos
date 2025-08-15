.MODEL SMALL
.STACK 100H
.DATA
    num1 DB 8
    num2 DB 3
    result DB ?

.CODE
MAIN PROC
    MOV AX, @DATA   ; Load data segment
    MOV DS, AX

    MOV AL, num1    ; Load first number
    SUB AL, num2    ; Subtract second number
    MOV result, AL  ; Store result

    ADD AL, 30H     ; Convert to ASCII
    MOV DL, AL
    MOV AH, 02H     ; DOS print character function
    INT 21H

    MOV AH, 4CH     ; Exit program
    INT 21H
MAIN ENDP
END MAIN
