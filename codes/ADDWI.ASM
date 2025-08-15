.model small
.stack 100h
.data
    msg1 db "Enter first digit: $"
    msg2 db 0Dh,0Ah, "Enter second digit: $"
    msg3 db 0Dh,0Ah, "Sum is: $"
    num1 db ?
    num2 db ?
    sum  db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    ; ---- Input first digit ----
    mov ah, 09h        ; print string
    lea dx, msg1
    int 21h

    mov ah, 01h        ; read char from keyboard
    int 21h
    sub al, 30h        ; convert ASCII to number
    mov num1, al

    ; ---- Input second digit ----
    mov ah, 09h
    lea dx, msg2
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov num2, al

    ; ---- Add ----
    mov al, num1
    add al, num2
    mov sum, al

    ; ---- Display result ----
    mov ah, 09h
    lea dx, msg3
    int 21h

    mov al, sum
    add al, 30h        ; convert number to ASCII
    mov dl, al
    mov ah, 02h        ; display character
    int 21h

    ; ---- Exit ----
    mov ah, 4Ch
    int 21h
main endp
end main
