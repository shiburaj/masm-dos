.model small
.stack 100h
.data
    num1 db 5       ; first number
    num2 db 3       ; second number
    sum  db ?       ; to store result
    msg  db "Sum is: $"

.code
main proc
    mov ax, @data
    mov ds, ax

    ; ---- Add numbers ----
    mov al, num1
    add al, num2
    mov sum, al

    ; ---- Display message ----
    mov ah, 09h
    lea dx, msg
    int 21h

    ; ---- Display result ----
    mov al, sum
    add al, 30h       ; convert to ASCII
    mov dl, al
    mov ah, 02h       ; print character
    int 21h

    ; ---- Exit ----
    mov ah, 4Ch
    int 21h
main endp
end main
