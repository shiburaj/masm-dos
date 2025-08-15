.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; ---- Enable speaker ----
    IN AL, 61H           ; read port 61h
    OR AL, 03H           ; set bits 0 and 1 to enable speaker
    OUT 61H, AL

    ; ---- Program PIT for tone ----
    MOV AL, 10110110B    ; channel 2, low/high byte, mode 3
    OUT 43H, AL

    ; Load frequency divisor (e.g., 440 Hz tone)
    ; Note: cannot use MOV AX, 1193182/440 directly in MASM 8086
    ; Precalculate 1193182/440 = 2712
    MOV AX, 2712          ; divisor for 440 Hz
    OUT 42H, AL           ; low byte
    MOV AL, AH
    OUT 42H, AL           ; high byte

    ; ---- Longer Delay using nested loops ----
    MOV CX, 500           ; Outer loop
OUTER_LOOP:
    MOV DX, 500           ; Inner loop
INNER_LOOP:
    NOP                    ; Do nothing, just wait
    DEC DX
    JNZ INNER_LOOP
    DEC CX
    JNZ OUTER_LOOP

    ; ---- Turn off speaker ----
    IN AL, 61H
    AND AL, 0FCH          ; clear bits 0 and 1
    OUT 61H, AL

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
