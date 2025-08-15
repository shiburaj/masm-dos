.MODEL SMALL
.STACK 100H
.DATA
    msg DB 'Enter a digit (0-9) to hear a beep: $'
    ; Precalculated PIT divisors for tones 220 Hz to 440 Hz
    Divisors DW 5424, 4949, 4551, 4290, 4040, 3810, 3618, 3400, 3225, 3045

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt
    MOV AH, 09H
    LEA DX, msg
    INT 21H

    ; Read a single character from keyboard
    MOV AH, 01H
    INT 21H
    SUB AL, 30H          ; Convert ASCII '0'-'9' to number
    CMP AL, 9
    JA INVALID_INPUT
    MOV BL, AL           ; Store input number in BL

    ; --- Load divisor from table safely ---
    MOV SI, OFFSET Divisors
    MOV CX, BX           ; Convert BL to CX (16-bit) for offset calculation
    SHL CX, 1            ; Multiply by 2 (word = 2 bytes)
    MOV BX, SI
    ADD BX, CX           ; BX now points to Divisors[input]
    MOV AX, [BX]         ; Load divisor into AX

    ; Enable speaker
    IN AL, 61H
    OR AL, 03H
    OUT 61H, AL

    ; Program PIT channel 2
    MOV AL, 10110110B    ; Control word: channel 2, mode 3
    OUT 43H, AL

    MOV DX, AX            ; Copy divisor to DX
    MOV AL, DL            ; Low byte
    OUT 42H, AL
    MOV AL, DH            ; High byte
    OUT 42H, AL

    ; Long beep duration using nested loops
    MOV CX, 500           ; Outer loop
OUTER_LOOP:
    MOV DX, 500           ; Inner loop
INNER_LOOP:
    NOP
    DEC DX
    JNZ INNER_LOOP
    DEC CX
    JNZ OUTER_LOOP

    ; Turn off speaker
    IN AL, 61H
    AND AL, 0FCH          ; Clear bits 0 and 1
    OUT 61H, AL

    ; Exit program
    MOV AH, 4CH
    INT 21H

INVALID_INPUT:
    ; Exit gracefully on invalid input
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
