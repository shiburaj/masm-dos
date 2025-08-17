.model small
.stack 100h
.code
main proc
    mov ax, 13h       ; set graphics mode 13h
    int 10h

    ; Draw pixel at (100,50), color 4 (red)
    mov ah, 0Ch
    mov al, 4
    mov cx, 100
    mov dx, 50
    int 10h

    ; Wait for key
    mov ah, 0
    int 16h

    ; Return to text mode
    mov ax, 03h
    int 10h
    ret
main endp
end main
