.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB 'Enter first BCD digit (0-9): $'
    msg2 DB 0DH,0AH,'Enter second BCD digit (0-9): $'
    msg3 DB 0DH,0AH,'Sum is: $'
    num1 DB ?
    num2 DB ?
    sum  DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; -------- Input first BCD digit --------
    MOV AH, 09H
    LEA DX, msg1
    INT 21H

    MOV AH, 01H      ; Read char from keyboard
    INT 21H
    SUB AL, 30H      ; Convert ASCII to number (0-9)
    MOV num1, AL

    ; -------- Input second BCD digit --------
    MOV AH, 09H
    LEA DX, msg2
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV num2, AL

    ; -------- Perform BCD Addition --------
    MOV AL, num1
    ADD AL, num2
    DAA               ; Decimal Adjust AL for BCD
    MOV sum, AL

    ; -------- Display message --------
    MOV AH, 09H
    LEA DX, msg3
    INT 21H

    ; -------- Display result --------
    MOV AL, sum
    ADD AL, 30H       ; Convert BCD digit to ASCII
    MOV DL, AL
    MOV AH, 02H       ; DOS print character
    INT 21H

    ; -------- Exit program --------
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
